---
title: "STRSUBSTNO Method (Code, Text)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 11f92b63-3130-468e-94f7-0e34c6a44a0f
caps.latest.revision: 14
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# STRSUBSTNO Method (Code, Text)
Replaces %1, %2, %3... and \#1, \#2, \#3... fields in a string with the values you provide as optional parameters.  
  
## Syntax  
  
```  
  
NewString := STRSUBSTNO(String [,Value1, …])  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or Code  
  
 A string containing '\#' and/or '%' fields.  
  
 The % fields are replaced by the values with their full lengths, and \# fields are replaced by the values that are truncated to the length of the \# field.  
  
 If this parameter is an expression that evaluates to Text or Code that is 512 or more characters, then a run-time error occurs.  
  
 *Value1, …*  
 Type: Any  
  
 One or more values \(expressions\) that you want to insert into *String*. You can specify up to 10 values.  
  
## Property Value/Return Value  
 Type: Text constant or Code  
  
 The resulting string, after the corresponding values have been substituted into the '\#' and '%' fields.  
  
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
  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|Data type|Length|  
|-------------------|---------------|------------|  
|Str|Text|1024|  
|AccountNo|Integer|Not applicable|  
|Balance|Decimal|Not applicable|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The balance of account %1 is $ %2|  
|Text001|The string before STRSUBSTNO has been called:\\%1|  
|Text002|The string after STRSUBSTNO has been called:\\%1|  
  
```  
Str := Text000;  
AccountNo := 3452;   
Balance := 2345 + 5462;  
MESSAGE(Text001, Str);  
Str := STRSUBSTNO(Str, AccountNo, Balance);  
MESSAGE(Text002, Str);  
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
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)