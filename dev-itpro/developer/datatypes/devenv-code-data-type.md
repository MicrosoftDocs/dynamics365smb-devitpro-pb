---
title: "Code Data Type"
ms.custom: na
ms.date: 06/30/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 5f0c3922-cf78-49a1-9143-466bffa29ab3
caps.latest.revision: 21
author: SusanneWindfeldPedersen
---
# Code Data Type
This simple data type denotes a special type of string that is converted to uppercase and removes any trailing or leading spaces.  
  
## Remarks  
 The length of a Code variable equals the number of characters in the text without leading or trailing spaces.  
  
 You must specify the length of a Code variable or field. The maximum length of a Code variable is 1024 characters. The maximum length of a Code field in a table is 250 characters.  
  
 A Code variable cannot be null.  
  
 The Code data type supports Unicode.  
  
 You can index any character position in a string, such as A[65]. The resulting value will be a [Char Data Type](devenv-char-data-type.md).  
  
 Fields that contain a date formula must not have data type Code. Instead, use the [DateFormula Data Type](devenv-date-formula-data-type.md). All fields that contain a date formula with data type Code must be converted into data type DateFormula.  
  
 You cannot assign a char to a position in the code variable greater than the current length of the variable +1. For more information, see [Char Data Type](devenv-char-data-type.md).  
  
## Methods
The methods supported for the Code data type are:

[CONVERTSTR method (Code, Text)](../methods/devenv-convertstr-method-code-text.md)   
[COPYSTR method (Code, Text)](../methods/devenv-copystr-method-code-text.md)   
[DELCHR method (Code, Text)](../methods/devenv-delchr-method-code-text.md)   
[DELSTR method (Code, Text)](../methods/devenv-delstr-method-code-text.md)   
[FORMAT method (Code, Text)](../methods/devenv-format-method-code-text.md)   
[INCSTR method (Code, Text)](../methods/devenv-incstr-method-code-text.md)   
[INSSTR method (Code, Text)](../methods/devenv-insstr-method-code-text.md)   
[LOWERCASE method (Code, Text)](../methods/devenv-lowercase-method-code-text.md)   
[MAXSTRLEN method (Code, Text)](../methods/devenv-maxstrlen-method-code-text.md)   
[PADSTR method (Code, Text)](../methods/devenv-padstr-method-code-text.md)   
[SELECTSTR method (Code, Text)](../methods/devenv-selectstr-method-code-text.md)   
[STRCHECKSUM method (Code, Text)](../methods/devenv-strchecksum-method-code-text.md)   
[STRLEN method (Code, Text)](../methods/devenv-strlen-method-code-text.md)   
[STRPOS method (Code, Text)](../methods/devenv-strpos-method-code-text.md)   
[STRSUBSTNO method (Code, Text)](../methods/devenv-strsubstno-method-code-text.md)   
[UPPERCASE method (Code, Text)](../methods/devenv-uppercase-method-code-text.md)

## Example  
 This example shows some typical examples of code string assignments. In these examples, assume that the variable c is a code variable with a maximum length of 4.  
  
```  
c := 'ABC';   
// Results in variable c, which contains 'ABC'   
// and is 3 characters in length.  
c := '1';  
// Results in variable c, which contains '1'   
// and is 1 character in length.  
c := '';  
// Results in variable c, which contains '' (empty string)  
// and is zero (0) characters in length.  
c := ' 2 ';  
// Results in variable c, which contains '2'  
// and is 1 character in length.  
```  
  
## See Also  
[AL Data Types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  