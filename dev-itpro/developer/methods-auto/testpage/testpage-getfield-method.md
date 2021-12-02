---
title: "TestPage.GetField(Integer) Method"
description: "Gets a field on a test page."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# TestPage.GetField(Integer) Method
> **Version**: _Available or changed with runtime version 3.0 until version 3.0 where it was deprecated._

Gets a field on a test page.


## Syntax
```AL
TestField :=   TestPage.GetField(Id: Integer)
```
## Parameters
*TestPage*  
&emsp;Type: [TestPage](testpage-data-type.md)  
An instance of the [TestPage](testpage-data-type.md) data type.  

*Id*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the field that you want to get.  


## Return Value
*TestField*  
&emsp;Type: [TestField](../testfield/testfield-data-type.md)  
The field on the test page.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestPage Data Type](testpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)