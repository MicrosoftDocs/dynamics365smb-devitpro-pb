---
title: "RequestPageHandler Attribute"
description: "Specifies that the method is a RequestPageHandler method, which handles the request page of a specific report."
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

# RequestPageHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a RequestPageHandler method, which handles the request page of a specific report.


## Applies To

- Method

> [!NOTE]
> The **RequestPageHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

```
[RequestPageHandler]
procedure RequestPageHandler(var RequestPage: TestRequestPage)
```
> [!IMPORTANT]
> The above signature requires the RequestPageHandler method to be *global*. For more information, see [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).

### Arguments
*RequestPage*  
&emsp;Type: [TestRequestPage](../methods-auto/testrequestpage/testrequestpage-data-type.md)  
The ID of a specific report.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **RequestPageHandler** method is called when a report is invoked in the code. 

If you create a **ReportHandler** method, then that method replaces all code for running the report, including the request page, and a **RequestPageHandler** is not called. Only create a **RequestPageHandler** method if you are not using a **ReportHandler** one. 

You use handler methods to automate tests by handling instances when user interaction is required by the code that is being tested by the test method. In these instances, the handler method is run instead of the requested user interface. The handler method should simulate the user interaction for the test case, such as validating messages, making selections, or entering values. You declare a handler type attribute on the method. For more information about handler methods, see [Creating Handler Methods](../devenv-creating-handler-methods.md).

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[ReportHandler Attribute](devenv-reporthandler-attribute.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)