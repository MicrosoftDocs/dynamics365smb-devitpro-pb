---
title: "TestPage.GoToRecord(Record) Method"
description: "Finds the specified record in a data set on a test page."
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
# TestPage.GoToRecord(Record) Method
> **Version**: _Available or changed with runtime version 1.0._

Finds the specified record in a data set on a test page.


## Syntax
```AL
[Ok := ]  TestPage.GoToRecord(Rec: Record)
```
## Parameters
*TestPage*  
&emsp;Type: [TestPage](testpage-data-type.md)  
An instance of the [TestPage](testpage-data-type.md) data type.  

*Rec*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record to find.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The GoToRecord method loops over all records until it finds the identifies record.  For each record, the [OnAfterGetCurrRecord Trigger](../../triggers-auto/page/devenv-onaftergetcurrrecord-page-trigger.md) is executed. 

## See Also
[TestPage Data Type](testpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)