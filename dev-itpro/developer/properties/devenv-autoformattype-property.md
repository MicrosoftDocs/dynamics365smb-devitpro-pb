---
title: "AutoFormatType Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# AutoFormatType Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a value that determines how data is formatted, together with the AL expression in the AutoFormatExpression Property.

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

## Property Value  

`1`, `2`, `3`, `10`, or `11`. For an explanation of these values and examples, see [Formatting Decimal Values in Fields](../devenv-format-field-data.md).  
  

## Remarks  
These two properties are only used to format decimal data types, such as amounts that can be stated in a foreign currency or ratios.  

## Example 1

The following example uses **AutoFormatType** and **AutoFormatExpression** property to set the format of decimal values to USD.

```AL
AutoFormatExpression = 'USD';
AutoFormatType = 1;
```

For example, this will result in a value like 7,564.00.


Changing the **AutoFormatExpression** property to `IRD` sets the format of decimal values to IDR \(Indonesian rupiah\).

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
AutoFormatExpression = '$<precision, 2:2><standard format, 0>;
```

## Example 4
This example sets the decimal precision to a minimum of 1 decimal and a maximum of 3.

```AL
AutoFormatType = 0;
DecimalPlaces = 1 : 3;
```
    
## See Also

[AutoFormatExpression Property](devenv-autoformatexpression-property.md)