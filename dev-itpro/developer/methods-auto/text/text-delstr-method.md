---
title: "Text.DelStr Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# Text.DelStr Method
Deletes a substring inside a string (text or code).


## Syntax
```
NewString :=   Text.DelStr(String: String, Position: Integer [, Length: Integer])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The input string.
        
*Position*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The position of the first character that you want to delete. Position must be greater than zero (0). If Position exceeds the length of String, DELSTR returns the original string, unchanged.
        
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies how many characters to delete. Length must be greater than zero (0).  


## Return Value
*NewString*  
&emsp;Type: [String](../string/string-data-type.md)  
The input string without the specified substring.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If you omit *Length*, all the characters starting with *Position* are deleted until the end of the string.  
  
 If you omit *Length* and *Position* is less than 1, then an error is returned.  
  
 If you omit *Length* and *Position* is greater than the length of *String*, then *String* is returned unchanged.  
  
## Example  
```
var
    Str: Text[40];
    NewStr: Text[40];
    Position: Integer;
    Lenght: Integer;
    Text000: TexConst ENU='Adjusting prices - Please wait.';
    Text001: TexConst ENU='The original string:>%1<';
    Text002: TexConst ENU='The original modified:>%2<';
begin
    Str := Text000;  
    Position := 11; // Remove the word 'prices' and a blank.  
    Length := 7;  
    NewStr := DELSTR(Str, Position, Length);  
    MESSAGE(Text001, Str);  
    MESSAGE(Text002, NewStr);  
end;
```  
  
 The first message window displays the following:  
  
 **The original string:**  
  
 **>Adjusting prices - Please wait.\<**  
  
 The second message window displays the following:  
  
 **The modified string:**  
  
 **>Adjusting - Please wait.\<**  
  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)