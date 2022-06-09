---
title: "ErrorInfo Data Type"
description: "Provides a structure for grouping information about an error."
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
# ErrorInfo Data Type
> **Version**: _Available or changed with runtime version 3.0._

Provides a structure for grouping information about an error.


The following methods are available on the ErrorInfo data type.


|Method name|Description|
|-----------|-----------|
|[Create()](errorinfo-create--method.md)|Creates a new ErrorInfo object with Collectible set to true.|
|[Create(Text [, Boolean] [, var Record] [, Integer] [, Integer] [, Text] [, Verbosity] [, DataClassification] [, Dictionary of [Text, Text]])](errorinfo-create-string-boolean-table-integer-integer-string-verbosity-dataclassification-dictionary[text,text]-method.md)|Creates a new ErrorInfo object.|

The following methods are available on instances of the ErrorInfo data type.

|Method name|Description|
|-----------|-----------|
|[Callstack()](errorinfo-callstack-method.md)|Specifies a callstack where the ErrorInfo was collected.|
|[Collectible([Boolean])](errorinfo-collectible-method.md)|Specifies if the error is collectible using ErrorBehavior.Collect.|
|[ControlName([Text])](errorinfo-controlname-method.md)|Specifies the control name that the error relates to.|
|[CustomDimensions([Dictionary of [Text, Text]])](errorinfo-customdimensions-method.md)|Set of additional dimensions, specified as a dictionary that relates to the error.|
|[DataClassification([DataClassification])](errorinfo-dataclassification-method.md)|Specifies the classification of the error. Values include 'CustomerContent', 'EndUserIdentifiableInformation', 'EndUserPseudonymousIdentifiers', 'AccountData', 'OrganizationIdentifiableInformation', 'SystemMetadata', and 'ToBeClassified'|
|[DetailedMessage([Text])](errorinfo-detailedmessage-method.md)|Specifies a detailed error message.|
|[ErrorType([ErrorType])](errorinfo-errortype-method.md)|Specifies type of the error. 'Client' shows the specified message in the client and sends it to telemetry. 'Internal' shows a generic message in the client and sends the specified message to telemetry.|
|[FieldNo([Integer])](errorinfo-fieldno-method.md)|Specifies the field ID that the error relates to.|
|[Message([Text])](errorinfo-message-method.md)|Specifies the message that will be sent to telemetry. For a 'Client' error type, the message will also be appear in the client.|
|[PageNo([Integer])](errorinfo-pageno-method.md)|Specifies the page number that the error relates to.|
|[RecordId([RecordId])](errorinfo-recordid-method.md)|Specifies the record ID of the record that the error relates to.|
|[SystemId([Guid])](errorinfo-systemid-method.md)|Specifies the system ID of the record that the error relates to.|
|[TableId([Integer])](errorinfo-tableid-method.md)|Specifies the table ID that the error relates to.|
|[Verbosity([Verbosity])](errorinfo-verbosity-method.md)|Specifies the severity level of the error. This can determine whether the error should be sent to telemetry (which is based on the trace level setting of the server).|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## See Also

[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  