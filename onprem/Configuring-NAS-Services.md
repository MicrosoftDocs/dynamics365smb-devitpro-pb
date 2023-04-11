---
title: "Configuring NAS Services"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 50124e1e-d04b-464c-83dd-6509886c117f
caps.latest.revision: 31
---
# Configuring NAS Services
NAS services are a middle-tier server component that executes business logic without a user interface or user interaction. NAS services in [!INCLUDE[nav_server](includes/nav_server_md.md)] support applications such as Microsoft Office Outlook Integration and the NAV Job Queue.  

 NAS stands for NAV Application Server, which was a component in earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)]. NAS services replace the NAS component, and this requires you to modify any use of server-side COM. For more information, see [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md).  

## Run NAS Services Applications in Dedicated Server Instances  
 It is recommended that you create a separate [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for each NAS services application. See [How to: Create a Microsoft Dynamics NAV Server Instance](How-to--Create-a-Microsoft-Dynamics-NAV-Server-Instance.md).  

 There are multiple reasons for running NAS services sessions in dedicated [!INCLUDE[nav_server](includes/nav_server_md.md)] instances:  

-   **Efficiency and convenience**  

     When you change any [!INCLUDE[nav_server](includes/nav_server_md.md)] setting, you must restart the instance for the change to take effect, which interrupts all services using that instance. So if you are running different types of services in the same instance—for example, [!INCLUDE[rtc](includes/rtc_md.md)] services and NAS services—making a change to the settings for either service type will require a server instance restart that interrupts all other service types running through that instance.  

     Even for different types of NAS services applications it’s wise to run each application in a separate server instance. For example, if you will be using NAS services for a Microsoft Office Outlook Integration application and also for a [!INCLUDE[navnow](includes/navnow_md.md)] job queue application, create a separate [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for each NAS services application. This way, if you need to modify settings for the Microsoft Office Outlook Integration application you will not affect the [!INCLUDE[navnow](includes/navnow_md.md)] job queue application, and vice-versa.  

-   **Performance**  

     Configuring NAS services applications to use separate server instances makes better use of the server computer’s resources, allowing you to run more applications with less degradation.  

-   **Efficient error tracking**  

     If a NAS services session terminates in an error, and there are no other services running on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, the service instance terminates and can be handled like any other Windows service. For example, you could configure the Recovery tab on the Service configuration tool in Control Panel to restart or otherwise manage the service.  

## Configuring NAS Services Settings  
 You can configure NAS services by using the settings in [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. In a multitenent [!INCLUDE[nav_server](includes/nav_server_md.md)] instance deployment, some NAS services settings, such as enabling NAS services and running NAS services with admin rights, are specified when you mount the tenant on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

#### To configure NAS Services  

1.  Start the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], and open the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance configuration.  

     For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  

2.  On the **NAS Services** tab, fill in the settings.  

     For more information about the settings, see [NAS Services Tab Settings](Configuring-Microsoft-Dynamics-NAV-Server.md#NASServices).  

    > [!IMPORTANT]  
    >  On the **General** tab, the **Services Default Company** specifies the default company that is used by NAS Services and also other types of client connections.  
    >   
    >  NAS services sessions execute in the time zone specified by the **ServicesDefaultTimeZone** parameter for [!INCLUDE[nav_server](includes/nav_server_md.md)].  
    >   
    >  For more information about these settings, see [General Tab Settings](Configuring-Microsoft-Dynamics-NAV-Server.md#General).  

3.  If the [!INCLUDE[nav_server](includes/nav_server_md.md)] is a configured as a multitenant server, mount the tenant to configure the NAS services settings for the tenant.  

     For more information, see [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](How-to--Mount-or-Dismount-a-Tenant-on-a-Microsoft-Dynamics-Server-Instance.md).  

4.  Save the changes and restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

5.  If you chose not to run NAS services with admin rights, add the service account for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to be a user in [!INCLUDE[navnow](includes/navnow_md.md)].  

     For more information, [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).  

## NAS Services and Languages  
 In multilanguage deployments of [!INCLUDE[navnow](includes/navnow_md.md)], the language preferences and regional settings for the user account that NAS services settings runs as determine the formatting of the data. Language preferences for a user account can be set in Windows or in [!INCLUDE[navnow](includes/navnow_md.md)]. For example, in [!INCLUDE[navnow](includes/navnow_md.md)], in the **User Personalization Card** window, you can specify a language for the user. But you can also set up a default language for the [!INCLUDE[navnow](includes/navnow_md.md)] deployment by creating an empty row in the **User Personalization List** window. If you create an entry where you specify a language but not a user ID, then NAS services will use that language unless the session runs with a user account where you have specified another language.  

 The following table illustrates how combinations of language personalization and regional settings impact data that a NAS services session processes. In this example, the NAS services session runs a computer where the regional settings are set to use the Spanish format. In [!INCLUDE[navnow](includes/navnow_md.md)], the user account that the NAS services session runs as either has a language personalization or not.  

|Regional settings format|User personalization language ID|Generic personalization language ID|NAS services language and format|  
|------------------------------|--------------------------------------|-----------------------------------------|--------------------------------------|  
|Spanish \(Spain\)|3086||8036 and Spanish \(Spain\)|  
|Spanish \(Spain\)|||1033 and Spanish \(Spain\)|  
|Spanish \(Spain\)||8036|8036 and Spanish \(Spain\)|  

## Retry Behavior After Failure
If the NAS service fails, and it is not stopped, then it is automatically restarted according to the following intervals:
-   Immediately for the first three attempts
-   Every 30 minutes after the third attempt
-   Every 60 minutes after the sixth attempt.

## See Also  
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Client Types](Client-Types.md)   
 [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md)   
 [Administration](Administration.md)
