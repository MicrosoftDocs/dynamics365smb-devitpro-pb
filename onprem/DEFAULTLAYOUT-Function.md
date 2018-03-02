---
title: "DEFAULTLAYOUT Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 32db8616-21ad-43e5-9fc6-2a77908063b8
caps.latest.revision: 3
manager: edupont
---
# DEFAULTLAYOUT Function
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
 The default layout for a report is specified by the report's [DefaultLayout Property](DefaultLayout-Property.md).  

## See Also  
 [Reports](Reports.md)   
 [How to. Specify the Default Built-in Report Layout](How-to.-Specify-the-Default-Built-in-Report-Layout.md)   
 [Designing Report Layouts from the Microsoft Dynamics NAV Development Environment](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md)
