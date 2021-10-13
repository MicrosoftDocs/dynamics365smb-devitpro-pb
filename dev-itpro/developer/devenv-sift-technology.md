---
title: "SumIndexField Technology (SIFT)"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# SumIndexField Technology (SIFT)
SumIndexField Technology \(SIFT\) lets you quickly calculate the sums of numeric data type \(Decimal, Integer, BigInteger, and Duration\) columns in tables, even in tables with thousands of records. SIFT is used to optimize the performance of FlowFields and query results in a [!INCLUDE[prod_short](includes/prod_short.md)] application. SIFT involves performing a series of database calls and calculations before arriving at a result. The topics in this section describes how SIFT is implemented in [!INCLUDE[prod_short](includes/prod_short.md)].  
  
## See Also  

[SIFT and SQL Server](devenv-sift-and-sql-server.md)  
[SIFT Tuning and Tracing](devenv-sift-tuning-and-tracing.md)  
[SIFT Performance](devenv-sift-performance.md)  
[FlowFields](devenv-flowfields.md)