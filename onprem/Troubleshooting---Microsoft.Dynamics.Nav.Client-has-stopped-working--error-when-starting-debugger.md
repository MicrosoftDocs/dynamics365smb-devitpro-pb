---
title: Microsoft.Dynamics.Nav.Client has stopped working
description: The error indicates that the Windows client cannot start, and occurs when the development environment and Windows client are running on different versions.
ms.date: 10/01/2018
ms.topic: article
ms.assetid: fd529da0-fd56-4b8f-9c1c-345a9a2dd9ab
caps.latest.revision: 2
---
# Troubleshooting: Microsoft.Dynamics.Nav.Client has stopped working - Error when starting debugger
When you try start debugger from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], you can get the following error:  
  
 **Microsoft.Dynamics.Nav.Client has stopped working.**  
  
 This error indicates that the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] cannot start. The error can occur when the version of [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] is different than the version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that debugger is starting. You can verify the versions by comparing the **Application Version** for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that is shown in details section of the error dialog box with the version of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  
  
## Resolution  
 By default, the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] starts the version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that was last installed. The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that is used by debugger is determined by the path that is specified by a protocol handler in the following registry key on the computer running the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]:  
  
 **HKEY\_CLASSES\_ROOT\\DYNAMICSNAV\\Shell\\Open\\Command**  
  
 To work around this issue, before you start debugger, change the data value of the registry key entry to the path of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that you want to use for debugging. For example, to start the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], set the value to [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\Microsoft.Dynamics.Nav.Client.exe -protocolhandler "%1".  
  
## See Also  
 [Debugging](Debugging.md)   
 [How to: Activate the Debugger from the Development Environment](How-to--Activate-the-Debugger-from-the-Development-Environment.md)