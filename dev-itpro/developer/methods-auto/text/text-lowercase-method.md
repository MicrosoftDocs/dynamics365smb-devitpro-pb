---
title: "Text.LowerCase(Text) Method"
description: "Converts all letters in a string to lowercase."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text.LowerCase(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Converts all letters in a string to lowercase.


## Syntax
```AL
NewString :=   Text.LowerCase(String: Text)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [Text](text-data-type.md)  
The string that you want to convert to lowercase. Only letters in the range A to Z and, if applicable, special language characters are converted.  


## Return Value
*NewString*  
&emsp;Type: [Text](text-data-type.md)  
The string converted to lowercase.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Because the Text.LowerCase method is culture-variant, its behavior may vary across different locales. For example, certain characters in languages such as Turkish or Greek may be transformed differently based on regional linguistic rules.
For culture-invariant method check [Text.ToLower()](./text-tolower-method.md)

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
  
## Related information
[Text Data Type](text-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
