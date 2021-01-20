---
title: "Text.ConvertStr Method"
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
# Text.ConvertStr Method
> **Version**: _Available from runtime version 1.0._

Replaces all chars in source found in FromCharacters with the corresponding char in ToCharacters and returns the converted string. If the length of the FromCharacters parameter and the ToChars parameter are different, an exception is thrown. If the parameter FromCharacters or the parameter ToChars is empty, the source is returned unmodified. Each element in source is only converted ONCE a double-replacement cannot happen.


## Syntax
```
NewString :=   Text.ConvertStr(String: String, FromCharacters: String, ToCharacters: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string that you want to convert.
        
*FromCharacters*  
&emsp;Type: [String](../string/string-data-type.md)  
The characters that you want to replace. This function is case-sensitive.
        
*ToCharacters*  
&emsp;Type: [String](../string/string-data-type.md)  
The new characters with which you want to replace the FromCharacters. This function is case-sensitive.  


## Return Value
*NewString*
&emsp;Type: [String](../string/string-data-type.md)
The input string with the converted characters.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The characters in the *FromCharacters* parameter are replaced by the characters in the *ToCharacters* parameter.  
  
 If the lengths of the *FromCharacters* and *ToCharacters* strings are not equal, then a run-time error occurs.  
  
 If either the *FromCharacters* or the *ToCharacters* strings are empty, then the source is returned unchanged.  
  
## Example  

```  
var
    OriginalString: Text[30];
    FromChars: Text[30];
    ToChars: Text[30];
    NewString: Text[30];
    Text000: Label 'Do you want to leave without saving?';
    Text001: Label 'lws';
    Text002: Label 'LWS';
    Text003: Label 'The original sentence is \\: %1';
    Text004: Label 'The sentence is converted to:\\ %1';
begin
    OriginalString := Text000;  
    FromChars := Text001;  
    ToChars := Text002;   
    NewString := CONVERTSTR(OriginalString, FromChars, ToChars);  
    Message(Text003, OriginalString);  
    Message(Text004, NewString);  
end;
```  
  
 The first message window shows:  
  
 **The original sentence is:**  
  
 **Do you want to leave without saving?**  
  
 The second message window shows:  
  
 **The sentence is converted to:**  
  
 **Do you Want to Leave Without Saving?**  
  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)