---
title: "System.Round(Decimal [, Decimal] [, Text]) Method"
description: "Rounds the value of a numeric variable."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.Round(Decimal [, Decimal] [, Text]) Method
> **Version**: _Available or changed with runtime version 1.0._

Rounds the value of a numeric variable.


## Syntax
```AL
NewNumber :=   System.Round(Number: Decimal [, Precision: Decimal] [, Direction: Text])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Number*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
The number that you want to round.  

*[Optional] Precision*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
This optional parameter determines the precision used when rounding. If you do not specify a Precision parameter, then the following steps are used to specify the precision:
1.  The method ReadRounding in Codeunit 45, ReadRounding, is called. ReadRounding returns a decimal value that is the precision. By default, the ReadRounding method returns the Amount Rounding Precision field from the GLSetup table.
2.  If you have customized Codeunit 45 and it does not implement the ReadRounding method, then the precision is specified as 2 digits after the decimal.  

*[Optional] Direction*  
&emsp;Type: [Text](../text/text-data-type.md)  
This optional parameter specifies how to round the Number parameter. The default rounding method is '='. The following are the options for rounding:
-   '=' rounds up or down to the nearest value (default). Values of 5 or greater are rounded up. Values less than 5 are rounded down.
-   '\>' rounds up
-   '\<' rounds down  


## Return Value
*NewNumber*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

This example shows how to use the **Round** method.
 
```al
var
    DecimalToRound: Decimal;
    Direction: Text;
    Precision: Decimal;
    Result: Decimal;
    Text00: Label 'Round(%1, %2, %3) returns %4.';
begin
    DecimalToRound := 1234.56789;  
    Direction := '>';  
    Precision := 0.001;  
    Result := Round(DecimalToRound, Precision, Direction);  
    Message(Text000, Format(DecimalToRound,0,1), Precision, Direction, Result);  
end;
```  

On a computer that has the regional format set to English \(United States\), the message window displays the following:  

**Round\(1234.56789, 0.001, '>'\) returns 1,234.568**  

The following table displays some additional Round examples.  

|Number|Precision|Direction|Rounded number|  
|------------|---------------|---------------|--------------------|  
|1234.56789|100|=|1200|  
|1234.56789|10|=|1230|  
|1234.56789|1|=|1235|  
|1234.56789|0.1|=|1234.6|  
|1234.56789|0.001|=|1234.568|  
|1234.56789|0.001|\<|1234.567|  
|1234.56789|0.001|>|1234.568|  
|-1234.56789|100|=|-1200|  
|-1234.56789|10|=|-1230|  
|-1234.56789|1|=|-1234|  
|-1234.56789|0.1|=|-1234.6|  
|-1234.56789|0.001|=|-1234.568|  
|-1234.56789|0.001|\<|-1234.567|  
|-1234.56789|0.001|>|-1234.568|  

When you round down \('\<'\) a negative number, such as -1234.56789, it is rounded down to -1234.567. However, -1234.567 is a mathematically greater value than -1234.56789.  

When you round up \('>'\) a negative number, such as -1234.56789, it is rounded up to -1234.568. However, -1234.568 is a mathematically smaller value than -1234.56789.  


## Related information

[System Data Type](system-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
