---
title: "LENGTH Function (BigText)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8a6b28e2-b69a-4c2d-8d93-a632f064f0a5
caps.latest.revision: 9
---
# LENGTH Function (BigText)
Retrieves the length of a BigText variable.  
  
## Syntax  
  
```  
  
Length := BigText.LENGTH  
```  
  
## Property Value/Return Value  
 Type: Integer  
  
 The length of the BigText variable.  
  
## Remarks  
 To delete the content in a BigText variable use the [CLEAR Function](CLEAR-Function.md). The syntax for the CLEAR function is shown in the following code snippet: `CLEAR(BigText)`.  
  
## Example  
 The following example demonstrates how to retrieve the length of a BigText variable. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyBigText|BigText|  
|VarLength|Integer|  
  
|Text constant name|ENU value|  
|------------------------|---------------|  
|Text000|VarLength = %1|  
  
 In this example, the BigText variable is initialized with the text ‘ABCDEFG’. The length, which is 7, is stored in the VarLength variable and displayed in a message box.  
  
```  
MyBigText.ADDTEXT('ABCDEFG');  
VarLength := MyBigText.LENGTH;  
MESSAGE(Text000, VarLength);  
  
```  
  
## See Also  
 [BigText Data Type](BigText-Data-Type.md)