---
title: "OnPostDataItem (Report Data Item) Trigger"
ms.description: "Runs after a data item is processed."
ms.author: solsen
ms.custom: na
ms.date: 04/16/2021
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

# OnPostDataItem (Report Data Item) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a data item is processed.


## Syntax
```
trigger OnPostDataItem()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This trigger runs after the last record in the data item is processed but before the [OnPostReport Trigger](../report/devenv-onpostreport-report-trigger.md) or the [OnPostXMLport Trigger](../xmlport/devenv-onpostxmlport-xmlport-trigger.md) is executed, if it is the last data item of the report or XMLport.  
  
Use this trigger to perform any cleanup or post processing needed after a data item is processed. For example, if you create a non-printing report where records are updated, you can update all the records with the modification date like shown in the example below.  
  
```AL
ModifyAll("Modification Date",TODAY);   
```  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
