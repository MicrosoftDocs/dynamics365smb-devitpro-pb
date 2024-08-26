---
title: "Text.UpperCase(Text) Method"
description: "Converts all letters in a string to uppercase."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text.UpperCase(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Converts all letters in a string to uppercase.


## Syntax
```AL
NewString :=   Text.UpperCase(String: Text)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [Text](text-data-type.md)  
The string that you want to convert to uppercase.  


## Return Value
*NewString*  
&emsp;Type: [Text](text-data-type.md)  
The string converted to uppercase.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example shows how to use the **UpperCase** method.  
  
```al
var
    Text000: Label 'Outstanding Order Status';  
    Text001: Label 'The test string before UpperCase is called:\\%1';  
    Text002: Label 'The string after UpperCase is called:\\%1';  
begin
    Lower := Text000;  
    Message(Text001, Lower);  
    Upper := UpperCase(Lower);  
    Message(Text002, Upper);  
end;
```  
  
 The first message window displays the following:  
  
 **The test-string before UpperCase is called:**  
  
 **Outstanding Order Status**  
  
 The second message window displays the following:  
  
 **The string after UpperCase is called:**  
  
 **OUTSTANDING ORDER STATUS**  

## See Also
[Text Data Type](text-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)