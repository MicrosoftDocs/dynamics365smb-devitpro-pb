## Save copies of server configuration files

It's a good idea to save copies of the configuration files for the [!INCLUDE[server](server.md)] instance (CustomSettings.config) and [!INCLUDE[webserverinstance](webserverinstance.md)] instances (navsettings.json and web.config). Having copies will help you configure the components after upgrade to match the setup you had before upgrade.

- For the [!INCLUDE[server](server.md)] instance, the default location of the CustomSettings.config file is C:\Program Files\Microsoft Dynamics 365 Business Central\NNN\Service.

- For the [!INCLUDE[webserverinstance](webserverinstance.md)] instances, the navsettings.json file is in the physical path of the web server instance. By default, the path is *C:\\inetpub\\wwwroot\\[WebServerInstanceName]* on the computer's hard drive. *[WebServerInstanceName]* corresponds to the name (alias) of the web server instance in IIS, for example, *C:\inetpub\\wwwroot\\BCNNN]*. The web.config file that is located in the physical path of the web application for the [!INCLUDE[webclient](webclient.md)]. The path is *rootdrive\\inetpub\\wwwroot\\\[VirtualDirectoryName\]\\*. For example, the folder for the default [!INCLUDE[webclient](webclient.md)] application is *C:\\inetpub\\wwwroot\\BCNNN\\*.

   *BCNNN* indicates the name of the [!INCLUDE[server](server.md)] instance chosen during setup.