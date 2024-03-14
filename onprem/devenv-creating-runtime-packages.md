---
title: "Creating runtime packages for Dynamics NAV"
description: "How to create runtime packages used for distribution of extensions."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---


# Creating runtime packages for Dynamics NAV
For distribution of extensions, you can generate runtime packages that do not contain AL code, but only the final artifacts used by the server at runtime. Runtime packages allow you to protect the intellectual property represented by your AL source code. 
The extension in a runtime package can be installed on servers that do not have a developer license. The license is checked on the server where the runtime package is generated. 

## Start using runtime packages
The first step in using runtime packages is to have an extension developed and published to an on-premise instance.
Next, use the following PowerShell command to connect to the server, find the extension, and download the runtime package.

`Get-NavAppRuntimePackage`

For more information about this cmdlet, see [Get-NAVAppRuntimePackage cmdlet](https://go.microsoft.com/fwlink/?linkid=859214).

The following example gets the NAV App runtime package with the provided name and version.

`Get-NAVAppRuntimePackage -ServerInstance DynamicsNAV -AppName 'Proseware SmartApp' -Version 2.3.4.500 -ExtensionPath 'Prosware SmartApp_2.3.4.500_runtime.app'`

For publishing and installing the package, use the [Publish-NavApp](https://go.microsoft.com/fwlink/?linkid=616079) and the [Install-NAVApp](https://go.microsoft.com/fwlink/?linkid=618056) PowerShell cmdlets. 

## Limitations
The limitation of runtime packages is that they only work for on-premise installations and therefore cannot be submitted to AppSource. Moreover, the debugging experience is very limited since no source code is available. 
 
## See also
[Publish-NAVApp cmdlet](https://go.microsoft.com/fwlink/?linkid=616079)   
[Install-NAVApp cmdlet](https://go.microsoft.com/fwlink/?linkid=618056)  



