---
title: "CLOSE Method (Dialog)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e47e8733-2254-4469-91d9-df6c530c7ce8
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CLOSE Method (Dialog)
Closes a dialog window that has been opened by [OPEN Method \(Dialog\)](devenv-OPEN-Method-Dialog.md).  
  
## Syntax  
  
```  
  
Dialog.CLOSE  
```  
  
#### Parameters  
 *Dialog*  
 Type: Dialog  
  
 The Dialog variable that you are closing.  
  
## Remarks  
 If CLOSE is used on a dialog window that is not open, a run-time error will occur.  
  
 The dialog windows of an object are automatically closed when the object terminates.  
  
## See Also  
 [Dialog Data Type](../datatypes/devenv-Dialog-Data-Type.md)