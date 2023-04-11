---
title: Create Server Instance
description: A Server contains a single instance by default. To create additional instances, install Server on computers or create other instances on the original Server.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cdd7aa24-38cd-4c42-99d0-7003cb9b49f4
caps.latest.revision: 9
---
# How to: Create a Microsoft Dynamics NAV Server Instance
A [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is the service through which the various types of [!INCLUDE[navnow](includes/navnow_md.md)] clients interact with the [!INCLUDE[navnow](includes/navnow_md.md)] SQL Server database. When you install [!INCLUDE[nav_server](includes/nav_server_md.md)] on a computer, there is initially a single default instance. If your organization requires additional instances, then you can either install [!INCLUDE[nav_server](includes/nav_server_md.md)] on additional computers or create additional instances on the original [!INCLUDE[nav_server](includes/nav_server_md.md)] computer. In this procedure, you create a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  
  
### To create a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance  
  
1.  Open the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. Choose **Start**, and in the **Search programs and files** box, enter **Microsoft Dynamics NAV Administration**, and then choose the related link.  
  
2.  In the tree view, which is the left pane, select the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer where you want to add an instance. This is typically the local computer, which is **Microsoft Dynamics NAV \(local\)**. For more information about remote administration, see [How to: Administer a Remote Microsoft Dynamics NAV Server Computer](How-to--Administer-a-Remote-Microsoft-Dynamics-NAV-Server-Computer.md).  
  
3.  Right-click the computer name, and then choose **Add Instance**.  
  
4.  Supply the required values in the **Server instance settings** section for the new instance.  
  
    > [!NOTE]  
    >  Each instance on a computer must have unique values for these settings.  
  
5.  Supply the required values in the **Log on Account** section, and then specify the computer account that will run the instance in the **Service Account** field. You can select the Network Service account or a domain user account If you select **Network Service** in the **Service Account** field, then you do not have to specify values for the **User name**, **Domain**, and **Password** fields.  
  
    > [!IMPORTANT]  
    >  Using the Network Service account to run a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is considered less secure because this account is a shared account that can be used by other unrelated network services. Any user who has rights to the Network Service account also has rights to other services that are running on this account. Running [!INCLUDE[nav_server](includes/nav_server_md.md)] instances under a dedicated domain user account, which is an account that is used only for [!INCLUDE[navnow](includes/navnow_md.md)] components, is more secure but does require a domain administrator to set up and provision the account.  
  
## See Also  
 [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md)
