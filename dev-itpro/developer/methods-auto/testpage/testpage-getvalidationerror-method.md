---
title: "TestPage.GetValidationError([Integer]) Method"
description: "Gets the list of all validation error that occurred on a test page as a string."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestPage.GetValidationError([Integer]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the list of all validation error that occurred on a test page as a string.


## Syntax
```AL
Error :=   TestPage.GetValidationError([Index: Integer])
```
## Parameters
*TestPage*  
&emsp;Type: [TestPage](testpage-data-type.md)  
An instance of the [TestPage](testpage-data-type.md) data type.  

*[Optional] Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The index of the validation error that occurred on the test page.  


## Return Value
*Error*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string where each line represents a validation error that occurred on the test page.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestPage Data Type](testpage-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
