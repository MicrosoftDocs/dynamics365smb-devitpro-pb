---
title: "OnAfterGetRecord (Data Items) Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8a9b07b0-a006-4d74-93e3-ca82574952c3
caps.latest.revision: 6
manager: edupont
---
# OnAfterGetRecord (Data Items) Trigger
Executed each time a record is retrieved from the data item.  
  
## Applies To  
 Data items  
  
## Remarks  
 Use this trigger to perform any processing that is needed, based on the values in the fields of the individual records of a data item.  
  
 If the record contains [FlowFields](FlowFields.md), you can put [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md) statements in this trigger to have them calculated. While it is normally easier to use the [CalcFields Property](CalcFields-Property.md) to have it done automatically, there are situations where you have to use this trigger to perform the calculation explicitly. For example, if you apply FlowFilters based on the context of the report or the XMLport to the FlowFields inside this trigger, you need to recalculate the FlowFields after you have applied the FlowFilters.  
  
 Another example is when you need to retrieve information from a table that is external to the report or XMLport. This is the situation when the records of a data item contain fields that are foreign keys \(that is, fields that are primary keys in other tables\), and you want to extract further information from the related tables. For example, in a report, the records in a data item might contain a field with a Vendor code, while you want to print the full name and address of the vendor. You use this trigger to retrieve the information in order to print it in your report.  
  
## See Also  
 [Triggers](Triggers.md)   
 [FlowFilter Overview](FlowFilter-Overview.md)