---
title: "Page Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Page Data Type
Contains a number of simpler elements called controls. Controls are used to display information to the user or receive information from the user.

The following methods are available on the Page data type.


|Method name|Description|
|-----------|-----------|
|[RunModal(Integer, [Table], [Any])](page-runmodal-integer-table-joker-method.md)|Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.|
|[RunModal(Integer, Table, Integer)](page-runmodal-integer-table-integer-method.md)|Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.|
|[Run(Integer, [Table], [Any])](page-run-integer-table-joker-method.md)|Creates and launches a page that you specify. You can use CLEAR function to remove the page.|
|[Run(Integer, Table, Integer)](page-run-integer-table-integer-method.md)|Creates and launches a page that you specify. You can use CLEAR function to remove the page.|

The following methods are available on instances of the Page data type.

|Method name|Description|
|-----------|-----------|
|[Editable([Boolean])](page-editable-method.md)|Gets or sets the default editability of the page.|
|[Caption([String])](page-caption-method.md)|The caption shown in the title bar. For example, the default value in English (United States) is the same as the name of the page.|
|[LookupMode([Boolean])](page-lookupmode-method.md)|Gets or sets the default lookup mode for the page.|
|[ObjectId([Boolean])](page-objectid-method.md)|Returns a string in the "Page xxx" format, where xxx is the caption or ID of the application object.|
|[SaveRecord()](page-saverecord-method.md)|Saves the current record as if performed by the client. If the record does not exist it is inserted, otherwise it is modified.|
|[Update([Boolean])](page-update-method.md)|Saves the current record and then updates the controls on the page. If you set the SaveRecord parameter to false, this function will not save the record before the page is updated.|
|[GetRecord(var Table)](page-getrecord-method.md)|Gets the current record of the page.|
|[SetRecord(var Table)](page-setrecord-method.md)|Sets the current record for the page.|
|[SetTableView(var Table)](page-settableview-method.md)|Applies the table view on the current record as the table view for the page, report, or XmlPort.|
|[SetSelectionFilter(var Table)](page-setselectionfilter-method.md)|Notes the records that the user has selected on the page, marks those records in the table specified, and sets the filter to "marked only".|
|[Activate([Boolean])](page-activate-method.md)|Activates the current page on the client if possible. The data on the page will not be refreshed.|
|[Close()](page-close-method.md)|Closes the current page.|
|[RunModal()](page-runmodal--method.md)|Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.|
|[Run()](page-run--method.md)|Creates and launches a page that you specify. You can use CLEAR function to remove the page.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  