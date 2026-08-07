---
title: Configure Business Central Server
description: Configure and modify settings in the Setup or Installed Business Central Server using PowerShell Cmdlets.
Use the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) to change the settings listed in [Business Central Server instance settings](server-instance-settings.md). Specify the setting's **Key Name** in the `-KeyName` parameter and its new value in the `-KeyValue` parameter. For example, you can change the database used by the `MyInstance` server instance from `Database-A` to `Database-B`:
ms.topic: how-to
ms.service: dynamics-365-op
ms.date: 08/04/2026
ms.author: jswymer
ms.reviewer: solsen
ms.custom:
  - bap-template
  - sfi-ropc-nochange
---

# Configure Business Central Server

**APPLIES TO:** [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 release wave 2 (version 21) and later. For earlier versions, refer to [Configuring Business Central Server in outdated versions](configure-server-instance-archived.md).

When you run [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Setup and install [!INCLUDE[server](../developer/includes/server.md)], you provide information that is then used as the configuration for the default [!INCLUDE[server](../developer/includes/server.md)] instance. This information is stored in a configuration file for the server instance called CustomSetting.config. The default location of the CustomSettings.config file is *[!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\Service*. Each [!INCLUDE[server](../developer/includes/server.md)] instance has its own CustomSettings.config file.

After you install [!INCLUDE[server](../developer/includes/server.md)], you can change any of the settings, including other settings that weren't available to you in Setup.

> [!NOTE]
> For a complete reference of server instance settings, including descriptions, default values, and dynamic update information, go to [Business Central Server instance settings](server-instance-settings.md).

## Configure [!INCLUDE[server](../developer/includes/server.md)] using Setup

To install and configure the default [!INCLUDE[server](../developer/includes/server.md)] instance, run [!INCLUDE[prod setup](../developer/includes/prodsetup.md)] (setup.exe) and select one of these options:

- Demo Option
- Server Option
- Developer Option
- Customize > Server

Depending on your selection, the **Specify parameters** page lets you configure several settings. Learn more in [Installing Business Central using Setup](../deployment/install-using-setup.md).

## Configure [!INCLUDE[server](../developer/includes/server.md)] after installation

After you install [!INCLUDE[server](../developer/includes/server.md)], you can change the configuration settings in the CustomSettings.config file of a [!INCLUDE[server](../developer/includes/server.md)] instance in the following ways:

- Using the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) that's available in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

    Learn more in [Using administration shell cmdlets to modify settings](configure-server-instance.md#UsingPowerShell).

- Editing CustomSettings.config using a text editor.

    We recommend that you don't directly edit the configuration file, because if you make any errors in typing, the server instance might not start.

## <a name="UsingPowerShell"></a> Configure server instance with [!INCLUDE[adminshell](../developer/includes/adminshell.md)]

The [!INCLUDE[adminshell](../developer/includes/adminshell.md)] includes `Set-` cmdlets for creating and modifying [!INCLUDE[server](../developer/includes/server.md)] instances. Use the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) to change the settings listed in [Business Central Server instance settings](server-instance-settings.md). Specify the setting's **Key Name** in the `-KeyName` parameter and its new value in the `-KeyValue` parameter.

1. Start [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for your current version as an administrator.

   [!INCLUDE[open-admin-shell](../developer/includes/open-admin-shell.md)]
1. Run the following command:

   ```powershell
   Set-NAVServerConfiguration -ServerInstance "<InstanceName>" -KeyName "<KeyName>" -KeyValue "<Value>"
   ```

   Replace:

   - `<InstanceName>` with the server instance name.
   - `<KeyName>` with the setting's key name.
   - `<Value>` with the new value for the setting.

   For example, the following command changes the database used by the `MyInstance` server instance to `Database-B`:

   ```powershell
   Set-NAVServerConfiguration -ServerInstance "MyInstance" -KeyName "DatabaseName" -KeyValue "Database-B"
   ```

## Restart [!INCLUDE[server](../developer/includes/server.md)] after modifications

There are a could factors that determine whether you must restart the server instance after you make changes before they take effect.

- If you modify the CustomSettings.config file directly, you must restart the [!INCLUDE[server](../developer/includes/server.md)] instance before any changes can take effect.

- If you use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) doesn't always require restarting the server instance. 

  It depends on the configuration setting that you change. There are several settings that are *dynamically updatable*. *Dynamically updatable* means that a server instance restart isn't necessarily required after modification. Learn more in [Modifying dynamically updatable settings](configure-server-instance.md#DynamicSettings).

  These settings are indicated by the text **Dynamically updatable: Yes** in [Business Central Server instance settings](server-instance-settings.md).

### Restart with the Services console

1. Search for and open **Services** (services.msc).
1. Find **Microsoft Dynamics 365 Business Central Server InstanceName]**, like **Microsoft Dynamics 365 Business Central Server BC280**.
1. Right-click and select **Restart**.

### Restart using admin shell

1. Start [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for your current version as an administrator.

   [!INCLUDE[open-admin-shell](../developer/includes/open-admin-shell.md)]
1. Run the following command:
  
   ```powershell
   Restart-NAVServerInstance -ServerInstance "<InstanceName>"
   ```

   Replace `<InstanceName>` with the server instance name.

## <a name="DynamicSettings"></a>Modify dynamically updatable settings

For dynamically updatable settings, use the `-ApplyTo` parameter to specify how to apply the change. The change can be written directly to the configuration file (CustomSettings.config) and applied to the current server instance state. The option you choose determines whether a server instance restart is required for the change to take effect. The parameter has three options, as described in the following table:

| Option | Description |
|-----------|-----------|
|ConfigFile|Saves the change to the configuration file of the server instance. The change doesn't take effect until the server instance is restarted.|
|Memory|Applies the change only to the server instance's current state. The changes take effect immediately, without having to restart the server instance. The change is stored in memory. The next time the server instance is restarted, it reverts to the setting in the configuration file.|
|All|Applies the change to the server instance's current setting state (in memory) and to the configuration file. The changes take effect immediately, without having to restart the server instance.|

For example, the following command sets the value for the `MaxStreamReadSize` key to `42424242`, without having to restart the server instance. 

```powershell
Set-NAVServerConfiguration -ServerInstanceMyInstance -KeyName MaxStreamReadSize -KeyValue 42424242 -ApplyTo Memory  
```

Learn more about running the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] in [Business Central PowerShell cmdlets](/powershell/business-central/overview).  

## Related information

[Configuring Business Central Web Server Instances](configure-web-server.md)  
[Business Central Server Administration Tool](administration-tool.md)   
[Enhancing Business Central Server Security](../security/enhancing-server-instance-security.md)   
[Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview)   
[Configuring Help](../deployment/configure-help.md)   
[Hiding UI Elements](hide-ui-elements.md)  
[Debugging](../developer/devenv-debugging.md)

