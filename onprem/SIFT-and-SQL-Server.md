---
title: "SIFT and SQL Server"
author: kennieNP
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6a0cc8fb-74eb-4636-a173-86b9adc3af73
ms.author: kepontop
---
# SIFT and SQL Server
A SumIndexField is always associated with a key and each key can have a maximum of 20 SumIndexFields associated with it. In this topic, a key that has at least one SumIndexField associated with it is a SIFT key.  

> [!IMPORTANT]  
>  Any field that has a numeric data type of Decimal, Integer, BigInteger, or Duration, can be associated with a key as a SumIndexField.  

## Implementing SIFT  
 [!INCLUDE[navnowlong](includes/navnowlong_md.md)] uses *Indexed Views* to maintain SIFT totals. Indexed views are a standard SQL Server feature. An indexed view is like a SQL Server view except that the contents have been materialized \(computed and stored\) to speed up the retrieval of data. For more information about indexed views, see SQL Server Books Online.  

 [!INCLUDE[navnowlong](includes/navnowlong_md.md)] creates one indexed view for each SIFT key that is enabled. When you create a SIFT key for a table, you must set the **MaintainSIFTIndex** property for that key to **Yes** to enable the SIFT key and create the indexed view. After SQL Server has created the indexed view, it maintains the contents of the view when any changes are made to the base table. If you set the **MaintainSIFTIndex** property for that key to **No**, SQL Server drops the indexed view and stops maintaining the totals.  

 The indexed view that is generated for a SIFT key is always created at the level of finest granularity. Therefore, if you create a SIFT key for `AccountNo., PostingDate`, the database will store an aggregated value for each account for each date. This means that in the worst case scenario, 365 records must be summed to generate the total for each account for a year.  

 The following is an example of how [!INCLUDE[navnowlong](includes/navnowlong_md.md)] creates an indexed view for a SIFT key that consists of the **AccountNo.** and **PostingDate** fields with a total for the **Amount** field.  

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

 The following C/AL code example retrieves a total.  

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
 [Tuning and Tracing](Tuning-and-Tracing.md)   
 [SIFT and Performance](SIFT-and-Performance.md)   
 [SumIndexField Technology \(SIFT\)](SumIndexField-Technology--SIFT-.md)  
