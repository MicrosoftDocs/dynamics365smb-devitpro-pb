---
title: "Text.StrLen Method"
description: "Gets the length of a string you define."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Text.StrLen Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the length of a string you define.


## Syntax
```AL
Length :=   Text.StrLen(String: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string for which you want to determine the length.  


## Return Value
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The length of the string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The difference between the StrLen method and the [MaxStrLen Method \(Code, Text\)](../text/text-maxstrlen-string-method.md) is that the StrLen returns the actual number of characters in the input string, whereas MaxStrLen returns the maximum defined length of the input string.  
  
 In [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], if you call StrLen on a Variant, then you get an error that the contents of the parameter are not valid. In earlier versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)], if you call StrLen on a Variant, then 0 is returned.  
  
## Example  
 This example shows the difference between the StrLen and the MaxStrLen methods.  
  
```al
var
    City: Text[30];
    MaxLength: Integer;
    Length: Integer;
    Text000: Label 'Atlanta';
    Text001: Label 'The MaxStrLen method returns: %1,\\';
    Text002: Label 'whereas the StrLen method returns: %2';
begin
    City := Text000;  
    MaxLength := MaxStrLen(City);  
    Length := StrLen(City);  
    Message(Text001 + Text002, MaxLength, Length);  
end;
```  
  
 The message window displays the following:  
  
 **The MaxStrLen method returns: 30**  
  
 **whereas the StrLen method returns: 7**  
  
 This shows that the MaxLength method returns the maximum possible length according to the definition of the string variable, whereas StrLen returns the actual length of the text.  
  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)