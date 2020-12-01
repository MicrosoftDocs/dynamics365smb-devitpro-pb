---
title: "Text.SelectStr Method"
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
# Text.SelectStr Method
> **Version**: _Available from runtime version 1.0._

Retrieves a substring from a comma-separated string.


## Syntax
```
NewString :=   Text.SelectStr(Number: Integer, CommaString: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies which substring to retrieve. The substrings in the comma-separated string are numbered 1, 2, 3, and so on. If Number is greater than the actual number of substrings, then a run-time error occurs.
        
*CommaString*  
&emsp;Type: [String](../string/string-data-type.md)  
A string that contains substrings separated by commas. The maximum length of this string is 391 characters.  


## Return Value
*NewString*
&emsp;Type: [String](../string/string-data-type.md)
The substring from the comma-separated string at the index specified.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 SELECTSTR treats string values as OPTIONS. This means that identical values in different strings are not allowed.  
  
 Any trailing commas are removed before the operation starts.  
  
 If *Number* is less than 1 or greater than the number of real values \(excluding trailing commas\) in the string, then an error is returned.  
  
 Quotes are not supported. For example, a,b,"c,d",e is treated as a five-element substring where substring 4 is d".  
  
## Example 1
 
```  
var
    CommaStr: Text[60];  
    CommaStr2: Text[60];  
    SubStr1: Text[60];  
    SubStr2: Text[60];  
    SubStr3: Text[60];  
    SubStr4: Text[60];  
    Text000: Label 'This,is a comma,separated,string';
    Text001: Label 'The calls to SELECTSTR return:\\';
    Text002: Label '11,22,33,,55,,,';
begin
    CommaStr := Text000;  
    CommaStr2 := Text002;  
    SubStr1 := SELECTSTR(2, CommaStr); // Pick out the 2nd substring.  
    SubStr2 := SELECTSTR(4, CommaStr); // Pick out the 4th substring.  
    SubStr3 := SELECTSTR(1, CommaStr2);  
    SubStr4 := SELECTSTR(3, CommaStr2);  
    MESSAGE(Text001 + '>%1<\' + '>%2<\' + '>%3<\' + '>%4<\', SubStr1, SubStr2, SubStr3, SubStr4);  
end;
```  
  
 The message window displays the following text:  
  
 **The calls to SELECTSTR return:**  
  
 **>is a comma\<**  
  
 **>string\<**  
  
 **>11\<**  
  
 **>33\<**  
  
## Example 2

```  
var
    CommaStr2: Text[60];  
    SubStr5: Text[60];  
    Text002: Label '11,22,33,,55,,,';
begin
    CommaStr2 := Text002;  
    SubStr5 := SELECTSTR(6,CommaStr2);  
    MESSAGE('>%1<\', SubStr5);  
end;
```  
  
 This example returns an error.  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)