---
title: "Dialog.LogInternalError(Text, DataClassification, Verbosity) Method"
description: "Log internal errors for telemetry."
ms.author: solsen
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Dialog.LogInternalError(Text, DataClassification, Verbosity) Method
> **Version**: _Available or changed with runtime version 6.0 until version 13.0 where it was deprecated for the following reason: "Consider using 'Session.LogMessage' instead."_

Log internal errors for telemetry.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
 Dialog.LogInternalError(Message: Text, DataClassificationInstance: DataClassification, VerbosityInstance: Verbosity)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Message*  
&emsp;Type: [Text](../text/text-data-type.md)  
This string contains the text of the error message you want to log into telemetry. It is not what the user will get, they will only get a generic error message.  

*DataClassificationInstance*  
&emsp;Type: [DataClassification](../dataclassification/dataclassification-option.md)  
Sets the classification of the data in the error message.  

*VerbosityInstance*  
&emsp;Type: [Verbosity](../verbosity/verbosity-option.md)  
Represents the security level of events.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Dialog Data Type](dialog-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)