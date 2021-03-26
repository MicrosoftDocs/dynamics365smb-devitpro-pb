---
title: "TestRequestPage.GetValidationError Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# TestRequestPage.GetValidationError Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the validation error that occurred on a test page.


## Syntax
```
Error :=   TestRequestPage.GetValidationError([Index: Integer])
```
## Parameters
*TestRequestPage*
&emsp;Type: [TestRequestPage](testrequestpage-data-type.md)
An instance of the [TestRequestPage](testrequestpage-data-type.md) data type.

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The index of the validation error that occurred on the test page.  


## Return Value
*Error*
&emsp;Type: [String](../string/string-data-type.md)
The validation error that occured at the specified index.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestRequestPage Data Type](testrequestpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)