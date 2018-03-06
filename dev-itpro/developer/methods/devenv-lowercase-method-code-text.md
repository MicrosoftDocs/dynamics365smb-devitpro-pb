---
title: "LOWERCASE Method (Code, Text)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 0562ef74-b416-4800-86d0-712c18a0b1a2
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# LOWERCASE Method (Code, Text)
Converts all letters in a string to lowercase.  
  
## Syntax  
  
```  
  
NewString := LOWERCASE(String)  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or code  
  
 The string that you want to convert to lowercase. Only letters in the range A to Z and, if applicable, special language characters are converted.  
  
## Property Value/Return Value  
 Type: Text constant or code  
  
 The resulting string after it has been converted to lowercase.  
  
## Example  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|Str|Text|60|  
|Lower|Text|60|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The Entries are Sorted by Name.|  
|Text001|The string before LOWERCASE is:>%1\<|  
|Text002|The string after LOWERCASE is:>%1\<|  
  
```  
Str := Text000;  
MESSAGE(Text001, Str);  
Lower := LOWERCASE(Str);  
MESSAGE(Text002, Lower);  
```  
  
 The first message window displays the following:  
  
 **The string before LOWERCASE is:**  
  
 **>The Entries are Sorted by Name.\<**  
  
 The second message window displays the following:  
  
 **The string after LOWERCASE is:**  
  
 **>the entries are sorted by name.\<**  
  
## See Also  
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)