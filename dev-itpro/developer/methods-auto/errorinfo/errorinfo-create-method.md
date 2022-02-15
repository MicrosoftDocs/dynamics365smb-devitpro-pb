---
title: "ErrorInfo.Create(String [, Boolean] [, var Record] [, Integer] [, Integer] [, String] [, Verbosity] [, DataClassification] [, Dictionary of [Text, Text]]) Method"
description: "Creates a new ErrorInfo object."
ms.author: solsen
ms.custom: na
ms.date: 08/24/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.Create(String [, Boolean] [, var Record] [, Integer] [, Integer] [, String] [, Verbosity] [, DataClassification] [, Dictionary of [Text, Text]]) Method
> **Version**: _Available or changed with runtime version 8.0._

Creates a new ErrorInfo object.


## Syntax
```AL
Error :=   ErrorInfo.Create(Message: String [, Collectible: Boolean] [, var Record: Record] [, FieldNo: Integer] [, PageNo: Integer] [, ControlName: String] [, Verbosity: Verbosity] [, DataClassification: DataClassification] [, CustomDimensions: Dictionary of [Text, Text]])
```
## Parameters
*Message*  
&emsp;Type: [String](../string/string-data-type.md)  
The error message.  
*[Optional] Collectible*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the error can be collected using ErrorBehavior.Collect. This parameter is optional.  
*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
A record that the error relates to. This parameter is optional.  
*[Optional] FieldNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
A field number that the error relates to. This parameter is optional.  
*[Optional] PageNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
A page that the error relates to. This parameter is optional.  
*[Optional] ControlName*  
&emsp;Type: [String](../string/string-data-type.md)  
A control name that the error relates to. This parameter is optional.  
*[Optional] Verbosity*  
&emsp;Type: [Verbosity](../verbosity/verbosity-option.md)  
The verbosity of the error. This parameter is optional.  
*[Optional] DataClassification*  
&emsp;Type: [DataClassification](../dataclassification/dataclassification-option.md)  
Classification of data in the message. This parameter is optional.  
*[Optional] CustomDimensions*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
Set of additional dimensions, specified as a dictionary. This parameter is optional.  


## Return Value
*Error*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also

[Collecting Errors](../../devenv-error-collection.md)  
[ErrorInfo Data Type](errorinfo-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)