---
title: "CharAllowed Property"
ms.author: solsen
ms.custom: na
ms.date: 11/17/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CharAllowed Property
> **Version**: _Available from runtime version 1.0._

Sets the range of characters the user can enter into this field or control.

## Applies to
-   Table Field
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Syntax
```AL
CharAllowed = 'AZ';
```
  
## Remarks  

If you want users to only enter uppercase letters in this field, enter **AZ**. This ensures that only uppercase characters in the range of A-Z are accepted. If you want both uppercase and lowercase characters, leave this value blank.  
  
You can specify multiple ranges of characters by entering the parameters in pairs. For example, a value of **admpzz** indicates that only the following characters are accepted: a, b, c, d, m, n, o, p, and z. If you only want to allow a single character, then enter that character twice to specify a starting and ending range.  
  
The setting for the field is checked during validation. Validation occurs only if the field or control value is updated through the UI, for example, if a value is updated on a page or if a field is updated in a table directly. If a field is updated through application code, then the **CharAllowed** property is not validated.  
  
## See Also  

[Properties](devenv-properties.md)