---
title: "TestPage.GoToKey Method"
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
# TestPage.GoToKey Method
> **Version**: _Available from runtime version 1.0._

Finds the row in a data set on the test page that is identified by the specified values.


## Syntax
```
[Ok := ]  TestPage.GoToKey([Value: Any,...])
```
## Parameters
*TestPage*
&emsp;Type: [TestPage](testpage-data-type.md)
An instance of the [TestPage](testpage-data-type.md) data type.

*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value or list of values to use to find the row. If this parameter is omitted, the value of the primary key that is defined for the underlying table is used.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The GoToKey method loops over all records until it finds the identifies row.  For each record, the [OnAfterGetCurrentRecord Trigger](../../triggers/devenv-onaftergetcurrrecord-trigger.md) is executed.  

## See Also
[TestPage Data Type](testpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)