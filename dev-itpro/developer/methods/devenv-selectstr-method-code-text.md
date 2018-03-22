---
title: "SELECTSTR Method (Code, Text)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: b665d6a5-c639-4483-8217-290600d3aa46
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SELECTSTR Method (Code, Text)
Retrieves a substring from a comma-separated string.  
  
## Syntax  
  
```  
  
NewString := SELECTSTR(Number, CommaString)  
```  
  
#### Parameters  
 *Number*  
 Type: Integer  
  
 Specifies which substring to retrieve. The substrings in the comma-separated string are numbered 1, 2, 3, and so on.  
  
 If *Number* is greater than the actual number of substrings, then a run-time error occurs.  
  
 *CommaString*  
 Type: Option  
  
 A string that contains substrings separated by commas. The maximum length of this string is 391 characters.  
  
## Property Value/Return Value  
 Type: Option  
  
 The substring that is retrieved from *CommaString*.  
  
## Remarks  
 SELECTSTR treats string values as OPTIONS. This means that identical values in different strings are not allowed.  
  
 Any trailing commas are removed before the operation starts.  
  
 If *Number* is less than 1 or greater than the number of real values \(excluding trailing commas\) in the string, then an error is returned.  
  
 Quotes are not supported. For example, a,b,"c,d",e is treated as a five-element substring where substring 4 is d".  
  
## Example  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|CommaStr|Text|60|  
|CommaStr2|Text|60|  
|SubStr1|Text|60|  
|SubStr2|Text|60|  
|SubStr3|Text|60|  
|SubStr4|Text|60|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|This,is a comma,separated,string|  
|Text001|The calls to SELECTSTR return:\\|  
|Text002|11,22,33,,55,,,|  
  
```  
CommaStr := Text000;  
CommaStr2 := Text002;  
SubStr1 := SELECTSTR(2, CommaStr); // Pick out the 2nd substring.  
SubStr2 := SELECTSTR(4, CommaStr); // Pick out the 4th substring.  
SubStr3 := SELECTSTR(1, CommaStr2);  
SubStr4 := SELECTSTR(3, CommaStr2);  
MESSAGE(Text001 + '>%1<\' + '>%2<\' + '>%3<\' + '>%4<\', SubStr1, SubStr2, SubStr3, SubStr4);  
```  
  
 The message window displays the following text:  
  
 **The calls to SELECTSTR return:**  
  
 **>is a comma\<**  
  
 **>string\<**  
  
 **>11\<**  
  
 **>33\<**  
  
## Example  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|CommaStr2|Text|60|  
|SubStr5|Text|60|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text002|11,22,33,,55,,,|  
  
```  
CommaStr2 := Text002;  
SubStr5 := SELECTSTR(6,CommaStr2);  
MESSAGE('>%1<\', SubStr5);  
```  
  
 This example returns an error.  
  
## See Also  
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)