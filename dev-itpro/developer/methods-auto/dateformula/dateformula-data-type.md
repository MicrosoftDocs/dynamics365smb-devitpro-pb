---
title: "DateFormula Data Type"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DateFormula Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents a date formula that has the same capabilities as an ordinary input string for the CALCDATE Method (Date). The DateFormula data type is used to provide multilanguage capabilities to the CALCDATE Method (Date).




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When a date calculation formula is stored in a DateFormula field, it is converted to a generic, non-language dependent format. When a date calculation formula is retrieved from a DateFormula field, it is converted to a valid date conversion string for the currently selected language.  

To assign a value to a DateFormula data type, whether it is a field or a variable, you must use the [EVALUATE Method](../system/system-evaluate-method.md).  
 
## Example  

This example requires that you create a DateFormulaVariable variable that is a DateFormula data type.  

```al
if Format(DateFormulaVariable) = ' ' then  
  Evaluate(DateFormulaVariable, '1W');  
```  

You must use the [Format Method](../system/system-format-joker-integer-string-method.md) to make a comparison with a text string. If you do not use this method, then the IF statement will fail because you cannot compare a DateFormula data type with a Text data type.  

## See Also

[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  