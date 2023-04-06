---
title: "Troubleshooting: Reports that are saved as Excel or Word files are blank"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0d2dbceb-a1e1-44ff-8d6e-2d7bc102a998
caps.latest.revision: 8
---
# Troubleshooting: Reports that are saved as Excel or Word files are blank
While you are viewing a report in **Print Preview** in the [!INCLUDE[nav_web](includes/nav_web_md.md)], you save the report as a Microsoft Excel or Microsoft Word file. When you open the saved file, it is empty.  
  
## Resolution  
 On the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you must give users read, write, and modify permission to the Temp folder of the user account that is used by the web site of the [!INCLUDE[nav_web](includes/nav_web_md.md)]. The default user account is ApplicationPoolIdentity and the folder is C:\\Users\\Web Client Application Pool\\AppData\\Local\\Temp\\.  
  
## See Also  
 [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-Microsoft-Dynamics-NAV-Web-Client-Installation.md)
