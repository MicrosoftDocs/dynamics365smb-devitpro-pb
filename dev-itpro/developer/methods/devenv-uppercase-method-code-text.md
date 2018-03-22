---
title: "UPPERCASE Method (Code, Text)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c701f575-b29f-4683-ba54-622ab2c7c34d
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# UPPERCASE Method (Code, Text)
Converts all letters in a string to uppercase.  
  
## Syntax  
  
```  
  
NewString := UPPERCASE(String)  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or code  
  
 The string that you want to convert to uppercase.  
  
## Property Value/Return Value  
 Type: Text constant or code  
  
 The resulting string after it has been converted to uppercase.  
  
## Example  
 The following example shows how to use the **UPPERCASE** method.  
  
 This example requires that you create the following text constants.  
  
|Text constant|ConstValue|  
|-------------------|----------------|  
|Text000|Outstanding Order Status|  
|Text001|The test string before UPPERCASE is called:\\%1|  
|Text002|The string after UPPERCASE is called:\\%1|  
  
```  
Lower := Text000;  
MESSAGE(Text001, Lower);  
Upper := UPPERCASE(Lower);  
MESSAGE(Text002, Upper);  
```  
  
 The first message window displays the following:  
  
 **The test-string before UPPERCASE is called:**  
  
 **Outstanding Order Status**  
  
 The second message window displays the following:  
  
 **The string after UPPERCASE is called:**  
  
 **OUTSTANDING ORDER STATUS**  
  
## See Also  
 [Code Data Type](../datatypes/devenv-Code-Data-Type.md)   
 [Text Data Type](../datatypes/devenv-Text-Data-Type.md)