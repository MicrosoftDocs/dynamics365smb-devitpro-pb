---
title: Adding a Server Instance
description: Add a new Dynamics NAV Server instance to an existing Server installation by using the New-NAVServerInstance cmdlet of the Administration Shell.
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 41737923-616d-416d-b215-d4a6ac75746f
caps.latest.revision: 11
---
# How to Add a Microsoft Dynamics NAV Server Instance
This topic describes how to add a new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to an existing [!INCLUDE[nav_server](includes/nav_server_md.md)] installation. To add a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, you use the New-NAVServerInstance cmdlet of the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

 You specify the name for the instance, the [!INCLUDE[navnow](includes/navnow_md.md)] database to connect to, and the TCP ports for the following services:  

-   Management services port  

     This specifies the TCP port for the [!INCLUDE[nav_server](includes/nav_server_md.md)] Administration tool.  

-   Client services port  

     This specifies TCP port for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)].  

-   SOAP web services port.  

-   OData web services port.  

> [!TIP]  
>  You can also add [!INCLUDE[nav_server](includes/nav_server_md.md)] instances by using the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. For more information, see [How to: Create a Microsoft Dynamics NAV Server Instance](How-to--Create-a-Microsoft-Dynamics-NAV-Server-Instance.md).  

### To add a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance  

1.  On the computer or virtual machine that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], run **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell** as an Administrator.  

    1.  Choose **Start**, in the **Search** box, type **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell**.  

    2.  Right-click the related link, and then choose **Run as Administrator**.  

2.  At the command prompt, type the following command:  

    ```  
    New-NAVServerInstance <MyInstance> -ServiceAccount <ServiceAccount> -ManagementServicesPort <PortNumber> -ClientServicesPort <PortNumber> -SOAPServicesPort <PortNumber> -ODataServicesPort <PortNumber> -DatabaseInstance <DatabaseInstance> -DatabaseName <DatabaseName> -DatabaseServer <DatabaseServer>  
    ```  

     Change the following parameter values.  

    |Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------|---------------------------------------|  
    |*\<MyInstance>*|Specifies the name that you want to give the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.|  
    |*\<ServiceAccount>*|Specifies the Windows account to use to log on to the [!INCLUDE[nav_server](includes/nav_server_md.md)].|  
    |*\<PortNumber>*|Specifies the TCP port number to use for the associated service.|  
    |*\<DatabaseInstance>*|Specifies the name of the SQL Server database instance to connect to.<br /><br /> If you are connecting to the same database instance as the existing [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, then you can omit this parameter and value.|  
    |*\<DatabaseName>*|Specifies the name of the [!INCLUDE[navnow](includes/navnow_md.md)] database.|  
    |*\<DatabaseServer>*|Specifies the name of the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server. The name has the *domain\\computername* format.<br /><br /> If you are connecting to the same database as the existing [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, then you can omit this parameter and value.|  

    > [!NOTE]  
    >  The command that is shown includes only a subset of the parameters of New-NAVServerInstance cmdlet. For more information about the syntax and parameters, see New-NAVServerInstance topic in the Administration Cmdlets for [!INCLUDE[navnow](includes/navnow_md.md)] section of the Technical Reference.  

3.  Press Enter to run the cmdlet.  

     A new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance with the specified name is added on the virtual machine in the [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Instances folder.  

    > [!NOTE]  
    >  If you want to change the configuration of the new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance after it has been added, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

## Example  
 The following example creates a new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. It will enable communication on the service ports through the Windows Firewall.  

```  
New-NAVServerInstance MyNavInstance -ServiceAccount NetworkService -ManagementServicesPort 8099 -ClientServicesPort 8100 -SOAPServicesPort 8101 -ODataServicesPort 8102 -verbose  
```  

## See Also  
 [Scaling the Microsoft Dynamics NAV Network Topology](Scaling-the-Microsoft-Dynamics-NAV-Network-Topology.md)   
 [Microsoft Dynamics NAV Server](Microsoft-Dynamics-NAV-Server.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [How to: Add a Microsoft Dynamics NAV Web Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Web-Server-Instance.md)   
 [How to: Add a Microsoft Dynamics NAV Database](How-to--Add-a-Microsoft-Dynamics-NAV-Database.md)   
 [How to: Add a Microsoft Dynamics NAV Company](How-to--Add-a-Microsoft-Dynamics-NAV-Company.md)
