---
title: "How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance"
author: edupont04
ms.custom: na
ms.date: 10/14/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2d7c114d-381b-4270-9bed-9b1930627df4
caps.latest.revision: 17
---
# How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance
If a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured for multitenancy, then you can mount and dismount tenant databases by using the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or **Mount-NAVTenant** or **Dismount-NAVTenant** cmdlets in [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

 Mounting a tenant by using the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] requires that you have a running [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. This is not required when you use the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]. With the **Mount-NAVTenant**, you can mount a tenant by either specifying the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, if it is running, or the application database.  

 This topic describes how to use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to mount or dismount a tenant. For more information about how to use the [!INCLUDE[nav_shell](includes/nav_shell_md.md)], see [Mount-NAVTenant](https://go.microsoft.com/FwLink/?LinkId=401372) and [Dismount-NAVTenant](https://go.microsoft.com/FwLink/?LinkId=401354).  

### To mount or dismount a tenant  

1.  Open the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  

    1.  Choose **Start**, and in the **Search programs and files** box, type **Microsoft Dynamics NAV Administration**, and then choose the related link.  

2.  Verify that the [!INCLUDE[nav_server](includes/nav_server_md.md)] that you want to mount the tenant on is running, and if not, then start it:  

    1.  In the left pane of [!INCLUDE[nav_admin](includes/nav_admin_md.md)], choose a [!INCLUDE[nav_server](includes/nav_server_md.md)] computer. Unless you are administering a remote computer, this is **Microsoft Dynamics NAV \(local\)**.  

    2.  In the center pane, if the **Status** of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is **Stopped**, then right-click it, and then choose **Start**.  

3.  In the left pane, expand item for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance on which you want to mount the tenant, and then choose the **Tenants** item.  

4.  To mount a tenant, in the **Actions** pane, choose **Mount Tenant**, fill in the parameters on the **Mount Tenant** dialog box, and then choose the **OK** button.  

     The following table describes the parameters on the **Mount Tenant** dialog box.  

    |Setting|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|Required|  
    |-------------|---------------------------------------|--------------|  
    |ID|Specifies the ID of the tenant to mount. If the tenant database has not been mounted on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance before, then you can specify any ID that you want that is not being used. This ID is then assigned to the database. The ID cannot be used by another tenant database and must comply with the following rules:<br /><br /> -   Contains only letters \(Aa-Zz\), numbers \(0-9\), or dashes \(-\). **Note:**      The ID is not case sensitive.<br />-   Does not start or end with a dash \(-\).<br />-   Less than 63 characters. **Important:**  If the database is the first tenant database ever to be mounted on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, then you must set the value to **default** or select the **Overwrite Tenant ID in the Database** check box, and then specify an ID according to the previous rules. <br /><br /> If the tenant database has been mounted in a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance before, then you must specify the tenant ID that is assigned to that database or specify another ID and select the **Overwrite Tenant ID in the Database** check box.|Yes|  
    |Database Name|Specifies the name of the [!INCLUDE[navnow](includes/navnow_md.md)] database that you want to mount on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For example, to mount the [!INCLUDE[demolong](includes/demolong_md.md)], specify **Demo Database NAV \(10-0\)**.|Yes|  
    |Database Server|Specifies the network name of the computer that is running SQL Server and the SQL Server database instance to connect to. You specify the value by using the format ComputerName\\SQLServerInstance. The default database instance for [!INCLUDE[navnow](includes/navnow_md.md)] is NAVDEMO.|No|  
    |Alternate Tenant IDs|Specifies the alternative IDs for the tenant, such as host names for the [!INCLUDE[nav_web](includes/nav_web_md.md)], SOAP web services, OData web services, or the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].<br /><br /> If you use alternative IDs for tenant resolution in the [!INCLUDE[nav_web](includes/nav_web_md.md)], you must also enable some of the UrlRewrite rules in the web.config file for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].|No|  
    |Allow Application Database Writes|Specifies whether the tenant can write to the application database.<br /><br /> You must create at least one tenant that has write access to the application database.|No|  
    |Enable NAS Services|Specifies whether NAV Application Server services are enabled for the tenant. For more information about NAS, see [Configuring NAS Services](Configuring-NAS-Services.md).|No|  
    |Run NAS Services with Admin Rights|Specifies whether NAS services run operations with administrator rights instead of the rights that are granted to the [!INCLUDE[nav_server](includes/nav_server_md.md)] service account.<br /><br /> -   If you select this setting, NAS services will have full permissions in [!INCLUDE[navnow](includes/navnow_md.md)], similar to the permissions that are granted by the SUPER permission set. The [!INCLUDE[nav_server](includes/nav_server_md.md)] service account is not required to be set up as a user in [!INCLUDE[navnow](includes/navnow_md.md)].<br />-   If you clear this setting, the [!INCLUDE[nav_server](includes/nav_server_md.md)] service account must be added as a user in [!INCLUDE[navnow](includes/navnow_md.md)] and assigned the permissions that are required to perform the operations.|No|  
    |Default Company|Specifies the default [!INCLUDE[navnow](includes/navnow_md.md)] company for the tenant. A tenant can contain several companies. This is the company that opens by default in [!INCLUDE[navnow](includes/navnow_md.md)] client.|No|  
    |Default Time Zone|Specifies the default time zone in which web service and NAS services calls on the tenant are run. You can specify the following values:<br /><br /> -   **UTC** - All business logic for web services and NAS services on the server instance runs in Coordinated Universal Time \(UTC\). This is how all web services business logic was handled in Microsoft Dynamics NAV 2009 and Microsoft Dynamics NAV 2009 SP1.<br />-   **Server Time Zone** - Services use the time zone of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].<br />-   \<ID of any time zone recognized by the current version of Windows> - Specifies any Windows time zone as defined in the system registry under HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Time Zones. For example, **Romance Standard Time**.|No|  
    |Database User Name|You use this setting, together with the **ProtectedDatabasePassword** setting, to configure SQL Server authentication with the tenant database in SQL Server.<br /><br /> This setting specifies the login name of the user account in the database that you want to use for authentication.|No|  
    |Database Password|You use this setting, together with the **DatabaseUserName** setting, to configure SQL Server authentication with the tenant database in SQL Server.<br /><br /> This setting specifies the login password of the user account in the database that you want to use for authentication.|No|  
    |Exchange Auth. Metadata Location|Specifies the URLs for Microsoft Exchange authentication metadata document of the services or authorities that are trusted to sign incoming Exchange identity tokens. The value of this field will overrule the **Exchange Auth. Metadata Location** setting on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, if any.<br /><br /> This setting is used by the [!INCLUDE[navnow](includes/navnow_md.md)] Outlook add-in to confirm the identity of the signing authority when using Exchange Authentication. The URLs are compared to the Exchange authentication metadata document URLs in the Exchange identity token. The scheme and host part of the two URLs must match to pass authentication. Paths in the URLs require only a partial match.<br /><br /> Value:<br /><br /> -   One or more valid URLs. A URL must include the scheme, such as http:// or https://, and the host name.<br />-   Separate multiple URLs with a comma.<br />-   Wildcards \(\*\) in URLs are supported.<br /><br /> Default: https://outlook.office365.com/||  
    |Overwrite Tenant ID in Database|Specifies whether to overwrite the tenant ID in the database if the database has been mounted as a tenant earlier. Select this check box if you want to use the tenant ID that is specified in the ID parameter instead of the tenant ID in the database that you are mounting to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. If you clear this check box, and the tenant database has previously been mounted with a different tenant ID, an error will occur.|No|  
    |Synchronization Mode|Specifies how the database schema for the tenant database is synchronized with the database schema that the mounted application database defines. The default value is **Synchronize**. You can select one of the following values.<br /><br /> -   **Synchronize without confirmation** - The database schema in the tenant database is updated with the application database schema even if data is lost. For example, if a table or a field has been deleted in the current application, the table or field is removed from the tenant database even if it contains data.<br />-   **Do not allow changes** - If the database schema in the tenant database differs from the current application, the tenant cannot be mounted against the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.<br />-   **Synchronize** - The database schema in the tenant database will be updated unless data is lost. For example, if a table or a field has been deleted in the current application, and it contains data in the tenant database, the tenant cannot be mounted against the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.<br />-   **Check only** - [!INCLUDE[nav_server](includes/nav_server_md.md)] tests if a change in the current application will cause data loss in the tenant database if the tenant is mounted with **Synchronization Mode** set to **ForceSync**. For example, if a table or a field has been deleted in the current application and it contains data in the tenant database.|No|  

5.  To save the changes, choose the **OK** button.  

     If you specified the **DatabaseUserName** and **ProtectedDatabasePassword** settings for SQL Server authentication, on the **Enable Encryption on SQL Server Connections** dialog box, choose the **OK** button.  

     Encryption keys are to secure the login credentials over the connection between the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server.  

6.  Choose the **OK** button to save the changes.  

### To dismount a tenant  

-   In the center pane, right-click the tenant, and then choose **Dismount Tenant**.  

## See Also  
 [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md)   
 [How to: Start, Stop, Restart, or Remove a Microsoft Dynamics NAV Server Instance](How-to--Start--Stop--Restart--or-Remove-a-Microsoft-Dynamics-NAV-Server-Instance.md)   
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)
