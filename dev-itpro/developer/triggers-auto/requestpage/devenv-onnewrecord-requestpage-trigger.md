---
title: "OnNewRecord (Request Page) Trigger"
description: "Runs after a new record is initialized, but before it is inserted as a record in the table."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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

# OnNewRecord (Request Page) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a new record is initialized, but before it is inserted as a record in the table.


## Syntax
```AL
trigger OnNewRecord(BelowxRec: Boolean)
begin
    ...
end;
```

### Parameters

*BelowxRec*  
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
This return value indicates whether the new record is to be inserted after the last record in the table (xRec). If false, the record is to be inserted between an existing record and the last record. If true, the record is to be inserted below the last record in the table (xRec).  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Use this trigger to initialize a new record or other variables on the page. This is run before users enter any data in the record.  
  
If an error occurs in the trigger code a popup dialog shows an error message. When the dialog is closed, the user can enter new data.  

> [!IMPORTANT]  
> For pages of the type `Card`, `List`, `ListPlus`, `Document`, or `Worksheet`, the **OnNewRecord** trigger is called more than once if the page is opened in the edit mode and does not have any records to display. If the page is opened in the view mode or displays a record, the trigger is called only once.

> [!NOTE]  
> The **OnNewRecord** trigger does not support calls to control add-in methods and properties because the trigger is invoked before the page is instantiated. <!-- For more information see, [Exposing Methods and Properties in a Windows Client Control Add-in](Exposing-Methods-and-Properties-in-a-Windows-Client-Control-Add-in.md).  -->

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnNewRecord (Page) Trigger](../page/devenv-onnewrecord-page-trigger.md)  
[OnNewRecord (Request Page Extension) Trigger](../requestpageextension/devenv-onnewrecord-requestpageextension-trigger.md)  
[OnNewRecord (Page Extension) Trigger](../pageextension/devenv-onnewrecord-pageextension-trigger.md)
