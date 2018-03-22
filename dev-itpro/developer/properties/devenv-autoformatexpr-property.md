---
title: "AutoFormatExpr Property"
ms.custom: na
ms.date: 06/09/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 18e6df94-639e-4c5f-99ed-5729037bb719
caps.latest.revision: 13
---

 

# AutoFormatExpression Property
Sets an AL expression that specifies how to format data.  
  
## Applies To  
 Fields (or columns) of the decimal data type in the following objects:  
  
-   Tables  
  
-   Pages  
  
-   Reports  
  
## Remarks  
 The AL expression is evaluated when the expression performs updates. Together with the [AutoFormatType Property](devenv-autoformattype-property.md), this property determines how data is formatted. These two properties are only used to format decimal data types, such as amounts that can be stated in a foreign currency or ratios.  
  
## See Also  
 [AutoFormatType Property](devenv-autoformattype-property.md)   
 [DecimalPlaces Property](devenv-decimalplaces-property.md)