---
title: "COPYSTR Method (Code, Text)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e749fda4-e8fc-4b26-b7ad-13ccfd24bdd4
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COPYSTR Method (Code, Text)
Copies a substring of any length from a specific position in a string \(text or code\) to a new string.  
  
## Syntax  
  
```  
  
NewString := COPYSTR(String, Position[, Length])  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or code  
  
 The string that you want to copy from.  
  
 *Position*  
 Type: Integer  
  
 The position of the first character to copy. If the value of *Position* is less than 1, then the COPYSTR method returns an error. If *Position* is greater than the length of the string, then the COPYSTR method returns an empty string.  
  
 *Length*  
 Type: Integer  
  
 The number of characters to copy. If the value of *Length* is less than 0, then the COPYSTR method returns an error. If the value of *Length* causes *Position* + *Length* to be > \(total length of the string\), then the result includes all the characters from *Position* to the end of the string. If you omit *Length*, then the resulting string includes all the characters from *Position* to the end of the string.  
  
## Property Value/Return Value  
 Type: Text constant or code  
  
 The resulting string or substring.  
  
## Remarks  
 If *Position* combined with *Length* exceeds the length of the string, all the characters from *Position* to the end of the string are returned.  
  
## Example  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|Str|Text|30|  
|Position|Integer|Not applicable|  
|Length|Integer|Not applicable|  
|NewStr|Text|30|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Using the COPYSTR method|  
|Text001|The original string is:>%1\<|  
|Text002|The copied string is:>%1\<|  
  
```  
Str := Text000;  
Position := 7;  
Length := 8;  
MESSAGE(Text001, Str);  
NewStr := COPYSTR(Str, Position, Length);  
MESSAGE(Text002, NewStr);  
```  
  
 The first message window shows the original string:  
  
 **The original string is:**  
  
 **>Using the COPYSTR method\<**  
  
 The second message window shows the copied string:  
  
 **The copied string is:**  
  
 **>the COPY\<**  
  
## See Also  
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)