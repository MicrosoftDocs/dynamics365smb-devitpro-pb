---
title: "AutoFormatType Property"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 7ec7d029-d2d1-4407-ab6c-f872536d3881
caps.latest.revision: 13
author: SusanneWindfeldPedersen
---


# AutoFormatType Property
Sets a value that determines how data is formatted, together with the AL expression in the [AutoFormatExpression Property](devenv-autoformatexpr-property.md).  
  
## Applies to  
 Fields of the decimal data type in the following objects:  
  
-   Tables  
  
-   Pages  
  
-   Reports  

## Syntax
```
AutoFormatExpression = '<Currency Code>';
AutoFormatType = 2;
```

## Property Value  

`1`, `2`, `3`, `10`, or `11`. For an explanation of these values and examples, see [Formatting Decimal Values in Fields](../devenv-format-field-data.md).  
  

## Remarks  
These two properties are only used to format decimal data types, such as amounts that can be stated in a foreign currency or ratios.  

## Example

The following example uses **AutoFormatType** and **AutoFormatExpression** property to set the format of decimal values to USD.

```
AutoFormatExpression = 'USD';
AutoFormatType = 1;
```

For example, this will result in a value like 7,564.00.


Changing the **AutoFormatExpression** property to `IRD` sets the format of decimal values to IDR \(Indonesian rupiah\).

```
AutoFormatExpression = 'IRD';
AutoFormatType = 1;
```
For example, this will result in a value like 7,564.

## Example

The following example is similar to the previous example, except it adds a $ sign before the amount.

```
AutoFormatExpression = '1,USD';
AutoFormatType = 10;
```

For example, this will result in a value like $7,564.00.

## Example

This example prefixes the decimal value with a $, includes a thousand separator, and has a maximum of two decimal places, such as $76,453.21:

```
AutoFormatType = 1;
AutoFormatExpression = '$<precision, 2:2><standard format, 0>;
```

## Example
This example sets the decimal precision to a minimum of 1 decimal and a maximum of 3.

```
AutoFormatType = 0;
DecimalPlaces = 1 : 3;
```
    
## See Also

[AutoFormatExpression Property](devenv-autoformatexpression-property.md)