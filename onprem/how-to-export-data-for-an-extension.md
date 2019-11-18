---
title: "How to: Export data for an Extension"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: solsen
---
# How to: Export Data for an Extension
[!INCLUDE[nav_ext1_not_supported](includes/nav_ext1_not_supported.md)]

An extension package may include required configuration and starting data for your extension to run properly. An extension can include the following types of data that can be imported for the tenant during the installation of the extension.  

- Permission sets
- Web services
- Starting table data
- Custom report layouts

The data must be exported from [!INCLUDE[navnow](includes/navnow_md.md)] into files to be included in the extension package.

## To export permission sets
1.	Open the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].
2.	Export the relevant permission set using the `Export-NAVAppPermissionSet` cmdlet to export the permission set to a file:

    `Export-NAVAppPermissionSet -ServerInstance DynamicsNAVServer -Path '.\PermissionSet.xml' -PermissionSetId PSA-VIEW`

    > [!NOTE]  
    >  Export each permission set to a separate XML file.

3.	Copy the exported permission set files into a folder for packaging, such as a *PermissionSets* folder at the same level at the next to the DELTA folder.
    > [!WARNING]  
    > If you do not include a permission set with your extension, only users with the SUPER permission set will be able to use the extension.

## To export web services
1.	Open the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].
2.	Export the relevant web service using the `Export-NAVAppTenantWebService` cmdlet to export the web service to a file:

    `Export-NAVAppTenantWebService -ServerInstance DynamicsNAVServer -Path TenantWebService.xml -ServiceName Customer -ObjectType Page -ObjectId 21`

    > [!NOTE]  
    >  Export each web service to a separate XML file.

3.	Copy the exported web service files into a source folder for packaging, such as a *WebServices* folder at the same level at the next to the DELTA folder.

## To export table data
1.	Open the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].
2.	Export the relevant data using the `Export-NAVAppTableData` cmdlet to export the data to a file. This includes setting the path to a folder where you want the .navxdata file created. A data file in the format of TAB<TABLEID>.navxdata will be created. (Example: TAB10000.navxdata)

    `Export-NAVAppTableData -ServerInstance DynamicsNAVServer -Path ‘C:\NAVAppTableData’ -TableId 10000`

    > [!NOTE]  
    >  Export the data for each table to a separate XML file.

3.	Copy the exported files into a source folder for packaging, such as a *TableData* folder at the same level at the next to the DELTA folder.
    >[!WARNING]
    > An extension can only include table data for new tables that are added as part of the extension.

## To export custom report layouts

1.	Open the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].
2.	Export the relevant report layouts using the `Export-NAVAppReportLayout` cmdlet to export to a file:

    `Export-NAVAppReportLayout -ServerInstance DynamicsNAV -Path .\ReportLayout.xml -LayoutId 1`

    > [!NOTE]  
    >  Export each custom report layout to a separate XML file.

3.	Copy the exported files into a source folder for packaging, such as a *ReportLayouts* folder at the same level at the next to the DELTA folder.


## See Also  
[Getting Started](developer/devenv-get-started.md)  
<!--
[Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md)  
[How to: Develop an Extension](How-to--Develop-an-Extension.md)  
[How to: Create an Extension Package](How-to--Create-an-Extension-Package.md)  
[How to: Publish and Install an Extension](How-to--Publish-and-Install-an-Extension.md)   
[Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)  
[Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)  
[Development Cmdlets for Microsoft Dynamics NAV](https://go.microsoft.com/fwlink/?LinkID=510540)
-->