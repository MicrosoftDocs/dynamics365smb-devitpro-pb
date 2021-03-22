---
title: "Text.DelChr Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Text.DelChr Method
> **Version**: _Available from runtime version 1.0._

Deletes chars contained in the which parameter in a string based on the contents on the where parameter. If the where parameter contains an equal-sign, then all occurrences of characters in which is deleted from the current value. If the where parameter contains a less-than, then the characters are only deleted when they are first in the string. If the where parameter contains a greater-than, then the characters are only deleted when they are the last in the string. If the where parameter contains any other char, an exception is thrown. If the where parameter or the which parameter is empty, the source is returned unmodified. The which parameter is to be considered as an array of chars to delete where the order does not matter.


## Syntax
```
NewString :=   Text.DelChr(String: String [, Where: String] [, Which: String])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The input string.
        
*Where*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies where to delete characters.
        
*Which*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the characters that you want to delete.  


## Return Value
*NewString*
&emsp;Type: [String](../string/string-data-type.md)
The end result String.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

The DelChr method is case-sensitive.  
  
If you omit the *Which* parameter, then the method deletes spaces from *String* based on the contents of the *Where* parameter as follows:  
  
- If *Where* contains =, then all the spaces are deleted from *String*.  
- If *Where* contains \<, then all the spaces at the start of *String* are deleted.  
- If *Where* contains >, then all the spaces at the end of *String* are deleted.  
- If *Where* contains any other character, then an error is returned.  
- If *Where* is empty, then *String* is returned unchanged.  
  
If you use the *Where* and the *Which* parameters, then the method deletes from *String* the characters that are contained in the *Which* parameter based on the contents of the *Where* parameter as follows:  
  
- If *Where* contains =, then every occurrence of the characters in *Which* are deleted from *String*.  
- If *Where* contains \<, then the characters in *Which* are only deleted if they occur at the start of *String*.  
- If *Where* contains >, then the characters in *Which* are deleted only if they occur at the end of *String*.  
- If *Where* contains any other character, then an error is returned.  
- If *Where* is empty, then *String* is returned unchanged.  
- If *Which* is empty, then *String* is returned unchanged.  
  
The *Which* parameter contains an array of the characters that you want to delete. The order of the characters is of no significance. If *String* contains a character that is specified in *Which*, it is deleted from *String*.  
  
## Example 1

```al
var
    String: Text;
    Where: Text;
    Which: Text;
    NewString: Text;
    Text000: TexConst ENU='Windy West Solutions';
    Text001: TexConst ENU='>%1< is transformed to >%2<';
begin 
    String := Text000;  
    Where := '<>';  
    Which := 'Ws';  
    NewString := DelChr(String, Where, Which);  
    Message(Text001, String,NewString);  
end;
```  
  
 The message window displays the following:  
  
 **>Windy West Solutions\< is transformed to >indy West Solution\<**  
  
 The method deletes every W and s that is either the first or last character in *String*.  
  
## Example 2

```al
var
    String: Text;
    Where: Text;
    Which: Text;
    NewString: Text;
    Text000: TexConst ENU='This is an example';
    Text001: TexConst ENU='>%1< is transformed to >%2<';
begin
    String := Text000;  
    Where := '=';  
    Which := 'sx';  
    NewString := DelChr(String, Where, Which);  
    Message(Text001, String,NewString);  
end;
```  
  
 The message window displays the following:  
  
 **>This is an example\< is transformed to >Thi i an eample\<**  
  
 The method deletes every s and x from *String*.  
  
## Example 3
 
```al
var
    String: Text;
    Where: Text;
    Which: Text;
    NewString: Text;
    Text000: TexConst ENU='This is an example';
    Text001: TexConst ENU='>%1< is transformed to >%2<';
begin
    String := Text000;  
    Where := '>';  
    Which := 'Tely';  
    NewString := DelChr(String, Where, Which);  
    Message(Text001, String,NewString);  
end;
```  
  
 The message window displays the following:  
  
 **>This is an example\< is transformed to >This is an examp\<**  
  
 If T, e, l, or y is the last character in *String*, the method deletes them.  
  
## Example 4

```al
var
    String: Text;
    Where: Text;
    Which: Text;
    NewString: Text;
    Text000: TexConst ENU='This is an example';
    Text001: TexConst ENU='>%1< is transformed to >%2<';
begin 
    String := Text000;  
    Where := '<';  
    Which := 'This ';  
    NewString := DelChr(String, Where, Which);  
    Message(Text001, String,NewString);  
end;
```  
  
 The message window displays the following:  
  
 **>This is an example\< is transformed to >an example\<**  
  
 If T, h, s, i, or space is the first character in *String*, the method deletes them.  
  
## Example 5

```al
var
    String: Text;
    Where: Text;
    Which: Text;
    NewString: Text;
    Text000: TexConst ENU='This is an example';
    Text001: TexConst ENU='>%1< is transformed to >%2<';
begin
    String := Text000;  
    Where := '<';  
    NewString := DelChr(String, Where);  
    Message(Text001, String,NewString);  
end;
```  
  
 The message window displays the following:  
  
 **>     This is an example\< is transformed to >This is an example\<**  
  
 The method removes any spaces from the start of *String*.  
  
## Example 6

```al
var
    String: Text;
    NewString: Text;
    Text000: Label ' Windy West Solutions '; // note that there can be multiple leading and trailing spaces
    Text001: Label '>%1< is transformed to >%2<';
begin
    String := Text000;
    NewString := DelChr(String);
    Message(Text001, String, NewString);
end;
```
The message window displays the following:

**> Windy West Solutions < is transformed to >WindyWestSolutions<**


## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)