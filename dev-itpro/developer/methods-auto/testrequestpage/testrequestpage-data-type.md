---
title: "TestRequestPage Data Type"
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
# TestRequestPage Data Type
Stores test request pages. A test request page part is a logical representation of a request page on a report. A test request page does not display a user interface (UI). The subtype of a test request page is the report whose request page you want to test.



The following methods are available on instances of the TestRequestPage data type.

|Method name|Description|
|-----------|-----------|
|[New()](testrequestpage-new-method.md)|Sets the current row of the test page to an empty row in a data set.|
|[ValidationErrorCount()](testrequestpage-validationerrorcount-method.md)|Gets the number of validation errors that occurred on the test page.|
|[GetValidationError([Integer])](testrequestpage-getvalidationerror-method.md)|Gets the validation error that occurred on a test page.|
|[Caption()](testrequestpage-caption-method.md)|Gets the caption of the test page.|
|[Next()](testrequestpage-next-method.md)|Sets the current row of the test page as the next row in the data set.|
|[Previous()](testrequestpage-previous-method.md)|Sets the current row of the test page as the previous row in the data set.|
|[First()](testrequestpage-first-method.md)|Sets the current row of the test page as the first row in the data set.|
|[Last()](testrequestpage-last-method.md)|Sets the current row of the test page as the last row in the data set.|
|[IsExpanded()](testrequestpage-isexpanded-method.md)|Specifies if rows on a test page are expanded.|
|[Expand(Boolean)](testrequestpage-expand-method.md)|Expands rows on a test page.|
|[GoToRecord(Record)](testrequestpage-gotorecord-method.md)|Finds the specified record in a data set on a test page. The record is searched from the beginning of the dataset defined by the current filter. The search is performed by iterating across the rows, comparing the primary key with the primary key fields of the record. For large dataset, use SetFilter to limit the dataset.|
|[GoToKey([Any,...])](testrequestpage-gotokey-method.md)|Finds the row in a data set on the test page that is identified by the specified values. The key is searched from the beginning of the dataset defined by the current filter. The search is performed by iterating across the rows, comparing the primary key with the primary key fields of the record. For large dataset, use SetFilter to limit the dataset.|
|[FindFirstField(TestField, Any)](testrequestpage-findfirstfield-method.md)|Finds the first field in the data set that is displayed on a test page. The row is searched from the beginning of the dataset defined by the current filter. The search is performed by iterating across the rows, comparing the primary key with the primary key fields of the record. For large dataset, use SetFilter to limit the dataset.|
|[FindNextField(TestField, Any)](testrequestpage-findnextfield-method.md)|Finds the next field in the data set that is displayed on a test page.The row is searched from the beginning of the dataset defined by the current filter. The search is performed by iterating across the rows, comparing the primary key with the primary key fields of the record. For large dataset, use SetFilter to limit the dataset.|
|[FindPreviousField(TestField, Any)](testrequestpage-findpreviousfield-method.md)|Finds the previous field in the data set that is displayed on a test page. The row is searched from the beginning of the dataset defined by the current filter. The search is performed by iterating across the rows, comparing the primary key with the primary key fields of the record. For large dataset, use SetFilter to limit the dataset.|
|[Editable()](testrequestpage-editable-method.md)|Gets the runtime value of the Editable property on a test page.|
|[SaveAsPdf(String)](testrequestpage-saveaspdf-method.md)|Saves a report as an Adobe Acrobat (.pdf) file.|
|[SaveAsWord(String)](testrequestpage-saveasword-method.md)|Saves a report as a Microsoft Word (.doc) file.|
|[SaveAsExcel(String)](testrequestpage-saveasexcel-method.md)|Saves a report as a Microsoft Excel (.xls) file.|
|[SaveAsXml(String, String)](testrequestpage-saveasxml-method.md)|Saves a report data set and the labels on a report as two XML (.xml) files.|
|[OK()](testrequestpage-ok-method.md)|Gets a TestAction representing an action on the Page under Test.|
|[Cancel()](testrequestpage-cancel-method.md)|Gets a TestAction representing an action on the Page under Test.|
|[Print()](testrequestpage-print-method.md)|Gets a the Print representing an action on the Page under Test.|
|[Preview()](testrequestpage-preview-method.md)|Gets a TestAction representing an action on the Page under Test.|
|[Schedule()](testrequestpage-schedule-method.md)|Gets a TestAction representing an action on the Page under Test.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  