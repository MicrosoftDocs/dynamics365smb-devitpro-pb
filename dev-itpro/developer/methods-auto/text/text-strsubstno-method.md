---
title: "Text.StrSubstNo Method"
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
# Text.StrSubstNo Method
> **Version**: _Available from runtime version 1.0._

Replaces %1, %2, %3... and #1, #2, #3... fields in a string with the values you provide as optional parameters.


## Syntax
```
NewString :=   Text.StrSubstNo(String: String [, Value1: Any,...])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
A string containing '#' and/or '%' fields.
        
*Value1*  
&emsp;Type: [Any](../any/any-data-type.md)  
One or more values (expressions) that you want to insert into String. You can specify up to 10 values.  


## Return Value
*NewString*
&emsp;Type: [String](../string/string-data-type.md)
Returns a new string with the provided values inserted into the specified string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method replaces the numbered specifiers in a string with a string representation of the equivalent numbered value.  
  
 The specifiers in the string can be either %*n* or \#\#\#\#\#\#\#*n*, where *n* represents a 1-based number. When you use the \# specifier, the number can be anywhere in the specifier. For example, \#\#\#2\#\#\#\# is allowed.  
  
 The %*n* specifier is replaced with the string representation of the value with their full lengths.  
  
 The \#\#*n* specifier is replaced with the same number of characters as the length of the specifier \(including the number\). The values are truncated to the length of the \# field.  
  
 If the string representation is shorter than the length of the specifier, then it is left aligned.  
  
 For example, `StrSubstNo('Test %1 >#2##< >#3<', 1,2,3)` returns "Test 1 >2   \< >3 \<".  
  
 In this example, the following substitutions are made:  
  
-   %1 is replaced by '1' because a % field is replaced by the specified value in its full length.  
  
-   '\#2\#\#' is replaced by '2 space space space' because the value is shorter than the field and therefore, the 2 is left aligned and the field is four characters long.  
  
-   \#3 is replaced by '3 space' because the 3 is left aligned and the field is two characters long  
  
 If the string is longer, then asterisks are inserted to indicate overflow.  
  
 For example, `StrSubstNo('Test %1 >###2< >#3<', 'Thomas','Thomas',0)` returns "Test Thomas >\*\*\*\*\< >0 \<".  
  
 In this example the following substitutions are made:  
  
-   %1 is replaced by 'Thomas' because a %1 field is replaced by the specified value in its full length.  
  
-   '\#\#\#2' is replaced by '\*\*\*\*' because the string 'Thomas' is longer than the \#\#\#2 field. Each character in the field is replaced by an asterisk.  
  
-   \#3 is replaced by '0 space' because the 0 is left aligned and the field is two characters long.  
  
 You can have several references to the same value.  
  
 For example, `StrSubstNo('Test %1 %3 %1', 555, 666, 777)` returns "Test 555 777 555".  
  
 If one of the values is null, then it is treated as an empty string.  
  
 <!--Links For more information about the STRSUBSTNO method in a multilanguage-enabled application, see [Developing Multilanguage-Enabled Applications](Developing-Multilanguage-Enabled-Applications.md).-->  
  
## Example  
 The following example shows how to use the STRSUBSTNO method.  
  
```  
var
    Str: Text[1024];
    AccountNo: Integer;
    Balance: Decimal;
    Text000: Label 'The balance of account %1 is $ %2';  
    Text001: Label 'The test string before STRSUBSTNO is called:\\%1';  
    Text002: Label 'The string after STRSUBSTNO is called:\\%1';  
begin
    Str := Text000;  
    AccountNo := 3452;   
    Balance := 2345 + 5462;  
    MESSAGE(Text001, Str);  
    Str := STRSUBSTNO(Str, AccountNo, Balance);  
    MESSAGE(Text002, Str);  
end;
```  
  
 The first message window displays the following text:  
  
 **The string before STRSUBSTNO has been called:**  
  
 **The balance of account %1 is $ %2**  
  
 The second message window displays the following text:  
  
 **The string after STRSUBSTNO has been called:**  
  
 **The balance of account 3452 is $ 7,807**  
  
> [!NOTE]  
>  This example is run on a computer that has the regional format set to English \(United States\).  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)