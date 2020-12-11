---
title: "Exporting data for Extensions"
description: "How you can export data such as permisisons, web services, and table data for an extension."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Exporting data for Extensions
For your extension to run properly, configuration and starting data such as permission sets and table data may be needed. An extension can include the following types of data that can be imported for the tenant during the installation of the extension.

- Permission sets
- Web services
- Starting table data
- Custom report layouts

<!-- 
> [!NOTE]  
> The NAV Development Shell is [!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)]. -->

The data must be exported into files to be included in the extension. To use the export functions you must use a container sandbox environment for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. For more information, see [Get started with the Container Sandbox Development Environment](devenv-get-started-container-sandbox.md).

## To export permission sets
1. Open the [!INCLUDE[bc_dev_shell](includes/bc_dev_shell.md)].
2. Export the relevant permission set using the `Export-NAVAppPermissionSet` cmdlet to export the permission set to a file. For example, the following command exports the BASIC permission set.

    `Export-NAVAppPermissionSet -ServerInstance DynamicsNAV160 -Path '.\PermissionSet.xml' -PermissionSetId BASIC`

    > [!NOTE]  
    > Export each permission set to a separate XML file.

3. Add the exported permission set files to the Visual Studio Code project that contains your extension.

    > [!WARNING]  
    > If you do not include a permission set with your extension, only users with the SUPER permission set will be able to use the extension.

## To export web services

1. Open the [!INCLUDE[bc_dev_shell](includes/bc_dev_shell.md)].
2. Export the relevant web service using the `Export-NAVAppTenantWebService` cmdlet to export the web service to a file. The following command exports the Customer Card page.

    `Export-NAVAppTenantWebService -ServerInstance DynamicsNAV160 -Path TenantWebService.xml -ServiceName Customer -ObjectType Page -ObjectId 21`

    > [!NOTE]  
    > Export each web service to a separate XML file.

3. Add the exported web services files to the Visual Studio Code project that contains your extension.

## To export table data 

1. Open the [!INCLUDE[bc_dev_shell](includes/bc_dev_shell.md)].
2. Export the relevant data using the `Export-NAVAppTableData` cmdlet to export the data to a file. This includes setting the path to a folder where you want the .navxdata file created. A data file in the format of TAB<TABLEID>.navxdata will be created. (Example: TAB10000.navxdata). 

    `Export-NAVAppTableData -ServerInstance DynamicsNAV160 -Path 'C:\NAVAppTableData' -TableId 10000`

    > [!NOTE]  
    > Export the data for each table to a separate XML file.

3. Add the exported table data files to the Visual Studio Code project that contains your extension.
4. Call the procedure in a Codeunit with the Subtype property `Install` or `Upgrade` and specify the table ID  in the `NavApp.LoadPackageData` procedure as shown in the following example.

    ```AL
    codeunit 50100 MyExtensionUpgrade
    {
        Subtype = Upgrade;
        trigger OnUpgradePerDatabase()
        begin
            NavApp.LoadPackageData(50100);
        end;
    }
    ```

    > [!WARNING]
    > An extension can only include table data for new tables that are added as part of the extension.

## To export custom report layouts

1. Open the [!INCLUDE[bc_dev_shell](includes/bc_dev_shell.md)].
2. Export the relevant report layouts using the `Export-NAVAppReportLayout` cmdlet to export to a file:

    `Export-NAVAppReportLayout -ServerInstance DynamicsNAV160 -Path .\ReportLayout.xml -LayoutId 1`

    > [!NOTE]  
    > Export each custom report layout to a separate XML file.

3. Add the exported custom report files to the Visual Studio Code project that contains your extension.

## See Also

[Developing Extensions in AL](devenv-dev-overview.md)  
[Converting Extensions V1 to Extensions V2](devenv-upgrade-v1-to-v2-overview.md)  
[Writing Extension Install Code](devenv-extension-install-code.md)  
