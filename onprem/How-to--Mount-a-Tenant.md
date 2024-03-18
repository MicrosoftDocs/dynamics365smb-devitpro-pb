---
title: "How to: Mount a Tenant"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 81caea90-e090-412a-997a-25b9e78dab96
caps.latest.revision: 4
---
# How to: Mount a Tenant
This topic describes how to mount a tenant database on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance in a multitenant [!INCLUDE[navnow](includes/navnow_md.md)] deployment. To mount a tenant database, you use the Mount-NAVTenant cmdlet of the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

> [!TIP]  
>  You can also mount a tenant by using the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. For more information, see [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](How-to--Mount-or-Dismount-a-Tenant-on-a-Microsoft-Dynamics-Server-Instance.md).  

### To mount a tenant database on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instances  

1.  On the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)], run **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell** as an Administrator.  

    1.  Choose **Start**, in the **Search** box, type **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell**.  

    2.  Right-click the related link, and then choose **Run as Administrator**.  

2.  At the command prompt, type the following command:  

    ```  
    Mount-NAVTenant [-ServerInstance] <NAVServerInstance> -DatabaseName <NAVDatabase> -DatabaseServer <MyDatabaseServer  
    ```  

     Change the following parameter values.  

    |Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------|---------------------------------------|  
    |*\<NAVServerInstance>*|Specifies the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that you want to mount the tenant against, such as [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].|  
    |*\<NAVDatabase>*|Specifies the name of the [!INCLUDE[navnow](includes/navnow_md.md)] database that you want to mount against the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, such as `'Demo Database NAV (7-1)'`.|  
    |*\<MyDatabaseServer>*|Specifies the name of the database server that hosts the [!INCLUDE[navnow](includes/navnow_md.md)] database that you want to mount against the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.|  

    > [!NOTE]  
    >  The command that is shown includes only a subset of all the parameters of the Mount-NavTenant cmdlet. For more information about the syntax and parameters, see Mount-NAVTenant topic in the Administration Cmdlets for [!INCLUDE[navnow](includes/navnow_md.md)] section of the Technical Reference.  

3.  Press Enter to run the cmdlet.  

     The tenant database is mounted on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

## See Also  
 [Scaling the Microsoft Dynamics NAV Network Topology](Scaling-the-Microsoft-Dynamics-NAV-Network-Topology.md)   
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)   
 [Migrating to Multitenancy](Migrating-to-Multitenancy.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [How to: Add a Microsoft Dynamics NAV Web Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Web-Server-Instance.md)   
 [How to: Add a Microsoft Dynamics NAV Database](How-to--Add-a-Microsoft-Dynamics-NAV-Database.md)   
 [How to: Add a Microsoft Dynamics NAV Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Server-Instance.md)
