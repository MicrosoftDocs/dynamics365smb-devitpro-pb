---
title: "TestPart.GoToRecord Method"
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
# TestPart.GoToRecord Method
> **Version**: _Available or changed with runtime version 1.0._

Finds the specified record in a data set on a test page.


## Syntax
```
[Ok := ]  TestPart.GoToRecord(Rec: Record)
```
## Parameters
*TestPart*
&emsp;Type: [TestPart](testpart-data-type.md)
An instance of the [TestPart](testpart-data-type.md) data type.

*Rec*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record to find.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestPart Data Type](testpart-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)