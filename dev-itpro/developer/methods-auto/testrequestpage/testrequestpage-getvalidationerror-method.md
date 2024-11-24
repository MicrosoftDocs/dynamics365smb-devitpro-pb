---
title: "TestRequestPage.GetValidationError([Integer]) Method"
description: "Gets the validation error that occurred on a test page."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestRequestPage.GetValidationError([Integer]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the validation error that occurred on a test page.


## Syntax
```AL
Error :=   TestRequestPage.GetValidationError([Index: Integer])
```
## Parameters
*TestRequestPage*  
&emsp;Type: [TestRequestPage](testrequestpage-data-type.md)  
An instance of the [TestRequestPage](testrequestpage-data-type.md) data type.  

*[Optional] Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The index of the validation error that occurred on the test page.  


## Return Value
*Error*  
&emsp;Type: [Text](../text/text-data-type.md)  
The validation error that occurred at the specified index.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestRequestPage Data Type](testrequestpage-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
