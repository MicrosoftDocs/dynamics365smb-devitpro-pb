---
title: "FileName Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3e0784ae-24f0-406b-814c-07e2d16839d8
caps.latest.revision: 12
---
# FileName Property
Sets the name of the external file to read data from or write data to an XMLport.  
  
## Applies To  
  
-   XMLports  
  
## Remarks  
 The **FileName** property must be set to a valid file name or a run-time error occurs.  
  
 This property can be set dynamically by using the [FILENAME Function \(XMLport\)](FILENAME-Function--XMLport-.md). Using this function together with the Import function, you can create XMLports that are dynamic. This means that they can determine whether data is input or output at run time, and the name of the external file to read from or write to can also be set at run time.  
  
 If **FileName** is blank, then a default request options page tab will be created, where this property can be set at run time. If no name is specified or the [UseRequestPage Property](UseRequestPage-Property.md) is set to **No**, then a run-time error occurs.  
  
## See Also  
 [IMPORT Function \(XMLport\)](IMPORT-Function--XMLport-.md)   
 [FILENAME Function \(XMLport\)](FILENAME-Function--XMLport-.md)   
 [UseRequestPage Property](UseRequestPage-Property.md)