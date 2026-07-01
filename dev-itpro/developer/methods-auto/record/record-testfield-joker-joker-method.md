---
title: "Record.TestField(Any, Any) Method"
description: "Tests whether the contents of a field match a given value."
ms.author: solsen
ms.date: 06/29/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.TestField(Any, Any) Method
> **Version**: _Available or changed with runtime version 1.0._

Tests whether the contents of a field match a given value.


## Syntax
```AL
 Record.TestField(Field: Any, Value: Any)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to test.  

*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value that you want to compare to Field. The data type of this parameter must match the data type of Field. If you include this optional parameter and the contents of Field do not match, then an error message is displayed. If you omit this parameter and the contents of Field is zero or blank (empty string), then an error message is displayed.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Unlike the single-parameter [TestField(Field)](record-testfield-joker-method.md) overload, this two-parameter overload doesn't automatically add a **Show [Record]** navigation button to the error dialog. When `TestField(Field, Value)` fails, it displays a plain error message (for example, "Status must be equal to 'Certified' in Routing Header...") with only an OK button.

This behavioral difference is by design: the single-parameter overload checks for a non-empty/non-zero value, and the platform knows the fix is "go fill in the field on the record." The two-parameter overload checks for a *specific* value, and the platform can't assume which page or action would resolve the mismatch.

If you want the error dialog to include navigation to a related record, use the [TestField(Field, Value, ErrorInfo)](record-testfield-joker-joker-errorinfo-method.md) overload and configure the [ErrorInfo](../errorinfo/errorinfo-data-type.md) object with the appropriate [PageNo](../errorinfo/errorinfo-pageno-method.md) and [RecordId](../errorinfo/errorinfo-recordid-method.md). You can also add a [FieldNo](../errorinfo/errorinfo-fieldno-method.md) to highlight the specific field that needs correction.

## Related information
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)