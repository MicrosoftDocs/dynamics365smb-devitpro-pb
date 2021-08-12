---
title: Full Upgrade from Business Central version 14.0 to version 15.0 
description: The article explains how to upgrade the application code and how to merge code from different versions of the application.
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
ROBOTS: NOINDEX
---
# Upgrade Customized Version 14.0 Application to Version 15.0 Base Application

> [!IMPORTANT]  
> [!INCLUDE[vnext_preview](../developer/includes/vnext_preview.md)] 
>
> Please note that this topic is a draft in progress. We are still working on adding more details to the steps described in this topic.

Use this process when you have a customized Business Central application that you want to upgrade to the Business Central Wave 2 application and platform. With this process, you will convert the entire application from C/AL to AL and refactor to use the system application layer extension.

<!-- For this scenario, I used a BC 14.0 modified base application on a BC 14.0 server instance, which include some customization on C/AL objects in the base application and a custom extension that modified the Item table. is proecess will convert the entire BC 14 custom application to an Extension on the BC 15 platform.-->

 ![Upgrade on customized Business Central application.](../developer/media/bc15-full-upgrade-customized-app.png "Upgrade on customize Business Central application")  
 
 

#### Single-tenant and multitenant deployments

The process for upgrading the very similar for a single-tenant and multitenant deployment. However, there are some inherent differences because with a single-tenant deployment, the application and business data are included in the same database, while with a multitenant deployment application code is in a separate database (the application database) than the business data (tenant). In the procedures that follow, for a single-tenant deployment, consider references to the *application database* and *tenant database* as the same database. Steps are marked as *Single-tenant only* or *Multitenant only* where applicable.

## Prerequisites

1.  Upgrade to the latest Business Central Spring 2019 Cumulative Update (version 14.0). For more information, see [Upgrading to Dynamics 365 Business Central On-Premises](upgrading-to-business-central-on-premises.md)

2. Install [!INCLUDE[prodlong](../developer/includes/prodlong.md)] 2019 release wave 2 (version 15.0)

    1. Before you install version 15.0, it can be useful to create desktop shortcuts to the the version 14.0 tools, such as the [!INCLUDE[admintool](../developer/includes/admintool.md)], [!INCLUDE[adminshell](../developer/includes/adminshell.md)], and [!INCLUDE[devshell](../developer/includes/devshell.md)] because the Start menu items for these will be replaced with the version 15.0 tools.
    
    2. Install all components of Business Central 2019 release wave 2 (version 15).
    
        If you did not uninstall version 14.0, then you must either specify different port numbers for components (like the [!INCLUDE[server](../developer/includes/server.md)] instance and web services) during installation, or you must stop the version 14.0 [!INCLUDE[server](../developer/includes/server.md)] instance before you run the installation. Otherwise, you will get an error that the [!INCLUDE[server](../developer/includes/server.md)] failed to install.
    
        > [!IMPORTANT]
        > Because of dependencies, we recommend that for upgrade , you install all components available. Also, there is currently a known issue with the Microsoft.Office.Interop.Word.dll. After installation, you must copy the Microsoft.Office.Interop.Word.dll from the C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\RoleTailored Client folder to the C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\Add-ins folder.
    
        For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).
    
## Upgrade Application Code

1. Convert your version 14 application from C/AL to AL

    The first thing to do is convert your solution from C/AL to AL. For more information, see [Code Conversion from C/AL to AL](devenv-code-conversion.md).

3. Uptake System Application

    In version 15.0, application functionality that is not related to the business logic has been moved into separate modules that are combined into an extension known as the System Application.
    
    In general, uptaking the system application involves the following steps:
    
    1. Remove the version 14 objects that are replaced by objects in the System application objects from base application. If you have any custom code in these objects, you will have to move the code to the base application or extensions if you still want  the functionality.
    
    2. Refactor your customized code in the base application to use system application.
    
    For more information, see [Overview of the System Application](../developer/devenv-system-application-overview.md).

4. Move code customizations to extensions

    To take up the base application, you will move all your custom-code into extensions.
    
    - If you have changed a the primary key of a table or data type of a field, this will cause problems.
    
    - At a minimum, you should move tables to extensions now.
    

## Upgrade the Database 

1. Prepare the database.
    1. Uninstall all etxensions.
    2. Unpublish all extensions
2. Convert the version 14 application database to version 15.
3. Publish system symbols, system application, and base application extensions.
4. Synchronize system application and base application extensions with the tenant database.
5. Install system application and base application extensions.
6. Run the data upgrade.
7. Upgrade to the new versions of Microsoft extensions.
8. Install 3rd-party extensions:
    1. Configure the version 15 server instance for migrating 3rd party extensions
    2. Publish extensions.
    3. Synchronize extensions.
    4. Install extensions.



## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
