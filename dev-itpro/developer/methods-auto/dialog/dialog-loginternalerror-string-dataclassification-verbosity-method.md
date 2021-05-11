---
title: "Dialog.LogInternalError Method"
description: "Log internal errors for telemetry."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Dialog.LogInternalError Method
> **Version**: _Available or changed with runtime version 6.0._

Log internal errors for telemetry.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
 Dialog.LogInternalError(Message: String, DataClassificationInstance: DataClassification, VerbosityInstance: Verbosity)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Message*  
&emsp;Type: [String](../string/string-data-type.md)  
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
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)