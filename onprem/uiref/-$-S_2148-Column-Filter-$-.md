---
title: "Column Filter"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 46f68d4a-aedc-42cf-a032-508b64fb9aaf
caps.latest.revision: 8
manager: edupont
---
# Column Filter
Sets a filter on the Column row of a query.  
  
 To open this window, open Query Designer, and then select a column in the designer. On the **View** menu, choose **Properties**, locate the **ColumnFilter** property, and then choose the **AssistEdit** button in the **Value** field. For more information about how to open Query Designer, see [Query Designer](-$-S_22401-Query-Designer-$-.md).  
  
> [!NOTE]  
>  The filter on a Column row is similar to a filter on a data item except that the filter of a Column row can be programmatically overwritten by calling the [SETFILTER Function \(Query\)](../SETFILTER-Function--Query-.md) and [SETRANGE Function \(Query\)](../SETRANGE-Function--Query-.md) from C/AL code.  
  
## Fields  
  
|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Column**|The column on which to set the filter.|  
|**Type**|The type of filter that you want to set. Set this field to **CONST** if you want to filter on constant value. Set the field to **FILTER** if you want to set a filter that is based on an expression.|  
|**Value**|The constant value or the filter expression you want to set for **Type**.|