---
title: "PaperSourceDefaultPage Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 624acbca-5cbb-433d-a768-9e1ed45c9d97
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

# PaperSourceDefaultPage Property

Specifies the default paper source to use when printing the report.  
  
## Applies to  

- Reports  

## Syntax

```AL
PaperSourceDefaultPage = AutomaticFeed;
```

<!-- 
## Remarks  

 In the **Report – Properties** window, in the **PaperSourceDefaultPage** field, choose the paper source. The list contains 13 standard trays and 16 printer-specific trays. It is based on information in the fin.stx file.  
  
 If the printer that is used for this report does not support the specified paper source, then the printer uses the default tray that is specified by the printer driver.  
  
 If you do not specify a value for the **PaperSourceDefaultPage** property, then the printer uses the default printer tray that is defined for the operating system.  
  
 If you do not specify a value for the **PaperSourceFirstPage** property or the **PaperSourceLastPage** property, then the printer uses the tray that is specified in the **PaperSourceDefaultPage** property.  
  
 The printer specific trays that are contained in the list are intended for use with printers that have other paper sources than the standard ones that are listed in the property.  
  
 The settings in the **Print** and **Page Setup** dialog boxes override the value that is specified for the **PaperSourceDefaultPage** property.  
  
 You can use the **GetPaperTrayForReport** function in codeunit 1, **Application Management**, to set the paper tray from AL code. This gives you runtime control over paper tray selection for first, last, and default pages in a report. 
  
## See Also  

 [PaperSourceFirstPage Property](devenv-papersourcefirstpage-property.md)   
 [PaperSourceLastPage Property](devenv-papersourcelastpage-property.md)   
 [How to: Add GetPaperTrayForReport Procedure in Codeunit 1](../devenv-How-to--Add-GetPaperTrayForReport-Procedure-in-Codeunit-1.md) -->

## See Also

[Report Properties](devenv-report-properties.md)   
[Report Object](../devenv-report-object.md)   
[Properties](devenv-properties.md)