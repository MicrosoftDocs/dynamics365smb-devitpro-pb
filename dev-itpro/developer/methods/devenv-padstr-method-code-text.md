---
title: "PADSTR Method (Code, Text)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 08467a3c-872d-4b3d-9470-2bda101e8b56
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# PADSTR Method (Code, Text)
Changes the length of a string to a length that you define.  
  
## Syntax  
  
```  
  
NewString := PADSTR(String, Length[, FillCharacter])  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or code  
  
 The string that you want to increase or decrease.  
  
 *Length*  
 Type: Integer  
  
 The new length of the output string.  
  
 If *Length* is less than the length of *String*, then *String* is truncated. Otherwise *String* is expanded with filler characters.  
  
 If *Length* is less than 0, then an error is returned.  
  
 *FillCharacter*  
 Type: Text constant or code  
  
 This is a string of length 1. This character is used to fill empty spaces at the end of the output string. If not specified, spaces are used as default. If the length of *FillCharacter* is not 1, an error is returned.  
  
## Property Value/Return Value  
 Type: Text constant or code  
  
 The output string. The length of the return value is *Length* characters. If the maximum \(defined\) length of *NewString* is less than *Length*, a run-time error occurs.  
  
## Remarks  
 If you omit *FillCharacter* and *String* is shorter than *Length*, then spaces are added at the end of *String* to match *Length*.  
  
 If you omit *FillCharacter* and *String* is longer than *Length*, then *String* is truncated.  
  
## Example  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|Str1|Text|30|  
|Str2|Text|30|  
|Len1|Integer|Not applicable|  
|Len2|Integer|Not applicable|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|13 characters|  
|Text001|Four|  
|Text002|Before PADSTR is called:\\|  
|Text003|>%1\< has the length %2\\|  
|Text004|>%3\< has the length %4\\|  
|Text005|After PADSTR is called:\\|  
  
```  
Str1 := Text000;  
Str2 := Text001;  
Len1 := STRLEN(Str1);  
Len2 := STRLEN(Str2);  
MESSAGE(Text002 + Text003 + Text004, Str1, Len1, Str2, Len2);  
Str1 := PADSTR(Str1, 5); // Truncate the length to 5  
Str2 := PADSTR(Str2, 15, 'w'); // Concatenate w until length = 15  
Len1 := STRLEN(Str1);  
Len2 := STRLEN(Str2);  
MESSAGE(Text005 + Text003 + Text004, Str1, Len1, Str2, Len2);  
```  
  
 The first message window displays the following:  
  
 **Before PADSTR is called:**  
  
 **>13 characters\< has the length 13**  
  
 **>Four\< has the length 4**  
  
 The second message window displays the following:  
  
 **After PADSTR is called:**  
  
 **>13 ch\< has the length 5**  
  
 **>Fourwwwwwwwwwww\< has the length 15**  
  
## See Also  
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)