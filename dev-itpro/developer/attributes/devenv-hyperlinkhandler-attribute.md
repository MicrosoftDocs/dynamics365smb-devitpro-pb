---
title: "HyperlinkHandler Attribute"
description: "Specifies that the method is a HyperLinkHandler method, which handles HyperLinkHandler statements."
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

# HyperlinkHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a HyperLinkHandler method, which handles HyperLinkHandler statements.


## Applies To

- Method

> [!NOTE]
> The **HyperlinkHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax


> **Version**: _Available or changed with runtime version 1.0._
```
[HyperlinkHandler]
procedure HyperlinkHandler(Message: Text[1024])
```
> [!IMPORTANT]
> The above signature requires the HyperlinkHandler method to be *global*. For more information, see [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).

> **Version**: _Available or changed with runtime version 2.1._
```
[HyperlinkHandler]
procedure HyperlinkHandler(Message: Text)
```
> [!IMPORTANT]
> The above signature requires the HyperlinkHandler method to be *global*. For more information, see [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).

### Arguments
*Message*  
&emsp;Type: [Text[1024]](../methods-auto/text/text-data-type.md)  
The actual hyperlink.  

*Message*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
The actual hyperlink.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **HyperLinkHandler** method is called when a hyperlink is invoked in the code

You use handler methods to automate tests by handling instances when user interaction is required by the code that is being tested by the test method. In these instances, the handler method is run instead of the requested user interface. The handler method should simulate the user interaction for the test case, such as validating messages, making selections, or entering values. You declare a handler type attribute on the method. For more information about handler methods, see [Creating Handler Methods](../devenv-creating-handler-methods.md).

## See Also  
[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)