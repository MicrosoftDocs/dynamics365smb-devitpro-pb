---
title: "Text.MaxStrLen Method"
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
# Text.MaxStrLen Method
> **Version**: _Available from runtime version 1.0._

Gets the maximum defined length of a string variable.


## Syntax
```
MaxLength :=   Text.MaxStrLen(String: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string variable for which you want to find the maximum length.  


## Return Value
*MaxLength*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The maximum length of the string variable.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If you call this method on a Variant, it returns an error.  
  
## Example

```al
var
    City: Text[30];
    MaxLength: Integer;
    Length: Integer;
    Text000: Label 'Vedbaek';
    Text001: Label 'The MaxStrLen method returns %1,\\';
    Text002: Label 'whereas the StrLen method returns %2';
begin
    City := Text000;  
    MaxLength := MaxStrLen(City);  
    Length := StrLen(City);  
    Message(Text001 + Text002, MaxLength, Length);  
end;
```  
  
 The message window displays the following:  
  
 **The MaxStrLen method returns 30,**  
  
 **whereas the StrLen method returns 7.**  
  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)