---
title: "Troubleshooting: Visual Studio Report Designer provided metadata is not valid"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: dff1ed92-0a1d-4191-a443-c159c2cdc9a1
caps.latest.revision: 11
---
# Troubleshooting: Visual Studio Report Designer provided metadata is not valid
You cannot open Visual Studio Report Designer and get the following error:  
  
 **The provided metadata is not valid.**  
  
 This error can occur when the following conditions are true:  
  
-   You are using Windows 7 or Windows Vista and User Access Control \(UAC\) is turned on.  
  
-   The executable file that runs the Visual Studio development environment \(devenv.exe\) is set to run as an administrator.  
  
-   The executable file that runs the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] \(finsql.exe\) is not set to run as an administrator.  
  
 To resolve this issue, set both finsql.exe and devenv.exe to run as an administrator.  
  
### To set a program to run as an administrator  
  
1.  Right-click the .exe file, and then select **Properties**.  
  
2.  In the **Properties** window, on the **Compatibility** tab, in the **Privilege Level** section, select **Run this program as an administrator**.  
  
## See Also  
 [How to: Integrate Report Dataset Designer and Visual Studio Report Designer](How-to--Integrate-Report-Dataset-Designer-and-Visual-Studio-Report-Designer.md)
