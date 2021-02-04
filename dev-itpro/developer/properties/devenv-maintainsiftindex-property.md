---
title: "MaintainSiftIndex Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# MaintainSiftIndex Property
> **Version**: _Available from runtime version 1.0._

Sets the value to determine whether SIFT structures (indexed views) should be created in SQL Server to support the corresponding SumIndexFields part of the Dynamics 365 Business Central key.  

## Applies to
-   Table Key


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**True** to create the SIFT structures (indexed views) in SQL Server; otherwise, **false**. The default is **true**. 

## Syntax

```AL
key(<key name>;<comma-separated list of lookup fields>) { 
    MaintainSiftIndex=[true|false];
    SumIndexFields=<comma-separated list of aggregation fields>
}
``` 
  
## Remarks
SumIndexFields are created in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] to support FlowField calculations and other fast summing operations. SQL Server can sum numeric data by scanning the table. If the SIFT structures exist for the SumIndexFields, summing the fields is faster, especially for large sets of records, but modifications to the table are slower because the SIFT structures must also be maintained.  
  
In situations where SumIndexFields must be created on a key to enable FlowField calculations, but the calculations are performed infrequently or on small sets of data, you can disable this property to prevent slow modifications to the table.  
  
## See Also  
[SumIndexFields Property](devenv-sumindexfields-property.md)  
[Properties](devenv-properties.md)