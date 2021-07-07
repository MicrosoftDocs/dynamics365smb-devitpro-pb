---
title: "System.Format(Any, Integer, String) Method"
description: "Formats a value into a string."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# System.Format(Any, Integer, String) Method
> **Version**: _Available or changed with runtime version 1.0._

Formats a value into a string.


## Syntax
```AL
String :=   System.Format(Value: Any, Length: Integer, FormatString: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
This is an AL variable (expression) of any simple data type, such as Option, Integer, BigInteger, Decimal, Char, Text, Code, Date, Time, DateTime, Boolean, or GUID. If, when the system formats Value, the result is a value larger than the maximum length MAXSTRLEN method (Code, Text) of String, a run-time error occurs.
          
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
This optional parameter specifies the length of String.
        
*FormatString*  
&emsp;Type: [String](../string/string-data-type.md)  
A literal string that defines a format as in the Format Property.  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

For the *Length* parameter, the following rules apply:  

- If *Length* = 0 then the entire value is returned (default).  

- If *Length* > 0 then the returned string will be exactly *Length* characters.  

   If *Value* is less than *Length* characters, then either leading or trailing spaces are inserted, depending on the format that you select.  

   If *Value* exceeds *Length* characters, then *String* is truncated to *Length* characters.  

- If *Length* < 0 then the returned string will not have leading or trailing spaces.  

   If *Value* is less than *Length* characters, the length of *String* will equal the length of *Value*.  

   If *Value* exceeds *Length* characters, then *String* is truncated to *Length* characters.

For the *Format* parameter, see [Format Property](../../devenv-format-property.md) for more information.

The *FormatNumber* parameter specifies the format that you want to use. The basic options for the Decimal data type are as follows:  

- <*Sign*><*Integer Thousand*><*Decimals*> is Format 0  

- <*Sign*><*Integer*><*Decimals*> is Format 1  

- <*Sign*><*Integer*><*Decimals*><*Comma*,.> is Format 2  

- <*Integer Thousand*><*Decimals*><*Sign,1*> is Format 3  

- <*Integer*><*Decimals*><*Sign,1*> is Format 4  

> [!NOTE]  
> You cannot use both *FormatNumber* and *FormatStr* at the same time.

## Example 1


```al
var
    Text000: Label 'The formatted value >%1<';
begin
    Message(Text000, Format(-123456.78, 12, 3));  
    Message(Text000, Format(-123456.78, 12, '<Standard Format,3>'));  
    Message(Text000, Format(-123456.78, 12, '<Integer Thousand><Decimals><Sign,1>'));  
end;

```  

The Regional and Language settings on the computer on which you run the code affect how the string is displayed. For example, on a computer that has the regional format set to English (United States), the message window displays the following:  

**The formatted value: > 123,456.78-\<**  

**The formatted value: > 123,456.78-\<**  

**The formatted value: > 123,456.78-\<**  

On a computer that has the regional format set to Danish \(Denmark\), the message window displays the following:  

**The formatted value: > 123.456,78-\<**  

**The formatted value: > 123.456,78-\<**  

**The formatted value: > 123.456,78-\<**  

## Example 2

This example shows how to use a string to build a format.

```al
var
    Text000: Label 'Today is %1';
begin 
    Message(Text000, Format(Today,0,'<Month Text> <Day>'));  
end;
```  

The message window displays the following:  

**Today is April 15.**  


## See Also
[Format Property](../../properties/devenv-format-property.md)  
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)