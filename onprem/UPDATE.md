---
title: "UPDATE"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a8daf814-80c5-4913-8fa2-8c3bd7a108c8
caps.latest.revision: 3
manager: edupont
---
# UPDATE
Saves the current record and then updates the controls in the page. If you set the SaveRecord parameter to false, this function will not save the record before the page is updated.  
  
## Syntax  
  
```vb  
CurrPage.UPDATE[(SaveRecord)]  
```  
  
#### Parameters  
 *SaveRecord*  
 Type: Boolean  
  
 Set this parameter to **true** if you want to save the current record. Set this parameter to **false** if you want to update without saving the current record. The default value is **true**.  
  
## See Also  
 [Page Data Type](Page-Data-Type.md)