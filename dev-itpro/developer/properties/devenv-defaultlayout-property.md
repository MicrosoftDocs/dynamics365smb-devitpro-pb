---
title: "DefaultLayout Property"
ms.custom: na
ms.date: 06/12/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b2f560c0-bda3-467e-8e81-50cdf8e64ed5
caps.latest.revision: 3
author: SusanneWindfeldPedersen
---

 

# DefaultLayout Property
Specifies whether the report uses the built-in RDLC or Word report layout by default.  
  
## Applies to  
  
-   Reports  
  
## Property Value  
  
-   **RDLC** - specifies the built-in RDLC layout as the default layout.  
  
-   **Word** - specifies the built-in Word layout as the default layout.  
  
## Remarks  
 A report object can include a built-in layout of either an RDLC type, Word type, or both. When you set the property to a type, then that layout type is used by default to view, save and print a report. Users can change a report to use another layout from the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] client.  
 <!-- 
 For more information, see [Built-in and Custom Report Layouts](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md#BuiltinCustomLayouts). 
  -->
## See Also  
 [Report Object](../devenv-report-object.md)  
 <!--
 [Designing Report Layouts from the Microsoft Dynamics NAV Development Environment](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md)   
 [How to. Specify the Default Built-in Report Layout](How-to.-Specify-the-Default-Built-in-Report-Layout.md)
 -->