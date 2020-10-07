---
title: "MaintainSIFTIndex Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 4bfc7edc-4561-4da4-b725-623d1c86be99
caps.latest.revision: 7
author: SusanneWindfeldPedersen
---

# MaintainSIFTIndex Property

Sets the value to determine whether SIFT structures should be created in SQL Server to support the corresponding SumIndexFields for the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] key.  
  
## Applies to  

- Keys  
  
## Property Value  

**True** to create the SIFT structures in SQL Server; otherwise, **false**. The default is **true**. 

## Syntax

```AL
key(PK;PK) { MaintainSqlIndex=false; MaintainSiftIndex=true; }
``` 
  
## Remarks

SumIndexFields are created in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] to support FlowField calculations and other fast summing operations. SQL Server can sum numeric data by scanning the table. If the SIFT structures exist for the SumIndexFields, summing the fields is faster, especially for large sets of records, but modifications to the table are slower because the SIFT structures must also be maintained.  
  
In situations where SumIndexFields must be created on a key to enable FlowField calculations, but the calculations are performed infrequently or on small sets of data, you can disable this property to prevent slow modifications to the table.  
  
## See Also  

[Properties](devenv-properties.md)