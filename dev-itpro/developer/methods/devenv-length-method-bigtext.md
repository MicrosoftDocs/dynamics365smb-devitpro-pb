---
title: "LENGTH Method (BigText)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8a6b28e2-b69a-4c2d-8d93-a632f064f0a5
caps.latest.revision: 9
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# LENGTH Method (BigText)
Retrieves the length of a BigText variable.  
  
## Syntax  
  
```  
  
Length := BigText.LENGTH  
```  
  
## Property Value/Return Value  
 Type: Integer  
  
 The length of the BigText variable.  
  
## Remarks  
 To delete the content in a BigText variable use the [CLEAR Method](devenv-CLEAR-Method.md). The syntax for the CLEAR method is shown in the following code snippet: `CLEAR(BigText)`.  
  
## Example  
 The following example demonstrates how to retrieve the length of a BigText variable. This example requires that you create the following global variables and text constant.  
  
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
 [BigText Data Type](../datatypes/devenv-BigText-Data-Type.md)