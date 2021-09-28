---
title: "Generating Delta files"
description: "Description of how to generate delta files with the ExportToNewSyntax flag."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Generating Delta files
You can use the `Compare-NAVApplicationObject` PowerShell cmdlet to generate .delta files from two versions of a set of application objects. For more information about the PowerShell cmdlet, see [Compare-NAVApplicationObject](/powershell/module/microsoft.dynamics.nav.model.tools/compare-navapplicationobject?view=businesscentral-ps).

The cmdlet has a `ExportToNewSyntax` switch that allows generating .delta files that can be used as a starting point for creating extensions. Setting the `ExportToNewSyntax` flag generates .delta files that contain additional information needed to generate the correct structure and layout of extension objects.  

> [!IMPORTANT]  
> The Txt2Al conversion tool will reject .delta files that were generated without using the -ExportToNewSyntax flag.

Using the `ExportToNewSyntax` switch for the `Compare-NAVApplicationObject` cmdlet produces a .delta file that can be converted to an extension. 

## The ExportToNewSyntax flag

|Parameter      |Description|
|---------------|-----------|
|Type          |SwitchParameter|
|Aliases       |None|
|Position      |Named|
|Default value |None|
|Accept pipeline input      |False|
|Accept wildcard characters |False|

## Example
```
Compare-NAVApplicationObject -OriginalPath "C:\PageWith2Controls.txt" -ModifiedPath "C:\PageWith3Controls.txt" -ExportToNewSyntax
 ```

## See Also
[The Txt2Al Conversion Tool](devenv-txt2al-tool.md)  
[Developing Extensions](devenv-dev-overview.md)   
[Converting Extensions V1 to Extensions V2](devenv-upgrade-v1-to-v2-overview.md)  
[Compare-NAVApplicationObject](/powershell/module/microsoft.dynamics.nav.model.tools/compare-navapplicationobject?view=businesscentral-ps)

