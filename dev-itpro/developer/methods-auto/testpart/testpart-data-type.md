---
title: "TestPart Data Type"
ms.author: solsen
ms.custom: na
ms.date: 12/09/2020
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
# TestPart Data Type
> **Version**: _Available from runtime version 1.0._

Represents a variable type that can be used to test Page Application Objects of type Part.



The following methods are available on instances of the TestPart data type.

|Method name|Description|
|-----------|-----------|
|[Caption()](testpart-caption-method.md)|Gets the caption of the test page.|
|[Editable()](testpart-editable-method.md)|Gets the runtime value of the Editable property on a test page.|
|[Expand(Boolean)](testpart-expand-method.md)|Expands rows on a test page.|
|[FindFirstField(TestField, Any)](testpart-findfirstfield-method.md)|Finds the first field in the data set that is displayed on a test page.|
|[FindNextField(TestField, Any)](testpart-findnextfield-method.md)|Finds the next field in the data set that is displayed on a test page.|
|[FindPreviousField(TestField, Any)](testpart-findpreviousfield-method.md)|Finds the previous field in the data set that is displayed on a test page.|
|[First()](testpart-first-method.md)|Sets the current row of the test page as the first row in the data set.|
|[GetField(Integer)](testpart-getfield-method.md)|Gets a field on a test page.|
|[GetValidationError([Integer])](testpart-getvalidationerror-method.md)|Gets the list of all validation error that occurred on a test page as a string.|
|[GoToKey([Any,...])](testpart-gotokey-method.md)|Finds the row in a data set on the test page that is identified by the specified values.|
|[GoToRecord(Record)](testpart-gotorecord-method.md)|Finds the specified record in a data set on a test page.|
|[IsExpanded()](testpart-isexpanded-method.md)|Specifies if the current row on the test page is expanded.|
|[Last()](testpart-last-method.md)|Sets the current row of the test page as the last row in the data set.|
|[New()](testpart-new-method.md)|Sets the current row of the test page to an empty row in a data set.|
|[Next()](testpart-next-method.md)|Sets the current row of the test page as the next row in the data set.|
|[Prev()](testpart-prev-method.md)|Sets the current row of the test page as the previous row in the data set.|
|[Previous()](testpart-previous-method.md)|Sets the current row of the test page as the previous row in the data set.|
|[ValidationErrorCount()](testpart-validationerrorcount-method.md)|Gets the number of validation errors that occurred on the test page.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  