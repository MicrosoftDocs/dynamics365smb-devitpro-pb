---
title: "ErrorInfo Data Type"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo Data Type
> **Version**: _Available from runtime version 3.0._

Provides a structure for grouping information about an error.

> [!NOTE]
> This data type is supported only in Business Central on-premises.


The following methods are available on instances of the ErrorInfo data type.

|Method name|Description|
|-----------|-----------|
|[ErrorType([ErrorType])](errorinfo-errortype-method.md)|Specifies type of the error. 'Client' shows the specified message in the client and sends it to telemetry. 'Internal' shows a generic message in the client and sends the specified message to telemetry.|
|[Verbosity([Verbosity])](errorinfo-verbosity-method.md)|Specifies the severity level of the error. This can determine whether the error should be sent to telemetry (which is based on the trace level setting of the server).|
|[DataClassification([DataClassification])](errorinfo-dataclassification-method.md)|Specifies the severity level of the error. Values include 'Critical', 'Error', 'Warning', 'Normal', and 'Verbose'|
|[Message([String])](errorinfo-message-method.md)|Specifies the message that will be sent to telemetry. For a 'Client' error type, the message will also be appear in the client.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  