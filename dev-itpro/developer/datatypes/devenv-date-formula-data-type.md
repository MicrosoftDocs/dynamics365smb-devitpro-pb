---
title: "DateFormula Data Type"
ms.custom: na
ms.date: 06/15/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b916afad-de38-43bd-ab7e-ec607192ba1f
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---
# DateFormula Data Type
Use this data type to contain a date formula that has the same capabilities as an ordinary input string for the [CALCDATE Method (Date)](../methods/devenv-calcdate-method-date.md). The DateFormula data type is used to provide multilanguage capabilities to the [CALCDATE Method (Date)](../methods/devenv-calcdate-method-date.md).  

## Remarks  
 When a date calculation formula is stored in a DateFormula field, it is converted to a generic, non-language dependent format. When a date calculation formula is retrieved from a DateFormula field, it is converted to a valid date conversion string for the currently selected language.  

 To assign a value to a DateFormula data type, whether it is a field or a variable, you must use the [EVALUATE Method](../methods/devenv-evaluate-method.md).  

## Methods
The methods supported for the DateFormula data type are:

[CALCDATE Method (Date)](../methods/devenv-calcdate-method-date.md)  
[EVALUATE Method](../methods/devenv-evaluate-method.md)  
[FORMAT Method (Code, Text)](../methods/devenv-format-method-code-text.md)  

## Example  
 This example requires that you create a DateFormulaVariable variable that is a DateFormula data type.  

```  
IF FORMAT(DateFormulaVariable) = ' ' THEN  
  EVALUATE(DateFormulaVariable, '1W');  
```  

 You must use the [FORMAT Method (Code, Text)](../methods/devenv-format-method-code-text.md) to make a comparison with a text string. If you do not use this method, then the IF statement will fail because you cannot compare a DateFormula data type with a Text data type.  

## See Also  
 <!-- [Developing Multilanguage-Enabled Applications](Developing-Multilanguage-Enabled-Applications.md)  -->
 [DateFormula Property](../properties/devenv-dateformula-property.md)  
 [AL Method Reference](../methods/devenv-al-method-reference.md)  
