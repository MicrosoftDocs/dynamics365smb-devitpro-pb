---
title: "Page Data Type"
description: "Contains a number of simpler elements called controls. Controls are used to display information to the user or receive information from the user."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Page Data Type
> **Version**: _Available or changed with runtime version 1.0._

Contains a number of simpler elements called controls. Controls are used to display information to the user or receive information from the user.


The following methods are available on the Page data type.


|Method name|Description|
|-----------|-----------|
|[GetBackgroundParameters()](page-getbackgroundparameters-method.md)|Gets the page background task input parameters.|
|[Run(Integer [, Record] [, Any])](page-run-integer-table-joker-method.md)|Creates and launches a page that you specify. You can use CLEAR method to remove the page.|
|[Run(Integer, Record, Integer)](page-run-integer-table-integer-method.md)|Creates and launches a page that you specify. You can use CLEAR method to remove the page.|
|[RunModal(Integer [, Record] [, Any])](page-runmodal-integer-table-joker-method.md)|Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.|
|[RunModal(Integer, Record, Integer)](page-runmodal-integer-table-integer-method.md)|Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.|
|[RunModal(Integer, Record, FieldRef)](page-runmodal-integer-table-fieldref-method.md)|Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.|
|[SetBackgroundTaskResult(Dictionary of [Text, Text])](page-setbackgroundtaskresult-method.md)|Sets the page background task result as a dictionary. When the task is completed, the OnPageBackgroundCompleted trigger will be invoked on the page with this result dictionary.|

The following methods are available on instances of the Page data type.

|Method name|Description|
|-----------|-----------|
|[Activate([Boolean])](page-activate-method.md)|Activates the current page on the client if possible. The data on the page will not be refreshed.|
|[CancelBackgroundTask(Integer)](page-cancelbackgroundtask-method.md)|Attempt to cancel a page background task.|
|[Caption([String])](page-caption-method.md)|The caption shown in the title bar. For example, the default value in English (United States) is the same as the name of the page.|
|[Close()](page-close-method.md)|Closes the current page.|
|[Editable([Boolean])](page-editable-method.md)|Gets or sets the default editability of the page.|
|[EnqueueBackgroundTask(var Integer, Integer [, var Dictionary of [Text, Text]] [, Integer] [, PageBackgroundTaskErrorLevel])](page-enqueuebackgroundtask-method.md)|Creates and queues a background task that runs the specified codeunit (without a UI) in a read-only child session of the page session. If the task completes successfully, the **OnPageBackgroundTaskCompleted** trigger is invoked. If an error occurs, the **OnPageBackgroundTaskError** trigger is invoked. If the page is closed before the task completes, or the page record ID on the task changed, the task is cancelled.|
|[GetRecord(var Record)](page-getrecord-method.md)|Gets the current record of the page.|
|[LookupMode([Boolean])](page-lookupmode-method.md)|Gets or sets the default lookup mode for the page.|
|[ObjectId([Boolean])](page-objectid-method.md)|Returns a string in the "Page xxx" format, where xxx is the caption or ID of the application object.|
|[Run()](page-run--method.md)|Creates and launches a page that you specify. You can use CLEAR method to remove the page.|
|[RunModal()](page-runmodal--method.md)|Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.|
|[SaveRecord()](page-saverecord-method.md)|Saves the current record as if performed by the client. If the record does not exist it is inserted, otherwise it is modified.|
|[SetRecord(var Record)](page-setrecord-method.md)|Sets the current record for the page.|
|[SetSelectionFilter(var Record)](page-setselectionfilter-method.md)|Notes the records that the user has selected on the page, marks those records in the table specified, and sets the filter to "marked only".|
|[SetTableView(var Record)](page-settableview-method.md)|Applies the table view on the current record as the table view for the page, report, or XmlPort.|
|[Update([Boolean])](page-update-method.md)|Saves the current record and then updates the controls on the page. If you set the SaveRecord parameter to false, this method will not save the record before the page is updated.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  