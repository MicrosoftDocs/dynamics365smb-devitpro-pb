---
title: "NotBlank Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c33fa0c5-761f-4aba-a0af-00b2145c9be7
caps.latest.revision: 17
author: SusanneWindfeldPedersen
---

 

# NotBlank Property
Sets a value that specifies whether users must enter a value in the selected field or text box.  
  
## Applies to  
  
-   Table Fields  
  
-   Page Fields  

## Syntax
```
NotBlank = true;
```
  
## Remarks  
 You can use this property together with the [InitValue Property](devenv-initvalue-property.md) to make sure that an entry is made in this field. This setting is evaluated for controls and fields during validation. Validation occurs only if the field or control value is updated through the UI, for example, if a value is updated on a page or if a field is updated in a table directly. If a field is updated through application code, then the **NotBlank** property is not validated.  
  
 You can set the **NotBlank** property to **true** on primary fields in a table. Setting the **NotBlank** property to **true** on other fields in a table does not cause a red star marking on the UI.  
  
 If the **NotBlank** property is used on other fields than primary fields, the behavior is as follows:  
  
-   If the field is blank, and never entered, the page can be closed.  
  
-   If the field has been entered, and the user tries to enter a blank value, a validation error occurs.  
  
## See Also  
 [MinValue Property](devenv-minvalue-property.md)   
 [MaxValue Property](devenv-maxvalue-property.md)   
 [Numeric Property](devenv-numeric-property.md)
 [Properties](devenv-properties.md)