---
title: "EnableExternalAssemblies Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d8416fc7-757c-479b-ae22-3f3c2986aa2b
caps.latest.revision: 10
---
# EnableExternalAssemblies Property
Sets whether external Microsoft .NET assemblies can be used on a report.  
  
## Applies to  
 Client report definition \(RDLC\) report layouts  
  
## Property Value  
 **True** if external assemblies can be used; otherwise, **false**. The default is **false**.  

## Syntax
```
EnableExternalAssemblies = true;
``` 
## Remarks  
 When you use the Visual Studio Report Designer for creating reports for the RoleTailored client, you can reference external assemblies to add functionality to a report. The location of the assembly must be accessible from the RoleTailored client. To use external assemblies on a report, the EnableExternalAssemblies property must be set to **true**.  
  
 For more information about referencing assemblies, see [Adding Custom Code to a Report \(Visual Studio Report Designer\)](https://go.microsoft.com/fwlink/?LinkID=184561&clcid=0x409).  
  
## Security Considerations  
 [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] cannot verify assemblies and protect against malicious sources that may be harmful to your computer. You should set the EnableExternalAssemblies property to **true** only if you can ensure that assemblies on the report come from a trusted source.  
  
## See Also  
 [Properties](devenv-properties.md)   
 <!-- [Designing Reports](Designing-Reports.md) -->