---
title: "EnableExternalAssemblies Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# EnableExternalAssemblies Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether external Microsoft .NET assemblies can be used on a report.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [NOTE]
> It applies to client report definition \(RDLC\) report layouts.  

## Property Value  

**True** if external assemblies can be used; otherwise, **false**. The default is **false**.  

## Syntax

```AL
EnableExternalAssemblies = true;
``` 

## Remarks  


When you use the Visual Studio Report Designer for creating reports for the RoleTailored client, you can reference external assemblies to add functionality to a report. The location of the assembly must be accessible from the RoleTailored client. To use external assemblies on a report, the EnableExternalAssemblies property must be set to **true**.  
  
For more information about referencing assemblies, see [Adding Custom Code to a Report \(Visual Studio Report Designer\)](https://go.microsoft.com/fwlink/?LinkID=184561&clcid=0x409).  
  
## Security Considerations  

[!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] cannot verify assemblies and protect against malicious sources that may be harmful to your computer. You should set the EnableExternalAssemblies property to **true** only if you can ensure that assemblies on the report come from a trusted source.  
  
## See Also

[Properties](devenv-properties.md)   