---
title: "FORMAT Method (Code, Text)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c5a1cb50-f089-43c9-808f-4a8653d32a14
caps.latest.revision: 14
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FORMAT Method (Code, Text)
Formats a value into a string.  

## Syntax  

```  

String := FORMAT(Value[, Length][, FormatStr/FormatNumber])  
```  

#### Parameters  
 *Value*  
 Type: Any  

 This is an AL variable \(expression\) of any simple data type, such as Option, Integer, BigInteger, Decimal, Char, Text, Code, Date, Time, DateTime, Boolean, or GUID.  

 If, when the system formats *Value*, the result is a value larger than the maximum length [MAXSTRLEN Method \(Code, Text\)](devenv-MAXSTRLEN-Method-Code-Text.md) of *String*, a run-time error occurs.  

 *Length*  
 Type: Integer  

 This optional parameter specifies the length of *String*. The following rules apply:  

-   If *Length* = 0 then the entire value is returned \(default\).  

-   If *Length* > 0 then the returned string will be exactly *Length* characters.  

     If *Value* is less than *Length* characters, then either leading or trailing spaces are inserted, depending on the format that you select.  

     If *Value* exceeds *Length* characters, then *String* is truncated to *Length* characters.  

-   If *Length* \< 0 then the returned string will not have leading or trailing spaces.  

     If *Value* is less than *Length* characters, the length of *String* will equal the length of *Value*.  

     If *Value* exceeds *Length* characters, then *String* is truncated to *Length* characters.  

 *FormatStr*  
 Type: String  

 A literal string that defines a format as in the [Format Property](../properties/devenv-Format-Property.md).  

 *FormatNumber*  
 Type: Integer  

 This optional parameter specifies the format that you want to use. The basic options for the Decimal data type are as follows:  

-   \<*Sign*>\<*Integer Thousand*>\<*Decimals*> is Format 0  

-   \<*Sign*>\<*Integer*>\<*Decimals*> is Format 1  

-   \<*Sign*>\<*Integer*>\<*Decimals*>\<*Comma*,.> is Format 2  

-   \<*Integer Thousand*>\<*Decimals*>\<*Sign,1*> is Format 3  

-   \<*Integer*>\<*Decimals*>\<*Sign,1*> is Format 4  

> [!NOTE]  
>  You cannot use both *FormatNumber* and *FormatStr* at the same time.  

## Property Value/Return Value  
 Type: Text or code  

 The formatted output string.  

## Remarks  
 For more information about the formats that are used by the various data types, see [Format Property](../properties/devenv-Format-Property.md). This topic describes the various predefined formats in detail, and how to create customized formats.  

 Format 9 is designed to be used when importing data with an XMLport and converts data from XML format to the corresponding AL formats.  

## Example  
 This example requires that you create the following global text constant.  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The formatted value: >%1\<|  

```  
MESSAGE(Text000, FORMAT(-123456.78, 12, 3));  
MESSAGE(Text000, FORMAT(-123456.78, 12, '<Standard Format,3>'));  
MESSAGE(Text000, FORMAT(-123456.78, 12, '<Integer Thousand><Decimals><Sign,1>'));  

```  

 The Regional and Language settings on the computer on which you run the code affect how the string is displayed. For example, on a computer that has the regional format set to English \(United States\), the message window displays the following:  

 **The formatted value: > 123,456.78-\<**  

 **The formatted value: > 123,456.78-\<**  

 **The formatted value: > 123,456.78-\<**  

 On a computer that has the regional format set to Danish \(Denmark\), the message window displays the following:  

 **The formatted value: > 123.456,78-\<**  

 **The formatted value: > 123.456,78-\<**  

 **The formatted value: > 123.456,78-\<**  

## Example  
 This example shows how to use a string to build a format.  

 This example requires that you create the following global text constant.  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Today is %1.|  

```  
MESSAGE(Text000, FORMAT(TODAY,0,'<Month Text> <Day>'));  
```  

 The message window displays the following:  

 **Today is April 15.**  

## See Also  
 [Format Property](../properties/devenv-Format-Property.md)   
 [EVALUATE Method](devenv-EVALUATE-Method.md)   
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)
