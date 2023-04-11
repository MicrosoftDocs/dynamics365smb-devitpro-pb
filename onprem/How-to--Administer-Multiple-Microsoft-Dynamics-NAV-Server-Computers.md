---
title: Administer Multiple Server Computers
description: Launch Microsoft Management Console (MMC) and configure multiple Dynamics NAV Server computers from a single instance of the Server Administration tool.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0431dd5f-98d1-47e4-b426-8dbe97b19fe2
caps.latest.revision: 17
---
# How to Administer Multiple Microsoft Dynamics NAV Server Computers
This procedure describes how to administer multiple [!INCLUDE[nav_server](includes/nav_server_md.md)] computers from a single instance of the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. In this procedure, you start the Microsoft Management Console \(MMC\) and then configure it to administer multiple [!INCLUDE[nav_server](includes/nav_server_md.md)] computers. If you start the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] from Control Panel or the Start menu, then you can only connect to a single [!INCLUDE[nav_server](includes/nav_server_md.md)] computer at a time. For more information, see [How to: Administer a Remote Microsoft Dynamics NAV Server Computer](How-to--Administer-a-Remote-Microsoft-Dynamics-NAV-Server-Computer.md)  
  
### To configure MMC to connect to multiple [!INCLUDE[nav_server](includes/nav_server_md.md)] computers  
  
1.  Verify that the administrator who will be connecting to the remote computer is a member of that computer’s Administrators group.  
  
2.  On each remote computer, open a Windows PowerShell command prompt with administrative credentials. Choose **Start**, choose **Accessories**, right-click **Windows PowerShell**, and then choose **Run as administrator**.  
  
     Windows PowerShell is included in Windows 7, Windows 8, Windows Server 2008 R2, and Windows Server 2912 and can be installed on other Windows operating systems. For more information, see [Windows PowerShell](https://go.microsoft.com/fwlink/?LinkId=211847) in the TechNet Library.  
  
3.  On each remote computer, at the Windows PowerShell command prompt, type `Enable-PSRemoting`, and then answer **Yes** to all prompts.  
  
4.  On the local [!INCLUDE[nav_server](includes/nav_server_md.md)] computer, choose **Start**, choose **Run**, and then enter the following command to run the Microsoft Management Console:  
  
    ```  
    mmc  
    ```  
  
5.  In the Management Console, on the **File** menu, choose **Add/Remove Snap-in** to open the **Add or remove Snap-ins** dialog box.  
  
6.  In the **Available snap-ins** list, double-click **Microsoft Dynamics NAV**.  
  
7.  In the **Connect to another computer** dialog box, type the name of a [!INCLUDE[nav_server](includes/nav_server_md.md)] computer in the **Server Name** box, and then choose **OK**.  
  
8.  Double-click **Microsoft Dynamics NAV** again, and then enter the name of a different [!INCLUDE[nav_server](includes/nav_server_md.md)] computer in the **Server Name** box. Choose **OK**.  
  
     You can also accept the default value, which is **\(Local\)**, if this is one of the [!INCLUDE[nav_server](includes/nav_server_md.md)] computers that you will be administering.  
  
9. Continue selecting [!INCLUDE[nav_server](includes/nav_server_md.md)] computers as needed. When you are finished selecting computers, choose **OK** to close the **Add or remove Snap-ins** dialog box.  
  
     Now you see multiple [!INCLUDE[nav_server](includes/nav_server_md.md)] computers listed in the tree view pane of the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]:  
  
    > [!TIP]  
    >  When you close MMC, you are prompted to save your settings to a Microsoft Management Console \(.msc\) file. If you save your settings, then you can use this file to open MMC with your [!INCLUDE[nav_server](includes/nav_server_md.md)] computers already listed  
  
## See Also  
 [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md)
