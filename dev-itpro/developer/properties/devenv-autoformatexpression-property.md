---
title: "AutoFormatExpression Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# AutoFormatExpression Property
> **Version**: _Available or changed with runtime version 1.0._

Sets an AL expression that specifies how to format data.

## Applies to
-   Table Field
-   Page Field
-   Report Column

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax
```AL
AutoFormatExpression = '<Currency Code>';
AutoFormatType = 2;
```


## Remarks
It applies to fields or columns of the decimal data type.

The AL expression is evaluated when the expression performs updates. Together with the [AutoFormatType Property](devenv-autoformattype-property.md), this property determines how data is formatted. These two properties are only used to format decimal data types, such as amounts that can be stated in a foreign currencies or ratios.

For more information, see [Formatting Decimal Values in Fields](../devenv-format-field-data.md).

## Example 1

The following example uses **AutoFormatExpression** property to set the format of decimal values to USD.

```AL
AutoFormatExpression = 'USD';
AutoFormatType = 1;
```

For example, this will result in a value like 7,564.00.


Changing the **AutoFormatExpression** property to `ÌRD` sets the format of decimal values to IDR \(Indonesian rupiah\).

```AL
AutoFormatExpression = 'IRD';
AutoFormatType = 1;
```
For example, this will result in a value like 7,564.

## Example 2

The following example is similar to the previous example, except it adds a $ sign before the amount.

```AL
AutoFormatExpression = '1,USD';
AutoFormatType = 10;
```

For example, this will result in a value like $7,564.00.

## Example 3

This example prefixes the decimal value with a $, includes a thousand separator, and has a maximum of two decimal places, such as $76,453.21:

```AL
AutoFormatType = 1;
AutoFormatExpression = '$<precision, 2:2><standard format, 0>':
```

## See Also

[AutoFormatType Property](devenv-autoformattype-property.md)  
[DecimalPlaces Property](devenv-decimalplaces-property.md)