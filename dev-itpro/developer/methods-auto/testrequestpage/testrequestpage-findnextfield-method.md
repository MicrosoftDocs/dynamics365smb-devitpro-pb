---
title: "TestRequestPage.FindNextField Method"
description: "Finds the next field in the data set that is displayed on a test page."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# TestRequestPage.FindNextField Method
> **Version**: _Available or changed with runtime version 1.0._

Finds the next field in the data set that is displayed on a test page.The row is searched from the beginning of the dataset defined by the current filter. The search is performed by iterating across the rows, comparing the primary key with the primary key fields of the record. For large dataset, use SetFilter to limit the dataset.


## Syntax
```AL
[Ok := ]  TestRequestPage.FindNextField(Field: TestField, Value: Any)
```
## Parameters
*TestRequestPage*  
&emsp;Type: [TestRequestPage](testrequestpage-data-type.md)  
An instance of the [TestRequestPage](testrequestpage-data-type.md) data type.  

*Field*  
&emsp;Type: [TestField](../testfield/testfield-data-type.md)  
The field to find.  
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value of the field.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the row is found, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestRequestPage Data Type](testrequestpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)