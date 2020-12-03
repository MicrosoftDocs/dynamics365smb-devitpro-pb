---
title: "TestRequestPage.GoToRecord Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestRequestPage.GoToRecord Method
> **Version**: _Available from runtime version 1.0._

Finds the specified record in a data set on a test page. The record is searched from the beginning of the dataset defined by the current filter. The search is performed by iterating across the rows, comparing the primary key with the primary key fields of the record. For large dataset, use SetFilter to limit the dataset.


## Syntax
```
[Ok := ]  TestRequestPage.GoToRecord(Rec: Record)
```
## Parameters
*TestRequestPage*
&emsp;Type: [TestRequestPage](testrequestpage-data-type.md)
An instance of the [TestRequestPage](testrequestpage-data-type.md) data type.

*Rec*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record to find.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the record is found, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestRequestPage Data Type](testrequestpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)