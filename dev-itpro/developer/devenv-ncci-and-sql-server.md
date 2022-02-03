---
title: "Nonclustered Columnstore Indexes (NCCIs) and SQL Server"
description: Explains how nonclustered columnstore indexes in Business Central tables work with SQL Server.
ms.custom: na
ms.date: 01/28/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Nonclustered Columnstore Indexes and SQL Server

A nonclustered columnstore index \(NCCI\) is always associated with a table, and there can only be one defined per table.  

Any field that exists in the table, except BLOB data types, can be added to the NCCI.

## Implementing NCCI

In contrast to SIFT keys, which rely on the indexed views feature in SQL Server, NCCIs in [!INCLUDE[prod_short](includes/prod_short.md)] use only the nonclustered columnstore indexes feature. No aggregated data is stored in the NCCI&mdash;all analytical queries are done at runtime. This implementation also means you don't have to worry about the order of fields added to the NCCI or design specific NNCIs for specific flow field scenarios. 

With SIFT keys, any insert, update, or delete operations to the underlying table will introduce some database locking because the indexed views must be updated as well. The more SIFT keys that are defined on the table, the more index maintenance is needed. This problem doesn't exist with a nonclustered columnstore index.  

## See Also

[NCCI Overview)](devenv-ncci-overview.md)  
[NCCI Tuning and Tracing](devenv-ncci-tuning-and-tracing.md)  
[NCCI Performance](devenv-ncci-performance.md)  
[Migrating from SIFT to NCCI](devenv-migrating-from-sift-to-ncci.md)  