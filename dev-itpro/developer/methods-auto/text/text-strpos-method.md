---
title: "Text.StrPos Method"
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
# Text.StrPos Method
> **Version**: _Available from runtime version 1.0._

Searches for the first occurrence of substring inside a string.


## Syntax
```
Position :=   Text.StrPos(String: String, SubString: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string in which you want to search.
        
*SubString*  
&emsp;Type: [String](../string/string-data-type.md)  
The substring for which you want to search.  


## Return Value
*Position*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The one-based index of the first occurrence of the substring inside the string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The StrPos method returns the position of the first occurrence of the substring.  
  
 If *SubString* cannot be found, then the method returns zero.  
  
 If *String* or *SubString* is empty, then the method returns zero.  
  
## Example 1

 This example shows how to use the StrPos method.  
  
```al
var
    Text000: Label 'ABC abc abc xy';  
    Text001: Label 'abc'; 
    Text002: Label 'The search for the substring: >%1<\\'; 
    Text003: Label 'in the string: >%2<,\\'; 
    Text004: Label 'returns the position: %3';  
begin
    String := Text000;  
    SubStr := Text001  
    Pos := StrPos(String, SubStr);  
    Message(Text002 + Text003 + Text004, SubStr, String, Pos);  
    // The StrPos method is case-sensitive. Furthermore, it only  
    // returns the position of the 1st occurrence of the substring.  
end;
```  
  
 The message window displays the following:  
  
 **The search for the substring: >abc\<**  
  
 **in the string: >ABC abc abc xy\<**  
  
 **returns the position: 5**  
  
## Example 2
  
```al
Pos1 := StrPos("abc",""); // Returns 0.  
Pos2 := StrPos("abc","c"); // Returns 3.  
Pos3 := StrPos("abc","bc"); // Returns 2.  
Pos4 := StrPos("abc","x"); // Returns 0.  
```  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)