---
title: "CompressionType"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c90654ad-da85-496c-900a-1c2fc7dd2f2b
caps.latest.revision: 13
---

 

# CompressionType Property

Specifies whether data compression is used on the table, and if so, what type of compression is used. 
  
## Applies To  
  
-   Tables of the [type](devenv-tabletype-property.md) `Normal` 

## Property Values  

| Value    |Description   |
|----------|------------|
|None         |Do not use compression on the table.|
|Page        |Compress the table on a page-level. This includes row, prefix, and dictionary compression.| 
|Row        |Compress the table on a row-level.|
|Unspecified        |Use the compression type that is specified externally on the table, for example, in SQL Server.|

## Remarks

With `None`, `Page`, and `Row`, the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] table synchronization process will make changes to table in SQL Server. `Unspecified` lets you control data compression directly on SQL Server.

For information about table compression in SQL Server, see [Data Compression](https://docs.microsoft.com/en-us/sql/relational-databases/data-compression/data-compression)

> [!NOTE]  
>  If you set multiple permissions, then one or the other applies. 

## Syntax
```
CompressionType = None|Page|Row|Unspecified; 
```


## See Also  
[Properties](devenv-properties.md)  
[Page object](../devenv-page-object.md)