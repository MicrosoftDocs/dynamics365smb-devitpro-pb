---
title: "ErrorInfo.DataClassification([DataClassification]) Method"
description: "Specifies the classification of the error."
ms.author: solsen
ms.custom: na
ms.date: 10/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.DataClassification([DataClassification]) Method
> **Version**: _Available or changed with runtime version 3.0._

Specifies the classification of the error. Values include 'CustomerContent', 'EndUserIdentifiableInformation', 'EndUserPseudonymousIdentifiers', 'AccountData', 'OrganizationIdentifiableInformation', 'SystemMetadata', and 'ToBeClassified'


## Syntax
```AL
[DataClassification := ]  ErrorInfo.DataClassification([DataClassification: DataClassification])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] DataClassification*  
&emsp;Type: [DataClassification](../dataclassification/dataclassification-option.md)  
The data classification of the content in the message.  


## Return Value
*[Optional] DataClassification*  
&emsp;Type: [DataClassification](../dataclassification/dataclassification-option.md)  
The current data classification of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[ErrorInfo Data Type](errorinfo-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)