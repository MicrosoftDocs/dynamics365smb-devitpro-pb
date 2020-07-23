---
title: "Formatting the Data in a Field"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Formatting Decimal Values in Fields

This article describes how you can format the decimal values that appear in fields on table, pages and reports. For example, you can change how the data appears in a Cue on the Role Center page. To format data, you use a combination of the [AutoFormatType Property](properties/devenv-AutoFormatType-Property.md), [AutoFormatExpression Property](properties/devenv-AutoFormatExpression-Property.md), and [DecimalPlaces Property](properties/devenv-DecimalPlaces-Property.md) of the field. These properties work together to enable you to specify the following:  
  
- Display amounts and unit amounts in another currency.  
- Specify the number of decimal places.   
- Specify whether to display a thousand separator.  
- Specify characters before and after the value, such as currency signs or %.  
  
## Implementation overview

When a field is used on a page or report, you can set the **AutoFormatType** and **AutoFormatExpr** properties directly on the page field or report field \(column\), or you can set them on the underlying table field. If you specify the properties on the table field, then the format applies wherever the field is used. Specifying the properties on the page or report field will only apply the format to the specific page or report. If you specify the properties on the table field and the page or report field, then the settings on the page or report field take precedence.  

When you use the **AutoFormatType** and **AutoFormatExpression** properties to format a field, two events are raised by the system codeunit **45 Auto Format**: OnResolveAutoFormat and OnAfterResolveAutoFormat.

## Setting up data formatting

The settings for the **AutoFormatType**, **AutoFormatExpression**, and **DecimalPlaces** properties will depend on the type of data that is displayed, for example, this could be currency amounts, unit amounts, simple decimals, or ratios. For the most part, the **AutoFormatType** property is the primary setting, which in turn determines the options for setting the **DecimalPlaces** and **AutoFormatExpr** properties.  

If the **AutoFormatType** is not set or is set to an incorrect property value, then the default setting is used, regardless of whether the **AutoFormatExpression** or **DecimalValues** properties are set. The default setting uses `AutoFormatType = 1` and `AutoFormatExpression = ''`.
  
The following tables describes how to set each of the properties to achieve the format that you want.

## Setting the DecimalPlaces property

With the following set up, the **AutoFormatExpression** property is ignored.
  
|AutoFormatType Property|DecimalPlaces Property|Usage Description|  
|---------------------------|--------------------------|---------------------------|
|0|Set to the number of decimal places that you want to display for the value.|Use this configuration when you want to format the decimal value according the Standard Format 0 (which is the default format) with a specific number of decimal places.<br /><br /> For example, if the value is a US decimal `-76543.21` and you set the **DecimalPlaces** property to `0`, then the value appears as **76,543**. The properties will look like this:<br /><br />`AutoFormatType = 0;`<br />`DecimalPlaces = '0';`|

## Setting the AutoFormatExpression property

With the following setup, the **DecimalPlaces** property is ignored. 

|AutoFormatType Property|AutoFormatExpression Property|Usage Description|  
|---------------------------|---------------------------|----------------------|  
|1|Set to return a currency code, such as USD or IDR. The blank currency code `''` denotes LCY and is the default value. |Use this configuration when you want to format the data as an amount. For example, a sales order will use two decimals when the currency is defined as US dollar and no decimals when the currency is defined as IDR \(Indonesian rupiah\). For example:<br /><br />`AutoFormatType = 1;`<br />`AutoFormatExpression = 'IDR';`|  
|2|Set to return a currency code such as USD or IDR. The blank currency code `''` denotes LCY and is the default value.|This is similar to the previous configuration where the **AutoFormatType** property is set to `1`, except you use this configuration when you want to format the data as a unit amount.|  
|10|Set to the property according to the following syntax:<br /><br /> `'[SubType][,<currencycode or expression>[,<PrefixedText>]]'`<br /><br /> `SubType` can be `1`, `2`, another number, or omitted: <br /><br /> `1` sets the value to an amount type (see 1 above). `2` sets the value to a unit amount type (see 2 above). The syntax for these two settings is: <br /><br /> `'SubType,<currencycode[,<PrefixedText>]'`<br /><br /> If you omit the subtype or use a number other than 1 or 2, the syntax is: <br> <br> `'<CustomNumber>, <expression>[,<PrefixedText>]'`<br /><br /> where `<expression>` sets the precision and one of the standard formats. For more information, see [Standard Formats](#StandardFormats).<br /><br />|Use SubType `1` to add the currency symbol and use the amount type precision. You use SubType `2` for unit amount precision. For example, set the property to `'1,USD'` to add the **$** symbol, like **$543.21**.<br><br />`AutoFormatType = 10;`<br />`AutoFormatExpression = '1,USD';` <br /><br />If you omit the SubType, you can use this configuration to customize the format based on one of the standard formats. This option enables you to specify characters before and after the decimal value, such as currency signs **$** and percent **%**. <br><br> For example, if you want to prefix the decimal value with a **$**, include a thousand separator, and have a maximum of two decimal places, such as **$76,453.21**, then you can set the properties to:  <br /><br />`AutoFormatType = 10;`<br />`AutoFormatExpression = '$<precision, 2:2><standard format, 0>'`<br><br> If you want to display the decimal value as a percentage, then you can add `%` at the end of the setting. For example: <br /><br />`AutoFormatType = 10;`<br />`AutoFormatExpression = '<precision, 1:1><standard format,0>%'`<br><br> When you include a `%` at the end of the setting, then the decimal value is assumed to be the ratio, and the decimal value will be multiplied by 100. For example, a value of 0.98 will be formatted to **98%**.|
|11|Set the property to the standard format as explained below. For example: <br><br>`'<Precision,3:3><Standard Format,0>'`|Use this option when you want full control over the formatting. The format string will be applied exactly as specified in the AutoFormatExpr property.|  

<!--
The following table describes how to set each of the properties to achieve the format that you want. 
 
|**AutoFormatType Property**|**DecimalPlaces Property**|**AutoFormatExpression Property**|**Usage Description**|  
|---------------------------|--------------------------|---------------------------|----------------------|  
|0|Set to the number of decimal places that you want to display for the value.|Not applicable. This property is ignored.|Use this configuration when you want to format the decimal value according the Standard Format 0 (which is the default format) with a specific number of decimal places.<br /><br /> For example, if the value is a US decimal `-76543.21` and you set the **DecimalPlaces** property to `0`, then the value appears as **76,543**:<br /><br />`AutoFormatType = 0;`<br />`DecimalPlaces = '0';`|  
|1|Not applicable. This property is ignored.|Set to return a currency code, such as USD or IDR \(blank currency code denotes LCY\).|Use this configuration when you want to format the data as an amount. For example, a sales order will use two decimals when the currency is defined as US dollar and no decimals when the currency is defined as IDR \(Indonesian rupiah\). For example:<br /><br />`AutoFormatType = 1;`<br />`AutoFormatExpression = 'IDR';`|  
|2|Not applicable. This property is ignored.|Set to return a currency code such as USD or IDR \(a blank currency code denotes LCY\).|This is similar to the previous configuration where the **AutoFormatType** property is set to 1, except you use this configuration when you want to format the data as a unit amount.|  
|10|Not applicable. This property is ignored.|Set to the property according to the following syntax:<br /><br /> `'[SubType][,<currencycode or expression>[,<PrefixedText>]]'`<br /><br /> `SubType` can be `1`, `2`, another number, or omitted: <br /><br /> `1` sets the value to an amount type (see 1 above) and `2` sets the value to a unit amount type (see 2 above). The syntax for these two setting is: <br /><br /> `'SubType,<currencycode[,<PrefixedText>]'`<br /><br /> If you omit the subtype or use a number than 1 or 2, the syntax is: <br> <br> `'<CustomNumber>, <expression>[,<PrefixedText>]'`<br /><br /> where `<expression>` implements the precision and one of the standard formats. For more information, see [Standard Formats](#StandardFormats).<br /><br />|Use SubType `1` to add the currency symbol and use the amount type precision. You use SubType `2` for unit amount precision. For example, set the property to `'1,USD'` to add the $ symbol, like $543.21.<br><br />`AutoFormatType = 10;`<br />`AutoFormatExpression = '1,USD';` <br /><br />If you omit the SubType, you can use this configuration to customize the format based on one of the standard formats. This option enables you to specify characters before and after the decimal value, such as currency signs $ and percent %. <br><br> For example, if you want to prefix the decimal value with a $, include a thousand separator, and have a maximum of two decimal places, such as $76,453.21, then you can set the properties to:  <br /><br />`AutoFormatType = 1;`<br />`AutoFormatExpression = '$<precision, 2:2><standard format, 0>'`<br><br> If you want to display the decimal value as a percentage, then you can add `%` at the end of the setting. For example: <br /><br />`AutoFormatType = 1;`<br />`AutoFormatExpression = '<precision, 1:1><standard format,0>%'`<br><br> When you include a `%` at the end of the setting, then the decimal value is assumed to be the ratio and the decimal value will be multiplied by 100. For example, a value of 0.98 will be formatted to 98%.|
|11|Not applicable. This property is ignored.|Set the property to the standard format as explained below. For example: <br><br>`'<Precision,3:3><Standard Format,0>'`|Use this option when you want full control over the formatting. The format string will be applied exactly as specified in the AutoFormatExpr property.|  
-->
## Precision

The precision determines the minimum and maximum number of decimal points for values. The precision takes the format `<precision,minimum:maximum>`. For example, `<precision,minimum:maximum>` sets the data with a minimum of 2 and a maximum of 3 decimal places.

##  <a name="StandardFormats"></a> Standard formats

The following table describes the standard formats that are available for the **AutoFormatExpr** property when the **AutoFormatType** property is set to 10.  
  
|**Standard Format**|**Format Description**|**Europe Decimal Example**|**US Decimal Example**|  
|-------------------------|----------------------------|--------------------------------|----------------------------|  
|0|\<Sign>\<Integer Thousand>\<Point or Comma>\<Decimals>|-76.543,21|-76,543.21|  
|1|\<Sign>\<Integer>\<Point or Comma>\<Decimals>|-76543,21|-76543.21|  
|2|\<Sign>\<Integer>\<Point or Comma>\<Decimals>|-76543.21|-76543.21|  
|3|\<Integer Thousand>\<Point or Comma>\<Decimals>\<Sign>|76.543,21-|76,543.21-|  
|4|\<Integer>\<Decimals>\<Point or Comma>\<Sign>|76543,21-|76543.21-|  
|9|XML format|-76543.21|-76543.21|  
  
## See Also  

[AutoFormatType Property](properties/devenv-AutoFormatType-Property.md)   
[AutoFormatExpression Property](properties/devenv-AutoFormatExpression-Property.md)   
[DecimalPlaces Property](properties/devenv-DecimalPlaces-Property.md)   

