---
title: "CaptionClass Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# CaptionClass Property
Controls the caption that is used in the label of a field in a database table or in the label of a control on a page.  
  
## Applies To  
  
- Table Fields  
  
- Page Fields  

## Syntax

```
CaptionClass = '1,2,3';
```
  
## Remarks  
The data type of the AL expression must be either `Text` (maximum length 80) or `Code`.  
  
Because this property lets you enter an expression, [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] must be able to differentiate between a literal string like 'DIM1' and a variable or method called DIM1. Every text string that you enter must be enclosed in '  ' or it will be interpreted as a variable or method. You must enter a value that results in a string. For example, if you want to enter 1 + 5, you must either enter '1+ 5', or FORMAT(1 + 5), which results in '6'.  
  
|AL expression|Comments|  
|-------------|--------|  
|DIM1|This value produces an error unless a text variable exists with the name DIM1.|  
|'DIM1'|OK. The caption is 'DIM1.'|  
|'DIM'+FORMAT(2)|OK. The caption is 'DIM2.'|  
|1+5|Error. The data type is Integer|  

## Functionality

When you set the **CaptionClass property** on a field or control, users can configure the caption of a text box that is connected to a label or the caption of a check box without having to modify code. <!--If you set the **CaptionClass property** on other controls, such as groups or Menu Items, the caption will not be displayed.-->

[!INCLUDE[prodshort](../includes/prodshort.md)] passes the value of the **CaptionClass property** to the **CaptionClassTranslate** method in codeunit 42. This method translates the **CaptionClass** to a caption that users can see. The following illustration shows this sequence.

The **CaptionClassTranslate** method is called when the **CaptionClassTranslate** event is raised. The event is raised by using a language and a CaptionClass. The method converts the CaptionClass into the specific caption for that language and returns it as a string. Language is specified as an integer. CaptionClass is a text.

  
## See Also  
[CaptionML Property](devenv-captionml-property.md)   
[Caption Property](devenv-caption-property.md)  
[CaptionClassTranslate Method](../methods-auto/system/system-captionclasstranslate-method.md) 