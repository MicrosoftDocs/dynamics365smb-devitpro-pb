---
title: "RequestPageHandler attribute"
description: "Specifies that the method is a RequestPageHandler method, which handles the request page of a specific report."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# RequestPageHandler attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a RequestPageHandler method, which handles the request page of a specific report.


## Applies to

- Method

> [!NOTE]
> The **RequestPageHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax


> **Version**: _Available or changed with runtime version 1.0._
```AL
[RequestPageHandler]
procedure RequestPageHandler(var RequestPage: TestRequestPage)
```
> [!IMPORTANT]
> The above signature requires the RequestPageHandler method to be *global*. Learn more in [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).

### Arguments
*RequestPage*  
&emsp;Type: [TestRequestPage](../methods-auto/testrequestpage/testrequestpage-data-type.md)  
The ID of a specific report.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `RequestPageHandler` method is called when code invokes a report's request page.

If a test uses a `ReportHandler` method for a report, the handler replaces the report run, including its request page. The `RequestPageHandler` method isn't called. Use `RequestPageHandler` only when the test doesn't use `ReportHandler` for that report.

You use handler methods to automate tests by handling instances when user interaction is required by the code that is being tested by the test method. In these instances, the handler method is run instead of the requested user interface. The handler method should simulate the user interaction for the test case, such as validating messages, making selections, or entering values. You declare a handler type attribute on the method. Learn more about handler methods in [Create Handler Methods](../devenv-creating-handler-methods.md).

## Related information

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[ReportHandler Attribute](devenv-reporthandler-attribute.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)
