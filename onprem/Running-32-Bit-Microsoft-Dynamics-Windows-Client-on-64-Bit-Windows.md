---
title: "Running 32-Bit Microsoft Dynamics Windows Client on 64-Bit Windows"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1e7bf9c4-3c2b-4288-b55f-da89d940051d
caps.latest.revision: 6
---
# Running 32-Bit Microsoft Dynamics Windows Client on 64-Bit Windows
On a 64-bit version of a Windows operating system, a 64-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] runs by default. The 64-bit version is suitable for most installations. It has an advantage over the 32-bit version because of its memory allocation capabilities, which is especially useful when running several large reports. However, if an application uses 32-bit components, such as COM technologies and 32-bit .NET Framework components, these components will not work in the 64-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. In this case, you must run the 32-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
## Run the 32-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
 By default, the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is started by running the Microsoft.Dynamics.Nav.Client.exe file. This file runs the 64-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on a 64-bit Windows operating system and the 32-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on a 32-bit Windows operating system. The file is installed by the [!INCLUDE[navnow](includes/navnow_md.md)] Setup, where the default location is [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client folder. In the same location, [!INCLUDE[navnow](includes/navnow_md.md)] Setup also installs the Microsoft.Dynamics.Nav.Client.x86.exe file, which you use to run the 32-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
 To run the 32-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], do any of the following:  
  
-   Run the Microsoft.Dynamics.Nav.Client.x86.exe file directly from the installation folder or create a desktop shortcut.  
  
-   Rename the Microsoft.Dynamics.Nav.Client.exe file to Microsoft.Dynamics.Nav.Client.X64.exe, and then rename the Microsoft.Dynamics.Nav.Client.X86.exe file to Microsoft.Dynamics.Nav.Client.exe.  
  
     This sets up the 32-bit version to run from the [!INCLUDE[navnow](includes/navnow_md.md)] link in computer's **Start** menu and from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
-   If you are installing the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on multiple computers and you want them all to run the 32-bit version, then on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media \(DVD\), you can rename the .exe files as described in the previous bullet.  
  
## See Also  
 [Client Types](Client-Types.md)
