### Upgrade other web server instances

At this point, the only [!INCLUDE[webserverinstance](webserverinstance.md)] instance that's been upgraded to the new version is the one you installed earlier using the setup.exe file. If you had multiple web server instances running on the old version that you still want multiple instances, complete the following steps:

1. Save a copy of the navsettings.json and web.config file.
2. Run the [Remove-NAVWebserverInstance](/powershell/module/microsoft.dynamics.nav.management/remove-navwebserverinstance) cmdlet to delete the instance. For example:

   ```powershell
   Remove-NAVWebServerInstance -WebServerInstance MyWebServerInstance
   ```

  Replace `MyWebServerInstance`with the name of the instance you want to remove.

3. Run the [New-NAVWebserverInstance](/powershell/module/microsoft.dynamics.nav.management/new-navwebserverinstance) cmdlet to create a new instance.

   For example, the following command creates a subsite instance named **MyWebServerInstance** under the default container **Microsoft Dynamics 365 Business Central Web Client** on port 8081.

   ```powershell
   New-NAVWebServerInstance -WebServerInstance MyWebServerInstance -Server localhost -ServerInstance $BcServerInstance -SiteDeploymentType SubSite -ContainerSiteName "Microsoft Dynamics 365 Business Central Web Client" -WebSitePort 8081 -PublishFolder "C:\Program Files\Microsoft Dynamics 365 Business Central\BCNNN\Web Client"
   ```

   The `-PublishFolder` parameter specifies the path to the [!INCLUDE[webservercomponents](webservercomponents.md)] for the version. If you're working on a computer where the [!INCLUDE[webservercomponents](webservercomponents.md)] are installed, you don't have to set the `-PublishFolder` parameter.

For more information about multiple web server instances, see [Setting Up Multiple Business Central Web Server Instances](../../deployment/configure-multiple-web-server-instances.md).