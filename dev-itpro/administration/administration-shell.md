---
title: "Business Central Administration Shell"
description: Read about the PowerShell cmdlets managing Business Central Server instances and extensions for on-premises deployments.
author: jswymer
ms.custom: bap-template
ms.reviewer: jswymer
ms.topic: article
ms.author: jswymer
ms.date: 03/18/2026
ms.service: dynamics-365-op
---

# Business Central Administration Shell

The [!INCLUDE[adminshell](../developer/includes/adminshell.md)] includes PowerShell cmdlets for administering Business Central on-premises deployments. You use it for configuring Business Central Server and Web server instances, databases, users, and more. You also use it to manage extensions, like publishing, syncing, installing, and upgrading.

## Install the Business Central Admin Shell

The [!INCLUDE[adminshell](../developer/includes/adminshell.md)] is installed together with [!INCLUDE[server](../developer/includes/server.md)] components by using the Business Central Setup wizard. To install it, run the setup.exe that's available on the installation media (DVD). Follow the wizard, and choose either the **Install Demo** option or the **Server** option in the customized setup. For more information, see [Install Using Setup](../deployment/install-using-setup.md).

### PowerShell 7 and PowerShell 5 modules

Starting with 2024 release wave 1 (v24), Business Central admin modules are installed in PowerShell 7 and Windows PowerShell 5 compatible versions.

- PowerShell 7 modules are most up-to-date and recommended for best performance. The PowerShell 7 modules are stored in the **Admin** folder of the Business Central Server installation and prefixed with `Microsoft.BusinessCentral` instead of `Microsoft.Dynamics.Nav`: The Microsoft.BusinessCentral.Management.dll, Microsoft.BusinessCentral.Apps.Management.dll, and Microsoft.BusinessCentral.Apps.Tools.dll.

- A Windows PowerShell 5 compatibility layer module is available users who aren't ready to use PowerShell 7. This module is named Microsoft.Dynamics.Nav.Management.dll and is stored in the **Management** folder Business Central Server installation. It consolidates the cmdlets/functions of all three modules (Microsoft.Dynamics.Nav.Management.dll, Microsoft.Dynamics.Nav.Apps.Management.dll, and Microsoft.Dynamics.Nav.Apps.Tools.dll) into a single module. The PowerShell 5 compatibility layer module is using an approach similar to the [Windows PowerShell Compatibility functionality in PowerShell 7](/powershell/module/microsoft.powershell.core/about/about_windows_powershell_compatibility).

## Run the Business Central Administration Shell

To run the shell, you have to be a member of the local administrator group on the computer. There are a couple ways to run the shell.

- One way is from the **Start** menu or **Search** on your desktop. Select **Start** or **Search**, type *[!INCLUDE[adminshell](../developer/includes/adminshell.md)]*, right-click it, then select **Run as administrator**.

  If PowerShell 7 is installed on your device, then the PowerShell 7 modules are load

- Another way is from Windows PowerShell. Start PowerShell 7 (or Windows PowerShell 5) as an administrator. At the prompt, run the following command:

    ```powershell
    Import-Module -Name C:\Program Files\Microsoft Dynamics 365 Business Central\nnn\Service\navadmintool.ps1
    ```

    Replace `C:\Program Files\Microsoft Dynamics 365 Business Central\nnn` with the path to your server installation.

    If you're using PowerShell 7, the PowerShell 7 modules are loaded. If you're using PowerShell 5, the PowerShell 5 compatibility layer module is loaded.

## Run Business Central Admin Shell in remote session

To administer [!INCLUDE[server](../developer/includes/server.md)] on a remote computer, you can use PowerShell remoting. PowerShell remoting allows you to run [!INCLUDE[adminshell](../developer/includes/adminshell.md)] cmdlets on the remote server from your local machine.

1. Ensure that PowerShell Remoting is enabled on the remote computer that's running [!INCLUDE[server](../developer/includes/server.md)]. From the remote computer, start PowerShell and run the following command:

   ```powershell
   Enable-PSRemoting -Force
   ```

1. On the local computer, start PowerShell 7 (or Windows PowerShell 5) as an administrator.

1. Run the following command to start an interactive session to the remote computer:

   ```powershell
   Enter-PSSession -ComputerName <RemoteComputerName> -Credential <Username>
   ```

   Once connected, your prompt changes to reflect the remote computer. You can now navigate and execute commands directly.
1. Run the following command to start [!INCLUDE[adminshell](../developer/includes/adminshell.md)]:
 
   ```powershell
    Import-Module -Name C:\Program Files\Microsoft Dynamics 365 Business Central\nnn\Service\navadmintool.ps1
    ```

> [!IMPORTANT]
>  With 2026 release wave 1 (v28.0), you must use Windows PowerShell 5 to run  [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. Due to a known issue, PowerShell 7–based remoting isn't supported. Learn more in [Known issues](../upgrade/known-issues.md#business-central-admin-shell-modules-fail-in-powershell7-remote-sessions).

## Get help on the cmdlets

To view the available cmdlets, enter the following command at the prompt:

```powershell  
Get-Command *NAV*  
```

To get help with syntax, options, and examples for a specific cmdlet in Business Central version 23 or earlier, enter the following command:


```PowerShell  
Get-Help <cmd name> -full
```  

For example, to get Help about the **Get-NAVServerInstance** cmdlet, type the following command.  

```powershell   
Get-Help Get-NAVServerInstance -full
```  

Help with syntax, options, and examples isn't available starting with version 24. Use the online version of the help on Microsoft Learn.  

To open the online help, enter the following command:  

```powershell
Get-Help <cmd name> -online  
```  

### Learn more

For more information about [!INCLUDE[adminshell](../developer/includes/adminshell.md)] cmdlets, see [Administration Cmdlets ](/powershell/module/microsoft.dynamics.nav.management).  

For more information about Windows PowerShell, see [Windows PowerShell Getting Started Guide](https://go.microsoft.com/fwlink/?LinkID=252252).  

## Related information

[Configuring Business Central Server Instances](configure-server-instance.md)  
[Configuring Business Central Web Server Instances](configure-web-server.md)  
[Publish and Install Extensions](../developer/devenv-how-publish-and-install-an-extension-v2.md)  
