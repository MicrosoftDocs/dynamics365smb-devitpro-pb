---
title: "System.RoundDateTime Method"
description: "Rounds a DateTime."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# System.RoundDateTime Method
> **Version**: _Available or changed with runtime version 1.0._

Rounds a DateTime.


## Syntax
```
NewDatetime :=   System.RoundDateTime(Datetime: DateTime [, Precision: BigInteger] [, Direction: String])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Datetime*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
The DateTime that you want to round.  
*Precision*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
This optional parameter determines the precision used when rounding. The default value is 1000, which rounds to the nearest second. You can only use positive BigIntegers.
        
*Direction*  
&emsp;Type: [String](../string/string-data-type.md)  
This optional parameter specifies how to round the DateTime. The default rounding method is '='. You can change the method by using the following options:
-   '=' rounds up or down to the nearest value (default). Values of 5 or greater are rounded up. Values less than 5 are rounded down.
-   '\>' rounds up
-   '\<' rounds down
          


## Return Value
*NewDatetime*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
The rounded result.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

A variable of type DateTime is stored as a 64 bit integer. The integer value is the number of milliseconds since year 0. When you call RoundDateTime, the DateTime integer value is rounded as a numeric variable.  

If you use 1 for the *Precision* parameter, then the resulting DateTime is rounded to the nearest millisecond. If you use 1000 for the *Precision* parameter, which is the default value, then the resulting DateTime will be rounded to the nearest second.  

We recommend that you do not use a value greater than 60\*60\*1000, which is the number of milliseconds in an hour, for the *Precision* parameter. The Regional and Language Options in Windows affect how the hour and date parts of a DateTime are rounded. To display a DateTime in a specific format, we recommend that you use the Format method instead of the RoundDateTime method.  

## Example

This example shows how to use the RoundDateTime method to round to the nearest second. 
 
```al
var
    Text000: Label 'RoundDateTime(%1, %2) returns %3.';
begin
    DateToRound := 20081127D;  
    TimeToRound := 093524.567T;  
    DateTimeToRound := CreateDateTime(DateToRound, TimeToRound);  
    Precision := 1000L;  
    FormatString := '<Month,2>/<Day,2>/<Year> <Hours24,2>:<Minutes,2>:<Seconds,2>.<Thousands,3>';  
    Result := RoundDateTime(DateTimeToRound, Precision);  
    Message(TEXT000, Format(DateTimeToRound,0,FormatString), Precision, Format(Result,0,FormatString)); 
end;
```  

The message window displays the following:  

**RoundDateTime\(11/27/08 09:35:24.567, 1000\) returns 11/27/08 09:35:25.000.**  

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)