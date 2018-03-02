---
title: "DELSTR Method (Code, Text)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 5313ab16-42ff-4e5f-b76b-0310e04a76b4
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DELSTR Method (Code, Text)
Deletes a substring inside a string \(text or code\).  
  
## Syntax  
  
```  
  
NewString := DELSTR(String, Position[, Length])  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or code  
  
 The input string.  
  
 *Position*  
 Type: Integer  
  
 The position of the first character that you want to delete. *Position* must be greater than zero \(0\).  
  
 If *Position* exceeds the length of *String*, DELSTR returns the original string, unchanged.  
  
 *Length*  
 Type: Integer  
  
 Specifies how many characters to delete. *Length* must be greater than zero \(0\).  
  
## Property Value/Return Value  
 Type: Text constant or code  
  
 The resulting string.  
  
## Remarks  
 If you omit *Length*, all the characters starting with *Position* are deleted until the end of the string.  
  
 If you omit *Length* and *Position* is less than 1, then an error is returned.  
  
 If you omit *Length* and *Position* is greater than the length of *String*, then *String* is returned unchanged.  
  
## Example  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|Str|Text|40|  
|Position|Integer|Not applicable|  
|Length|Integer|Not applicable|  
|NewStr|Text|40|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Adjusting prices - Please wait.|  
|Text001|The original string:>%1\<|  
|Text002|The modified string:>%2\<|  
  
```  
Str := Text000;  
Position := 11; // Remove the word 'prices' and a blank.  
Length := 7;  
NewStr := DELSTR(Str, Position, Length);  
MESSAGE(Text001, Str);  
MESSAGE(Text002, NewStr);  
```  
  
 The first message window displays the following:  
  
 **The original string:**  
  
 **>Adjusting prices - Please wait.\<**  
  
 The second message window displays the following:  
  
 **The modified string:**  
  
 **>Adjusting - Please wait.\<**  
  
## See Also  
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)