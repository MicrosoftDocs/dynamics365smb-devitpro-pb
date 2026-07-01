---
title: "Record.TestField(Any) Method"
description: "Tests that the content of the field is not zero or blank (empty string)."
ms.author: solsen
ms.date: 06/29/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.TestField(Any) Method
> **Version**: _Available or changed with runtime version 1.0._

Tests that the content of the field is not zero or blank (empty string).


## Syntax
```AL
 Record.TestField(Field: Any)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to test.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When `TestField(Field)` fails because the field is blank or zero, the runtime automatically adds a **Show [Record]** action button to the error dialog. This button navigates the user to the card page of the related record, allowing them to fill in the missing value. This automatic navigation behavior is built into the platform and doesn't require an [ErrorInfo](../errorinfo/errorinfo-data-type.md) parameter.

### How the platform determines the target page

The runtime resolves the navigation target by finding a Card-type page whose [SourceTable](../../properties/devenv-sourcetable-property.md) matches the table of the record that failed validation. For example, if `TestField` fails on a Vendor record, the runtime identifies the **Vendor Card** page (a page with `PageType = Card` and `SourceTable = Vendor`) and uses it as the navigation target.

### Limitations of automatic navigation

The automatic navigation provided by `TestField(Field)` has the following limitations compared to explicit [ErrorInfo](../errorinfo/errorinfo-data-type.md)-based navigation:

- **No field highlighting** — The error dialog doesn't highlight or focus the specific field that needs attention. With `ErrorInfo`, you can set [FieldNo](../errorinfo/errorinfo-fieldno-method.md) to direct the user to the exact field.
- **No custom button caption** — The button always shows "Show [Record Name]." With `ErrorInfo.AddNavigationAction`, you can provide a custom caption.
- **No custom page choice** — The platform always navigates to the default card page for the table. With `ErrorInfo`, you can specify any page using [PageNo](../errorinfo/errorinfo-pageno-method.md).
- **No detailed message** — There's no additional context beyond the standard field-is-empty error. With `ErrorInfo`, you can add a [DetailedMessage](../errorinfo/errorinfo-detailedmessage-method.md) with troubleshooting guidance.

### When to use explicit ErrorInfo instead

Even though `TestField(Field)` provides automatic navigation, consider using the [TestField(Field, ErrorInfo)](record-testfield-joker-errorinfo-method.md) overload with an `ErrorInfo` object when you need to:

- Highlight the specific field that requires attention
- Provide a custom navigation button caption
- Navigate to a page other than the default card page
- Add a detailed message or title to help the user understand the fix
- Add a Fix-it action that programmatically resolves the error
This behavior only applies to the single-parameter overload. The two-parameter overload [TestField(Field, Value)](record-testfield-joker-joker-method.md) doesn't provide automatic navigation — it displays a plain error message with an OK button only. To add custom navigation to a two-parameter `TestField` call, use the [TestField(Field, Value, ErrorInfo)](record-testfield-joker-joker-errorinfo-method.md) overload with an `ErrorInfo` object that specifies a page ID.

## Related information
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)