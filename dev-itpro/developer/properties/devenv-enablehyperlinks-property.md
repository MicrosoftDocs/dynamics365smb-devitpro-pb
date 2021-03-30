---
title: "EnableHyperlinks Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# EnableHyperlinks Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether hyperlinks to URLs are allowed on reports.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**True** if links to other URLs from the report are allowed; otherwise, **true**. The default is **false**.  
 
## Syntax

```AL
EnableHyperlinks = true;
```

## Remarks

> [NOTE]
> It applies to client report definition \(RDLC\) report layouts.    

When you use the Visual Studio Report Designer for creating reports for the RoleTailored client, you can add hyperlinks on controls that target different URLs. This allows you set up a link from a field on a report to another report or page of the RoleTailored client for drilling down into data. To use hyperlinks on a report, the EnableHyperlinks property must be set to **true**.
  
> [!NOTE]  
> The EnableHyperlinks property exposes the [LocalReport.EnableHyperlinks Property](/dotnet/api/microsoft.reporting.webforms.localreport.enablehyperlinks) of the [Microsoft.ReportViewer.WebForms.LocalReport object](/dotnet/api/microsoft.reporting.webforms.localreport), which is embedded in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. The Microsoft.ReportViewer.WebForms.LocalReport object is part of the [ReportViewer controls](/previous-versions/ms251671(v=vs.140)) that are available in Visual Studio for adding reports to your application.  
  
## Security Considerations

[!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] cannot verify URLs and protect against malicious sites that may be harmful to your computer. You should set the EnableHyperlinks property to **true** only if you can ensure that hyperlinks on the report target trusted sites.  
  
## See Also  

[Properties](devenv-properties.md)