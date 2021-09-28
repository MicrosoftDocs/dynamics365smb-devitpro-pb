---
title: "Formatting Values, Dates, and Time"
description: Explains the Format functionality in Business Central.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Formatting Values, Dates, and Time

With the `Format` function in Business Central, you can set the format of the source expression for various data types in AL.  
  
## Remarks  

You can choose to set `Format` to a predefined format, or you can build your own format. For more information, see [Format Method (Integer, Text)](methods-auto/system/system-format-joker-integer-string-method.md).  
  
## Basic Settings  

To choose a predefined format, use the syntax: <Standard Format,*X*>, where *X* is one of the entries in the Value column of the following table.  
  
|Value|Description|  
|-----|---------------------------------------|  
|0|Standard Display Format (the default for all data types)|  
|1|Standard Display Format 2 (edit)|  
|2|AL Code Constant Format|  
  
> [!NOTE]  
> You must enter the < and > angle brackets, such as `<Standard Format,2>`.  
  
## Building Formats  

You can use `Format` to create your own formats. To create a format, use the following rules:  
  
- A format property consists of zero or more Chars, Fields, or Attributes.  
  
- Fields and Attributes are expressed by using an identifier enclosed in brackets (<>).  
  
- Attributes must contain a comma (,) and a parameter after the identifier.  
  
- Fields can optionally take a comma (,) and a FieldLen.  
  
The following table shows the syntax.  
  
|Syntax|Values|  
|-|-|  
|FormatProperty :=|\[\<Char> &#124; \<Field> &#124; \<Attribute>\]|  
|\<Char> :=|character with ASCII value \[32..255\]|  
|\<Field> :=|'\<' \<FieldName> \[',' \<FieldLen>\] '>'<br /><br /> \[, \<Attribute>\]|  
|\<FieldName> :=|literal name of field \(format component\)|  
|\<FieldLen> :=|length of field \(0 or no entry means that the length is dynamic\)|  
|\<Attribute> :=|\['\<' \<AttributeName> ',' \<Char> '>'\]|  
|\<AttributeName> :=|\[Standard Format &#124; 1000Character &#124; Comma &#124; Overflow &#124; Filler Character &#124; Precision\]|  
  
The `1000Character` attribute specifies the character that separates the thousandths place digit from the hundredths place digit, the millionth place digit from the hundred thousandths place digit, and so on. The 1000Character attribute must be after the Integer or Integer Thousand field name and before the Decimals field name.  
  
The Comma attribute specifies the character that separates the integer from the decimals. The Comma attribute must be after the Decimals field name.  
  
Filler Character indicates the character that is used to fill empty spaces.  
  
The FieldName is a component that you can use to build a format expression. Depending on the data type in the field, you can choose the appropriate FieldName from this list.  
  
|Data type|FieldName values|  
|---------------|----------------------|  
|Decimal|Sign, Integer, Decimals, Integer Thousand|  
|Date|Day, Month, Month Text, Quarter, Year, Year4, Week, Week Year, Week Year4, Weekday, Weekday Text, Closing|  
|Time|Hours24, Hours12, Minutes, Seconds, Thousands, AM/PM, Second dec|  
|DateTime|Day, Month, Month Text, Quarter, Year, Year4, Week, Week Year, Week Year4, Weekday, Weekday Text, Hours24, Hours12, Minutes, Seconds, Thousands, AM/PM, Second dec **Note:**  "Second dec" specifies a fraction of a second, in decimal format.|  
|Integer, BigInteger|Sign, Integer, Integer Thousand|  
|Boolean|Text, Number|  
|Option|Text, Number|  
|Code|Text|  
|Char|Char/Number, Char, Number|  
|Text|Text|  
  
### Example  

The following examples demonstrate how to use `Format`:  
  
- Choosing a standard format.  
  
     Use the Standard Format attribute to select one of the standard formats (these are listed at the end of this topic).  
  
     For example, <Standard Format,5> selects Standard Format 5.  
  
- Using a standard format with an attribute.  
  
     <Precision,2:3><Standard Format,0> will use Standard Format 0 and will format the data with a minimum of 2 and a maximum of 3 decimal places. For more information, see [DecimalPlaces Property](properties/devenv-decimalplaces-property.md). If you do not specify a precision, then the page uses the precision that is specified in the [DecimalPlaces Property](properties/devenv-decimalplaces-property.md) of the corresponding field in the table.  
  
- Building a format.  
  
     You can create your own formats using Chars (which are displayed literally), Fields (to choose specific components of a value, for example the year-part of a date) and Attributes (for example to select which character to use as a filler).  
  
     For example, a field that is based on a source expression of the Date data type can use the following format string:  
  
     \<Weekday Text>, \<Month Text> \<Day>   
  
     This expression displays the date as **Monday, April 15**.  
  
    > [!NOTE]  
    > The settings that are specified under the Regional and Language Options in Windows determine how some separators are displayed. In the Business Central client, you can specify a **Region** under **Settings**, this determines how thousand and decimal separators are displayed.
  
## Standard Decimal Formats

This table shows the standard Decimal formats with the regional setting of a European country/region.  
  
|**Europe Decimal**|**Format**|**Example**|  
|------------------------|----------------|-----------------|  
|\<Sign>\<Integer Thousand>\<Decimals>|0|-76.543,21|  
|\<Sign>\<Integer>\<Decimals>|1|-76543,21|  
|\<Sign>\<Integer>\<Decimals>\<Comma,.>|2|-76543.21|  
|\<Integer Thousand>\<Decimals>\<Sign,1>|3|76.543,21-|  
|\<Integer>\<Decimals>\<Sign,1>|4|76543,21-|  
|\<XML format>|9|-76543.21|  
  
The following table shows the standard Decimal formats with the regional setting of English \(US\).  
  
|**US Decimal**|**Format**|**Example**|  
|--------------------|----------------|-----------------|  
|\<Sign>\<Integer Thousand>\<Decimals>|0|-76,543.21|  
|\<Sign>\<Integer>\<Decimals>|1|-76543.21|  
|\<Sign>\<Integer>\<Decimals>|2|-76543.21|  
|\<Integer Thousand>\<Decimals>\<Sign,1>|3|76,543.21-|  
|\<Integer>\<Decimals>\<Sign,1>|4|76543.21-|  
|\<XML format>|9|-76543.21|  
  
## Standard Date Formats

The following table shows the standard Date formats with the regional setting of a European country/region.  
  
|**Europe Date**|**Format**|**Example**|  
|---------------------|----------------|-----------------|  
|\<Closing>\<Day,2>-\<Month,2>-\<Year>|0|05-04-21|  
|\<Closing>\<Day,2>-\<Month,2>-\<Year>|1|05-04-21|  
|\<Day,2>\<Month,2>\<Year>\<Closing>D|2|050421D|  
|\<Closing>\<Year>-\<Month,2>-\<Day,2>|3|21-04-05|  
|\<Closing>\<Day>. \<Month Text> \<Year4>|4|5. April 2021|  
|\<Closing>\<Day,2>\<Month,2>\<Year>|5|050421|  
|\<Closing>\<Year>\<Month,2>\<Day,2>|6|210405|  
|\<Day,2>\<Filler Character, >. \<Month Text,3> \<Year4>|7|5. Apr 2021|  
|\<XML format>|9|2021-04-05|  
  
The following table shows the standard Date formats with the regional setting of English \(US\).  
  
|**US Date**|**Format**|**Example**|  
|-----------------|----------------|-----------------|  
|\<Closing>\<Month,2>/\<Day,2>/\<Year>|0|04/05/21|  
|\<Closing>\<Month,2>/\<Day,2>/\<Year>|1|04/05/21|  
|\<Month,2>\<Day,2>\<Year>\<Closing>D|2|040521D|  
|\<Closing>\<Year>/\<Month,2>/\<Day,2>|3|21/04/05|  
|\<Month Text> \<Closing>\<Day>, \<Year4>|4|April 5, 2021|  
|\<Closing>\<Month,2>\<Day,2>\<Year>|5|040521|  
|\<Closing>\<Year>\<Month,2>\<Day,2>|6|210405|  
|\<Day,2>\<Filler Character, >. \<Month Text,3> \<Year4>|7|5. Apr 2021|  
|\<XML format>|9|2021-04-05|  
  
## Standard Time Formats

The following table shows the standard Time formats with the regional setting of a European country/region.  
  
|**Europe Time**|**Format**|**Example**|  
|---------------------|----------------|-----------------|  
|\<Hours24>.\<Minutes,2>.\<Seconds,2>|0|4.35.55|  
|\<Hours24>.\<Minutes,2>.\<Seconds,2>\<Second dec.>|1|4.35.55.553|  
|\<Hours24,2>\<Filler Character,0>\<Minutes,2>\<Seconds,2> \<Second dec.>\<Comma,.>T|2|043555.553T|  
|\<XML format>|9|04:35:55.553|  
  
The following table shows the standard Time formats with the regional setting of English \(US\).  
  
|**US Time**|**Format**|**Example**|  
|-----------------|----------------|-----------------|  
|\<Hours12>:\<Minutes,2>:\<Seconds,2>\<Second dec.> \<AM/PM>|0|4:35:55 AM|  
|\<Hours12>:\<Minutes,2>:\<Seconds,2>\<Second dec.> \<AM/PM>|1|4:35:55.553 AM|  
|\<Hours24,2>\<Filler Character,0>\<Minutes,2>\<Seconds,2> \<Second dec.>T|2|043555 .553T|  
|\<XML format>|9|04:35:55.553|  

## Standard DateTime Formats

The following table shows the standard DateTime formats with the regional setting of a European country/region.  
  
|**Europe DateTime**|**Format**|**Example**|  
|-------------------------|----------------|-----------------|  
|\<Day,2>-\<Month,2>-\<Year> \<Hours24,2>.\<Minutes,2>|0|05-04-21 04:35|  
|\<Day,2>-\<Month,2>-\<Year> \<Hours24,2>.\<Minutes,2>.\<Seconds,2>\<Second dec>|1|05-04-21 04:35:55,553|  
|\<Day,2>-\<Month,2>-\<Year> \<Hours24,2>.\<Minutes,2>|2|05-04-21 04:35|  
|\<Day,2>-\<Month,2>-\<Year> \<Hours24,2>.\<Minutes,2>.\<Seconds,2>|3|05-04-21 04:35:55|  
|\<XML format> **Warning:**  A DateTime is stored in the database as Coordinated Universal Time \(UTC\). For example, on a computer in the \(UTC+01:00\) Brussels, Copenhagen, Madrid, Paris time zone, UTC is one hour earlier than local time on the computer and probably two hours earlier during summer time.|9|2021-04-05T03:35:55.553Z|  
  
The following table shows the standard DateTime formats with the regional setting of English \(US\).  
  
|**US DateTime**|**Format**|**Example**|  
|---------------------|----------------|-----------------|  
|\<Month,2>/\<Day,2>/\<Year> \<Hours12,2>:\<Minutes,2> \<AM/PM>|0|04/05/21 04:35 AM|  
|\<Month,2>/\<Day,2>/\<Year> \<Hours12,2>:\<Minutes,2>:\<Seconds,2>\<Second dec> \<AM/PM>|1|04/05/21 04:35:55.553 AM|  
|\<Month,2>/\<Day,2>/\<Year> \<Hours12,2>:\<Minutes,2> \<AM/PM>|2|04/05/21 04:35 AM|  
|\<Month,2>/\<Day,2>/\<Year> \<Hours12,2>:\<Minutes,2>:\<Seconds,2> \<AM/PM>|3|04/05/21 04:35:55 AM|  
|\<XML format> **Warning:**  A DateTime is stored in the database as Coordinated Universal Time \(UTC\). For example, on a computer in the \(UTC-08:00\) Pacific Time zone, UTC is eight hours later than local time on the computer.|9|2021-04-05T12:35:55.553Z|  

## Standard Integer Formats  

|**Integer and BigInteger**|**Format**|**Example**|  
|--------------------------------|----------------|-----------------|  
|\<Sign>\<Integer>|0|-567|  
|\<Sign>\<Integer>|1|-567|  
|\<Sign>\<Integer>|2|-567|  
|\<XML format>|9|-567|  

## Standard Boolean Formats  

|**Boolean**|**Format**|**Example**|  
|-----------------|----------------|-----------------|  
|\<Text>|0|True/False|  
|\<Text>|1|True/False|  
|\<Number>|2|1/0|  
|\<XML format>|9|true/false|  

## Standard GUID Formats  

|**GUID**|**Format**|**Example**|  
|----------------|----------------|-----------------|  
|{<4byte>-<2byte>-<2byte>-<2byte>-<6byte>}|0|{EA48A3E0-48E0-4AB7-B1A1-E3EA85BF1B75}|  
|{<4byte>-<2byte>-<2byte>-<2byte>-<6byte>}|1|{EA48A3E0-48E0-4AB7-B1A1-E3EA85BF1B75}|  
|{<4byte>-<2byte>-<2byte>-<2byte>-<6byte>}|2|{EA48A3E0-48E0-4AB7-B1A1-E3EA85BF1B75}|  
|<16byte>|3|EA48A3E048E04AB7B1A1E3EA85BF1B75|  
|<4byte>-<2byte>-<2byte>-<2byte>-<6byte>|4|EA48A3E0-48E0-4AB7-B1A1-E3EA85BF1B75|  
|(<4byte>-<2byte>-<2byte>-<2byte>-<6byte>)|5|(EA48A3E0-48E0-4AB7-B1A1-E3EA85BF1B75)|  
|{0X<4byte>,0X<2byte>,0X<2byte>,{0X<1byte>,0X<1byte>,0X<1byte>,0X<1byte>,<br/>0X<1byte>,0X<1byte>,0X<1byte>,0X<1byte>}}|6|{0XEA48A3E0,0X48E0,0X4AB7,{0XB1,0XA1,0XE3,0XEA,0X85,0XBF,0X1B,0X75}}|  
|\<XML format>|9|{EA48A3E0-48E0-4AB7-B1A1-E3EA85BF1B75}|  

## Standard Enum Formats  

|**Enum value**|**Format**|**Example**|  
|----------------|----------------|-----------------|  
|\<Text>|0|Bronze|  
|\<Text>|1|Bronze|  
|\<Number>|2|1|  
|\<XML format>|9|1|  

## Standard Option Formats

|**Option**|**Format**|**Example**|  
|----------|----------|-----------------|  
|\<Text>|0|Blue|  
|\<Text>|1|Blue|  
|\<Number>|2|1|  
|\<XML format>|9|1|  

## Standard XML and String Formats

Standard format `9` is used to display the data in the standard XML formats.  
  
For Chars, all formats should resemble the following: <Char/Number>.  
  
For Text and Code, all formats should resemble the following: \<Text>.  
  
## See Also

[DecimalPlaces Property](properties/devenv-decimalplaces-property.md)
