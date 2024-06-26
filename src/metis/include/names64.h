/*
 * names64.h
 *
 * This file defines 64-bit integer procedure names
 *
 * Nick Gould
 * 2024-03-24
 *
 */

#ifndef _LIBMETIS_NAMES64_H_
#define _LIBMETIS_NAMES64_H_
#ifdef INTEGER_64
#define METIS_NodeND METIS_NodeND_64
#define METIS_Free METIS_Free_64
#define METIS_SetDefaultOptions METIS_SetDefaultOptions_64
#define Balance2Way Balance2Way_64
#define Bnd2WayBalance Bnd2WayBalance_64
#define General2WayBalance General2WayBalance_64
#define McGeneral2WayBalance McGeneral2WayBalance_64
#define BucketSortKeysInc BucketSortKeysInc_64
#define CheckGraph CheckGraph_64
#define CheckInputGraphWeights CheckInputGraphWeights_64
#define FixGraph FixGraph_64
#define CoarsenGraph CoarsenGraph_64
#define CoarsenGraphNlevels CoarsenGraphNlevels_64
#define Match_RM Match_RM_64
#define Match_SHEM Match_SHEM_64
#define Match_2Hop Match_2Hop_64
#define Match_2HopAny Match_2HopAny_64
#define Match_2HopAll Match_2HopAll_64
#define Match_JC Match_JC_64
#define PrintCGraphStats PrintCGraphStats_64
#define CreateCoarseGraph CreateCoarseGraph_64
#define SetupCoarseGraph SetupCoarseGraph_64
#define ReAdjustMemory ReAdjustMemory_64
#define CompressGraph CompressGraph_64
#define PruneGraph PruneGraph_64
#define FindPartitionInducedComponents FindPartitionInducedComponents_64
#define ComputeBFSOrdering ComputeBFSOrdering_64
#define IsConnected IsConnected_64
#define IsConnectedSubdomain IsConnectedSubdomain_64
#define FindSepInducedComponents FindSepInducedComponents_64
#define EliminateComponents EliminateComponents_64
#define MoveGroupContigForCut MoveGroupContigForCut_64
#define MoveGroupContigForVol MoveGroupContigForVol_64
#define ComputeCut ComputeCut_64
#define ComputeVolume ComputeVolume_64
#define ComputeMaxCut ComputeMaxCut_64
#define CheckBnd CheckBnd_64
#define CheckBnd2 CheckBnd2_64
#define CheckNodeBnd CheckNodeBnd_64
#define CheckRInfo CheckRInfo_64
#define CheckNodePartitionParams CheckNodePartitionParams_64
#define IsSeparable IsSeparable_64
#define CheckKWayVolPartitionParams CheckKWayVolPartitionParams_64
#define FM_2WayRefine FM_2WayRefine_64
#define FM_2WayCutRefine FM_2WayCutRefine_64
#define FM_Mc2WayCutRefine FM_Mc2WayCutRefine_64
#define SelectQueue SelectQueue_64
#define Print2WayRefineStats Print2WayRefineStats_64
#define Change2CNumbering Change2CNumbering_64
#define Change2FNumbering Change2FNumbering_64
#define Change2FNumbering2 Change2FNumbering2_64
#define Change2FNumberingOrder Change2FNumberingOrder_64
#define ChangeMesh2CNumbering ChangeMesh2CNumbering_64
#define ChangeMesh2FNumbering ChangeMesh2FNumbering_64
#define ChangeMesh2FNumbering2 ChangeMesh2FNumbering2_64
#define SetupGraph SetupGraph_64
#define SetupGraph_tvwgt SetupGraph_tvwgt_64
#define SetupGraph_label SetupGraph_label_64
#define SetupSplitGraph SetupSplitGraph_64
#define CreateGraph CreateGraph_64
#define InitGraph InitGraph_64
#define FreeSData FreeSData_64
#define FreeRData FreeRData_64
#define FreeGraph FreeGraph_64
#define graph_WriteToDisk graph_WriteToDisk_64
#define graph_ReadFromDisk graph_ReadFromDisk_64
#define Init2WayPartition Init2WayPartition_64
#define InitSeparator InitSeparator_64
#define RandomBisection RandomBisection_64
#define GrowBisection GrowBisection_64
#define McRandomBisection McRandomBisection_64
#define McGrowBisection McGrowBisection_64
#define GrowBisectionNode GrowBisectionNode_64
#define GrowBisectionNode2 GrowBisectionNode2_64
#define Greedy_KWayOptimize Greedy_KWayOptimize_64
#define Greedy_KWayCutOptimize Greedy_KWayCutOptimize_64
#define Greedy_KWayVolOptimize Greedy_KWayVolOptimize_64
#define Greedy_McKWayCutOptimize Greedy_McKWayCutOptimize_64
#define Greedy_McKWayVolOptimize Greedy_McKWayVolOptimize_64
#define IsArticulationNode IsArticulationNode_64
#define KWayVolUpdate KWayVolUpdate_64
#define Greedy_KWayEdgeStats Greedy_KWayEdgeStats_64
#define Greedy_KWayEdgeCutOptimize Greedy_KWayEdgeCutOptimize_64
#define RefineKWay RefineKWay_64
#define AllocateKWayPartitionMemory AllocateKWayPartitionMemory_64
#define ComputeKWayPartitionParams ComputeKWayPartitionParams_64
#define ProjectKWayPartition ProjectKWayPartition_64
#define ComputeKWayBoundary ComputeKWayBoundary_64
#define ComputeKWayVolGains ComputeKWayVolGains_64
#define IsBalanced IsBalanced_64
#define rvecle rvecle_64
#define rvecge rvecge_64
#define rvecsumle rvecsumle_64
#define rvecmaxdiff rvecmaxdiff_64
#define ivecle ivecle_64
#define ivecge ivecge_64
#define ivecaxpylez ivecaxpylez_64
#define ivecaxpygez ivecaxpygez_64
#define BetterVBalance BetterVBalance_64
#define BetterBalance2Way BetterBalance2Way_64
#define BetterBalanceKWay BetterBalanceKWay_64
#define ComputeLoadImbalance ComputeLoadImbalance_64
#define ComputeLoadImbalanceDiff ComputeLoadImbalanceDiff_64
#define ComputeLoadImbalanceDiffVec ComputeLoadImbalanceDiffVec_64
#define ComputeLoadImbalanceVec ComputeLoadImbalanceVec_64
#define ComputeSubDomainGraph ComputeSubDomainGraph_64
#define UpdateEdgeSubDomainGraph UpdateEdgeSubDomainGraph_64
#define PrintSubDomainGraph PrintSubDomainGraph_64
#define EliminateSubDomainEdges EliminateSubDomainEdges_64
#define MoveGroupMinConnForCut MoveGroupMinConnForCut_64
#define MoveGroupMinConnForVol MoveGroupMinConnForVol_64
#define MinCover MinCover_64
#define MinCover_Augment MinCover_Augment_64
#define MinCover_Decompose MinCover_Decompose_64
#define MinCover_ColDFS MinCover_ColDFS_64
#define MinCover_RowDFS MinCover_RowDFS_64
#define genmmd genmmd_64
#define mmdelm mmdelm_64
#define mmdint mmdint_64
#define mmdnum mmdnum_64
#define mmdupd mmdupd_64
#define MlevelNestedDissection MlevelNestedDissection_64
#define MlevelNestedDissectionCC MlevelNestedDissectionCC_64
#define MlevelNodeBisectionMultiple MlevelNodeBisectionMultiple_64
#define MlevelNodeBisectionL2 MlevelNodeBisectionL2_64
#define MlevelNodeBisectionL1 MlevelNodeBisectionL1_64
#define SplitGraphOrder SplitGraphOrder_64
#define SplitGraphOrderCC SplitGraphOrderCC_64
#define MMDOrder MMDOrder_64
#define SetupCtrl SetupCtrl_64
#define SetupKWayBalMultipliers SetupKWayBalMultipliers_64
#define Setup2WayBalMultipliers Setup2WayBalMultipliers_64
#define PrintCtrl PrintCtrl_64
#define CheckParams CheckParams_64
#define FreeCtrl FreeCtrl_64
#define Refine2Way Refine2Way_64
#define Allocate2WayPartitionMemory Allocate2WayPartitionMemory_64
#define Compute2WayPartitionParams Compute2WayPartitionParams_64
#define Project2WayPartition Project2WayPartition_64
#define ConstructSeparator ConstructSeparator_64
#define ConstructMinCoverSeparator ConstructMinCoverSeparator_64
#define FM_2WayNodeRefine2Sided FM_2WayNodeRefine2Sided_64
#define FM_2WayNodeRefine1Sided FM_2WayNodeRefine1Sided_64
#define FM_2WayNodeBalance FM_2WayNodeBalance_64
#define Refine2WayNode Refine2WayNode_64
#define Allocate2WayNodePartitionMemory Allocate2WayNodePartitionMemory_64
#define Compute2WayNodePartitionParams Compute2WayNodePartitionParams_64
#define Project2WayNodePartition Project2WayNodePartition_64
#define InitTimers InitTimers_64
#define PrintTimers PrintTimers_64
#define iargmax_strd iargmax_strd_64
#define iargmax_nrm iargmax_nrm_64
#define iargmax2_nrm iargmax2_nrm_64
#define rargmax2 rargmax2_64
#define InitRandom InitRandom_64
#define metis_rcode metis_rcode_64
#define AllocateWorkSpace AllocateWorkSpace_64
#define AllocateRefinementWorkSpace AllocateRefinementWorkSpace_64
#define FreeWorkSpace FreeWorkSpace_64
#define wspacemalloc wspacemalloc_64
#define wspacepush wspacepush_64
#define wspacepop wspacepop_64
#define iwspacemalloc iwspacemalloc_64
#define rwspacemalloc rwspacemalloc_64
#define ikvwspacemalloc ikvwspacemalloc_64
#define cnbrpoolReset cnbrpoolReset_64
#define cnbrpoolGetNext cnbrpoolGetNext_64
#define vnbrpoolReset vnbrpoolReset_64
#define vnbrpoolGetNext vnbrpoolGetNext_64
#endif
#endif
