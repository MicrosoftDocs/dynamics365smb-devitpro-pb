---
title: Add Company to a Database
description: Add a new company to a Dynamics NAV database on a computer or a virtual machine by using the New-NAVCompany cmdlet of the Administration Shell.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 1bd63fec-c8b1-4ac4-b3df-d1549f591eca
caps.latest.revision: 13
---
# How to Add a Microsoft Dynamics NAV Company
This topic describes how to add a new company to a [!INCLUDE[navnow](includes/navnow_md.md)] database on a computer or virtual machine. To add a [!INCLUDE[navnow](includes/navnow_md.md)] company, you use the New-NAVCompany cmdlet of the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

> [!TIP]  
>  You can also create a company from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)]. For more information, see [How to: Create Companies](How-to--Create-Companies.md).  

### To add a [!INCLUDE[navnow](includes/navnow_md.md)] company  

1.  On the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)], run **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell** as an Administrator.  

    1.  Choose **Start**, in the **Search** box, type **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell**.  

    2.  Right-click the related link, and then choose **Run as Administrator**.  

2.  At the command prompt, type the following command:  

    ```  
    New-NAVCompany -ServerInstance <NAVServerInstance> -CompanyName <MyCompanyName>  
    ```  

     Or if you have a multitenant [!INCLUDE[navnow](includes/navnow_md.md)] deployment, then type the following command:  

    ```  
    New-NAVCompany -ServerInstance <NAVServerInstance> -CompanyName <MyCompanyName> -Tenant <TenantId>  
    ```  

     Change the following parameter values.  

    |Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------|---------------------------------------|  
    |*\<NAVServerInstance>*|Specifies the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the company uses, such as [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].|  
    |*\<MyCompanyName>*|Specifies the name of the company that you want to create. If a company with that name already exists in the [!INCLUDE[navnow](includes/navnow_md.md)] database, the cmdlet fails.|  
    |*\<TenantId>*|Specifies the ID of the tenant that the company must be created in, such as Tenant1. This parameter is required unless the specified service instance is not configured to run multiple tenants.|  

    > [!NOTE]  
    >  The command that is shown includes only a subset of all the parameters of the New-NavCompany cmdlet. For more information about the syntax and parameters, see New-NAVCompany topic in the Administration Cmdlets for [!INCLUDE[navnow](includes/navnow_md.md)] section of the Technical Reference.  

3.  Press Enter to run the cmdlet.  

     A new [!INCLUDE[navnow](includes/navnow_md.md)] company that has the specified name is created.  

## See Also  
 [Scaling the Microsoft Dynamics NAV Network Topology](Scaling-the-Microsoft-Dynamics-NAV-Network-Topology.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [How to: Add a Microsoft Dynamics NAV Web Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Web-Server-Instance.md)   
 [How to: Add a Microsoft Dynamics NAV Database](How-to--Add-a-Microsoft-Dynamics-NAV-Database.md)   
 [How to: Add a Microsoft Dynamics NAV Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Server-Instance.md)
