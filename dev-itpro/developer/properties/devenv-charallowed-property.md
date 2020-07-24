---
title: "CharAllowed Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 0159477c-28e5-4a3c-b6fd-615f7524b495
caps.latest.revision: 11
author: SusanneWindfeldPedersen
---

 

# CharAllowed Property
Sets the range of characters the user can enter into this field or control.  
  
## Applies to  
  
-   Page Fields  
  
-   Table Fields  

## Syntax
```
CharAllowed = 'AZ';
```
  
## Remarks  
 If you want users to only enter uppercase letters in this field, enter **AZ**. This ensures that only uppercase characters in the range of A-Z are accepted. If you want both uppercase and lowercase characters, leave this value blank.  
  
 You can specify multiple ranges of characters by entering the parameters in pairs. For example, a value of **admpzz** indicates that only the following characters are accepted: a, b, c, d, m, n, o, p, and z. If you only want to allow a single character, then enter that character twice to specify a starting and ending range.  
  
 The setting for the field is checked during validation. Validation occurs only if the field or control value is updated through the UI, for example, if a value is updated on a page or if a field is updated in a table directly. If a field is updated through application code, then the **CharAllowed** property is not validated.  
  
## See Also  
 [Properties](devenv-properties.md)