---
title: "Formatting field values in report datasets"
description: "Learn how to format data in report datasets."
author: KennieNP
ms.custom: na
ms.date: 12/01/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: kepontop
---

# Formatting field values in report datasets

It's often useful to format data in the report dataset to reduce the complexity of the report layout. For example, if a decimal field in a table has precision of five digits, the same level of precision might not be needed in the report. Or maybe you want to format dates or currencies in a different way in the report as they appear on the page in [!INCLUDE[prod_short](./includes/prod_short.md)].

In this article, we explain  

* how to format decimal values,
* how to format date, boolean, and enum values, and
* how to control regional formats for Date/DateTime/Time and decimal values.

## Formatting decimal values

When a field of type Decimal is defined on a table, it's possible to set the properties **AutoFormatType** and **AutoFormatExpr** to control how this field is shown on pages and reports. You can also change the precision using the **DecimalPlaces** property.

If you don't want to use the format defined on the field on the table, you can override these properties on the field in the dataset. 

For more information about how to use **AutoFormatType** and **AutoFormatExpr** to override the formatting on table fields of type Decimal, see [Formatting decimal values in report fields](devenv-format-field-data.md). 


## Formatting date, boolean, and enum values

As described above, formatting of fields of type Decimal can be done using properties. But you might also want to format fields of other data types such as Date, Boolean, or Enum in your report dataset. To achieve this, you can simply use the Format method directly when specifying the field from the table in your dataitem columns. See an example below on how to do this.

For more information on how to use Format method for formatting dates, times, booleans, enums, and more, see [Formatting values, dates, and time](devenv-format-property.md).


### Example

The following example illustrates, how to format field of type Date in the `Customer` table in the dataset of a report that builds on top of the `Customer` table.

Assume that the `Customer` table has two fields `Last Date Modified` and `Prices Including VAT` of type Date and Boolean.

```AL
table 18 Customer
{
... 

fields
    {
        field(54; "Last Date Modified"; Date)
        {
        }
        ...
        field(82; "Prices Including VAT"; Boolean)
        {
        }
    }
}
```

When defining a report `MyCustomerReport` using data from the `Customer` table, you can format fields in the dataset using the Format method.

```AL
report 50143 MyCustomerReport
{

...

    dataitem(CustomerDataItem; Customer)
    { 
        ...
        column("My Last Date Modified"; Format("Last Date Modified"))
        {
        }
        column("Including VAT (Y/N)"; Format("Prices Including VAT"))
        {
        }
        ...
    }
...
}
```

## Formatting captions, options, enums, and strings in Date/DateTime/Time strings

It's possible to control the language to use for application captions, options, enums, and strings in Date/DateTime/Time strings by using the `Language` method on the report object. This value determines the localizations that are used for formatting period names like day name, month name, and so forth.

For more information on how to use the `Language` method on the report object for formatting captions, options, enums, and strings in Date/DateTime/Time strings, see [Localizing the report data formatting and caption strings](devenv-report-localization.md).


## Defining the regional format for Date/DateTime/Time and decimal values
Similar to the ability to control the language of the report using the `Language` method, it's also possible to control the regional format on Date/DateTime/Time and decimal values. You can achieve this by using the report method `FormatRegion`.

For more information on how to use the `FormatRegion` method on the report object for formatting Date/DateTime/Time and decimal values, see [Localizing the report data formatting and caption strings](devenv-report-localization.md).



## See Also
[Formatting decimal values in report fields](devenv-format-field-data.md)   
[Localizing the report data formatting and caption strings](devenv-report-localization.md)   
[Defining a report dataset](devenv-report-dataset.md)   
[Report Design Overview](devenv-report-design-overview.md)  
[Reports Overview](devenv-reports.md)  
