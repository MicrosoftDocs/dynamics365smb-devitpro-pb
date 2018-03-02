---
title: Code Data Type
description: Code data type is a simple data type denotes a special type of string that is converted to uppercase and removes any trailing or leading spaces.
ms.custom: na
ms.date: 10/26/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5f0c3922-cf78-49a1-9143-466bffa29ab3
caps.latest.revision: 21
manager: edupont
---
# Code Data Type in Dynamics NAV
This simple data type denotes a special type of string that is converted to uppercase and removes any trailing or leading spaces.  
  
## Remarks  
 The length of a Code variable equals the number of characters in the text without leading or trailing spaces.  
  
 You must specify the length of a Code variable or field. The maximum length of a Code variable is 1024 characters. The maximum length of a Code field in a table is 250 characters.  
  
 A Code variable cannot be null.  
  
 The Code data type supports Unicode.  
  
 You can index any character position in a string, such as A\[65\]. The resulting value will be a [Char Data Type](Char-Data-Type.md).  
  
 Fields that contain a date formula must not have data type Code. Instead, use the [DateFormula Data Type](DateFormula-Data-Type.md). All fields that contain a date formula with data type Code must be converted into data type DateFormula.  
  
 You cannot assign a char to a position in the code variable greater than the current length of the variable +1. For more information, see [Char Data Type](Char-Data-Type.md).  
  
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
 [CONVERTSTR Function \(Code, Text\)](CONVERTSTR-Function--Code--Text-.md)   
 [COPYSTR Function \(Code, Text\)](COPYSTR-Function--Code--Text-.md)   
 [DELCHR Function \(Code, Text\)](DELCHR-Function--Code--Text-.md)   
 [DELSTR Function \(Code, Text\)](DELSTR-Function--Code--Text-.md)   
 [FORMAT Function \(Code, Text\)](FORMAT-Function--Code--Text-.md)   
 [INCSTR Function \(Code, Text\)](INCSTR-Function--Code--Text-.md)   
 [INSSTR Function \(Code, Text\)](INSSTR-Function--Code--Text-.md)   
 [LOWERCASE Function \(Code, Text\)](LOWERCASE-Function--Code--Text-.md)   
 [MAXSTRLEN Function \(Code, Text\)](MAXSTRLEN-Function--Code--Text-.md)   
 [PADSTR Function \(Code, Text\)](PADSTR-Function--Code--Text-.md)   
 [SELECTSTR Function \(Code, Text\)](SELECTSTR-Function--Code--Text-.md)   
 [STRCHECKSUM Function \(Code, Text\)](STRCHECKSUM-Function--Code--Text-.md)   
 [STRLEN Function \(Code, Text\)](STRLEN-Function--Code--Text-.md)   
 [STRPOS Function \(Code, Text\)](STRPOS-Function--Code--Text-.md)   
 [STRSUBSTNO Function \(Code, Text\)](STRSUBSTNO-Function--Code--Text-.md)   
 [UPPERCASE Function \(Code, Text\)](UPPERCASE-Function--Code--Text-.md)