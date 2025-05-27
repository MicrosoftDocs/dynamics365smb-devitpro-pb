---
title: "AutoFormatType property"
description: "Sets a value that determines how data is formatted, together with the AL expression in the AutoFormatExpression Property."
ms.author: solsen
ms.date: 01/29/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AutoFormatType Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a value that determines how data is formatted, together with the AL expression in the AutoFormatExpression Property.

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

## Property value  

`0`, `1`, `2`, `3`, `10`, or `11`. For an explanation of all of these values, see [Formatting decimal values in fields](../devenv-format-field-data.md). In the following table, the values for formatting decimal values `0`, `1`, and `2` are explained.
  

## Remarks

The `AutoFormatType` and `AutoFormatExpression` properties are only used to format decimal data types, such as amounts that can be stated in a foreign currency or ratios. The settings for the `AutoFormatType` property and the `AutoFormatExpr` property depend on the type of data in the field that you need to format. There are three categories of data: amount, unit amount, and other types of data.

|Type of data| Value| Meaning|
|------------|-------------|------------|
|Other types of data|`AutoFormatType` must be `0` and `AutoFormatExpr` must be blank | Use default settings for formatting (Standard format 0).|
|Amount      | `AutoFormatType` must be `1` and `AutoFormatExpr` must return a currency code | Format as amount data, for example used for line amounts, document totals, or any accounting values.|
|Unit amount | `AutoFormatType` must be `2` and `AutoFormatExpr` must return a currency code | Format as unit amount data, for example used for unit prices.|

## Example 1

The following example uses **AutoFormatType** and **AutoFormatExpression** property to set the format of decimal values to USD.

```AL
AutoFormatExpression = 'USD';
AutoFormatType = 1;
```

For example, this results in a value like `7,564.00`.

Changing the **AutoFormatExpression** property to `IRD` sets the format of decimal values to IDR \(Indonesian rupiah\).

```AL
AutoFormatExpression = 'IRD';
AutoFormatType = 1;
```

For example, this results in a value like `7,564`.

## Example 2

The following example is similar to the previous example, except it adds a `$` sign before the amount.

```AL
AutoFormatExpression = '1,USD';
AutoFormatType = 10;
```

For example, this results in a value like `$7,564.00`.

## Example 3

This example prefixes the decimal value with a `$`, includes a thousand separator, and has a maximum of two decimal places, such as `$76,453.21`:

```AL
AutoFormatType = 1;
AutoFormatExpression = '$<precision, 2:2><standard format, 0>';
```

## Example 4

This example sets the decimal precision to a minimum of `1` decimal and a maximum of `3`.

```AL
AutoFormatType = 0;
DecimalPlaces = 1 : 3;
```
    
## Related information

[AutoFormatExpression property](devenv-autoformatexpression-property.md)