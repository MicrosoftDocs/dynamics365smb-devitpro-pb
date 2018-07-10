---
title: "Adding Pages and Reports to Search"
description: "Description of how you use AL to add pages and reports to Search in the client."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

# Making Pages and Reports in the MenuSuite Searchable in [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)]

In [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], pages and reports were searchable in the [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)] only if they were included in the MenuSuite. In [!INCLUDE[d365fin_md](../developer/includes/d365fin_md.md)], instead using the MenuSuite, pages and reports are made searchable by setting properties on the page and report objects themselves, specifically the [UsageCategory](../developer/properties/devenv-usagecategory-property.md) property, and optionally the [AccessByPermissions](../developer/properties/devenv-accessbypermission-property.md) and [ApplicationArea](../developer/properties/devenv-applicationarea-property.md) properties. The UsageCategory property corresponds to the DepartmentCategory property on MenuSuite items linked to page and report objects.

This means that after an upgrade from [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[d365fin_md](../developer/includes/d365fin_md.md)], pages and reports that were previously searchable in the client, will no longer be searchable unless you set the required object properties. 

Instead of setting these properties manually, the [!INCLUDE[d365fin_md](../developer/includes/d365fin_md.md)] installation media (DVD) includes a Windows PowerShell scripted module called **WebSearch.psm1**. This module includes a single cmdlet called **Set-PageAndReportPropertiesFromExistingMenuSuites**. This cmdlet creates modified copies of page and report objects that are linked to MenuSuite items, setting the UsageCategory, AccessByPermissions, and ApplicationArea properties according to the DepartmentCategory, AccessByPermissions, and ApplicationArea properties in the MenuSuite. The modified copies can then be imported into the database. 

## Run the Set-PageAndReportPropertiesFromExistingMenuSuites cmdlet

1. Run **Windows PowerShell** as an administrator.
2. At the command prompt, import the WebSearch.psm1 module.

    On the installation media (DVD), the module is in the **WindowsPowerShellScripts\WebSearch** folder.

    For example, run the following command:
    
    ```
    import-module -Name c:\dvd\WindowsPowerShellScripts\WebSearch\WebSearch.psm1

    ```
3.  The `Set-PageAndReportPropertiesFromExistingMenuSuites` cmdlet has several parameters that you can set to change its behavior. To get help on this cmdlet, run the following command:`

    ```
    get-help Set-PageAndReportPropertiesFromExistingMenuSuites -full
    ```
3.  Run the `Set-PageAndReportPropertiesFromExistingMenuSuites` cmdlet.

    For example:

    ```
    Set-PageAndReportPropertiesFromExistingMenuSuites -RoleTailoredClientFolder "C:\Program Files (x86)\Microsoft
    Dynamics NAV\130\RoleTailored Client" -DataBaseName "MySolutionDatabase" -OutPutFolder "C:\temp"
    ```

    In this example, the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)] (finsql.exe) installation path is `C:\Program Files (x86)\Microsoft
    Dynamics NAV\130\RoleTailored Client`, the database is named `MyDatabase` and modifed page and report objects are stored to the folder `C:\temp`.

 
4. If the cmdlet was not set up to import the modified page and report objects, import them from the output folder into the database. 

5. Compile the imported objects.


## See Also
[Adding Menus to the Navigation Pane](../developer/devenv-adding-menus-to-navigation-pane.md)  
[MenuSuite Properties](../developer/properties/devenv-menusuite-properties.md)   
[Page Object](../developer/devenv-page-object.md)  
[Report Object](devenv-report-object.md)  
[AL Development Environment](../developer/devenv-reference-overview.md)
