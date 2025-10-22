---
author: jswymer
ms.topic: include
ms.date: 10/21/2025
ms.author: jswymer
ms.reviewer: jswymer
---
After you upgrade your application, we recommend changing the value of application build number that shows on the Help and Support page to match the new current version. This version isn't updated automatically. Displaying the updated version in Help and Support page is useful for support purposes and helps answer common questions about the application. Learn more about version numbers in [Version numbers in Business Central](../../administration/version-numbers.md).

The [!INCLUDE[server](server.md)] includes a configuration setting called **Solution Version Extension** (SolutionVersionExtension). This setting lets you specify an extension whose version number displays as the Application Version on the client's **Help and Support** page. Typically, you'd use the extension considered to be your solution's base application. You set **Solution Version Extension** to ID of the extension. For example, if your solution uses the Microsoft Base Application, set the value to `437dbf0e-84ff-417a-965d-ed2bb9650972`.

To set **Solution Version Extension**, use [Set-NAVServerConfiguration](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) cmdlet of the [!INCLUDE[admin shell](adminshell.md)].

The following example uses the Set-NAVServerConfiguration cmdlet to set the **Solution Version Extension** to the Microsoft Base Application:

```powershell  
Set-NAVServerConfiguration -ServerInstance $NewBcServerInstance -KeyName SolutionVersionExtension -KeyValue "437dbf0e-84ff-417a-965d-ed2bb9650972" -ApplyTo All  
```
