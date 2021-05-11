---
title: "SIFT and SQL Server"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# SIFT and SQL Server
A SumIndexField is always associated with a key and each key can have a maximum of 20 SumIndexFields associated with it. In this topic, a key that has at least one SumIndexField associated with it is a SIFT key.  

> [!IMPORTANT]  
>  Any field that has a numeric data type of Decimal, Integer, BigInteger, or Duration, can be associated with a key as a SumIndexField.  

## Implementing SIFT  
 [!INCLUDE[prod_short](includes/prod_short.md)] uses *Indexed Views* to maintain SIFT totals. Indexed views are a standard SQL Server feature. An indexed view is like a SQL Server view except that the contents have been materialized \(computed and stored\) to speed up the retrieval of data. For more information about indexed views, see [SQL Server Documentation](/sql/sql-server/).  

 [!INCLUDE[prod_short](includes/prod_short.md)] creates one indexed view for each SIFT key that is enabled. When you create a SIFT key for a table, you must set the [MaintainSIFTIndex Property](properties/devenv-maintainsiftindex-property.md) for that key to **True** to enable the SIFT key and create the indexed view. After SQL Server has created the indexed view, it maintains the contents of the view when any changes are made to the base table. If you set the [MaintainSIFTIndex Property](properties/devenv-maintainsiftindex-property.md) for that key to **False**, SQL Server drops the indexed view and stops maintaining the totals.  

 The indexed view that is generated for a SIFT key is always created at the level of finest granularity. Therefore, if you create a SIFT key for `AccountNo., PostingDate`, the database will store an aggregated value for each account for each date. This means that in the worst case scenario, 365 records must be summed to generate the total for each account for a year.  

 The following is an example of how [!INCLUDE[prod_short](includes/prod_short.md)] creates an indexed view for a SIFT key that consists of the **AccountNo.** and **PostingDate** fields with a total for the **Amount** field.  

```  
CREATE VIEW GLEntry$VSIFT$1 AS
SELECT SUM(Amount) as SUM$Amount, AccountNo, PostingDate
FROM GLEntry
GROUP BY AccountNo, PostingDate  
;

CREATE UNIQUE CLUSTERED INDEX VSIFTIDX ON  
GLEntry$VSIFT$1(AccountNo, PostingDate)  
;
```  

 The following AL code example retrieves a total.  

```  
GLEntry.SETCURRENTKEY("G/L Account No.","Posting Date");  
GLEntry.SETRANGE("G/L Account No.",'1110');  
GLEntry.SETRANGE("Posting Date",DMY2DATE(1,1,2007),DMY2DATE(15,12,2007));  
GLEntry.CALCSUMS(Amount); 
```  

 The following code example shows how the same total is retrieved through an indexed view.  

```  
SELECT SUM(SUM$Amount)
FROM GLEntry$VSIFT$1 WITH(NOEXPAND)
WHERE AccountNo=?
AND PostingDate>=?
AND PostingDate<=?  
```  

## See Also
[SumIndexField Technology \(SIFT\)](devenv-sift-technology.md)  
[Tuning and Tracing](devenv-sift-Tuning-and-Tracing.md)   
[SIFT and Performance](devenv-SIFT-Performance.md)