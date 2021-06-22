---
title: "ConfirmHandler Attribute"
description: "Specifies that the method is a ConfirmHandler method, which handles Confirm statements."
ms.author: solsen
ms.custom: na
ms.date: 06/22/2021
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

# ConfirmHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a ConfirmHandler method, which handles Confirm statements.


## Applies To

- Method

> [!NOTE]
> The **ConfirmHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

> **Version**: _Available or changed with runtime version 1.0._
```
[ConfirmHandler]
procedure ConfirmHandler(Question: Text[1024], var Reply: Boolean)
```
> [!IMPORTANT]
> The above signature requires the ConfirmHandler method to be *global*. For more information, see [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).
> **Version**: _Available or changed with runtime version 2.1._
```
[ConfirmHandler]
procedure ConfirmHandler(Question: Text, var Reply: Boolean)
```
> [!IMPORTANT]
> The above signature requires the ConfirmHandler method to be *global*. For more information, see [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).

### Arguments
*Question*  
&emsp;Type: [Text[1024]](../methods-auto/text/text-data-type.md)  
The text of the test method.  

*Question*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
The text of the test method.  

*Reply*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether the response to confirm is *yes* or *no*.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **ConfirmHandler** method is called when a confirm method is invoked in the code.

You use handler methods to automate tests by handling instances when user interaction is required by the code that is being tested by the test method. In these instances, the handler method is run instead of the requested user interface. The handler method should simulate the user interaction for the test case, such as validating messages, making selections, or entering values. You declare a handler type attribute on the method. For more information about handler methods, see [Creating Handler Methods](../devenv-creating-handler-methods.md).

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  