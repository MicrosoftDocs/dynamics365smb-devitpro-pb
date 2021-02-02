---
title: "TestField.GetOption Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# TestField.GetOption Method
> **Version**: _Available from runtime version 1.0._

Gets the options for a field on a test page.


## Syntax
```
Result :=   TestField.GetOption([Index: Integer])
```
## Parameters
*TestField*
&emsp;Type: [TestField](testfield-data-type.md)
An instance of the [TestField](testfield-data-type.md) data type.

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The index of the field that you want to get the options from. This parameter is optional.  


## Return Value
*Result*
&emsp;Type: [String](../string/string-data-type.md)
The options for a field on a test page.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestField Data Type](testfield-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)