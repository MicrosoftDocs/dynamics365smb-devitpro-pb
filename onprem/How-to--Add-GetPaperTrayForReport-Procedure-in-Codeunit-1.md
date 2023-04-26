---
title: Add GetPaperTrayForReport Procedure in Codeunit 1
description: Print a report using different paper trays for different letterheads by adding the GetPaperTrayForReport procedure in codeunit 1 application management.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7668292c-a5e0-4f68-bba5-1dd63a23a22d
caps.latest.revision: 6
---
# How to Add GetPaperTrayForReport Procedure in Codeunit 1
You can print a report that uses different paper trays to print different letterheads. You can programmatically achieve this by adding the **GetPaperTrayForReport** procedure in codeunit 1 **Application Management** to set the paper tray from C/AL code. This is a procedure that you must add yourself if you need it. This gives you runtime control over paper tray selection for first, last, and default pages in all reports. When a report is run, the **GetPaperTrayForReport** procedure is called automatically to determine which paper trays should be used. If the **GetPaperTrayForReport** procedure is absent, then the report uses the **PaperSourceFirstPage**, **PaperSourceDefaultPage**,and **PaperSourceLastPage** properties that are set on the report.  
  
### To add the GetPaperTrayForReport procedure in codeunit 1  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In **Object Designer**, choose **Codeunit**, and then choose codeunit 1 **Application Management**.  
  
3.  Add a new procedure, which has ID 75 in codeunit 1. The following code example shows how the **GetPaperTrayForReport** procedure can be used to set paper tray in report 110.  
  
    ```  
    PROCEDURE GetPaperTrayForReport@75(ReportID@1000 : Integer; VAR FirstPage@1001 : Integer; VAR DefaultPage@1002 : Integer; VAR LastPage@1003 : Integer)  
    BEGIN   
        IF ReportID = 110 THEN BEGIN   
            FirstPage := 1;   
            DefaultPage := 2;   
            LastPage := 3;   
        END;   
    END;  
    ```  
  
4.  The following table describes the procedure parameters.  
  
    |Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------|---------------------------------------|  
    |**ReportID**|The ID of the report that is currently running.|  
    |**FirstPage**|A reference value that returns the integer value of the paper tray used on the first page. If the value returns 0, then the printer uses the paper tray that is defined in the printer settings.|  
    |**DefaultPage**|A reference value that returns the integer value of the paper tray used on the default page. If the value returns 0, then the printer uses the paper tray that is defined in the printer settings.|  
    |**LastPage**|A reference value that returns the integer value of the paper tray used on the last page. If the value returns 0, then the printer uses the paper tray that is defined in the printer settings.|  
  
5.  Save and compile codeunit 1.  
  
## See Also  
 [PaperSourceDefaultPage Property](PaperSourceDefaultPage-Property.md)   
 [PaperSourceFirstPage Property](PaperSourceFirstPage-Property.md)   
 [PaperSourceLastPage Property](PaperSourceLastPage-Property.md)
