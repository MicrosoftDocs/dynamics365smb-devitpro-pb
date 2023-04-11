---
title: "How to: Register a Windows Client Control Add-in"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c9dd426e-c4dc-43fe-b11a-8d916aaab76a
caps.latest.revision: 22
---
# How to: Register a Windows Client Control Add-in
A [!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-in is delivered as a Microsoft .NET Framework–based assembly, which is a .dll file. An assembly for [!INCLUDE[nav_windows](includes/nav_windows_md.md)] add-ins can contain more than one control add-in where each control add-in has a unique name. Before you can use a control add-in on pages, you use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to register it on the **Control Add-ins** page of your [!INCLUDE[navnow](includes/navnow_md.md)] database.  
  
 To register a control add-in, provide the following information.  
  
|Information|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------------|---------------------------------------|  
|Control add-in name|The name is defined in the assembly's source code by the [Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute) attribute value for control add-in class definition, as shown in the following example code snippet.<br /><br /> **C\#**<br /><br /> `[ControlAddInExport("MyCompany.MyProduct.FieldPopupAddin")] public class MyFieldPopupAddin : StringControlAddInBase, IStringControlAddInDefinition`<br /><br /> In this example, the control add-in name is `MyCompany.MyProduct.FieldPopupAddin`. For more information, see [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md).|  
|Public key token|The public key token is a 16-character key that is given to the assembly when it is built and signed in Microsoft Visual Studio. To determine the public token key, run the Microsoft .NET Strong Name Utility \(sn.exe\) on the assembly. For more information, see [How to: Determine the Public Key Token of the Windows Client Control Add-in and .NET Framework Assembly](How-to--Determine-the-Public-Key-Token-of-the-Windows-Client-Control-Add-in-and-.NET-Framework-Assembly.md) and [Strong-Named Signing](https://go.microsoft.com/fwlink/?LinkID=150201&clcid=0x409).|  
  
### To register a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-in  
  
1.  Open [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
2.  In the **Search** box, enter **Control Add-ins** and then choose the related link.  
  
3.  On a blank line on the **Control Add-ins** page, fill in the **Control Add-In Name** and **Public Key Token** fields.  
  
4.  Close the **Control Add-ins** page.  
  
 You can also register and manage the control add-in by using the [New-NAVAddin cmdlet](https://go.microsoft.com/fwlink/?LinkID=521781), [Set-NAVAddin cmdlet](https://go.microsoft.com/fwlink/?LinkID=521784), [Get-NAVAddin](https://go.microsoft.com/fwlink/?LinkID=521782), or [Remove-NAVAddin](https://go.microsoft.com/fwlink/?LinkID=521783) cmdlets from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  
  
## See Also  
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [How to: Set Up a Windows Client Control Add-in on a Page](How-to--Set-Up-a-Windows-Client-Control-Add-in-on-a-Page.md)   
 [How to: Install a Windows Client Control Add-in Assembly](How-to--Install-a-Windows-Client-Control-Add-in-Assembly.md)   
 [How to: Determine the Public Key Token of the Windows Client Control Add-in and .NET Framework Assembly](How-to--Determine-the-Public-Key-Token-of-the-Windows-Client-Control-Add-in-and-.NET-Framework-Assembly.md)   
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)   
 [Walkthrough: Creating and Using a Windows Client Control Add-in](Walkthrough--Creating-and-Using-a-Windows-Client-Control-Add-in.md)
