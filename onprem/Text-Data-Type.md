---
title: Text Data Type
description: The Text data type is a simple type that denotes a text string, it does not enforce a limit on the length of a Text variable. 
ms.custom: na
ms.date: 10/30/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fe8419b7-96a2-486e-858d-51f62c66657f
caps.latest.revision: 16
---
# Text Data Type in Dynamics NAV
This simple data type denotes a text string.  
  
## Remarks  
 [!INCLUDE[navnowlong](includes/navnowlong_md.md)] does not enforce a limit on the length of a Text variable. You can specify a maximum length in the **C/AL Globals** or **C/AL Locals** window when you create the variable, but it is not required. There is no performance impact if you do not specify a length. The maximum length of a Text field in a table is 250 characters. The length of a text variable equals the number of characters in the string. An empty text string has a length of zero \(0\). A text string cannot be null.  
  
 You can index any character position in a text string, for example A\[65\]. The resulting value will be a [Char Data Type](Char-Data-Type.md).  
  
 You cannot assign a char to a position in the code variable greater than the current length of the variable +1. For more information, see [Char Data Type](Char-Data-Type.md).  
  
 The Text data type supports Unicode.  
  
## Example  
 This example shows some typical examples of text strings. In these examples, the text variable has a maximum length of 6.  
  
```  
text := 'ABC';  
// Results in a text variable which contains 'ABC'.  
text := '123456abc';  
// Results in a run-time error because the length (9)  
// exceeds the maximum length of 6.  
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