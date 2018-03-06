---
title: "Table View"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a21f8728-9759-49a2-8f4b-a45223cfa8d5
caps.latest.revision: 8
manager: edupont
---
# Table View
Specifies the sorting and filtering for the data item.  

 To open this window, on the **Tools** menu, choose **Object Designer**, choose **Report**, choose the **Design** button, choose a DataItem, and then on the **View** menu, choose **Properties**. Locate the **DataItemTableView** property, and then choose the **AssistButton** in the **Value** column.  

## Fields  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Key**|Specifies a table key on which you want to sort the data in the report or choose the **Up Arrow** button to select a key from the [Key List](-$-S_2123-Key-List-$-.md) window. If you specify a key, then this data item does not have a FastTab on the request page, and end users cannot select a key for sorting, sort order, or filters for the data item.|  
|**Order**|Specifies the sort order by choosing either **Ascending** or **Descending** from the drop-down list. If you specify a sort order, then this sort order is used for the report regardless of the sort order that the end user selects on the request page.|  
|**Table Filter**|Specifies a filter expression to use to filter the data in the report or choose the **AssistEdit** button to enter a filter in the [Table Filter](-$-S_2131-Table-Filter-$-.md) window. If you specify a filter, then this filter is not displayed on the request page, but it is used along with any filters that the end user specifies on the request page.|  

## See Also  
 [DataItemTableView Property](../DataItemTableView-Property.md)
