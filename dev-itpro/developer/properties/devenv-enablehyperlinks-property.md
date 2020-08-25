---
title: "EnableHyperlinks Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 19978a91-2af9-4e9e-9f73-64c7be28897f
caps.latest.revision: 14
author: SusanneWindfeldPedersen
---

 

# EnableHyperlinks Property
Sets whether hyperlinks to URLs are allowed on reports.  
  
## Applies to  
 Client report definition (RDLC) report layouts  
  
## Property Value  
 **True** if links to other URLs from the report are allowed; otherwise, **true**. The default is **false**.  
 
## Syntax
```
EnableHyperlinks = true;
```

## Remarks  
 When you use the Visual Studio Report Designer for creating reports for the RoleTailored client, you can add hyperlinks on controls that target different URLs. This allows you set up a link from a field on a report to another report or page of the RoleTailored client for drilling down into data. To use hyperlinks on a report, the EnableHyperlinks property must be set to **true**. <!-- For examples that use this property, see [Walkthrough: Creating a Link from a Report to a Report](Walkthrough-Creating-a-Link-from-a-Report-to-a-Report.md) and [Walkthrough: Creating a Link from a Report to a Page](Walkthrough-Creating-a-Link-from-a-Report-to-a-Page.md). --> 
  
> [!NOTE]  
>  The EnableHyperlinks property exposes the [LocalReport.EnableHyperlinks Property](https://go.microsoft.com/fwlink/?LinkId=222520&clcid=0x409) of the [Microsoft.ReportViewer.WebForms.LocalReport object](https://go.microsoft.com/fwlink/?LinkId=222521&clcid=0x409), which is embedded in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. The Microsoft.ReportViewer.WebForms.LocalReport object is part of the [ReportViewer controls](https://go.microsoft.com/fwlink/?LinkID=222518&clcid=0x409) that are available in Visual Studio for adding reports to your application.  
  
## Security Considerations  
 [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] cannot verify URLs and protect against malicious sites that may be harmful to your computer. You should set the EnableHyperlinks property to **true** only if you can ensure that hyperlinks on the report target trusted sites.  
  
## See Also  
 [Properties](devenv-properties.md)   
 <!--
 [Designing Reports](Designing-Reports.md) -->