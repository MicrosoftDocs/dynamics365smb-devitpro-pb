---
title: "PageHandler Attribute"
description: "Specifies that the method is a PageHandler method, which handles specific pages that are not run modally."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
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

# PageHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a PageHandler method, which handles specific pages that are not run modally.


## Applies To

- Method

> [!NOTE]
> The **PageHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

> **Version**: _Available or changed with runtime version 1.0._

```
[PageHandler]
procedure PageHandler(var Page: TestPage)
```
> **Version**: _Available or changed with runtime version 2.1._

```
[PageHandler]
procedure PageHandler(var Page: Page)
```

### Arguments
*Page*  
&emsp;Type: [TestPage](../methods-auto/testpage/testpage-data-type.md)  
A specific page.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **PageHandler** method is called when a non-modal page is invoked in the code. 

For more information about handler methods, see [Creating Handler Methods](../devenv-creating-handler-methods.md).

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)