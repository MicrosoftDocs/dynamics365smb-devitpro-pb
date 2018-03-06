---
title: "Merging Application Objects using the Example Scripts"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8a8c8a05-5876-489f-9ecc-5922fbb23185
caps.latest.revision: 4
---
# Merging Application Objects using the Example Scripts
The [!INCLUDE[navnow](includes/navnow_md.md)] product media includes a folder with examples of how you can use [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to compare and merge application objects. In the **WindowsPowerShellScripts** folder on the product media, the **ApplicationMergeUtilities** folder contains [!INCLUDE[wps_2](includes/wps_2_md.md)] sample scripts and folders that contain demonstration data.  
  
 You can run the sample scripts from the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)]. Alternatively, you can use the [!INCLUDE[wps_2](includes/wps_2_md.md)] Integrated Scripting Environment \(ISE\) as described in the following section.  
  
 The individual scripts provide different variations of how you can use the [!INCLUDE[navnow](includes/navnow_md.md)] cmdlets. For example, the HowTo-Merge-N-Conflicts-External-Tools.ps1 script shows different ways of displaying conflicts. By opening the scripts in the [!INCLUDE[wps_2](includes/wps_2_md.md)] ISE, you can examine the different variations and decide how you want to use the cmdlets to upgrade and maintain your own application.  
  
## Using the Sample Scripts in the [!INCLUDE[wps_2](includes/wps_2_md.md)] ISE  
 If you want to use the [!INCLUDE[wps_2](includes/wps_2_md.md)] ISE, you must you must import the Microsoft.Dynamics.Nav.Model.Tools.psd1 module. The module installs to the equivalent of [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client when you choose the Developer option in [!INCLUDE[nav_setup](includes/nav_setup_md.md)].  
  
 For example, you can import the module into the [!INCLUDE[wps_2](includes/wps_2_md.md)] ISE by typing a command such as the following:  
  
```  
Import-Module "${env:ProgramFiles(x86)}\Microsoft Dynamics NAV\90\RoleTailored Client\Microsoft.Dynamics.Nav.Model.Tools.psd1" -force  
  
Get-Help "NAV"  
```  
  
 Now you can see the Help for the cmdlets and take a closer look at the examples for how to use them.  
  
 The **ApplicationMergeUtilities** folder contains four subfolders that can help you start working with the scripts. The demonstration data in the ORIGINAL, MODIFIED, and TARGET folders illustrate the text files that are the input to the cmdlets. The demonstration data uses separate text files for each application object, but you can configure the text files in the way that works better for you. For example, you can use the Join-NAVApplicationObjectFile cmdlet to combine all the text files in the MODIFIED folder in a single file, for example, before you run the script.  
  
 The HowTo-Start-Import-NAV-Module.ps1 script imports the Microsoft.Dynamics.Nav.Model.Tools.psd1 module into the [!INCLUDE[wps_2](includes/wps_2_md.md)] ISE. The \_\_Run-Application-Merge-Utilities.ps1 and \_\_Reset-HowTo-Sample.ps1 scripts enable you to run the sample scripts repeatedly.  
  
 For Help for a [!INCLUDE[navnow](includes/navnow_md.md)] cmdlet, type `Get-Help <cmd name>`. For Help for the [!INCLUDE[wps_2](includes/wps_2_md.md)] ISE, press F1, or choose the Help menu, and then choose [!INCLUDE[wps_2](includes/wps_2_md.md)] ISE Help.  
  
## See Also  
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
 [How to: Merge Application Changes](How-to--Merge-Application-Changes.md)   
 [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)