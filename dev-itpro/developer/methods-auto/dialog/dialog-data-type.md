---
title: "Dialog Data Type"
description: "Represents a dialog window."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Dialog Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents a dialog window.


The following methods are available on the Dialog data type.


|Method name|Description|
|-----------|-----------|
|[Confirm(Text [, Boolean] [, Any,...])](dialog-confirm-method.md)|Creates a dialog box that prompts the user for a yes or no answer. The dialog box is centered on the screen.|
|[Error(Text [, Any,...])](dialog-error-string-joker-method.md)|Displays an error message and ends the execution of AL code.|
|[Error(ErrorInfo)](dialog-error-errorinfo-method.md)|Displays an error message and ends the execution of AL code.|
|[LogInternalError(Text, DataClassification, Verbosity)](dialog-loginternalerror-string-dataclassification-verbosity-method.md)|Log internal errors for telemetry.|
|[LogInternalError(Text, Text, DataClassification, Verbosity)](dialog-loginternalerror-string-string-dataclassification-verbosity-method.md)|Log internal errors for telemetry.|
|[Message(Text [, Any,...])](dialog-message-method.md)|Displays a text string in a message window.|
|[StrMenu(Text [, Integer] [, Text])](dialog-strmenu-method.md)|Creates a menu window that displays a series of options.|

The following methods are available on instances of the Dialog data type.

|Method name|Description|
|-----------|-----------|
|[Close()](dialog-close-method.md)|Closes a dialog window that has been opened by the OPEN method.|
|[HideSubsequentDialogs([Boolean])](dialog-hidesubsequentdialogs-method.md)|Specifies that subsequent child dialogs are not shown.|
|[Open(Text [, var Any,...])](dialog-open-method.md)|Opens a dialog window.|
|[Update([Integer] [, Any])](dialog-update-method.md)|Updates the value of a '#'-or '@' field in the active window.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  