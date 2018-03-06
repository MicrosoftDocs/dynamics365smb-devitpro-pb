---
title: "STRPOS Function (Code, Text)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7b3d6ca1-da1e-4ea2-88b4-e982da6ab12d
caps.latest.revision: 7
manager: edupont
---
# STRPOS Function (Code, Text)
Searches for the first occurrence of substring inside a string.  
  
## Syntax  
  
```  
  
Position := STRPOS(String, SubString)  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or code  
  
 The string in which you want to search.  
  
 *SubString*  
 Type: Text constant or code  
  
 The substring for which you want to search.  
  
 The STRPOS function is case-sensitive.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The position of *SubString* in *String*.  
  
## Remarks  
 The STRPOS function returns the position of the first occurrence of the substring.  
  
 If *SubString* cannot be found, then the function returns zero.  
  
 If *String* or *SubString* is empty, then the function returns zero.  
  
## Example  
 This example shows how to use the STRPOS function.  
  
 This example requires that you create the following text constants in the **C/AL Globals** window.  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|'ABC abc abc xy'|  
|Text001|'abc'|  
|Text002|'The search for the substring: >%1\<\\'|  
|Text003|'in the string: >%2\<,\\'|  
|Text004|'returns the position: %3'|  
  
```  
String := Text000;  
SubStr := Text001  
Pos := STRPOS(String, SubStr);  
MESSAGE(Text002 + Text003 + Text004, SubStr, String, Pos);  
// The STRPOS function is case-sensitive. Furthermore, it only  
// returns the position of the 1st occurrence of the substring.  
```  
  
 The message window displays the following:  
  
 **The search for the substring: >abc\<**  
  
 **in the string: >ABC abc abc xy\<**  
  
 **returns the position: 5**  
  
## Example  
  
```  
Pos1 := StrPos("abc",""); // Returns 0.  
Pos2 := StrPos("abc","c"); // Returns 3.  
Pos3 := StrPos("abc","bc"); // Returns 2.  
Pos4 := StrPos("abc","x"); // Returns 0.  
```  
  
## See Also  
 [Code Data Type](Code-Data-Type.md)   
 [Text Data Type](Text-Data-Type.md)