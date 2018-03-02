---
title: "AutoFormatExpr Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 18e6df94-639e-4c5f-99ed-5729037bb719
caps.latest.revision: 13
---
# AutoFormatExpr Property
Sets a C/AL expression that specifies how to format data.  
  
## Applies To  
 Fields \(or columns\) of the decimal data type in the following objects:  
  
-   Tables  
  
-   Pages  
  
-   Reports  
  
## Remarks  
 The C/AL expression is evaluated when the expression performs updates. Together with the [AutoFormatType Property](AutoFormatType-Property.md), this property determines how data is formatted. These two properties are only used to format decimal data types, such as amounts that can be stated in a foreign currency or ratios.  
  
 For more information, see [Formatting the Data in a Field](Formatting-the-Data-in-a-Field.md).  
  
## See Also  
 [AutoFormatType Property](AutoFormatType-Property.md)   
 [DecimalPlaces Property](DecimalPlaces-Property.md)