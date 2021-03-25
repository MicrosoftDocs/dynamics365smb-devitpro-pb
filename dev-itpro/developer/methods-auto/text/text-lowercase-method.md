---
title: "Text.LowerCase Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# Text.LowerCase Method
> **Version**: _Available or changed with runtime version 1.0._

Converts all letters in a string to lowercase.


## Syntax
```
NewString :=   Text.LowerCase(String: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string that you want to convert to lowercase. Only letters in the range A to Z and, if applicable, special language characters are converted.  


## Return Value
*NewString*
&emsp;Type: [String](../string/string-data-type.md)
The string converted to lowercase.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  

```al
var
    Str: Text[60];
    Lower: Text[60];
    Text000: Label 'The Entries are Sorted by Name.';
    Text001: Label 'The string before LowerCase is:>%1<';
    Text002: Label 'The string after LowerCase is:>%1<';
begin
    Str := Text000;  
    Message(Text001, Str);  
    Lower := LowerCase(Str);  
    Message(Text002, Lower);  
end;
```  
  
 The first message window displays the following:  
  
 **The string before LowerCase is:**  
  
 **>The Entries are Sorted by Name.\<**  
  
 The second message window displays the following:  
  
 **The string after LowerCase is:**  
  
 **>the entries are sorted by name.\<**  
  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)