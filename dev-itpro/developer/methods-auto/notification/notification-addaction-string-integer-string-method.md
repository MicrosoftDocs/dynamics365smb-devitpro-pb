---
title: "Notification.AddAction(Text, Integer, Text) Method"
description: "Specifies an action for the notification."
ms.author: solsen
ms.custom: na
ms.date: 08/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Notification.AddAction(Text, Integer, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Specifies an action for the notification.


## Syntax
```AL
 Notification.AddAction(Caption: Text, CodeunitID: Integer, MethodName: Text)
```
## Parameters
*Notification*  
&emsp;Type: [Notification](notification-data-type.md)  
An instance of the [Notification](notification-data-type.md) data type.  

*Caption*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text string that appears as the caption of the action in the notification UI. The string can be a label that is enabled for multilanguage functionality.  

*CodeunitID*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the Codeunit to run when the action is initiated from the notification UI. The codeunit should contain at least one global method to be called by the notification action. The global method must have a Notification data type parameter for accepting the notification object.  

*MethodName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name of the method in the Codeunit, which is specified by the CodeunitID parameter, that you want to run for the action.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)