---
title: "HandlerFunctions attribute"
description: "Specifies the handler methods that are used by the test method."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# HandlerFunctions attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies the handler methods that are used by the test method.


## Applies to

- Method

> [!NOTE]
> The **HandlerFunctions** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

```AL
[HandlerFunctions(HandlerNames: Text)]
```

### Arguments
*HandlerNames*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
The names of the handler methods used by the test method.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> If the test method uses more than one handler method, separate the handler method names with commas.
  
## Remarks

You use test codeunits and test methods to test your application. A handler method allows you to automate tests by handling instances when user interaction is required by the code that is being tested. In these instances, the test method calls the handler method, which is run instead of the user interface.

The following rules apply to handler methods:

- A handler method must have one of these attributes:
  - [MessageHandler](devenv-messagehandler-attribute.md)
  - [ConfirmHandler](devenv-confirmhandler-attribute.md)
  - [StrMenuHandler](devenv-strmenuhandler-attribute.md)
  - [PageHandler](devenv-pagehandler-attribute.md)
  - [ModalPageHandler](devenv-modalpagehandler-attribute.md)
  - [ReportHandler](devenv-reporthandler-attribute.md)
  - [RequestPageHandler](devenv-requestpagehandler-attribute.md)
  - [SendNotificationHandler](devenv-sendnotificationhandler-attribute.md)
  - [HyperlinkHandler](devenv-hyperlinkhandler-attribute.md)
  - [RecallNotificationHandler](devenv-recallnotificationhandler-attribute.md)
  - [SessionSettingsHandler](devenv-sessionsettingshandler-attribute.md)
  - [FilterPageHandler](devenv-filterpagehandler-attribute.md)
  - [HttpClientHandler](devenv-httpclienthandler-attribute.md)

- A test method can only call handler methods that are defined in the same test codeunit as the test method.

- Every nonoptional handler method that you enter in the `HandlerFunctions` attribute must be called at least once in the test method. If you execute a test method that has a nonoptional handler method listed that isn't called, then the test fails. Send-notification and recall-notification handlers can be optional.

Learn more about handler methods in [Create handler methods](../devenv-creating-handler-methods.md).

## Example

```al
[Test]
[HandlerFunctions('SendNotificationHandler,MessageHandler')]
procedure MyTestFunction()
begin
    ...
end;
```

## Related information

[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
