---
author: jswymer
ms.service: dynamics365-business-central
ms.topic: include
ms.date: 10/01/2021
ms.author: jswymer
---
After you upgrade your application, we recommend changing the value of application build number that's stored in the database and shown on the Help and Support page to match the new current version. This version isn't updated automatically when you upgrade. If you want the version to reflect the version of the update or your own version, you change it manually. This task serves two purposes. It ensures that personalization works as expected after upgrade. It's also useful for support purposes and answering a common question about the application version.

You get the number from the [Released Updates for Microsoft Dynamics 365 Business Central 2021 Release Wave 2 on-premises](https://support.microsoft.com/help/4528706). For an explanation of the number, see [Version numbers in Business Central](../../administration/version-numbers.md).

### Change the application version in the database

1. Run the [Set-NAVApplication cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navapplication):

    ```powershell
    Set-NAVApplication -ServerInstance $NewBcServerInstance -ApplicationVersion $NewBCVersion -Force
    ```

    For example:

    ```powershell
    Set-NAVApplication -ServerInstance BC190 -ApplicationVersion 19.0.38071.0 -Force
    ```

2. Run the [Sync-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet to synchronize the tenant with the application database.

    ```powershell  
    Sync-NAVTenant -ServerInstance $NewBcServerInstance -Mode Sync -Tenant $TenantId
    ```

    With a single-tenant deployment, you can omit the `-Tenant` parameter and value.

3. Run the [Start-NavDataUpgrade](/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade) cmdlet to change the version number:

    ```powershell
    Start-NAVDataUpgrade -ServerInstance $NewBcServerInstance -FunctionExecutionMode Serial -Tenant $TenantId
    ```

    The data upgrade process will be running in the background after running the above Start-NAVDataUpgrade cmdlet. You check on the progress using the Get-NAVDataUpgrade cmdlet: such as: `Get-NAVDataUpgrade -ServerInstance $NewBcServerInstance -Tenant $TenantId -Progress` or `Get-NAVDataUpgrade -ServerInstance $NewBcServerInstance -Tenant $TenantId -Detailed`.

Don't stop the [!INCLUDE[server](server.md)] instance until the process is complete, that is, when you see `State = Operational` in the results from the Get-NAVDataUpgrade cmdlet. Also, you can't do operations like installing extensions until the state is operational. It can take several minutes before the process completes.


### Change the application version shown on the Help and Support page in the client

The [!INCLUDE[server](server.md)] includes a configuration setting called **Solution Version Extension** (SolutionVersionExtension). This setting lets you specify an extension whose version number will show as the Application Version on the client's **Help and Support** page. Typically, you'd use the extension considered to be your solution's base application. You set **Solution Version Extension** to ID of the extension. For example, if your solution uses the Microsoft Base Application, set the value to `437dbf0e-84ff-417a-965d-ed2bb9650972`.

You can set **Solution Version Extension** by using the [!INCLUDE[admintool](admintool.md)] or the [Set-NAVServerConfiguration](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) cmdlet of the [!INCLUDE[admin shell](adminshell.md)].

The following example uses the Set-NAVServerConfiguration cmdlet to set the **Solution Version Extension** to the Microsoft Base Application:

```powershell  
Set-NAVServerConfiguration -ServerInstance $NewBcServerInstance -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All  
```
