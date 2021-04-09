---
title: "System.GuiAllowed Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# System.GuiAllowed Method
> **Version**: _Available or changed with runtime version 1.0._

Checks whether the AL code can show any information on the screen.


## Syntax
```
Ok :=   System.GuiAllowed()
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

User Portal Application Server accepts GuiAllowed.  

## Example  

This example shows how to use the GuiAllowed method.  

```al
var
    Text000: Label 'Code is running on a client.';
begin
    if GuiAllowed then  
     Message(Text000);  
end;
```  

 If the code runs on a client, which means that the user interface is available, a message box will appear with the following message.  

 **Code is running on a client**  

 If the code runs on Microsoft Dynamics NAV Application Server, then the message will not be displayed.  

> [!NOTE]  
> If the [Message Method \(Dialog\)](../../methods-auto/dialog/dialog-message-method.md) or the [Error Method \(Dialog\)](../../methods-auto/dialog/dialog-error-method.md) is called when the code is running on Microsoft Dynamics NAV Application Server, then the message is written to the event log of the operating system. 

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)