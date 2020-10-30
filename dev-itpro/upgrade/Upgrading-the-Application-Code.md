---
title: Upgrade Application Code
description: The article explains how to upgrade the application code and how to merge code from different versions of the application.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
author: jswymer
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
|*Original version*|This is the baseline version of the solution that you want to upgrade, such as the original release of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] October 2018 or [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)].|  
|*Modified version*|This is the version that you want to upgrade, such as a customer's [!INCLUDE[prodshort](../developer/includes/prodshort.md)] October 2018 or [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database with customizations and add-on solutions.|  
|*Target version*|This is the target of the merge process that you want to upgrade your application to, such as the standard version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.|  

When you merge the application objects from these three versions, you can import the result into a new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database that then contains the upgraded application. At the end of the process, you export the merged [!INCLUDE[prodshort](../developer/includes/prodshort.md)] objects from this database to a .fob file that you will use during the data upgrade.

### Single-tenant and multitenant deployments

The process for upgrading the application code is basically the same for a single-tenant and multitenant deployment. However, there are some inherent differences because with a single-tenant deployment, the application and business data is included in the same database, while with a multitenant deployment application code is in a separate database than the business data (tenants). Here is the general process for each deployment type. In the tasks that follow this section, tasks are marked as *Single-tenant only* or *Multitenant only* where applicable.

**Single-tenant**

1. Upgrade the application code.
2. Create a new database on the new platform.
3. Import the upgraded application to the new database.
4. Export the application to a .fob file.
5. Upgrade the data. Here you will import the .fob file.

**Multitenant**

1. Upgrade the application code.
2. Create a new database on the new platform.
3. Import the upgraded application to the new database.
5. Upgrade the data by mounting the tenant on the application database.

With a multitenant deployment, you will perform the steps in this article on the application database, that is, the database that contains the application object definitions.

### Different ways of upgrading application code

You can use any tool or set of tools to help you compare and merge code. [!INCLUDE[navnow](../developer/includes/navnow_md.md)] and [!INCLUDE[proshort](../developer/includes/prodshort.md)] include [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets and sample scripts that can help you upgrade your application. The cmdlets are available through the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] and [!INCLUDE[devshell](../developer/includes/devshell.md)], or by importing the Microsoft.Dynamics.NAV.Model.Tools.psd1 module into the Windows PowerShell Integrated Scripting Environment (ISE). You can find the sample scripts on the product installation media, in the *WindowsPowerShellScripts\ApplicationMergeUtilities* folder.
We recommend that you use these cmdlets and sample scripts because they can make it faster to merge most changes. For example, you can combine several steps in a command that uses a cmdlet such as the [Merge-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398884). The sections in this article describe how you can use the Merge-NAVApplicationObject cmdlet and other [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets. For more information, see [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md).

## Task 1: Install the Prerequisites and Tools

To complete the tasks in this article, you will use various tools and components of the old [!INCLUDE[navnow](../developer/includes/navnow_md.md)] version and [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Ensure that you have the following installed:

#### [!INCLUDE[navnow](../developer/includes/navnow_md.md)] to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] upgrade

|  Product  |  Tool/Component  |
|----|------------------|
| Old [!INCLUDE[navnow](../developer/includes/navnow_md.md)] version  |<ul><li>[!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]</li><li>[!INCLUDE[navnow](../developer/includes/navnow_md.md)] Development Shell</li></ul>|
|[!INCLUDE[prodshort](../developer/includes/prodshort.md)] |<ul><li>[!INCLUDE[server](../developer/includes/server.md)]</li><li>[!INCLUDE[devshell](../developer/includes/devshell.md)]([!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)])</li><li>[!INCLUDE[adminshell](../developer/includes/adminshell.md)]</li><li>[!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] ([!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)])</li> </ul>|

#### [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] upgrade

| Product   |  Tool/Component  |
|----|------------------|
| Old [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version  |<ul><li>[!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]</li><li>[!INCLUDE[devshell](../developer/includes/devshell.md)]</li></ul>|
|New [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version |<ul><li>[!INCLUDE[server](../developer/includes/server.md)]</li><li>[!INCLUDE[devshell](../developer/includes/devshell.md)]([!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)])</li><li>[!INCLUDE[adminshell](../developer/includes/adminshell.md)]</li><li>[!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]([!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)])</li> </ul>|

<!-- Get application version ans family of the old application

 C:\windows\system32> Get-NAVApplication -ServerInstance BC130

Database server      Database name ApplicationVersion ApplicationFamily
---------------      ------------- ------------------ -----------------
NAVDEVVM-0127\BCDEMO BC 130 App    13.4.28076.0       W1-->

## Task 2: Prepare the Application Object Text Files

You must prepare text files that contain the application objects for the different application versions previously described (original, modified, and target). The text files provide the input for the application merge process.

There are three ways to export application objects to text files:

- Use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] version that matches the application database version.

    For more information see [To export objects by using the development environment UI](../cside/cside-import-objects.md#ExportObjectsDevEnv).
- Use the finsql.exe that matches the application database version to run the ExportObjects command.

    For more information, see [To export objects by running finsql.exe with the ExportObjects command  ](../cside/cside-import-objects.md#ExportObjectsFinSQL).
- Use the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] or [!INCLUDE[devshell](../developer/includes/devshell.md)] version that matches the application database version.

    This is the way that is described in the tasks of this article. Note that the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] is not available for [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)] and [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]. For these versions, you must use [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] or finsql.exe.

### Create the application text files

> [!NOTE]
> Be sure to upload a valid developer license to the database before doing the following steps.

1. Create four folders on the computer, and name them as follows:  

    - **ORIGINAL**  

        This folder will be used to store the application object text file(s) from the baseline version, such as the original release of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] October 2018, [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)], or [!INCLUDE[nav2017](../developer/includes/nav2017.md)].  

    - **MODIFIED**  

        This folder will be used to store the application object text file(s) from the modified version, such as the customer's database.  

    - **TARGET**  

        This folder will be used to store the application object text file(s) from the latest [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version.  

    - **RESULT**  

        This folder will be used to store the application object text file(s) that are the result of the application merge. It will also contain zero or more .CONFLICT files that describe conflicting code.  

2. Export all application objects except system tables from the original version of the old application database, such as the original [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database.

    Do not export system tables, which have the IDs in the 2000000000 range. Name the file **OldBaseVersion.txt**, and then save the file in the **ORIGINAL** folder that you created earlier.

    For example, start the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] version that matches the database version, and run the **Export-NAVApplicationObject** function as follows:

    ```  
    Export-NAVApplicationObject –DatabaseServer MyServer –DatabaseName "Demo Database NAV (11-0)" –Path C:\Upgrade\ORIGINAL\OldBaseVersion.txt -Filter 'Id=1..1999999999'
    ```  

3.  Export all application objects, except system tables, from the old modified application database, such as the customer's customized [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database.

    Name the file **OldCustomVersion.txt**, and then save the file in the **MODIFIED** folder that you created earlier.

    For example (using the [!INCLUDE[nav_dev_shell_md](../developer/includes/nav_dev_shell_md.md)] version that matches the database version), if the customer's database is called *MyCustomerNAV2016Database*, you can run the following command:
    ```  
    Export-NAVApplicationObject –DatabaseServer MyServer –DatabaseName "MyCustomerNAV2018Database" –Path C:\Upgrade\MODIFIED\OldCUSTOMVersion.txt -Filter 'Id=1..1999999999'
    ```  

    > [!TIP]  
    >  In some cases, existing customizations might be irrelevant after the upgrade because they correspond to new functionality in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

4.  Export all application objects, except system tables, from the new base version, such as the original [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.

    Name the file **NewBaseVersion.txt**, and then save the file in the **TARGET** folder that you created earlier.

    For example, using the [!INCLUDE[devshell](../developer/includes/devshell.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], run the following command:
    ```  
    Export-NAVApplicationObject –DatabaseServer MyServer –DatabaseName "Demo Database BC (14-0)" –Path C:\Upgrade\Target\NewBaseVersion.txt -Filter 'Id=1..1999999999'
    ```  

Optionally, you can use the [Split-NAVApplicationObjectFile](https://go.microsoft.com/fwlink/?linkid=398885) cmdlet to split each text file into separate text files for each application object. This can make it easier to keep track of the process. The end result at this stage is three folders with one or more text files that contain the three sets of application objects that you want to merge.  

## Task 3: Merge Versions

You now merge the three sets of application objects to create the application for the new database. This section illustrates how to do this by using the [Merge-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398884) cmdlet.

The product installation media contains sample scripts that provide examples of how you can use the [Merge-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398884) cmdlet to merge application objects. For more information, see [Merge Application Changes](merge-application-changes.md).

> [!Note]  
> In certain scenarios, you can choose to use the [Compare-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398882) cmdlet to identify the changes between the existing customized application and the new application. You can then choose to use the [Update-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398886) cmdlet to apply all or some of the changes to the new version. For more information, see [Compare and Update Application Object Source Files](compare-update-application-object-source-files.md). However, we recommend that you use the Merge-NAVApplicationObject cmdlet in most cases.

### Merge the application object versions into text files

1. Run the new [!INCLUDE[devshell](../developer/includes/devshell.md)] as an administrator.
2. At the command prompt, change to the directory that contains the four folders that contain the application text files, and then run the following command:

    ```
    Merge-NAVApplicationObject -OriginalPath ORIGINAL -TargetPath TARGET -ModifiedPath MODIFIED -ResultPath RESULT  
    ```  
    For example:


    ```
    Merge-NAVApplicationObject -OriginalPath C:\Upgrade\ORIGINAL -TargetPath C:\Upgrade\TARGET -ModifiedPath C:\Upgrade\MODIFIED -ResultPath C:\Upgrade\RESULT  
    ```  
Depending on the number of objects that you are merging and the number of differences found, this can take a few seconds, a few minutes, or longer. When the cmdlet completes, the result of the merge is shown, including a description of any application objects with conflicting code. The **RESULT** folder will contain a text file (.TXT) for each merged application object and possibly one or more .CONFLICT files that describe the code conflicts that occurred during the merge.

At this point, you can either go to Task 4 to analyze and eventually resolve the conflicts, or you can go directly to Task 5 to import the merged objects as-is from the **RESULT** folder to the new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.  

## Task 4: Handling Conflicts

Depending on the application that you are upgrading, you can choose to analyze and fix the conflicting code before you import the merged objects into the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The conflicts are shown in the merged text files but are also identified in .CONFLICT files in the subfolders of the **RESULT** folder. The subfolders **ConflictOriginal**, **ConflictModified**, and **ConflictTarget** folders then contain copies of the source files from the versions that have conflicting code.

You can analyze the conflicts in any tool, make the relevant changes, and then run the merge operation again. For more information, see [Handling Merge Conflicts](Handling-Merge-Conflicts.md). Alternatively, you can go directly to task 5 to import the merged files into the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and resolve the conflicts there. 

## Task 5: Import and Compile Merged Objects in an Empty Database

After you have completed the merge, you import the new merged application objects as text files into a new (empty) [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database, and then compile all objects. You must resolve any compilation errors before you can continue. The text files include successfully merged code, and code that is partially merged. You can import the partially merged objects into the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] development environment and resolve the conflicts there.

1. Create a new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database for the new upgraded application. The database should be empty, except for the system tables.

    For example, give the database the name *My Upgraded App*. For more information, see [Creating and Altering Databases](../cside/cside-create-databases.md).

    >[!IMPORTANT]  
    > You must set the collation of the new database to match the collation of the old application database. To see the collation of the old database, open it in the old [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] version, then choose **File** > **Database** > **Alter** > **Collation**. 

2. Make sure the database includes a valid [!INCLUDE[prodshort](../developer/includes/prodshort.md)] license.

    For more information, see [Uploading a License File for a Specific Database](../cside/cside-upload-license-file.md)

3. Import the new merged application object text files (.TXT) from the **Result** folder into the new database.

    There are three ways to import the files:

    - Use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

        For more information see [To import objects by using the development environment UI](../cside/cside-import-objects.md#ImportObjectsDevEnv).
    - Use the finsql.exe to run the [ImportObjects](/dynamics-nav/importobjects) command.

        For more information, see [To import objects by running finsql.exe with the ImportObjects command  ](../cside/cside-import-objects.md#ImportObjectsFinSQL).

    - Use the [!INCLUDE[devshell](../developer/includes/devshell.md)] (or Microsoft.Dynamics.NAV.Model.Tools.psd1 module).

        The shell includes the **Join-NAVApplicationObjectFile** cmdlet and **Import-NAVApplicationObject** function. The **Join-NAVApplicationObjectFile** cmdlet combines multiple application object text files into one text file. The **Import-NAVApplicationObject** function runs the [ImportObjects](/dynamics-nav/importobjects) command to import an object file.

        This means that you can run a command similar to following to create a single text file from the merge application text files in the **Result** folder:

        ```  
        Join-NAVApplicationObjectFile –Source C:\Upgrade\RESULT\*.txt -Destination C:\Upgrade\all-merged.txt
        ```

        Then, you can run this command to import the text file:
        ```  
        Import-NAVApplicationObject –DatabaseServer MyServer –DatabaseName "My Upgraded App" –Path C:\Upgrade\all-merged.txt  
        ```

4. Connect the new [!INCLUDE[server](../developer/includes/server.md)] instance to the database.  

    You can do this with the [!INCLUDE[admintool](../developer/includes/admintool.md)] or the [Set-NAVServerConfiguration cmdlet](https://go.microsoft.com/fwlink/?linkid=401394) in the [!INCLUDE[adminshell](../developer/includes/nav_shell_md.md)]. In addition, you must add the service account that is used by the [!INCLUDE[server](../developer/includes/server.md)] instance as a member of the **db\_owner** role in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database on SQL Server.  

    For more information about how to do this using the [!INCLUDE[admintool](../developer/includes/admintool.md)], see [How to: Connect a Microsoft Dynamics NAV Server Instance to a Database](../administration/connect-server-to-database.md) and [Giving the account necessary database privileges in SQL Server](../deployment/provision-server-account.md#dbo).  

5. Compile all the newly imported objects. Choose to synchronize **later**.

    You can use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] or finsql.exe. For more information, see [Compiling Objects](../cside/cside-compiling-objects.md).

    If you use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], you will first have to set it to use the [!INCLUDE[server](../developer/includes/server.md)] instance that connects to the database. For more information, see [Change the Server Instance Used in C/SIDE](../cside/cside-change-server-instance.md).  

    When you compile the objects, an error is thrown for each code conflict, and you can use the tools that are available in the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to resolve the conflicts.

## Task 6: <!--(Multitenant mode only)-->Check/change the application family and version

The application and tenant databases are tagged with `Family` and `Version`. To perform the data upgrade, the `Family` on the application must match that tenant's `Family`. The `Version` of the application must be greater than or equal to the tenant's `Version`. The easiest way to ensure that `Family` and `Version` of the upgraded application are compatible for data upgrade is to set `Family` to the same value as the old application, and set the `Version` to a higher value than the old application. 

To get the `Family` and `Version`, use the [Get-NAVApplication](/powershell/module/microsoft.dynamics.nav.management/get-navapplication) cmdlet, for example:

```  
Get-NAVApplication -ServerInstance BC
```

To set the `Family` and `Version`, use the [Set-NAVApplication](/powershell/module/microsoft.dynamics.nav.management/set-navapplication) cmdlet. For example, to set the family, run the following command:

```
Set-NAVApplication -ServerInstance <ServerInstanceName> -ApplicationFamily <Family> 
```

To increase the version by 1, run the following command:

```
Set-NAVApplication -ServerInstance <ServerInstanceName> -IncrementApplicationVersion
```

Or, to specify change to another version, run the following command:

```
Set-NAVApplication -ServerInstance <ServerInstanceName> -ApplicationVersion <N.N.N.N> -Force
```

## Task 7: ([!INCLUDE[navnow](../developer/includes/navnow_md.md)] upgrade only) Configure pages and reports to be searchable

The MenuSuite is no longer used to control whether a page or report can be found in the search feature of the Web client. This is now determined by specific properties on the page and report objects. This task is not required at this point, and can be done after the data upgrade as well.

For more information, see [Making Pages and Reports Searchable After an Upgrade](upgrade-pages-report-for-search.md).

## Task 8: Build object search index

Build the object search index to make objects able to be searched from **Tell Me** in the client. If you completed step 7, you can skip this step.

In the **Tools** menu of the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)], select **Build Object Search Index**.

For more information, see [Making Pages and Reports Searchable After an Upgrade](upgrade-pages-report-for-search.md).

## Task 9. ([!INCLUDE[navnow](../developer/includes/navnow_md.md)] upgrade only) Transition the custom code from old codeunit 1 to use the new implementation

Because codeunit 1 has been deprecated in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you must move any custom logic that was included in the old codeunit 1 into the management codeunits and methods described in the article [Transitioning from Codeunit 1](transition-from-codeunit1.md).

You now have a new database with a fully upgraded application. For a multitenant deployment, you can start the data upgrade. For this, you will use the new server instance that connects to the upgraded application database. See [Upgrading the Data](Upgrading-the-Data.md).

## Task 10: (Single-tenant mode only) Export all objects

With a single-tenant deployment, export all objects of the new database to a .fob type file, such as **objects.fob** file. You will use this .fob file as part of the data upgrade process. The export must include customized objects, upgraded reports, and all other [!INCLUDE[prodshort](../developer/includes/prodshort.md)] objects.

As with exporting objects in Task 1, you can use either the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], finsql.exe, or [!INCLUDE[devshell](../developer/includes/devshell.md)].

With the [!INCLUDE[devshell](../developer/includes/devshell.md)], you can run a command that is similar to the following:

```  
Export-NAVApplicationObject c:\Upgrade\objects.fob -DatabaseName "My Upgraded App" -DatabaseServer [server_name]\[database_instance]
```  

This completes the upgrade of the application code for single-tenant deployment. Next, you must upgrade the data in the database. See [Upgrading the Data](Upgrading-the-Data.md).

## <a name="ToolKit"></a>Task 11: (Multitenant mode only) Import the upgrade toolkit objects

The upgrade toolkit includes upgrade codeunits for handling the data upgrade.

For W1 versions, you can find the default upgrade toolkit objects in the  **UpgradeToolKit\Data Conversion Tools** folder on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD). Choose the FOB that matches the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] version from which you are upgrading:

|  From  |  To Business Central April 2019  |  To Business Central October 2018   |
|-----------|-------|-----------|
| [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]| Upgrade80014x.FOB |Upgrade800130.FOB|
| [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]| Upgrade90014x.FOB| Upgrade900130.FOB|
|[!INCLUDE[nav2017](../developer/includes/nav2017.md)]| Upgrade100014x.FOB| Upgrade1000130.FOB|
|[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]| Upgrade110014x.FOB|Upgrade1100130.FOB|
|[!INCLUDE[prodshort](../developer/includes/prodshort.md)] Fall 2018| Upgrade13x14x.FOB|Not applicable|

For local versions, you will find the upgrade toolkit objects in the **UpgradeToolKit\Local Objects** folder. The files follow the same naming convention except they include the 2-letter local version, such as **Upgrade110014x.DK.fob** for Denmark or **Upgrade110014x.DE.fob** for Germany.

For information about importing objects, see [Importing Objects](../cside/cside-import-objects.md).

## <a name="AddExtensions"></a>Task 12: (Multitenant mode only) Publish extensions

1. Unpublish the existing system, test, and application symbols by using the [Unpublish-NAVAPP cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp):
       
        ```
        Unpublish-NAVApp -ServerInstance <ServerInstanceName> -Name <name> -Version <n.n.n.n>
        ```
2. Publish the system and test symbols.
  
    Symbols are a prerequisite for extensions. If you installed the **AL Development Environment**, you can find the symbol files where your installed the environment, which by default is [!INCLUDE[prodx86installpath](../developer/includes/prodx86installpath.md)]. Otherwise, you can find the files in the **ModernDev** folder on the installation media. 

    To publish the symbols, open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and run the following command for each of the symbol files:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
    ```

3. Generate the application symbol references by using the finsql.exe file as follows:

    1. Make sure that **Enable loading application symbol references at server startup** (EnableSymbolLoadingAtServerStartup) is set on the [!INCLUDE[server](../developer/includes/server.md)] instance.

        For more information, see [Configuring Dynamics NAV Server](../administration/configure-server-instance.md).
    2. Open a command prompt as an administrator, change to the directory where the `finsql.exe` file has been installed as part of [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and then run the following command:

        ```
        finsql.exe Command=generatesymbolreference, Database="<MyDatabaseName>", ServerName=<DatabaseServerName>\<DatabaseInstance>
        ```

        Replace values for the `Database` and `ServerName` settings to suit.

        If the application database contains test objects (ID 130000-139999), then make sure to exclude these objects when generating symbols. You can do this by using the `-Filter` parameter and running the command twice:

        ```
        finsql.exe command=generatesymbolreference, ServerName=<DatabaseServerName>\<DatabaseInstance>, Database=<MyDatabaseName>, filter="Object ID=1..129999"
        ```

        ```
        finsql.exe command=generatesymbolreference, ServerName=<DatabaseServerName>\<DatabaseInstance>, Database=<MyDatabaseName>, filter="Object ID=140000..1999999999"
        ```

        > [!NOTE]  
        >  This command does not generate a file. It populates the **Object Metadata** table in the database.

    3. When you run the command, the console returns to an empty command prompt, and does not display or provide any indication about the status of the run. However, the finsql.exe may still be running in the background. It can take several minutes for the run to complete, and the symbols will not be generated until such time. You can see whether the finsql.exe is still running by using Task Manager and looking on the **Details** tab for **finsql.exe**. 
    
        When the process ends, a file named **navcommandresult.txt** is saved to the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] installation folder. If the command succeeded, the file will contain text like `[0] [06/12/17 14:36:17] The command completed successfully in '177' seconds.` If the command failed, another file named **naverrorlog.txt** will be generated. This file contains details about the error(s) that occurred. 
            
    For more information about generation symbols, see [Running C/SIDE and AL Side-by-Side](../developer/devenv-running-cside-and-al-side-by-side.md).

4. <a name="PublishNew"></a>Publish new versions of the Microsoft extensions.

    The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD) includes several new versions of Microsoft extensions (that is, extensions that have **Microsoft** as the publisher). If your old deployment uses these extensions, you have to upgrade the old versions to the new versions.

    > [!IMPORTANT]
    > For Denmark (DK) and German (DE) versions. Some of the local functionality has been moved from the base application to extensions.
    >
    > If you are upgrading from a Denmark (DK) version of Dynamics NAV 2017 or earlier, you must publish and install the following extensions to get the local functionality:
    >
    >|Name|Extension package|
    >|----|---------|
    >|OIOUBL |OIOUBL.app|
    >|Payroll Data Import Definitions (DK)| ImportDKPayroll.app| 
    >|Payment and Reconciliation Formats (DK)|FIK.app |
    >|Tax File Formats (DK)| VATReportsDK.app|
    >
    > If you are upgrading from a German (DE) version of Dynamics NAV or [!INCLUDE[prodshort](../developer/includes/prodshort.md)] October 2018 (Cumulative Update 2 or earlier), you must publish and install the following extensions to get the local functionality:
    >
    >|Name|Extension package|
    >|----|---------|
    >|ELSTER VAT Localization for Germany| Elster.app|

    The new versions are found in the `\Extensions` folder of the installation media.

    To publish the new extension version, run the [Publish-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) cmdlet: 

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
    ```

## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
