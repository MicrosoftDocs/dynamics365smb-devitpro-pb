---
title: "Business Central Administration Shell"
description: Read about the PowerShell cmdlets managing Business Central Server instances and extensions for on-premises deployments.
author: jswymer
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
ms.date: 08/31/2022
---

# Business Central Administration Shell

The [!INCLUDE[adminshell](../developer/includes/adminshell.md)] includes PowerShell cmdlets for administering Business Central on-premises deployments. You use it for configuring Business Central Server and Web server instances, databases, users, and more. You also use it to manage extensions, like publishing, syncing, installing and upgrading.

## Install the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]

The [!INCLUDE[adminshell](../developer/includes/adminshell.md)] is installed together with [!INCLUDE[server](../developer/includes/server.md)] components by using the Business Central Setup wizard. To install it, run the setup.exe that's available on the installation media (DVD). Follow the wizard, and choose either the **Install Demo** option or the **Server** option in the customized setup. For more information, see [Install Using Setup](../deployment/install-using-setup.md).

## Run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]

To run the shell, you have to be a member of the local administrator group on the computer. There are a couple ways to run the shell.

- One way is from the **Start** menu or **Search** on your desktop. Select **Start** or **Search**, type *[!INCLUDE[adminshell](../developer/includes/adminshell.md)]*, right-click it, then select **Run as administrator**.

- Another way is from Windows PowerShell. Start Windows PowerShell as an administrator. At the prompt, run the following command:

    ```powershell
    Import-Module -Name C:\Program Files\Microsoft Dynamics 365 Business Central\210\Service\navadmintool.ps1
    ```

    Replace `C:\Program Files\Microsoft Dynamics 365 Business Central\210` with the path to your server installation.

## Get help on the cmdlets

To see the cmdlets that are available, type the following command at the prompt:  

```powershell  
Get-Command *NAV*  
```  

To get help about syntax and options for a specific cmdlet, type the following command:  

```  
Get-Help <cmd name> -full
```  

For example, to get Help about the **Get-NAVServerInstance** cmdlet, type the following command.  

```powershell   
Get-Help Get-NAVServerInstance -full
```  

To go the online version of the help on Microsoft Docs, type the following command:  

```powershell   
Get-Help <cmd name> -online  
```  

### Learn more

For more information about [!INCLUDE[adminshell](../developer/includes/adminshell.md)] cmdlets, see [Administration Cmdlets ](/powershell/module/microsoft.dynamics.nav.management).  

For more information about Windows PowerShell, see [Windows PowerShell Getting Started Guide](https://go.microsoft.com/fwlink/?LinkID=252252).  

## See Also

[Configuring Business Central Server Instances](configure-server-instance.md)  
[Configuring Business Central Web Server Instances](configure-web-server.md)  
[Publish and Install Extenstions](../developer/devenv-how-publish-and-install-an-extension-v2.md)  
