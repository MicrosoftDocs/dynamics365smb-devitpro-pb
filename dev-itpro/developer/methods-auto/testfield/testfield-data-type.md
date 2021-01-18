---
title: "TestField Data Type"
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
# TestField Data Type
> **Version**: _Available from runtime version 1.0._

Represents a testable field on a page.



The following methods are available on instances of the TestField data type.

|Method name|Description|
|-----------|-----------|
|[Activate()](testfield-activate-method.md)|Activates a field on a test page.|
|[AsBoolean()](testfield-asboolean-method.md)|Converts the value in a field on a test page to a Boolean data type.|
|[AsDate()](testfield-asdate-method.md)|Converts the value in a field on a test page to a Date data type.|
|[AsDateTime()](testfield-asdatetime-method.md)|Converts the value in a field on a test page to a DateTime data type.|
|[AsDecimal()](testfield-asdecimal-method.md)|Converts the value in a field on a test page to a Date data type.|
|[AsInteger()](testfield-asinteger-method.md)|Converts the value of the field on a test page to an Integer data type.|
|[AssertEquals(Any)](testfield-assertequals-method.md)|Asserts that the value in a field on a test page equals a specified value.|
|[AssistEdit()](testfield-assistedit-method.md)|Provides assist-edit functionality to a field on a test page.|
|[AsTime()](testfield-astime-method.md)|Converts the value in a field on a test page to a Time data type.|
|[Caption()](testfield-caption-method.md)|Gets the current caption of the field as a String.|
|[Drilldown()](testfield-drilldown-method.md)|Applies drill-down capability for a field on a test page.|
|[Editable()](testfield-editable-method.md)|Gets the editable state for the field.|
|[Enabled()](testfield-enabled-method.md)|Gets the enabled state for the field.|
|[GetOption([Integer])](testfield-getoption-method.md)|Gets the options for a field on a test page.|
|[GetValidationError([Integer])](testfield-getvalidationerror-method.md)|Gets the validation error that occurred on a test page.|
|[HideValue()](testfield-hidevalue-method.md)|Gets the hide value state for the field.|
|[Invoke()](testfield-invoke-method.md)|Invokes the default action on the field.|
|[Lookup()](testfield-lookup--method.md)|Provides a lookup window for a text box on a test page.|
|[Lookup(RecordRef)](testfield-lookup-recordref-method.md)|Calls the OnAfterLook trigger with the selected record|
|[OptionCount()](testfield-optioncount-method.md)|Gets the number of options in a field on a test page.|
|[SetValue(Any)](testfield-setvalue-method.md)|Sets a value for a field on a test page.|
|[ShowMandatory()](testfield-showmandatory-method.md)|Gets the ShowMandatory state for the field.|
|[ValidationErrorCount()](testfield-validationerrorcount-method.md)|Gets the number of validation errors that occurred on the test page.|
|[Value([String])](testfield-value-method.md)|Gets or sets the value of this field.|
|[Visible()](testfield-visible-method.md)|Gets the visible state for the field.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  