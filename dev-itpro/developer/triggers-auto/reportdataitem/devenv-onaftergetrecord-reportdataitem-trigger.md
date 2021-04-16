---
title: "OnAfterGetRecord (Report Data Item) Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/14/2021
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

# OnAfterGetRecord (Report Data Item) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs each time a record is retrieved from the data item.



## Syntax
```
trigger OnAfterGetRecord()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Use this trigger to perform any processing that is needed, based on the values in the fields of the individual records of a data item.  

If the record contains [FlowFields](../../devenv-flowfields.md), you can put [CalcFields Method \(Record\)](../../methods-auto/record/record-calcfields-method.md) statements in this trigger to have them calculated. While it is normally easier to use the [CalcFields Property](../../properties/devenv-calcfields-property.md) to have it done automatically, there are situations where you have to use this trigger to perform the calculation explicitly. For example, if you apply FlowFilters based on the context of the report or the XMLport to the FlowFields inside this trigger, you need to recalculate the FlowFields after you have applied the FlowFilters.  

Another example is when you need to retrieve information from a table that is external to the report or XMLport. This is the situation when the records of a data item contain fields that are foreign keys \(that is, fields that are primary keys in other tables\), and you want to extract further information from the related tables. For example, in a report, the records in a data item might contain a field with a Vendor code, while you want to print the full name and address of the vendor. You use this trigger to retrieve the information in order to print it in your report.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnAfterGetRecord (Page) Trigger](../page/devenv-onaftergetrecord-page-trigger.md)  
[OnAfterGetRecord (Request Page) Trigger](../requestpage/devenv-onaftergetrecord-requestpage-trigger.md)  
[OnAfterGetRecord (Request Page Extension) Trigger](../requestpageextension/devenv-onaftergetrecord-requestpageextension-trigger.md)  
[OnAfterGetRecord (Page Extension) Trigger](../pageextension/devenv-onaftergetrecord-pageextension-trigger.md)  
[OnAfterGetRecord (Xml Port Table Element) Trigger](../xmlporttableelement/devenv-onaftergetrecord-xmlporttableelement-trigger.md)
