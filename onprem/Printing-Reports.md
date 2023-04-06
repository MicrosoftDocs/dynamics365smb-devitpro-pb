---
title: "Printing Reports"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 82a210a7-f42a-4fc2-8d27-d9a8c89bd38c
caps.latest.revision: 19
---
# Printing Reports
You can specify page settings and page orientation for a printed report from the following UI locations:  
  
-   The **Report Properties** dialog box on the client report definition \(RDLC\) report layout in Visual Studio.  
  
-   The **Properties** dialog box for the printer.  
  
-   The **Print** dialog box that is displayed immediately before you print.  
  
-   The **Page Setup** dialog box from the **Print Preview** page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
 The page settings that are used for the printed report depend on the mode in which you print the report.  
  
 You can use the following modes to print a report:  
  
-   Run a report that has the [UseRequestPage Property](UseRequestPage-Property.md) set to **No**, and therefore, does not display a request page.  
  
-   Print a report from the request page without previewing the report.  
  
-   Print a report from the **Print Preview** page.  
  
    > [!NOTE]  
    >  The printer that you use determines what to do if the actual paper size in the printer differs from the page size that is specified.  
  
 With [!INCLUDE[nav_web](includes/nav_web_md.md)], from the print preview, you can only print to a local printer. To print from the print preview, you must the install a client-side component. For more information, see [Printing Reports from ReportViewer](https://go.microsoft.com/fwlink/?LinkId=225474).  
  
## Specifying Page Settings and Orientation  
 The following table describes how you access each of the dialog boxes in which you can specify page settings and orientation.  
  
|Print mode|To access the **Report Properties** dialog box|To access the **Properties** dialog box for the printer|To access the **Print** dialog box|To access the **Page Setup** dialog box|  
|----------------|----------------------------------------------------|-------------------------------------------------------------|----------------------------------------|---------------------------------------------|  
|Run a report that does not have a request page|When you design the report layout in Visual Studio, on the **Report** menu, choose **Report Properties**.|In Control Panel, double-click **Printers**. Right-click the selected printer, and then choose **Properties**.|Cannot access|Cannot access|  
|Print a report from the request page without previewing|When you design the report layout in Visual Studio, on the **Report** menu, choose **Report Properties**.|In Control Panel, double-click **Printers**. Right-click the selected printer, and then choose **Properties**.|From the client, on the request page, choose **Print**.|Cannot access|  
|View a preview of a report|When you design the report layout in Visual Studio, on the **Report** menu, choose **Report Properties**.|In Control Panel, double-click **Printers**. Right-click the selected printer, and then choose **Properties**.|In the **Print Preview** window, choose the **Print** icon.|In the client, in the **Print Preview** window, choose the **Page Setup** icon.|  
  
## How Printed Report Settings Are Determined  
 Because there are several locations in the UI where you can specify page settings and orientation, you should know how the settings are determined for a printed report. How the settings are determined depends on the mode that you use to print the report.  
  
### Printing a Report Without a Request Page  
 The following table describes the page settings and orientation that are used if you print a report that does not have a request page.  
  
|If|Then the printed report paper size and margins are determined by|And the printed report orientation is determined by|  
|--------|----------------------------------------------------------------------|---------------------------------------------------------|  
|The settings in the **Report Properties** dialog box on the layout of the report specify a standard paper size.|The settings in the **Report Properties** dialog box on the RDLC layout.|The settings in the **Report Properties** dialog box on the RDLC layout.|  
|The settings in the **Report Properties** dialog box on the layout of the report specify a custom paper size.|The settings in the **Properties** dialog box for the printer.|The settings in the **Properties** dialog box for the printer.|  
  
### Printing a Report From the Request Page  
 The following table describes the page settings and orientation that are used if you print a report from the request page without previewing the report.  
  
|If|Then the printed report paper size and margins are determined by|And the printed report orientation is determined by|  
|--------|----------------------------------------------------------------------|---------------------------------------------------------|  
|The settings in the **Report Properties** dialog box on the layout of the report specify a standard paper size.|The settings in the **Report Properties** dialog box on the RDLC layout but is overridden if you change the settings in the **Print** dialog box.|The settings in the **Report Properties** dialog box on the RDLC layout but is overridden if you change the settings in the **Print** dialog box.|  
|The settings in the **Report Properties** dialog box on the layout of the report specify a custom paper size.|The settings in the **Properties** dialog box for the printer but is overridden if you change the settings in the **Print** dialog box.|The settings in the **Report Properties** dialog box on the RDLC layout but is overridden if you change the settings in the **Print** dialog box.|  
  
> [!NOTE]  
>  The values in the **Print** dialog box are initially set to the values from the **Report Properties** dialog box on the RDLC report layout.  
  
### Printing a Report From the Print Preview Page  
 The following table describes the page settings and orientation that are used if you print a report from the **Print Preview** page.  
  
|If|Then the printed report paper size and margins are determined by|And the printed report orientation is determined by|  
|--------|----------------------------------------------------------------------|---------------------------------------------------------|  
|The settings in the **Report Properties** dialog box on the layout of the report specify a standard paper size|The settings in the **Report Properties** dialog box on the RDLC layout but is overridden if you change the settings in the **Page Setup** dialog box.|The paper size settings in the **Report Properties** dialog box on the RDLC layout but is overridden if you change the settings in the **Page Setup** dialog box.|  
|The settings in the **Report Properties** dialog box on the layout of the report specify a custom paper size|The settings in the **Report Properties** dialog box on the RDLC layout but is overridden if you change the settings in the **Page Setup** dialog box.|The paper size settings in the **Report Properties** dialog box on the RDLC layout but is overridden if you change the settings in the **Page Setup** dialog box.|  
  
> [!NOTE]  
>  The values in the **Page Setup** dialog box are initially set to the values from the **Report Properties** dialog box on the RDLC report layout.  
  
## See Also  
 [How to: Specify Printer Selection for Reports](How-to--Specify-Printer-Selection-for-Reports.md)   
 [How to: Verify the Paper Size](How-to--Verify-the-Paper-Size.md)   
 [Printing Reports from a Background Session](Printing-Reports-from-a-Background-Session.md)
