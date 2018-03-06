---
title: "EnableHyperlinks Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 19978a91-2af9-4e9e-9f73-64c7be28897f
caps.latest.revision: 14
manager: edupont
---
# EnableHyperlinks Property
Sets whether hyperlinks to URLs are allowed on reports.  
  
## Applies To  
 Client report definition \(RDLC\) report layouts  
  
## Property Value  
 **Yes** if links to other URLs from the report are allowed; otherwise, **No**. The default is **No**.  
  
## Remarks  
 When you use the Visual Studio Report Designer for creating reports for the RoleTailored client, you can add hyperlinks on controls that target different URLs. This allows you set up a link from a field on a report to another report or page of the RoleTailored client for drilling down into data. To use hyperlinks on a report, the EnableHyperlinks property must be set to **Yes**. For examples that use this property, see [Walkthrough: Creating a Link from a Report to a Report](Walkthrough--Creating-a-Link-from-a-Report-to-a-Report.md) and [Walkthrough: Creating a Link from a Report to a Page](Walkthrough--Creating-a-Link-from-a-Report-to-a-Page.md).  
  
> [!NOTE]  
>  The EnableHyperlinks property exposes the [LocalReport.EnableHyperlinks Property](http://go.microsoft.com/fwlink/?LinkId=222520&clcid=0x409) of the [Microsoft.ReportViewer.WebForms.LocalReport object](http://go.microsoft.com/fwlink/?LinkId=222521&clcid=0x409), which is embedded in [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. The Microsoft.ReportViewer.WebForms.LocalReport object is part of the [ReportViewer controls](http://go.microsoft.com/fwlink/?LinkID=222518&clcid=0x409) that are available in Visual Studio for adding reports to your application.  
  
## Security Considerations  
 [!INCLUDE[navnowlong](includes/navnowlong_md.md)] cannot verify URLs and protect against malicious sites that may be harmful to your computer. You should set the EnableHyperlinks property to **Yes** only if you can ensure that hyperlinks on the report target trusted sites.  
  
## See Also  
 [Properties](Properties.md)   
 [Designing Reports](Designing-Reports.md)