---
title: "ModalPageHandler Attribute"
description: "Specifies that the method is a ModalPageHandler method, which handles specific pages that are run modally."
ms.author: solsen
ms.custom: na
ms.date: 06/16/2021
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

# ModalPageHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a ModalPageHandler method, which handles specific pages that are run modally.


## Applies To

- Method

> [!NOTE]
> The **ModalPageHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

```
[ModalPageHandler]
procedure ModalPageHandler(var Page: TestPage)
```
> [!IMPORTANT]
> The above signature requires the method on which the **ModalPageHandler** attribute is set to be *global*. For more information, see [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).
```
[ModalPageHandler]
procedure ModalPageHandler(var Page: Page, var Response: Action)
```
> [!IMPORTANT]
> The above signature requires the method on which the **ModalPageHandler** attribute is set to be *global*. For more information, see [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).

### Arguments
*Page*  
&emsp;Type: [TestPage](../methods-auto/testpage/testpage-data-type.md)  
A specific page.  

*Page*  
&emsp;Type: [Page](../methods-auto/page/page-data-type.md)  
A specific page.  

*Response*  
&emsp;Type: [Action](../methods-auto/action/action-option.md)  
The action that the user took on the page.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **ModalPageHandler** method is called when a modal page is invoked in the code.

For more information about handler methods, see [Creating Handler Methods](../devenv-creating-handler-methods.md).

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  