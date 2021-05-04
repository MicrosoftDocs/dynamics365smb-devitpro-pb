---
title: "OnInit (Request Page) Trigger"
description: "Initializes the user-defined variables on the page."
ms.author: solsen
ms.custom: na
ms.date: 04/27/2021
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

# OnInit (Request Page) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Initializes the user-defined variables on the page.


## Syntax
```
trigger OnInit()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

The AL code in this trigger is run immediately after the variables are cleared and the page is loaded. This trigger cannot be used to access the controls on the page. You can change properties that are dynamic, including those properties that can only be changed when the page is opened.  
  
After this trigger is executed, the [OnOpenPage Trigger](devenv-onopenpage-page-trigger.md) for pages is called. If an error occurs in the trigger code, then the page is closed.  
  
> [!NOTE]  
> The **OnInit** trigger does not support calls to control add-in methods and properties because the trigger is invoked before the page is instantiated. <!-- For more information see, [Exposing Methods and Properties in a Windows Client Control Add-in](exposing-methods-and-properties-in-a-windows-client-pagefield-add-in.md). --> 

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnInit (Page) Trigger](../page/devenv-oninit-page-trigger.md)
