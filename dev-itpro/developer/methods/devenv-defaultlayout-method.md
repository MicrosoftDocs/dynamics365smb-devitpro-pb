---
title: "DEFAULTLAYOUT Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 32db8616-21ad-43e5-9fc6-2a77908063b8
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DEFAULTLAYOUT Method
Gets the default built-in layout type that is used on a specified report.  

## Syntax  

```  
DefaultLayout := REPORT.DEFAULTLAYOUT(Number)  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The ID of the report that you want to save. To specify the report from a list, on the **View** menu, choose **Symbols**.  

 If the report that you specify does not exist, then a run-time error occurs.  

## Property Value/Return Value  
 Type: Option  

 The default layout type. The value can be either **None**, **RDLC**, or **Word**.  

## Remarks  
 The default layout for a report is specified by the report's [DefaultLayout Property](../properties/devenv-DefaultLayout-Property.md).  

## See Also  
 [Report Object](../devenv-report-object.md)   
 <!--Links [How to Specify the Default Built-in Report Layout](How-to-Specify-the-Default-Built-in-Report-Layout.md)   
 [Designing Report Layouts from the Microsoft Dynamics NAV Development Environment](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md)-->
