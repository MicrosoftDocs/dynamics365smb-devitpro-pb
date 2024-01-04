---
title: "ErrorInfo Data Type"
description: "Provides a structure for grouping information about an error."
ms.author: solsen
ms.custom: na
ms.date: 12/01/2023
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


## Static methods
The following methods are available on the ErrorInfo data type.


|Method name|Description|
|-----------|-----------|
|[Create()](errorinfo-create--method.md)|Creates a new ErrorInfo object with Collectible set to true.|
|[Create(Text [, Boolean] [, var Record] [, Integer] [, Integer] [, Text] [, Verbosity] [, DataClassification] [, Dictionary of [Text, Text]])](errorinfo-create-string-boolean-table-integer-integer-string-verbosity-dataclassification-dictionary[text,text]-method.md)|Creates a new ErrorInfo object.|

## Instance methods
The following methods are available on instances of the ErrorInfo data type.

|Method name|Description|
|-----------|-----------|
|[AddAction(Text, Integer, Text)](errorinfo-addaction-string-integer-string-method.md)|Specifies an action for the error.|
|[AddAction(Text, Integer, Text, Text)](errorinfo-addaction-string-integer-string-string-method.md)|Specifies an action for the error.|
|[AddNavigationAction([Text])](errorinfo-addnavigationaction-string-method.md)|Adds a navigation action for the error.|
|[AddNavigationAction([Text] [, Text])](errorinfo-addnavigationaction-string-string-method.md)|Adds a navigation action for the error.|
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
|[Title([Text])](errorinfo-title-method.md)|Specifies the title of the error.|
|[Verbosity([Verbosity])](errorinfo-verbosity-method.md)|Specifies the severity level of the error. This can determine whether the error should be sent to telemetry (which is based on the trace level setting of the server).|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 

The different properties in the `ErrorInfo` data type are used in different ways for error handling, such as collectable errors, actionable errors, or what is shown in the user interface. 

|Use this method... | when you want to... |
|-----------|-----------|
|[AddAction(Text, Integer, Text)](errorinfo-addaction-string-integer-string-method.md)| Make the error actionable and add a fix-it action to the error message. For more information, see [Actionable errors](../../devenv-actionable-errors.md).  |
|[AddAction(Text, Integer, Text, Text)](errorinfo-addaction-string-integer-string-string-method.md)|Make the error actionable and add a fix-it action to the error message. For more information, see [Actionable errors](../../devenv-actionable-errors.md). |
|[AddNavigationAction([Text])](errorinfo-addnavigationaction-string-method.md)|Make the error actionable and add a show-it action to the error message. For more information, see [Actionable errors](../../devenv-actionable-errors.md). |
|[AddNavigationAction([Text] [, Text])](errorinfo-addnavigationaction-string-string-method.md)| Make the error actionable and add a show-it action to the error message. For more information, see [Actionable errors](../../devenv-actionable-errors.md).|
|[Collectible([Boolean])](errorinfo-collectible-method.md)| Make the error collectable and be part of a larger validation scenario. For more information, see [Collecting errors](../../devenv-error-collection.md). |
|[ControlName([Text])](errorinfo-controlname-method.md)| Make the error actionable and add a show-it action to the error message. For more information, see [Actionable errors](../../devenv-actionable-errors.md). |
|[CustomDimensions([Dictionary of [Text, Text]])](errorinfo-customdimensions-method.md)| Make the error actionable and add a fix-it action to the error message. The data in CustomDimensions can be used by the codeunit used in the action. For more information, see [Actionable errors](../../devenv-actionable-errors.md). |
|[DetailedMessage([Text])](errorinfo-detailedmessage-method.md)| Add more details (hidden for the user) for the person who need to troubleshoot the error.|
|[FieldNo([Integer])](errorinfo-fieldno-method.md)| Make the error actionable and add a show-it action to the error message. For more information, see [Actionable errors](../../devenv-actionable-errors.md).|
|[Message([Text])](errorinfo-message-method.md)| Show a message to the user. For more information, see [User experience guidelines for errors](../../devenv-error-handling-guidelines.md) |
|[PageNo([Integer])](errorinfo-pageno-method.md)| Make the error actionable and add a show-it action to the error message. For more information, see [Actionable errors](../../devenv-actionable-errors.md). |
|[RecordId([RecordId])](errorinfo-recordid-method.md)| Make the error actionable and add a fix-it action to the error message. For more information, see [Actionable errors](../../devenv-actionable-errors.md). |
|[SystemId([Guid])](errorinfo-systemid-method.md)| Make the error actionable and add a show-it action to the error message. For more information, see [Actionable errors](../../devenv-actionable-errors.md). |
|[TableId([Integer])](errorinfo-tableid-method.md)|Specifies the table ID that the error relates to.|
|[Title([Text])](errorinfo-title-method.md)| Add a title to the error message. Not recommended for validation errors. |


## See Also

[Error(ErrorInfo) method](../dialog/dialog-error-errorinfo-method.md)   
[Actionable errors](../../devenv-actionable-errors.md)  
[Collecting errors](../../devenv-error-collection.md)  
[User experience guidelines for errors](../../devenv-error-handling-guidelines.md)  
[Error handling](../../devenv-al-error-handling.md)   
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  