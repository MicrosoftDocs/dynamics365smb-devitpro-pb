---
title: Remote Server Administration
description: Use Server Administration tool to connect to other computers on your network where Dynamics NAV is installed and manage Server instances on those computers.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 11c18e22-79be-49d4-b068-c5d664665824
caps.latest.revision: 10
---
# How to Administer a Remote Microsoft Dynamics NAV Server Computer
You can use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to connect to other computers on your network where [!INCLUDE[navnowlong](includes/navnowlong_md.md)] is installed and manage [!INCLUDE[nav_server](includes/nav_server_md.md)] instances on those computers.  
  
> [!NOTE]  
>  In this procedure, you only administer one [!INCLUDE[nav_server](includes/nav_server_md.md)] computer at a time. To administer multiple [!INCLUDE[nav_server](includes/nav_server_md.md)] computers from a single instance of [!INCLUDE[nav_admin](includes/nav_admin_md.md)], see [How to: Administer Multiple Microsoft Dynamics NAV Server Computers](How-to--Administer-Multiple-Microsoft-Dynamics-NAV-Server-Computers.md).  
  
### To connect to a remote [!INCLUDE[nav_server](includes/nav_server_md.md)] computer  
  
1.  Verify that the administrator who will be connecting to the remote computer is a member of that computer’s Administrators group.  
  
2.  On the remote computer, open a Windows PowerShell command prompt with administrative credentials. Choose **Start**, choose **Accessories**, right-click **Windows PowerShell**, and then choose **Run as administrator**.  
  
     Windows PowerShell is included in Windows 7, Windows 8, Windows Server 2008 R2 and Windows Server 2012, and can be installed on other Windows operating systems. For more information, see [Windows PowerShell](https://go.microsoft.com/fwlink/?LinkId=211847) in the TechNet Library.  
  
3.  At the Windows PowerShell command prompt, type `Enable-PSRemoting`, and then answer **Yes** to all prompts.  
  
4.  Close the Windows PowerShell command prompt window.  
  
5.  Start the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  
  
     For detailed instructions on starting [!INCLUDE[nav_admin](includes/nav_admin_md.md)], see "Running the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]" in [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  
  
6.  In the tree view pane, choose a [!INCLUDE[nav_server](includes/nav_server_md.md)] computer, and then choose **Connect to Another Computer** in the right pane.  
  
    > [!IMPORTANT]  
    >  The **Connect to Another Computer** command is only available when a computer instead of a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is selected in the tree view pane.  
  
7.  In the **Connect to another computer** dialog box, type the name of the remote computer in the **Server Name** box, and then choose **OK**.  
  
     The tree view changes to show [!INCLUDE[nav_server](includes/nav_server_md.md)] instances on the remote computer.
