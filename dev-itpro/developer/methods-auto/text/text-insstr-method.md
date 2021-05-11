---
title: "Text.InsStr Method"
description: "Inserts a substring into a string."
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
# Text.InsStr Method
> **Version**: _Available or changed with runtime version 1.0._

Inserts a substring into a string.


## Syntax
```
NewString :=   Text.InsStr(String: String, SubString: String, Position: Integer)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string into which you want to insert a substring.
        
*SubString*  
&emsp;Type: [String](../string/string-data-type.md)  
The substring that you want to insert into String.
        
*Position*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies where to insert SubString. Position must be greater than or equal to 1. If Position is greater than the length of String, then the result is concatenated and copied to NewString.  


## Return Value
*NewString*  
&emsp;Type: [String](../string/string-data-type.md)  
The input string including the specified substring


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If *SubString* is empty, then *String* is returned unchanged.  
  
 If *Position* is less than 1, an error is returned.  
  
 If *Position* is greater than the length of *String*, *SubString* is added at the end of *String*. For example, `InsStr("Thomas","AAA",999)` returns 'ThomasAAA'.  
  
## Example

```al
var
    Str: Text[60];  
    SubString: Text[60];  
    NewString: Text[60]; 
    Text000: Label 'Press ENTER to continue.';  
    Text001: Label 'or ESC';
    Text002: Label ' The test string before InsStr is called:>%1<';
    Text003: Label ' The resulting string after InsStr is called:>%1<'; 
begin
    Str := Text000;  
    SubString := Text001;  
    Message(Text002, Str);  
    NewString := InsStr(Str, SubString, 13);  
    Message(Text003, NewString);  
end;
```  
  
 The first message window displays the following:  
  
 **The test string before InsStr is called:**  
  
 **>Press ENTER to continue.\<**  
  
 The second message window displays the following:  
  
 **The resulting string after InsStr is called:**  
  
 **>Press ENTER or ESC to continue.\<**  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)