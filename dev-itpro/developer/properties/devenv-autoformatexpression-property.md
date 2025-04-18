---
title: "AutoFormatExpression property"
description: "Sets an AL expression that specifies how to format data."
ms.author: solsen
ms.date: 01/29/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AutoFormatExpression Property
> **Version**: _Available or changed with runtime version 1.0._

Sets an AL expression that specifies how to format data.

## Applies to
-   Table field
-   Page Field
-   Report Column

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
AutoFormatExpression = '<Currency Code>';
AutoFormatType = 2;
```

## Remarks

Applies to fields or columns of the decimal data type.

The AL expression is evaluated when the expression performs updates. Together with the [AutoFormatType property](devenv-autoformattype-property.md), this property determines how data is formatted. These two properties are only used to format decimal data types, such as amounts that can be stated in a foreign currencies or ratios.

Learn more in [Formatting decimal values in fields](../devenv-format-field-data.md).

## Example 1

The following example uses `AutoFormatExpression` property to set the format of decimal values to USD.

```AL
AutoFormatExpression = 'USD';
AutoFormatType = 1;
```

This example results in a value like `7,564.00`.

Changing the `AutoFormatExpression` property to `ÌRD` sets the format of decimal values to IDR \(Indonesian rupiah\).

```AL
AutoFormatExpression = 'IRD';
AutoFormatType = 1;
```

This example results in a value like `7,564`.

## Example 2

The following example is similar to the previous example, except it adds a `$` sign before the amount.

```AL
AutoFormatExpression = '1,USD';
AutoFormatType = 10;
```

This example results in a value like `$7,564.00`.

## Example 3

This example prefixes the decimal value with a `$`, includes a thousand separator, and has a maximum of two decimal places, such as `$76,453.21`:

```AL
AutoFormatType = 1;
AutoFormatExpression = '$<precision, 2:2><standard format, 0>';
```

## Example 4

> [!NOTE]
> [!INCLUDE [2025rw1_and_later](../includes/2025rw1_and_later.md)]

This example writes the number with two decimals, encloses the number in parenthesis if negative and 'Zero' if the value is `0`.
This uses the standard .NET numeric formatting system. Learn more in [Custom numeric format strings](/dotnet/standard/base-types/custom-numeric-format-strings).

```AL
AutoFormatType = 1;
AutoFormatExpression = '<FormatString>#,##0.00;(#,##0.00);Zero';
```

## Related information

[AutoFormatType property](devenv-autoformattype-property.md)  
[DecimalPlaces property](devenv-decimalplaces-property.md)
