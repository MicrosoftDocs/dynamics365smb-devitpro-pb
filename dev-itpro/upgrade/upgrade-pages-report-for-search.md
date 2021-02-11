---
title: "Making Pages and Reports in the MenuSuite Searchable After Upgrade"
description: Explains how to make pages and reports searchable in the Web Client after an upgrade to the Business Central platform from Dynamics NAV.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

# Making Pages and Reports Searchable in the [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)] After an Upgrade

In [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], pages and reports were searchable in the [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)] only if they were included in the MenuSuite. In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], instead using the MenuSuite, pages and reports are made searchable by setting properties on the page and report objects themselves, specifically the [UsageCategory](../developer/properties/devenv-usagecategory-property.md) property, and optionally the [AccessByPermissions](../developer/properties/devenv-accessbypermission-property.md) and [ApplicationArea](../developer/properties/devenv-applicationarea-property.md) properties. The UsageCategory property corresponds to the DepartmentCategory property on MenuSuite items linked to page and report objects.


As a result of this change, after an upgrade from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] to [!INCLUDE[prod_short](../developer/includes/prod_short.md)], pages and reports that were previously searchable in the client, will no longer be searchable unless you set the required object properties. 

You can set the properties of pages and reports manually (see [Adding Pages and Reports to Search](../developer/devenv-al-menusuite-functionality.md)). Alternatively, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] installation media (DVD) includes a Windows PowerShell scripted module called **TransitionMenuSuiteObjectsForSearch.psm1** that includes the **Set-ObjectPropertiesFromMenuSuite**. The cmdlet saves each page and report included in the MenuSuite as a modified object text file that sets the UsageCategory, AccessByPermissions, and ApplicationArea properties to match the DepartmentCategory, AccessByPermissions, and ApplicationArea properties in the MenuSuite. The modified objects can then be imported into the database, either manually or automatically using the cmdlet. 

## Run the Set-ObjectPropertiesFromMenuSuite cmdlet

1. Run **Windows PowerShell** as an administrator.
2. At the command prompt, import the **TransitionMenuSuiteObjectsForSearch.psm1** module.

    On the installation media (DVD), the module is in the **WindowsPowerShellScripts\WebSearch** folder.

    For example, run the following command:
    
    ```
    import-module -Name c:\dvd\WindowsPowerShellScripts\WebSearch\TransitionMenuSuiteObjectsForSearch.psm1

    ```
3.  The `Set-ObjectPropertiesFromMenuSuite` cmdlet has several parameters that you can set to change its behavior. To get help on this cmdlet, run the following command:

    ```
    get-help Set-ObjectPropertiesFromMenuSuite -full
    ```
3.  Run the `Set-ObjectPropertiesFromMenuSuite` cmdlet.

    For example:

    ```
    Set-ObjectPropertiesFromMenuSuite -RoleTailoredClientFolder "C:\Program Files (x86)\Microsoft
    Dynamics NAV\130\RoleTailored Client" -DataBaseName "MySolutionDatabase" -OutPutFolder "C:\temp"
    ```

    In this example, the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)] (finsql.exe) installation path is `C:\Program Files (x86)\Microsoft
    Dynamics NAV\130\RoleTailored Client`, the database is named `MyDatabase` and modified page and report objects are stored to the folder `C:\temp`.

 
4. If the cmdlet was not set up to import the modified page and report object text files, import them from the output folder into the database. 

    See [How to: Import Objects](/dynamics-nav/how-to--import-objects).

5. Compile the imported objects.

    See [Compiling Objects](/dynamics-nav/compiling-objects).

6. In the **Tools** menu of the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)], select **Build Object Search Index**.

    The pages and reports will not be searchable until you run **Build Object Search Index**. 


## See Also
[Converting a Database - Technical Upgrade](converting-a-database.md)  
[Upgrading the Data](upgrading-the-data.md)  

