# test_l2rt.jl
# Simple code to test the Julia interface to L2RT

using GALAHAD
using Test
using Printf
using Accessors

function test_l2rt()
  # Derived types
  data = Ref{Ptr{Cvoid}}()
  control = Ref{l2rt_control_type{Float64}}()
  inform = Ref{l2rt_inform_type{Float64}}()

  # Set problem data
  n = 50 # dimensions
  m = 2 * n

  status = Ref{Cint}()
  power = 3.0
  weight = 1.0
  shift = 1.0
  x = zeros(Float64, n)
  u = zeros(Float64, m)
  v = zeros(Float64, n)

  # Initialize l2rt
  l2rt_initialize(data, control, status)

  status[] = 1
  @reset control[].print_level = Cint(0)
  l2rt_import_control(control, data, status)

  for i in 1:m
    u[i] = 1.0 # b = 1
  end

  # iteration loop to find the minimizer with A^T = (I:diag(1:n))
  terminated = false
  while !terminated # reverse-communication loop
    l2rt_solve_problem(data, status, m, n, power, weight, shift, x, u, v)
    if status[] == 0 # successful termination
      terminated = true
    elseif status[] < 0 # error exit
      terminated = true
    elseif status[] == 2 # form u <- u + A * v
      for i in 1:n
        u[i] = u[i] + v[i]
        u[n + i] = u[n + i] + i * v[i]
      end
    elseif status[] == 3 # form v <- v + A^T * u
      for i in 1:n
        v[i] = v[i] + u[i] + i * u[n + i]
      end
    elseif status[] == 4 # restart
      for i in 1:m
        u[i] = 1.0
      end
    else
      @printf(" the value %1i of status should not occur\n", status)
    end
  end

  l2rt_information(data, inform, status)

  @printf("l2rt_solve_problem exit status = %i, f = %.2f\n", inform[].status, inform[].obj)

  # Delete internal workspace
  l2rt_terminate(data, control, inform)

  return 0
end

@testset "L2RT" begin
  @test test_l2rt() == 0
end
