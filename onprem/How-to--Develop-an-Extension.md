---
title: "How to: Develop an Extension"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 69203ef8-ceb0-4dc9-8f4c-eacaa0d33a6c
author: solsen
---
# How to: Develop an Extension
[!INCLUDE[nav_ext1_not_supported](includes/nav_ext1_not_supported.md)]

You can build extension packages that add functionality to a [!INCLUDE[navnow](includes/navnow_md.md)] deployment. Unlike the familiar development and deployment of [!INCLUDE[navnow](includes/navnow_md.md)] functionality, building an extension relies on the exported version of an application to .TXT files. You can export the application from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], use the development environment commands, or use the [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlet that is available in the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)], `Export-NAVApplicationObjectLanguage`.  

> [!TIP]  
>  We recommend that you create a folder structure that can be leveraged by the cmdlets that you use when you build the extension package. That structure should contain folders for the ORIGINAL object files, MODIFIED object files, and DELTA files. These names match those used as parameters in the application merge utilities. For more information, see [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md). In addition, you may want to create additional folders for any .NET add-ins, language files, or data files that you are going to include in the package.  

## To create an extension  

1.  Establish the BASE as TXT files.  

    1.  The foundation for your extension is the exported .txt files of the objects you are modifying. You can export just the objects that you want to modify, or you can export the entire [!INCLUDE[navnow](includes/navnow_md.md)] application. In the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)], the `Export-NAVApplicationObjectLanguage` cmdlet can automate this process or you can use the export functionality in the development environment. The following example uses this cmdlet to export objects to establish the base for the planned modifications.  

        ```  
        Export-NAVApplicationObject -Path ORIGINAL -DatabaseName MyDatabase -DatabaseServer MyDatabaseServer  
        ```  

        > [!IMPORTANT]  
        >  Objects must be exported as .TXT files. You cannot build an extension based on a .FOB file.  

         If you use a source control system, you may want to pull the base .TXT files from there.  

    2. If you will be adding multilanguage translations for captions or constants, you must first export all of the text strings to file using [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md).  

2.  Create functionality in the development environment.  

    1.  Use the development environment as usual to create new objects or modify ones to the extent your license allows you. Keep in mind the following rules:  

        -   DO NOT make C/AL code modifications.  

        -   DO use subscribing to events to execute code.  

        -   DO NOT change restricted page and table properties.  

         In order to get an easy upgrade experience for your extensions, you cannot modify code the way you do in the traditional customization process. Instead, you extend [!INCLUDE[navnow](includes/navnow_md.md)] functionality by subscribing to programming events that are raised either explicitly in code, or implicitly by the platform. For more information, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).  
         > [!IMPORTANT]  
         >  Do not add inline comments to your code. Such comments are helpful as internal documentation, but they will cause the extension to fail when you build the extension package.  

    2. Write extension upgrade code for new or modified tables in a codeunit. For more information, see [How to: Write Extension Upgrade Code](extensions-upgrade-howto.md).

    3. If you want your extension to support the multilanguage functionality, add CaptionML captions using the development environment or to a copy of the language export file using the directions for translating multilanguage files in [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md).  

    4.  Test your application with the extension added.  

3.  Export your changed and added application objects to .TXT files.  

    1.  Export all objects that you added or modified to .TXT files. Use the same export cmdlet from step 1 or manually export within the development environment. They must also be exported as .TXT files and should be placed in a separate directory so that the packaging process can be pointed at them.  

        ```  
        Export-NAVApplicationObject -Path MODIFIED -DatabaseName MyDatabase -DatabaseServer MyDatabaseServer  
        ```  
    2. Export the codeunit that contains the upgrade code to a .TXT file. This file must be placed in the folder for delta files that you create in the next step.
4.  Create DELTA files using the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] cmdlets.  

    1.  Extension packages are based on application object deltas. Again, you use the application merge utilities in the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] to distil the changes in the form of application object differences that are stored in DELTA files. Creating an extension uses many of the same concepts and tools as you know from application object deltas. You use the `Compare-NAVApplicationObject` cmdlet to create these delta files.  

        ```  
        Compare-NAVApplicationObject -OriginalPath ORIGINAL -ModifiedPath MODIFIED -DeltaPath DELTA  
        ```  

        > [!NOTE]  
        >  Your delta files must be one-to-one with the objects you have added or modified. You cannot include a single merged delta file. If you output your export file as a single file use the `Split-NAVAppplicationObjectFile` cmdlet to create the individual files.  

    2. If you will be adding Multilanguage translations for captions or constants, use the `Compare-NAVAppApplicationObjectLanguage` cmdlet to calculate the delta between the original version and modified version of the language text files. Include the resulting delta language text file in the sourcepath when building the extension package.

        ```
        Compare-NAVAppApplicationObjectLanguage -OriginalPath MLORIGINAL -ModifiedPath MLMODIFIED -DeltaPath MLDELTA
        ```

5.  Build the extension package.  

     For more information, see [How to: Create an Extension Package](How-to--Create-an-Extension-Package.md).  

### Debugging Extensions
Debugging your extension is no different than debugging any other customization that you do. But if you have to debug your way through a deployed extension, then you must set your breakpoint and debug from within the runtime environment for the tenant.  

## Adding Data to your Extension
An extension can include starting or default data that is loaded when the extension is installed. The data to load can only be for a new table that is not company-specific and is added as part of the extension.  

As part of developing your extension, you create a new table that will contain this data, add the data, extract the data, and then build the extension package.

### To load starting data in a new table
1.	Create a new table for your extension that is not a company-specific table.  
    This is the table that you want to load the starting data into during the installation.  

2.	Populate the table with the starting data that you want loaded when the Extension is installed.  

3.	Add a call to the `NAVAPP.LOADPACKAGEDATA(TableNo)` system function in the `OnNAVAppUpgradePerDatabase` codeunit for the table.  

    ```
    PROCEDURE OnNavAppUpgradePerDatabase@1();
        BEGIN
            NAVAPP.LOADPACKAGEDATA(50004);
        END;
    ```

4.	Export the table data to file.
    Use the `Export-NAVAppTableData` cmdlet to export the data from the table to file. When exporting you will provide the path to a folder where you want the .navxdata file created. A data file in the format of *TAB<TABLEID>.navxdata* will be created, such as *TAB10000.navxdata*.

    ```
    Export-NAVAppTableData -ServerInstance DynamicsNAVServer -Path ‘C:\NAVAppTableData’ -TableId 10000
    ```

5.	Copy the exported table data file into a source folder for packaging, such as a folder with the name *TableData* next to the *DELTA* folder.

6.	Create your extension package, including the folder containing the exported table data file as a source path.  

7.	Publish and install the extension.

In certain situations, you may need to load starting data for your extension to existing tables or to company-specific tables. In that case, you can add a new table that serves as a staging table in your extension, and then using a page or codeunit to retrieve the table data from the staging table and load it into the target table.  

### To use a staging table to load data into an existing table
1.  Create a new table for your extension that is not a company-specific table.  
    This is the staging table that you want to load the data into during the installation.  

2.  Populate the table with the data that you will want to load in the target tables, and then follow steps 3-5 in the previous procedure.  

3.	Add a new codeunit that will retrieve the data from the staging table and load it in the company table.  

    1.	Create a new codeunit.  
    2.	Add a new function to the codeunit that subscribes to the `OnBeforeCompanyOpen` event.  
    3.	Set the *Event* property to *Subscriber*.  
    4.	Set the *EventPublisherObject* property to *Codeunit ApplicationManagement*.  
    5.	Set the *EventFunction* property to the `OnBeforeCompanyOpen` integration event.

        > [!NOTE]  
        >  When you get asked if you want to overwrite the edited function's signature, choose **Yes** to continue.  

    6.	Add your code to copy the data from the staging table to the company table to the new event subscriber function. The code should check if the data has already been copied and if it hasn’t then copy the data.

If the existing table is not a company-specific table, then create a page where the user can select to load the data instead.  

## Extending Other Extensions  
 You can extend the functionality that another extension has made available. When you do that, you create a dependency between the original extension and the one extending it. This dependency must be verified and compiled when the new extension is published.  

 You must have the source code for the extension that you want to extend available in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to use as the base of your app. The steps for creating a dependent app, or, in other words, extending another extension, are outlined below.  

> [!NOTE]  
>  If you do not identify a dependency when you build your extension package, publishing your extension results in errors that are caused by base objects missing, and the publish operation will fail.  

### To create a dependent extension  

1.  Import and compile the source code for the extension that you want to extend.  

2.  Use the Export-NAVApplicationObjectLanguage cmdlet to establish the new base for your app deltas.  

3.  Extend the functionality with your modifications and additions using the development environment.  

4.  Use the Export-NAVApplicationObjectLanguage and the Compare-NAVApplicationObject cmdlets to export and create the deltas for your app. Since you are comparing against a base that has the functionality that you are extending, you should only see deltas for your changes.  

5.  Create the package for your extension using the `New-NAVAppManifest`, `Get-NAVAppInfo`, and `New-NAVAppPackage` cmdlets making sure to use the *–Dependencies* parameter on the `New-NAVAppManifest` to identify the NAV extensions that you dependent on.  


## See Also  
[Getting Started](developer/devenv-get-started.md)  
<!--
[Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md)  
[How to: Write Extension Upgrade Code](extensions-upgrade-howto.md)  
[How to: Export Data for an Extension](how-to-export-data-for-an-extension.md)  
[How to: Create an Extension Package](How-to--Create-an-Extension-Package.md)  
[How to: Publish and Install an Extension](How-to--Publish-and-Install-an-Extension.md)  
[Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)   
[Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
[Development Cmdlets for Microsoft Dynamics NAV](https://go.microsoft.com/fwlink/?LinkID=510540)
-->