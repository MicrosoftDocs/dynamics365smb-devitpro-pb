---
title: PowerShell Administration
description: Windows PowerShell is a Windows command-line shell that is designed especially for system administrators.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1e61e54a-a430-4a53-8253-bf7505e1cf2a
caps.latest.revision: 9
---
# Working with PowerShell in Dynamics NAV
Windows PowerShell is a Windows command-line shell that is designed especially for system administrators.  
  
 To start a [!INCLUDE[navnow](includes/navnow_md.md)] PowerShell session, on the **Start** menu, choose **All Programs**, and then choose **[!INCLUDE[nav_shell](includes/nav_shell_md.md)]**. This opens a PowerShell prompt where the [!INCLUDE[navnow](includes/navnow_md.md)] cmdlets are available.  
  
 If this is your first time working with Windows PowerShell, there are various online resources for learning, which include the following:  
  
-   [Getting Started with Windows PowerShell](https://go.microsoft.com/fwlink/?LinkId=254637)  
  
-   [Scripting with Windows PowerShell](https://go.microsoft.com/fwlink/?LinkId=254638) \(with videos\)  
  
-   [The Windows PowerShell blog](https://go.microsoft.com/fwlink/?LinkId=254642)  
  
 All Windows PowerShell cmdlets support the parameters in the following table.  
  
|Parameter|Definition|  
|---------------|----------------|  
|`-confirm`|Use this parameter with a cmdlet to make sure that you do not unintentionally overwrite files that you have already uploaded.|  
|`-verbose`|Use this parameter to display messages that indicate how the action is processing.|  
  
 In addition, you can use the Get-Help cmdlet in combination with any [!INCLUDE[navnow](includes/navnow_md.md)] cmdlets to view a cmdlets definition, information about parameters, and examples.  
  
```  
Get-Help <cmdlet name>  
```  
  
 You can also obtain help for the `Get-Help` cmdlet itself to learn about different ways to use it.  
  
```  
Get-Help Get-Help  
```  
  
## Windows PowerShell Scripts  
 Because the [!INCLUDE[navnow](includes/navnow_md.md)] PowerShell cmdlets for Microsoft Azure require many parameters, it is easier and more efficient to use scripts instead of entering cmdlets directly at the prompt. By using scripts, you can easily debug your cmdlets, and save them for reuse.  
  
 Windows PowerShell scripts have a .ps1 file name extension. Before you can run a script, you must change the script execution policy to allow for scripts to run that originate on the local computer. To do this, run the following command at the PowerShell prompt.  
  
```  
Set-ExecutionPolicy "RemoteSigned" -Scope Process  
```  
  
 For more information about PowerShell execution policy, see [About Execution Policies](https://go.microsoft.com/fwlink/?LinkID=254644).  
  
## See Also  
 [Preparing for Deploying Microsoft Dynamics NAV on Microsoft Azure](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md)