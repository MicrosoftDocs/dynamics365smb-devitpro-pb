---
title: "TestRequestPage.Last() Method"
description: "Sets the current row of the test page as the last row in the data set."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestRequestPage.Last() Method
> **Version**: _Available or changed with runtime version 1.0._

Sets the current row of the test page as the last row in the data set.


## Syntax
```AL
[Ok := ]  TestRequestPage.Last()
```
## Parameters
*TestRequestPage*  
&emsp;Type: [TestRequestPage](testrequestpage-data-type.md)  
An instance of the [TestRequestPage](testrequestpage-data-type.md) data type.  

## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if a last row is present, otherwise **false**. Throws a NavTestPageNotOpenedException if the page is not opened.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestRequestPage Data Type](testrequestpage-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)