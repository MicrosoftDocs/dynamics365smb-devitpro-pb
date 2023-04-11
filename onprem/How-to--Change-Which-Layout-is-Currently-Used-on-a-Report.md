---
title: Change the Report Layout
description: Learn how to change the currently used report layout to a custom layout on a report. Setup with more than one report layout and switch among as needed.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7bb42186-1105-4c43-bb7a-cf0e2f5bdc03
caps.latest.revision: 6
translation.priority.ht:
  - da-dk
  - de-at
  - de-ch
  - de-de
  - en-au
  - en-ca
  - en-gb
  - en-in
  - en-nz
  - es-es
  - es-mx
  - fi-fi
  - fr-be
  - fr-ca
  - fr-ch
  - fr-fr
  - is-is
  - it-ch
  - it-it
  - nb-no
  - nl-be
  - nl-nl
  - ru-ru
  - sv-se
---
# How to Change the Report Layout in Dynamics NAV
This procedure describes how to change the layout that is used by a report. A report can be set up with more than one report layout, which you can then switch among as needed.  

 Depending on the layouts that are available for a report, you can choose to use a built-in RDLC report layout, a built-in Word report layout, or a custom layout. For more information about RDLC and Word report layouts, built-in and custom layouts, and more, see [Managing Report Layouts](managing-report-layouts.md).  

### To change the layout that is used on a report  

1.  In the **Search** box, enter **\Report Layout Selection**, and then choose the related link.  

     The **\Report Layout Selection** window lists all the reports that are available for the company that is specified in the **Company** field at the top of the window.  

     The **Selected Layout** field specifies the layout that is currently used on the report.  

2.  Set the **Company** field at the top of the window to the company that includes the report.  

3.  To change the layout that is used by a report, in the row for the report in the list, set the **Selected Layout** field to one of the following options:  

    |[!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |----------------------------------|---------------------------------------|  
    |**RDLC \(built-in\)**|Uses the built-in RDLC report layout on the report.|  
    |**Word \(built-in\)**|Uses the built-in Word report layout on the report.|  
    |**Custom**|Uses a custom layout on the report.<br /><br /> You can see which custom layouts are available for the report in the **Custom Layouts** FactBox. If there are no custom layouts for the report, then you will have to create one first.<br /><br /> If you choose this option, go to the next procedure to specify the custom layout that you want to use.|  

    > [!NOTE]  
    >  If you choose **RDLC \(built-in\)** or **Word \(built-in\)** and you get an error message that the report does not have a layout of the specified type, then you must choose another layout option or create a custom report layout of the type that you want to use.  

 If you selected a built-in RDLC or Word report layout, then no further action is required and the layout will be used the next time the report is run.  

### To specify a custom layout on a report  

1.  You specify which custom layout to use on the report from the **Report Layouts** window. If the **Report Layouts** window is not open, then in the **Report Layout Description** field, choose the lookup button.  

2.  In the **Report Layouts** window, select the row for custom layout that you want to use, and then choose the **OK** button.  

 You return to the **\Report Layout Selection** window. The name of the selected custom layout displays in the **Report Description** field. The custom layout will be used the next time that you run the report.  

## See Also  
 [Managing Report Layouts](managing-report-layouts.md)   
 [Designing Report Layouts from the Microsoft Dynamics NAV Development Environment](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md)   
 [Managing Report Layouts](managing-report-layouts.md)   

