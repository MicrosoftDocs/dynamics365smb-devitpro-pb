---
title: "Byte Data Type"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 66cf2909-97b3-4cf5-a3c9-8b8c55db553d
caps.latest.revision: 3
author: SusanneWindfeldPedersen
---
# Byte Data Type
Use this simple data type to store a single, 8-bit character as a value in the range 0 to 255. You can easily convert this data type from a number to a character and vice versa. This means you can use mathematical operators on Byte variables.  
  
## Example  
 The following example assumes that you have a Byte variable named B and a Text variable named S.  
  
 You can assign a constant string of the length 1 to a Byte variable, as shown in the first line of the following code example.  
  
 You can assign a single character in a Text or Code variable to a Byte variable, as shown in the second line of the following code example.  
  
 You can assign a numeric value to a Byte variable, as shown in the third line of the following code example. This causes the Byte variable to contain the character from the ASCII character set that corresponds to the numeric ASCII code.  
  
```  
B := 'A';  
B := S[2];  
B := 65;  
```  
  
 You cannot assign a character to a position greater than the position of the null terminator. For example, if the value of the text variable *MyText* is 'abc', then the null terminator is at position 4 and the following assignment causes a run-time error to occur.  
  
```  
MyText[5] := 'e';  
```  
  
## See Also  
[AL Data Types](devenv-al-data-types.md)  
[Text Data Type](devenv-text-data-type.md)   
[Code Data Type](devenv-code-data-type.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  