---
title: "PREVIEW Method (Report)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: caa2140e-f2f7-4933-95f4-0031516255f3
caps.latest.revision: 19
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# PREVIEW Method (Report)
Indicates whether a report is being printed in preview mode.  

## Syntax  

```  
IsPreview := PREVIEW  
```  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the report is run in preview mode; otherwise, **false**.  

## Remarks  
 You must use the return value. A compile error is generated if this value is not used.  

If you run a client report definition \(RDLC\) report layout in preview mode and then call the CurrReport.PREVIEW method, then the Print icon, Print Layout icon, Page Setup icon, and Save As icon are not displayed.  

 If you run a client report definition \(RDLC\) report layout in preview mode and do not call the CurrReport.PREVIEW method, then you can print from the **Print Preview** window.  

## Example  
 This example shows how to use the PREVIEW method. You can use this method in an application that stores a count of how many times a document has been printed in the database. This number must be updated from inside the report that is used to print the document. To avoid updating the number when the report is run in preview mode, add a construct to the OnPreDataItem trigger that resembles the one that is shown in this example when you add the code that updates the count.  

```  
IF CurrReport.PREVIEW THEN  
... // Preview-specific processing.  
ELSE  
... // Processing that is not preview specific:  
... // Update the print count.  
```  

## See Also  
 [Report Data Type](../datatypes/devenv-Report-Data-Type.md)
