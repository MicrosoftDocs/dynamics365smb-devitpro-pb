---
title: "Option Data Type"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 4ce38f7b-bae2-427d-9db8-3e5014a48c6a
caps.latest.revision: 11
author: SusanneWindfeldPedersen
---
# Option Data Type
This simple data type denotes an option value.  
  
## Remarks  
 In the [OptionString Property](../properties/devenv-optionstring-property.md) of the field or variable, you can enter the option values as a comma-separated list. The Option type is a zero-based enumerator type, which means that the option values are assigned to sequential numbers, starting with 0. You can convert option data types to integers.  
 <!-- 
 For more information about option variables in multilanguage-enabled applications, see [Developing Multilanguage-Enabled Applications](../../dynamics-nav/Developing-Multilanguage-Enabled-Applications.md).  
 --> 
## Example  
 In the Purchase Header table, the Status field is an Option data type. In the following example, the option value is converted into an integer. This example requires that you create the following variables.  
  
|Name|Data type|Subtype|  
|----------|---------------|-------------|  
|Number|Integer|Not applicable|  
|PurchHeaderRec|Record|Purchase Header|  
  
```  
Number := PurchHeaderRec."Document Type";  
```  
  
## Example  
 This example shows how you can use the value of an option field as a constant in your AL code.  
  
```  
PurchHeaderRec."Document Type" := PurchHeaderRec."Document Type"::Invoice;   
```
## See Also
[AL Data Types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  