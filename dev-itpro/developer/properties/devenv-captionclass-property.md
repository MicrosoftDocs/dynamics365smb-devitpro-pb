---
title: "CaptionClass Property"
ms.custom: na
ms.date: 06/09/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 52f27d7a-ecda-4da8-b139-9b2f0a6bf256
caps.latest.revision: 13
author: SusanneWindfeldPedersen
---

 

# CaptionClass Property
Controls the caption that is used in the label of a field in a database table or in the label of a control on a page.  
  
## Applies To  
  
-   Table Fields  
  
-   Page Fields  
  
## Remarks  
 The data type of the AL expression must be either Text (maximum length 80) or Code.  
  
 Because this property lets you enter an expression, [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] must be able to differentiate between a liter string like 'DIM1' and a variable or method called DIM1. Every text string that you enter must be enclosed in '  ' or it will be interpreted as a variable or method. You must enter a value that results in a string. For example, if you want to enter 1 + 5, you must either enter '1+ 5', or FORMAT(1 + 5), which results in '6'.  
  
 The expression is then interpreted by trigger 15 in codeunit 1.  
  
|AL expression|Comments|  
|-------------|--------|  
|DIM1|This value produces an error unless a text variable exists with the name DIM1.|  
|'DIM1'|OK. The caption is 'DIM1.'|  
|'DIM'+FORMAT(2)|OK. The caption is 'DIM2.'|  
|1+5|Error. The data type is Integer|  
  
## See Also  
[CaptionML Property](devenv-captionml-property.md)   
[Caption Property](devenv-caption-property.md)   