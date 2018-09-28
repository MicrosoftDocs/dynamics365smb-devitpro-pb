---
title: Upgrade Application Code
description: The article explains how to upgrade the application code and how to merge code from different versions of the application.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
manager: edupont
ms.service: "dynamics365-business-central"
---
# Upgrading the Application Code in [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

Typically, customers want all the customizations that have been implemented in their existing databases to be migrated to their new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] databases. Depending on the version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] that a database is being upgraded from, the amount of code changes between the two versions can vary. To upgrade the application code, you must merge code from different versions of the application. This merge process is known as a *code upgrade* or *application upgrade*. You must upgrade the application before you upgrade the data.

> [!IMPORTANT]  
> Before you begin, read the article [Important Information and Considerations for Before Upgrading](upgrade-considerations.md). This article contains information about limitations and things that might require you to perform extra tasks before you upgrade, such as the use of extensions V1 and the deprecation of codeunit 1.

## Application Upgrade Overview  
During an upgrade, you have to first identify which changes you have to make, and then you'll have to upgrade the application objects and the application code, and finally, you might have to upgrade data so that it fits the new database schema.

For the application portion of the upgrade, you must analyze and process code changes by comparing and merging three separate versions of the database:  

|Version|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-------------|---------------------------------------|  
|*Original version*|This is the baseline version of the solution that you want to upgrade, such as the original release of [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] or [!INCLUDE[nav2017](../developer/includes/nav2017.md)].|  
|*Modified version*|This is the version that you want to upgrade, such as a customer's [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] or [!INCLUDE[nav2017](../developer/includes/nav2017.md)] database with customizations and add-on solutions.|  
|*Target version*|This is the target of the merge process that you want to upgrade your application to, such as the standard version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.|  

When you merge the application objects from these three versions, you can import the result into a new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database that then contains the upgraded application. At the end of the process, you export the merged [!INCLUDE[prodshort](../developer/includes/prodshort.md)] objects from this database to a .fob file that you will use during the data upgrade.  

### Different ways of upgrading application code
You can use any tool or set of tools to help you compare and merge code. [!INCLUDE[navnow](../developer/includes/navnow_md.md)] and [!INCLUDE[proshort](../developer/includes/prodshort.md)] include [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets and sample scripts that can help you upgrade your application. The cmdlets are available through the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] and [!INCLUDE[devshell](../developer/includes/devshell.md)], or by importing the Microsoft.Dynamics.NAV.Model.Tools.psd1 module into the Windows PowerShell Integrated Scripting Environment (ISE). You can find the sample scripts on the product installation media, in the *WindowsPowerShellScripts\ApplicationMergeUtilities* folder.
We recommend that you use these cmdlets and sample scripts because they can make it faster to merge most changes. For example, you can combine several steps in a command that uses a cmdlet such as the [Merge-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398884). The sections in this article describe how you can use the Merge-NAVApplicationObject cmdlet and other [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets. For more information, see [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md).

<!--
For information about other ways of upgrading your code, see [Upgrading the Application Code](http://msdn.microsoft.com/en-us/library/dn271652\(v=nav.71\).aspx) for [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)] in the MSDN Library.
-->
<!--
### Application code upgrade guideline
To upgrade the application code , complete these tasks:  

1.  Prepare the application object text files.  

2.  Merge versions.  

3.  Resolve conflicts  

4.  Import and compile the merged application objects.  

5.  Export all objects.  
-->

<!-- In the stesp, the application database refers to the only database in single tenant mode. In multitenant mode, it refers to the application database.

-->
## Task 1: Install the Prerequisites

To complete the tasks in this article, you will use various tools and components of the old [!INCLUDE[navnow](../developer/includes/navnow_md.md)] version and [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Ensure that you have the following installed:

|    |  Tool/Component  |
|----|------------------|
| Old [!INCLUDE[navnow](../developer/includes/navnow_md.md)] version  |<ul><li>[!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]<br />or</li><li>[!INCLUDE[navnow](../developer/includes/navnow_md.md)] Development Shell<br />This is not available in [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)] and [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]</li></ul>|
|[!INCLUDE[prodshort](../developer/includes/prodshort.md)] |<ul><li>[!INCLUDE[server](../developer/includes/server.md)]</li><li>[!INCLUDE[devshell](../developer/includes/devshell.md)]</li><li>[!INCLUDE[adminshell](../developer/includes/adminshell.md)]</li>[!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]</li> </ul>|

<!-- For multitentant, I installed the BC demo, and then converted to multitenancy.-->

## Task 2: Prepare the Application Object Text Files  
<!--The [!INCLUDE[navnow](../developer/includes/navnow_md.md)] cmdlets take text files as input.--> You must prepare text files that contain the application objects for the different application versions previously described (original, modified, and target). The text files provide the input for the application merge process.

There are three ways to export application objects to text files:

-   Use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] version that matches the application database version. For more information see [To export objects by using the development environment UI](../cside/cside-import-objects.md#ExportObjectsDevEnv).
-   Use the finsql.exe that matches the application database version to run the ExportObjects command. For more information, see [To export objects by running finsql.exe with the ExportObjects command  ](../cside/cside-import-objects.md#ExportObjectsFinSQL).
-   Use the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] or [!INCLUDE[devshell](../developer/includes/devshell.md)] version that matches the application database version. This is the way that is described in the tasks of this article. Note that the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] is not available for [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)] and [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]. For these versions, you must use [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] or finsql.exe.

### Create the application text files
1.  Create four folders on the computer, and name them as follows:  

 -   **ORIGINAL**  

        This folder will be used to store the application object text file(s) from the baseline version, such as the original release of [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] or [!INCLUDE[nav2017](../developer/includes/nav2017.md)].  

 -   **MODIFIED**  

        This folder will be used to store the application object text file(s) from the modified version, such as the customer's database.  

 -   **TARGET**  

        This folder will be used to store the application object text file(s) from [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  

 -   **RESULT**  

        This folder will be used to store the application object text file(s) that are the result of the application merge. It will also contain zero or more .CONFLICT files that describe conflicting code.  

2.  Export all application objects from the original version of the old application database, such as the original [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database. Do not export system tables, which have the IDs in the 2000000000 range. Name the file **OldBaseVersion.txt**, and then save the file in the **ORIGINAL** folder that you created earlier.  

    For example, start the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] version that matches the database version, and run the **Export-NAVApplicationObject** function as follows:

    ```  
    Export-NAVApplicationObject –DatabaseServer MyServer –DatabaseName "Demo Database NAV (11-0)" –Path C:\Upgrade\ORIGINAL\OldBaseVersion.txt -Filter 'Id=1..1999999999'
    ```  

3.  Export all application objects, except system tables, from the old modified application database, such as the customer's customized [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database. Name the file **OldCustomVersion.txt**, and then save the file in the **MODIFIED*** folder that you created earlier.

    For example (using the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] version that matches the database version), if the customer's database is called *MyCustomerNAV2016Database*, you can run the following command:
    ```  
    Export-NAVApplicationObject –DatabaseServer MyServer –DatabaseName "MyCustomerNAV2018Database" –Path C:\Upgrade\MODIFIED\OldCUSTOMVersion.txt -Filter 'Id=1..1999999999'
    ```  

    > [!TIP]  
    >  In some cases, existing customizations might be irrelevant after the upgrade because they correspond to new functionality in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

4.  Export all application objects, except system tables, from the new base version, such as the original [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database. Name the file **NewBaseVersion.txt**, and then save the file in the **TARGET** folder that you created earlier.  

    For example, using the [!INCLUDE[devshell](../developer/includes/devshell.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], run the following command:
    ```  
    Export-NAVApplicationObject –DatabaseServer MyServer –DatabaseName "Demo Database NAV (13-0)" –Path C:\Upgrade\Target\NewBaseVersion.txt -Filter 'Id=1..1999999999'
    ```  

Optionally, you can use the [Split-NAVApplicationObjectFile](https://go.microsoft.com/fwlink/?linkid=398885) cmdlet to split each text file into separate text files for each application object. This can make it easier to keep track of the process. The end result at this stage is three folders with one or more text files that contain the three sets of application objects that you want to merge.  

## Task 3: Merge Versions  
You must now merge the three sets of application objects to create the application for the new database. This section illustrates how to do this by using the [Merge-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398884) cmdlet. Additionally, the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] product media contains sample scripts provide examples of how you can use the [Merge-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398884) cmdlet to merge application objects. For more information, see [How to: Merge Application Changes](How-to--Merge-Application-Changes.md).

> [!Note]  
> In certain scenarios, you can choose to use the [Compare-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398882) cmdlet to identify the changes between the existing customized application and the new application. You can then choose to use the [Update-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398886) cmdlet to apply all or some of the changes to the new version. For more information, see [How to: Compare and Update Application Object Source Files](How-to--Compare-and-Update-Application-Object-Source-Files.md). However, we recommend that you use the Merge-NAVApplicationObject  cmdlet in most cases.

### Merge the application object versions into text files
1. Run the [!INCLUDE[devshell](../developer/includes/devshell.md)] as an administrator.
2. At the command prompt, change to the directory that contains the four folders that contain the application text files, and then run the following command:

    ```  
    Merge-NAVApplicationObject -OriginalPath  C:\Upgrade\ORIGINAL -TargetPath  C:\Upgrade\TARGET -ModifiedPath  C:\Upgrade\MODIFIED -ResultPath  C:\Upgrade\RESULT  
    ```  

Depending on the number of objects that you are merging and the number of differences found, this can take a few seconds, a few minutes, or longer. When the cmdlet completes, the result of the merge is shown, including a description of any application objects with conflicting code. The **RESULT** folder will contain a text file (.TXT) for each merged application object and possibly one or more .CONFLICT files that describe the code conflicts that occurred during the merge.

At this point, you can either go to Task 4 to analyze and eventually resolve the conflicts, or you can go directly to Task 5 to import the merged objects as-is from the **RESULT** folder to the new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.  

## Task 4: Handling Conflicts  
Depending on the application that you are upgrading, you can choose to analyze and fix the conflicting code before you import the merged objects into the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The conflicts are shown in the merged text files but are also identified in .CONFLICT files in the subfolders of the **RESULT** folder. The subfolders **ConflictOriginal**, **ConflictModified**, and **ConflictTarget** folders then contain copies of the source files from the versions that have conflicting code.

You can analyze the conflicts in any tool, make the relevant changes, and then run the merge operation again. For more information, see [Handling Merge Conflicts](Handling-Merge-Conflicts.md). Alternatively, you can go directly to task 5 to import the merged files into the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and resolve the conflicts there. 

## Task 5: Import and Compile Merged Objects in an Empty Database
After you have completed the merge, you import the new merged application objects as text files into a new (empty) [!INCLUDE[prodshort](../developer/includes/prodshort.md) database, and then compile all objects. You must resolve any compilation errors before you can continue. The text files include successfully merged code, and code that is partially merged. You can import the partially merged objects into the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] development environment and resolve the conflicts there.

1.  Create a new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database for the new upgraded application. The database should be empty, except for the system tables.

    For example, give the database the name *My Upgraded App*. For more information, see [Creating and Altering Databases](../cside/cside-create-databases.md).

    >[!IMPORTANT]  
    > You must set the collation of the new database to match the collation of the old application database. To see the collation of the old database, open the database in [[!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], then choose **File** > **Database** > **Alter** > **Collation**. 

2.  Make sure the database includes a valid [!INCLUDE[prodshort](../developer/includes/prodshort.md)] license.

    For more information, see [Uploading a License File for a Specific Database](../cside/cside-upload-license-file.md)

3.  Import the new merged application object text files (.TXT) from the **Result** folder into the new database.

    There are three ways to import the files:

    -   Use the [[!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

        For more information see [To import objects by using the development environment UI](../cside/cside-import-objects.md#ImportObjectsDevEnv).
    -   Use the finsql.exe to run the [ImportObjects](https://docs.microsoft.com/en-us/dynamics-nav/importobjects) command.

        For more information, see [To import objects by running finsql.exe with the ImportObjects command  ](../cside/cside-import-objects.md#ImportObjectsFinSQL).

    -   Use the [!INCLUDE[devshell](../developer/includes/devshell.md)] (or Microsoft.Dynamics.NAV.Model.Tools.psd1 module).

        The shell includes the **Join-NAVApplicationObjectFile** cmdlet and **Import-NAVApplicationObject** function. The **Join-NAVApplicationObjectFile** cmdlet combines multiple application object text files into one text file. The **Import-NAVApplicationObject** function runs the [ImportObjects](https://docs.microsoft.com/en-us/dynamics-nav/importobjects) command to import an object file.

        This means that you can run a command similar to following to create a single text file from the merge application text files in the **Result** folder:

        ```  
        Join-NAVApplicationObjectFile –Source C:\Upgrade\RESULT\*.txt -Destination C:\Upgrade\all-merged.txt   
        ```  
        Then, you can run this command to import the text file:
        ```  
        Import-NAVApplicationObject –DatabaseServer MyServer –DatabaseName "My Upgraded App" –Path C:\Upgrade\all-merged.txt  
        ```

4.  Connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the database.  

    You can do this with the [!INCLUDE[admintool](../developer/includes/admintool.md)] or the [Set-NAVServerConfiguration cmdlet](https://go.microsoft.com/fwlink/?linkid=401394) in the [!INCLUDE[adminshell](../developer/includes/nav_shell_md.md)]. In addition, you must add the service account that is used by the [!INCLUDE[server](../developer/includes/server.md)] instance as a member of the **db\_owner** role in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database on SQL Server.  

    For more information about how to do this using the [!INCLUDE[admintool](../developer/includes/admintool.md)], see [How to: Connect a Microsoft Dynamics NAV Server Instance to a Database](../administration/connect-server-to-database.md) and [Giving the account necessary database privileges in SQL Server](../deployment/provision-server-account.md#dbo).  

6.  Compile all the newly imported objects. Choose to synchronize **later**.

    You can use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] or finsql.exe. For more information, see [Compiling Objects](../cside/cside-compiling-objects.md).

    If you use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], you will first have to set it to use the [!INCLUDE[server](../developer/includes/server.md)] instance that connects to the database. For more information, see [Change the Server Instance Used in C/SIDE](../cside/cside-change-server-instance.md).  

    When you compile the objects, an error is thrown for each code conflict, and you can use the tools that are available in the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to resolve the conflicts.

## Task 6: Check/change the application family and version (multitenant mode only)

The application and tenant databases are tagged with `Family` and `Version`. To perform the data upgrade, the `Family` on the application must match that tenant's `Family`. The `Version` of the application must be greater than or equal to the tenant's  `Version`. The easiest way to ensure that `Family` and `Version` of the upgraded application are compatible for data upgrade is to set `Family` to the same value as the old application, and set the `Version` to a higher value than the old application. 

To get the `Family` and `Version`, use the [Get-NAVApplication](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/get-navapplication) cmdlet. To set the `Family` and `Version`, use the [Set-NAVApplication](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navapplication) cmdlet.

You now have a new database with a fully upgraded application. For a multitenant deployment, you can start the data upgrade. For this you will use the new server instance that connects to the upgraded application database. See [Upgrading the Data](Upgrading-the-Data.md).    

## Task 7: Export All Objects (single-tenant mode only) 
With a single-tenant deployment, export all objects of the new database to a .fob type file, such as **objects.fob** file. You will use this .fob file as part of the data upgrade process. The export must include customized objects, upgraded reget-helpports, and all other [!INCLUDE[prodshort](../developer/includes/prodshort.md)] objects.

As with exporting objects in Task 1, you can use either the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], finsql.exe, or [!INCLUDE[devshell](../developer/includes/devshell.md)].

With the [!INCLUDE[devshell](../developer/includes/devshell.md)], you can run a command that is similar to the following:

```  
Export-NAVApplicationObject objects.fob -DatabaseName "My Upgraded App" -DatabaseServer [server_name]\[database_instance]
```  

This completes the upgrade of the application code for single-tenant deployment. Next, you must upgrade the data in the database. See [Upgrading the Data](Upgrading-the-Data.md).  

## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
