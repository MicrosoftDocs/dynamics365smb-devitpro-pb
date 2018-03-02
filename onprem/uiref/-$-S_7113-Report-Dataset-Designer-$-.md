---
title: "Report Dataset Designer"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9387ce5d-5b68-4d1b-86ee-b88f15d8537b
caps.latest.revision: 8
manager: edupont
---
# Report Dataset Designer
Designs the dataset of a report.  

 To open this window, on the **Tools** menu, choose **Object Designer**, choose **Report**, and then choose the **Design** button. You can choose the **New** button instead of the **Design** button to design a new report.  

## Fields  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Expanded**|Expands and collapses all indented hierarchy. This includes child data items and columns.|  
|**Data Type**|Specifies either **DataItem** or **Column**. A data item is a table. A column can be:<br /><br /> -   A field in a table.<br />-   A variable.<br />-   An expression.<br />-   A TextConstant that could represent a caption that is not related to a specific table.|  
|**Data Source**|Specifies the source of the DataItem or Column. For example, specify the table for a DataItem, or specify a field, variable, expression, or text for a Column. On a DataItem row, either enter the table name or table number or use the up arrow to select a table from the [Object List](-$-S_2120-Object-List-$-.md) window. On a Column row, either enter a value or choose the **AssistEdit** button or use the **Field Menu** to select a field, variable, or text constant from the **C/AL Symbol Menu**.|  
|**Name**|Specifies a name that complies with the Common Language Specification \(CLS\). For more information, see the "Naming" section in [Common Language Specification](http://go.microsoft.com/fwlink/?LinkId=193144) in the MSDN Library.|  
|**Include Caption**|Includes the caption of a field in the dataset when the check box of a Column data type is selected. For more information about how to include captions, see [IncludeCaption Property](../IncludeCaption-Property.md).|  

## See Also  
 [Reports](../Reports.md)
