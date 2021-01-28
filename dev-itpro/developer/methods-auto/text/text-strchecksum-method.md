---
title: "Text.StrCheckSum Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text.StrCheckSum Method
> **Version**: _Available from runtime version 1.0._

Calculates a checksum for a string that contains a number. If the source is empty, 0 is returned. Each char in the source and in the weight must be a numeric character 0-9, otherwise an exception is thrown. If the WeightString parameter is shorter then the source, it is padded with '1' up until the length of source. If the WeightString parameter is longer than the source, an exception is thrown.


## Syntax
```
CheckNumber :=   Text.StrCheckSum(String: String [, WeightString: String] [, Modulus: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
This string contains the number for which you want to calculate a checksum. You can only enter the numeric characters 0-9 in this string. If you enter anything else, a run-time error will occur. If String is empty, 0 is returned.
        
*WeightString*  
&emsp;Type: [String](../string/string-data-type.md)  
This string contains numbers that you want to use as weights when calculating the checksum. The default value is a string that contains StrLen(String) '1'-characters.
        
*Modulus*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number that you want to use in the checksum formula. The default value is 10.  


## Return Value
*CheckNumber*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The resulting checksum value.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example 1

 This example shows how to use the StrCheckSum method to calculate a checksum.  
 
```al
var
    StrNumber: Text[30];
    Weight: Text[30];
    Modulus: Integer;
    Text000: Label 'The number: %1\\';
    Text001: Label 'has the checksum: %2';
begin
    StrNumber := '4378';  
    Weight := '1234';  
    Modulus := 7;   
    CheckSum := StrCheckSum(StrNumber, Weight, Modulus);   
    Message(Text000 + Text001, StrNumber, CheckSum);  
end;
```  

 The formula is:  

 \(7 - \(4x1 + 3x2 + 7x3 + 8x4\) MOD 7\) MOD 7=0  

 The message window displays the following:  

 **The number: 4378**  

 **has the checksum: 0**  

## Example 2

 This example shows how to use the StrCheckSum method to calculate a modulus 10 checksum for a bar code.  

 The StrCheckSum method can be used to calculate checksums for 13- and 8-digit European Article Number \(EAN\) and EAN-compatible bar codes such as a Universal Product Code \(UPC\) or Japanese Article Number \(JAN\).  

 A 13-digit EAN code has the following format:  

1.  The 12 digits in positions 13 to 2 are used to calculate the checksum at position 1.  

2.  Starting with position 2, all even values are totaled. The result is then multiplied by three. This value is called Even.  

3.  Starting with position 3, all odd values are totaled. The result is called Odd.  

4.  Total=Even + Odd.  

5.  The modulus 10 checksum is then \(10 - Total MOD 10\) MOD 10.  

 
```al
var
    StrNumber: Text[30];
    Weight: Text[30];
    Modulus: Integer;
    Text000: Label 'The EAN code: %1\\';
    Text001: Label 'has the checksum: %2';
begin
    StrNumber := '577622135746';  
    Weight := '131313131313';  
    CheckSum := StrCheckSum(StrNumber, Weight);  
    Message(Text000 + Text001, StrNumber, CheckSum);  
end;
```  

 The message window displays the following:  

 **The EAN code: 577622135746**  

 **has the checksum: 3**  


## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)