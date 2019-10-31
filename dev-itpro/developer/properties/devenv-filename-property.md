---
title: "FileName Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 3e0784ae-24f0-406b-814c-07e2d16839d8
caps.latest.revision: 12
author: SusanneWindfeldPedersen
---

# FileName Property
Sets the name of the external file to read data from or write data to an XMLport.  
  
## Applies To  
  
-   XMLports  

## Syntax
```
FileName = 'File.txt';
```
 
## Remarks  
 The **FileName** property must be set to a valid file name or a run-time error occurs.  
  
 This property can be set dynamically by using the [FILENAME Method (XMLport)](../methods-auto/xmlport/xmlportinstance-filename-method.md). Using this method together with the Import method, you can create XMLports that are dynamic. This means that they can determine whether data is input or output at run time, and the name of the external file to read from or write to can also be set at run time.  
  
 If **FileName** is blank, then a default request options page tab will be created, where this property can be set at run time. If no name is specified or the [UseRequestPage Property](devenv-userequestpage-property.md) is set to **false**, then a run-time error occurs.  
  
## See Also  
 [IMPORT Method (XMLport)](../methods-auto/xmlport/xmlportinstance-import-method.md)   
 [FILENAME Method (XMLport)](../methods-auto/xmlport/xmlportinstance-filename-method.md)   
 [UseRequestPage Property](devenv-userequestpage-property.md)
