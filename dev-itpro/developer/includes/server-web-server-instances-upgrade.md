### Business Central server and web server instances

The steps in this article will delete the default [!INCLUDE[server](server.md)] and [!INCLUDE[webserverinstance](webserverinstance.md)] of the old version. The default instances are those instances that were created using the Business Central Setup (setup.exe) program. A new [!INCLUDE[server](server.md)] and [!INCLUDE[webserverinstance](webserverinstance.md)] instance that run on the new platform will be added to replace the old ones.

Your current deployment, however, may using multiple [!INCLUDE[server](server.md)] or [!INCLUDE[webserverinstance](webserverinstance.md)] instances. If, so you might need to do some extra tasks at the end of the process for each instance:

- With [!INCLUDE[server](server.md)] instances, all extra instances, like the new default instance, will automatically use new platform assemblies and file installed by the setup program. The only task you might have to do on the extra instances is to modify some configuration file settings (.config).

- Extra [!INCLUDE[webserverinstance](webserverinstance.md)] instances aren't upgraded automatically. With these instances, you'll have to remove the old instances, then create new instances using the latest platform.