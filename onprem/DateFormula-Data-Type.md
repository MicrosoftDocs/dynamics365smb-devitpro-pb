---
title: DateFormula Data Type
description: In Dynamics NAV, the DateFormula Data Type can used to contain a date formula that has the same capabilties as an ordinary input string for the CALC function.
ms.custom: na
ms.date: 10/26/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b916afad-de38-43bd-ab7e-ec607192ba1f
caps.latest.revision: 9
manager: edupont
---
# DateFormula Data Type in Dynamics NAV
Use this data type to contain a date formula that has the same capabilities as an ordinary input string for the [CALCDATE Function \(Date\)](CALCDATE-Function--Date-.md). The DateFormula data type is used to provide multilanguage capabilities to the [CALCDATE Function \(Date\)](CALCDATE-Function--Date-.md).  
  
## Remarks  
 When a date calculation formula is stored in a DateFormula field, it is converted to a generic, non-language dependent format. When a date calculation formula is retrieved from a DateFormula field, it is converted to a valid date conversion string for the currently selected language.  
  
 To assign a value to a DateFormula data type, whether it is a field or a variable, you must use the [EVALUATE Function](EVALUATE-Function.md).  
  
## Example  
 This example requires that you create a DateFormulaVariable variable that is a DateFormula data type.  
  
```  
IF FORMAT(DateFormulaVariable) = ' ' THEN  
  EVALUATE(DateFormulaVariable, '1W');  
```  
  
 You must use the [FORMAT Function \(Code, Text\)](FORMAT-Function--Code--Text-.md) to make a comparison with a text string. If you do not use this function, then the IF statement will fail because you cannot compare a DateFormula data type with a Text data type.  
  
## See Also  
 [Developing Multilanguage-Enabled Applications](Developing-Multilanguage-Enabled-Applications.md)   
 [DateFormula Property](DateFormula-Property.md)