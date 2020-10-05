---
title: "TestPage Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# TestPage Data Type
Represents a variable type that can be used to test Page Application Objects.



The following methods are available on instances of the TestPage data type.

|Method name|Description|
|-----------|-----------|
|[OpenNew()](testpage-opennew-method.md)|Opens a blank test page in edit mode.|
|[OpenEdit()](testpage-openedit-method.md)|Opens a test page in edit mode.|
|[OpenView()](testpage-openview-method.md)|Opens a test page in view mode.|
|[Close()](testpage-close-method.md)|Closes an open test page.|
|[New()](testpage-new-method.md)|Sets the current row of the test page to an empty row in a data set.|
|[GetField(Integer)](testpage-getfield-method.md)|Gets a field on a test page.|
|[ValidationErrorCount()](testpage-validationerrorcount-method.md)|Gets the number of validation errors that occurred on the test page.|
|[GetValidationError([Integer])](testpage-getvalidationerror-method.md)|Gets the list of all validation error that occurred on a test page as a string.|
|[Caption()](testpage-caption-method.md)|Gets the caption of the test page.|
|[Trap()](testpage-trap-method.md)|Traps the next test page that is invoked and assigns it to the test page variable.|
|[Next()](testpage-next-method.md)|Sets the current row of the test page as the next row in the data set.|
|[Previous()](testpage-previous-method.md)|Sets the current row of the test page as the previous row in the data set.|
|[Prev()](testpage-prev-method.md)|Sets the current row of the test page as the previous row in the data set.|
|[First()](testpage-first-method.md)|Sets the current row of the test page as the first row in the data set.|
|[Last()](testpage-last-method.md)|Sets the current row of the test page as the last row in the data set.|
|[IsExpanded()](testpage-isexpanded-method.md)|Specifies if rows on a test page are expanded.|
|[Expand(Boolean)](testpage-expand-method.md)|Expands rows on a test page.|
|[GoToRecord(Record)](testpage-gotorecord-method.md)|Finds the specified record in a data set on a test page.|
|[GoToKey([Any,...])](testpage-gotokey-method.md)|Finds the row in a data set on the test page that is identified by the specified values.|
|[FindFirstField(TestField, Any)](testpage-findfirstfield-method.md)|Finds the first field in the data set that is displayed on a test page.|
|[FindNextField(TestField, Any)](testpage-findnextfield-method.md)|Finds the next field in the data set that is displayed on a test page.|
|[FindPreviousField(TestField, Any)](testpage-findpreviousfield-method.md)|Finds the previous field in the data set that is displayed on a test page.|
|[Editable()](testpage-editable-method.md)|Gets the runtime value of the Editable property on a test page.|
|[View()](testpage-view-method.md)|Gets the View system action.|
|[Edit()](testpage-edit-method.md)|Gets the Edit system action.|
|[OK()](testpage-ok-method.md)|Gets the OK system action.|
|[Cancel()](testpage-cancel-method.md)|Gets the Cancel system action.|
|[Yes()](testpage-yes-method.md)|Gets the Yes system action.|
|[No()](testpage-no-method.md)|Gets the No system action.|
|[RunPageBackgroundTask(Integer [, var Dictionary of [Text, Text]] [, Boolean])](testpage-runpagebackgroundtask-method.md)|Runs the page background task codeunit in the current session. Note that by default, no triggers are invoked at this point.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  