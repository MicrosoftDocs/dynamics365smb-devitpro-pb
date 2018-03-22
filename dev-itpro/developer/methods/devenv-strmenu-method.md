---
title: "STRMENU Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f1d1b82e-058f-4462-a7ff-0686a3464b23
caps.latest.revision: 7
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# STRMENU Method
STRMENU creates and displays a dialog box with an option group and returns the selection that the user makes.  
  
 STRMENU has the following syntax.  
  
```  
OptionNumber := Dialog.STRMENU(OptionString [, DefaultNumber]);  
```  
  
 *OptionNumber* is the number of the option that the user chooses. The first option in *OptionString* is number 1. If the user closes the dialog box with ESC, then STRMENU returns 0 \(zero\). If it is defined, then *DefaultNumber* is used to select the default option. If *DefaultNumber* is not defined, then option number 1 is used as the default.  
  
## Example  
 The following example creates a window with the following options:  
  
-   Save  
  
-   Close  
  
-   Cancel  
  
 The window also has an **OK** button and a **Cancel** button.  
  
 This example requires that you create the following variable.  
  
|Variable|Data type|  
|--------------|---------------|  
|Selection|Integer|  
  
```  
Selection := Dialog.STRMENU('Save,Close,Cancel',3);  
```  
  
 In this example, the Cancel option is the default because the *DefaultNumber* parameter was set to 3. We recommend that you set the default to a harmless action, such as cancel, because this option can be selected by pressing Enter. If the user accidentally presses Enter, nothing catastrophic occurs, as might be the case if the default option was "Delete all."  
  
## See Also  
 [STRMENU Method \(Dialog\)](devenv-STRMENU-Method-Dialog.md)   
 [Progress Windows, MESSAGE, ERROR, and CONFIRM Methods](../devenv-progress-windows-message-error-and-confirm-methods.md)