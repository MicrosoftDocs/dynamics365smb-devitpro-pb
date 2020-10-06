---
title: "DefaultLayout Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# DefaultLayout Property
Specifies whether the report uses the built-in RDL or Word report layout by default.  
  
## Applies to  
  
- Reports  
  
## Property Value  
  
- **RDLC** - specifies the built-in RDL layout as the default layout.  
  
- **Word** - specifies the built-in Word layout as the default layout. 

## Syntax
```
DefaultLayout = Word;
``` 
  
## Remarks  
A report object can include a built-in layout of either an RDL type, Word type, or both. When you set the property to a type, then that layout type is used by default to view, save and print a report. Users can change a report to use another layout from the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] client.  
 <!-- 
 For more information, see [Built-in and Custom Report Layouts](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md#BuiltinCustomLayouts). 
  -->
## See Also  

[Report Object](../devenv-report-object.md)  
[Creating a Word Layout Report](../devenv-howto-report-layout.md)  
[Creating an RDL Layout Report](../devenv-howto-rdl-report-layout.md)  

 <!--
 [Designing Report Layouts from the Microsoft Dynamics NAV Development Environment](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md)   
 [How to. Specify the Default Built-in Report Layout](How-to.-Specify-the-Default-Built-in-Report-Layout.md)
 -->