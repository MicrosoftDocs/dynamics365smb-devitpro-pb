---
title: "How to: Open Microsoft Dynamics NAV in Configuration Mode"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0a562f54-76df-4058-880b-8cdb4bab52f2
caps.latest.revision: 34
---

# How to: Open [!INCLUDE[nav_windows](includes/nav_windows_md.md)] in Configuration Mode
To configure a profile, for example to customize the profile’s user interface, you must open the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] in configuration mode.  
  
### To open the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] in configuration mode  
  
1.  At the command prompt, navigate to the root folder of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For example:  
  
    ```  
    cd navnow_x86install\RoleTailored Client  
    ```  
  
2.  Type the following command:  
  
    ```  
    Microsoft.Dynamics.Nav.Client.exe -configure -profile:"profileid"  
    ```  
  
     Replace **profileid** with the name of the profile that you want to configure.  
  
     For example, to configure the Accounting Manager profile, use this command to open the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] in configuration mode:  
  
    ```  
    Microsoft.Dynamics.Nav.Client.exe -configure -profile:"Accounting Manager"  
    ```  
  
## See Also  
 [How to: Create a Profile](how-to-create-a-profile.md)   
 [How to: Assign a User to a Profile](how-to-assign-a-user-to-a-profile.md)
