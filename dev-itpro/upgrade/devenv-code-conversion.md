---
title: "Code Conversion from C/AL to AL"
description: "Description of the conversion process from C/AL to AL."

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2019
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Code Conversion from C/AL to AL

> [!IMPORTANT]  
> Please note that this topic is a draft in progress. We are still working on adding more details to the steps described in this topic.

With the recent preview release of the base application converted to AL, you can now preview converting your existing C/AL code-customized on-prem solution to an AL code-customized on-prem solution as well. Below outlines the steps involved to do so. Please notice that this is just to test out the conversion; running a modified base application on AL in production is not yet supported. Before venturing into this, we recommend getting familiar with the basics of setting up and developing in Visual Studio Code and AL, see [Developing Extensions in AL](../developer/devenv-dev-overview.md). 

> [!NOTE]  
> Moving on-premise C/AL code customizations to [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)] online, requires converting these to AL extensions. This could include converting the C/AL deltas to AL extension code as a starting point, as outlined in [The Txt2Al Conversion Tool](../developer/devenv-txt2al-tool.md). 

<!--## To run a code conversion from C/AL to AL-->

## Task 1: Import the test library into your C/AL solution

If your solution uses Microsoft (1st-party) extensions, you will have to convert the test library from C/AL to AL, in addition to the base application. The reason for this is that the Microsoft extensions rely on the test symbols. The easiest way to do this is to import the **CALTestLibraries.W1.fob** file into the old database. This file is available on the installation media (DVD) for in the **TestToolKit** folder.

You can do this using the ([!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]) (see [Creating and Altering Databases](../cside/cside-import-objects.md) or [Create-NAVDatabase](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/create-navdatabase?view=businesscentral-ps) cmdlet of the [!INCLUDE[devshell](../developer/includes/devshell.md)].

Alternatively, you can create separate AL project in Visual Studio Code for the test libraries and compile the project to into an extension.

## Task 2: Compile all the objects in your C/AL solution

Compiling all the objects is a prerequisite for a successful and complete export. To compile objects, you can use either of the following:  
- C/SIDE ([!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]). See [Compiling Objects](../cside/cside-compiling-objects.md).
- [Compile-NAVApplicationObject](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/compile-navapplicationobject?view=businesscentral-psPowerShell) cmdlet of the [!INCLUDE[devshell](../developer/includes/devshell.md)]. Make sure to run this as an administrator.

## Task 3: Export the application from the database to the new TXT syntax

Once the application compiles, you must export all C/AL application objects, except system tables and codeunits, to the new TXT format, that can be used as input to the conversion tool. To do so, use the [Export-NAVApplicationObject](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/export-navapplicationobject?view=businesscentral-ps) PowerShell cmdlet with the `ExportToNewSyntax` switch.

When you are converting a custom base application to AL as part, omit all system objects. These have IDs in the 2000000000 range. 

For example, using the [Export-NAVApplicationObject](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/export-navapplicationobject?view=businesscentral-ps), do the following:

1. Create a folder for storing the exported TXT file.
2. Run the following command:
    ```
    Export-NAVApplicationObject -DatabaseServer navdevvm-0127\BCDEMO -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\export2al\exportedbc14app.txt" -Filter 'Id=1..1999999999'
    ```
This can take several minutes.

## Task 4: Create a declaration file for custom .NET assemblies (optional)

If your solution contains .NET interoperability code and control add-ins, you can create a file that contains the declarations to the assemblies. This file will be used when you convert the C/AL TXT files to AL in the next step. Alternatively, after the conversion, you will have to manually add the declarations to objects that use the assemblies.

To create the file, use a text editor or Visual Studio code to create a file that contains the assembly declarations as follows:

``` 
dotnet 

{ 
    assembly("Microsoft.Dynamics.Nav.Client.BusinessChart") 
    { 
        type("Microsoft.Dynamics.Nav.Client.BusinessChart.BusinessChartAddIn";"Microsoft.Dynamics.Nav.Client.BusinessChart") 
        { 
            IsControlAddIn = true; 
        } 

        // Other control add-ins in this assembly 
    } 

    // Other assemblies containing control add ins 
}  

```

Save the file with any name and the extension **.al**, for example **mydotnet.al**. Make a note of the path because you will use it in the next step. 

## Task 5: Convert the C/AL TXT files to AL

With C/AL exported to the new TXT format, you now convert the code to AL using the [The Txt2Al Conversion Tool](../developer/devenv-txt2al-tool.md). The Txt2Al creates .al files for each object in the TXT file.

1. Create folder for storing the .al files.
2. Start a command prompt as administrator, and navigate to the folder that contain txt2al.exe file.

    By default, the location is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client.
3. Run the txt2al command:

    ```      
    txt2al --source=C:\export2al\exportedbc14app.txt --target=C:\export2al\al2 --injectDotNetAddIns --dotNetAddInsPackage=C:\export2al\dotnet\mydotnet.al --dotNetTypePrefix
    ```      

    If your solution contains .NET interoperability code, the following Txt2Al command line parameters should be used to achieve a conversion that requires less manual intervention:  

    - `--injectDotNetAddIns` injects the definition of standard .NET add-ins in the resulting .NET package. The standard .NET add-ins are a set of add-ins that are embedded into the platform.
    - `--dotNetAddInsPackage` should be used to point the conversion tool to an AL file containing declarations for the .NET types that represent .NET control addins. Use this to inject a custom set of .NET control add-in declarations. This is the file you created in the previous step.
        
    - `--dotNetTypePrefix` should be used to specify a prefix for all the .NET type aliases created by the conversion tool. In AL, .NET type declarations are in the global namespace, and this will prevent conflicts between different solutions.

> [!NOTE]
If you are interested in migrating your localization resources, you should use the ```--addLegacyTranslationInfo``` switch to instruct Txt2Al to generate information about the legacy IDs of the translation code.

When completed, there will be an al for for each object.


## Task 6:  Copy CodeViewer add-in to the [!INCLUDE[server](../developer/includes/server.md)] version 15.0 installation

Copy the **CodeViewer** folder from the **Add-ins** folder of the Business Central 140 RoleTailored client installation (C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client\Add-ins) to the **Add-ins** folder of the Business Central 150 Server installation (C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\Add-ins). Replace the existing folder and files, if any.
 
In version 15.0 CodeViewer is no longer used, but it is required because of references thar exist in the converted application. If you omit this step, you might get compilation errors.

## Task 7: Create a new application database for development purposes

To build your base application, you will create a new application database on the Business Central 15.0 platform. This will only be used during development.

1. Start the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.
2. Run the New-NAVApplicationDatabase cmdlet to create the database. For example:

    ```
    New-NAVApplicationDatabase -DatabaseServer .\BCDEMO -DatabaseName MyBC15DevDatabase
    ```

3. Connect your [!INCLUDE[server](../developer/includes/server.md)] instance to the database. See [Connecting a Business Central Server Instance to a Database](../administration/connect-server-to-database.md).

## Task 8: Create and set up an AL project in Visual Studio Code

In this task, you will create a AL project in Visual Studio code that you will use for building your custom base application extension based on your converted C/AL application.

1. If you haven't already, install Visual Studio Code and the latest AL Language extension for version 15.0 as outlined in [Getting Started with AL](../developer/devenv-get-started.md).  
2. Use the **AL Go!** command to create a new project.
3. Remove the HelloWorld.al sample file from the project.
4. Create a **.alpackages** folder in the project and then copy the system (platform) symbols extension (System.app) to the folder.

    The System.app file is located where you installed the AL Development Environment, which by default is the C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment folder. This package contains the symbols for all the system tables and codeunits.

3. Modify the `settings.json` file of Visual Studio Code to include the following settings: 

    - `"al.packageCachePath": "./.alpackages"` and point to a folder containing the System.app package.
    
    - `"al.assemblyProbingPaths": ["./.netpackages"]` and add all the folders that contain .NET assemblies used by your project.

    For example:

    ```
    "al.assemblyProbingPaths": [
    "./.netpackages", "C:/Windows/Microsoft.NET/assembly", "C:/Program Files/Microsoft Dynamics 365 Business Central/150","C:/Program Files/Microsoft Dynamics 365 Business Central/150/service/Addins",:/NugetCache/NET_Framework_472_TargetingPack.4.7.03081.00","C:/NugetCache/Microsoft.Nav.Platform.Main.14.0.28217",
    "C:/windows/assembly/GAC/ADODB","C:/Program Files (x86)/Microsoft Dynamics 365 Business Central/150/RoleTailored Client"],
    ```

    For more information about the settings.json, see [User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings).
4. Modify the app.json for the project:

    - **Important** The ID, name, publisher, and version of the custom base application must match the Business Central base application. Set the parameters to the following values`:

        ```
          "id": "437dbf0e-84ff-417a-965d-ed2bb9650972",
          "name": "Base Application",
          "publisher": "Microsoft",
          "version": "15.0.0.0"
        ```
    - Set the `target` to `OnPrem`.
    - Change the `idRange` to include all the IDs (leave blank).
    - Delete the values in the `dependencies` parameter.

6. Copy all of the AL files generated in the previous step to the root folder of your project.

7. Open the **dotnet.al** file for the project, and make the following changes:

    - Delete all instances of `Version='14.0.0.0';` for **Microsoft.Dynamics.Nav** assembly declarations.
    - For the `DocumentFormat.OpenXml` assembly declaration, remove the `version` and `culture` keys and set `PublicKeyToken = '8fb06cb64d019a17'`.

        ```
        assembly("DocumentFormat.OpenXml")
        {
            PublicKeyToken = '8fb06cb64d019a17';
            ...
        ```

> [!NOTE]  
> Adding assemblies to the folders in your assembly probing paths is not automatically detected by the compiler. You must restart Visual Studio Code for the changes to be detected.

## Task 9: Improve Visual Studio Code editing experience performance (optional)

Visual Studio Code is built to handle many smaller, dependent projects, and not one large project, however, as the base application is not yet split into modules or components that allows managing the code in smaller projects, we recommend the following performance optimizations.

Open your `settings.json` file in the project (or global settings if you prefer that). Set:

- `"al.enableCodeAnalysis": false` to remove code analysis, read more here [Using the Code Analysis Tool](../developer/devenv-using-code-analysis-tool.md).

- `"al.enableCodeActions": false`

- `"editor.codeLens": false` to remove code lens in Visual Studio Code, see [Code Navigation](https://code.visualstudio.com/Docs/editor/editingevolved#_reference-information).

- Add the build folder to the exclusion list for [Windows Defender](https://support.microsoft.com/en-us/help/4028485/windows-10-add-an-exclusion-to-windows-security).

## Task 10: Compile your project in Visual Studio Code
The AL compiler is more strict than the C/SIDE compiler and will issue errors for constructs that are not valid. We recommend that you fix the errors in the C/AL solution and re-export, iterating over steps 1-4 above until all the compilation errors are fixed.

Currently, there are known issues which you might have to address.
 
1. Fixing errors in AzureADUserManagement.Codeunit.al, FlowSelectorTemplate.Page.al, and FlowSelector.Page.al.

    To fix these errors, comment out the code that errors, as shown: 

        - AzureADUserManagement.Codeunit.al
    
            ```
                local procedure GetGraphUserPlans(var TempPlan: Record Plan temporary;var GraphUser: DotNet UserInfo;IncludePlansWithoutEntitlement: Boolean)
            var
                AssignedPlan: DotNet ServicePlanInfo;
                DirectoryRole: DotNet RoleInfo;
                ServicePlanIdValue: Variant;
                IsSystemRole: Boolean;
                HaveAssignedPlans: Boolean;
            begin
                TempPlan.Reset;
                TempPlan.DeleteAll;
        
                // Loop through assigned Azzure AD Plans
                foreach AssignedPlan in GraphUser.AssignedPlans do begin
                  HaveAssignedPlans := true;
                  if AssignedPlan.CapabilityStatus = 'Enabled' then begin
                    ServicePlanIdValue := AssignedPlan.ServicePlanId;
                    if IncludePlansWithoutEntitlement or IsNavServicePlan(ServicePlanIdValue) then
                      AddToTempPlan(ServicePlanIdValue,AssignedPlan.ServicePlanName,TempPlan);
                  end;
                end;
        
                // If there are no Azure AD Plans, loop through Azure AD Roles
                /* if not HaveAssignedPlans then
                  foreach DirectoryRole in Graph.GetUserRoles(GraphUser) do begin
                    Evaluate(IsSystemRole,Format(DirectoryRole.IsSystem));
                    if IncludePlansWithoutEntitlement or IsSystemRole then
                      AddToTempPlan(DirectoryRole.RoleTemplateId,DirectoryRole.DisplayName,TempPlan);
                  end; */
            end;
    
            ```
        - FlowSelectorTemplate.Page.al
    
            ```   
            usercontrol(FlowAddin;"Microsoft.Dynamics.Nav.Client.FlowIntegration")
            {
            ApplicationArea = Basic,Suite;
        
            trigger ControlAddInReady()
            begin
            /*                                 CurrPage.FlowAddin.Initialize(
                FlowServiceManagement.GetFlowUrl,FlowServiceManagement.GetLocale,
                AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowARMResourceUrl,FlowServiceManagement.GetFlowResourceName,false),
                AzureAdMgt.GetAccessToken(FlowServiceManagement.GetAzureADGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,false),
                AzureAdMgt.GetAccessToken(FlowServiceManagement.GetMicrosoftGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,false));
    
            LoadTemplates;
    
            AddInReady := true; */
            end;
            ```   
            ```
        - FlowSelector.Page.al
    
            ```   
                group(Control3)
                {
                    ShowCaption = false;
                    Visible = IsUserReadyForFlow AND NOT IsErrorMessageVisible;
                    usercontrol(FlowAddin;"Microsoft.Dynamics.Nav.Client.FlowIntegration")
                    {
                        ApplicationArea = Basic,Suite;
    
                        trigger ControlAddInReady()
                        begin
                        /*     CurrPage.FlowAddin.Initialize(
                              FlowServiceManagement.GetFlowUrl,FlowServiceManagement.GetLocale,
                              AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowARMResourceUrl,FlowServiceManagement.GetFlowResourceName,false),
                              AzureAdMgt.GetAccessToken(FlowServiceManagement.GetAzureADGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,false),
                              AzureAdMgt.GetAccessToken(FlowServiceManagement.GetMicrosoftGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,false));
    
                            LoadFlows;
    
                            AddInReady := true; */
                        end;
            ```  
    
        - PowerBIServiceMgt.Codeunit.al (ImportReportRequest)
        - Debugger objects 

        After you fix these issues, build tha project again.    
<!--
   2. CodeViewer related errors.

      CodeViewer is no longer used. Either remove all references to it in the application (recommended) or copy the **CodeViewer** folder from the Add-in folder of Business Central 140 RoleTailored client installation to the Add-ins folder of the Business Central 150 Server installation.
-->
<!--
3. Publish the custom application:

    1. Publish the platform system symbols:

        ```
        Publish-NAVApp -ServerInstance BC150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
        ```
    2. Publish the custom base app extension:

        ```
        Publish-NAVApp -ServerInstance BC150 -Path "C:\Users\jswymer\Documents\AL\CusomtBaseApp2\Microsoft_BaseApp_15.0.34982.0.app" -SkipVerification
        ```
-->
<!--
## 8. Convert the test toolkit library and test runner codeunits to AL extension

If solution will use Microsoft (1st party) extensions, you will have to convert the test toolkit libraries and test runner code units to AL because these extensions have a dependency on the test toolkit. The process is similar to what you did to convert your custom base application to AL.

<!--1. Create a new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.

    You can do this using the ([!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]) (see [Creating and Altering Databases](../cside/cside-create-databases.md) or [Create-NAVDatabase](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/create-navdatabase?view=businesscentral-ps) cmdlet of the [!INCLUDE[devshell](../developer/includes/devshell.md)].

2. Import the CALTestLibraries.W1.fob <!--and CALTestRunner.fob> file into the old database.

    You can do this using the ([!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]) (see [Creating and Altering Databases](../cside/cside-import-objects.md) or [Create-NAVDatabase](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/create-navdatabase?view=businesscentral-ps) cmdlet of the [!INCLUDE[devshell](../developer/includes/devshell.md)].
    
    Make sure to compile and synchronize.
3. Export the test library objects to the new TXT syntax. The test objects have IDs in the 130000 range and are tagged with the Version List of NAVW114.40.00,Test.   

    ``` 
    Export-NAVApplicationObject -DatabaseServer navdevvm-0127\BCDEMO -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\txt\expoertedbc14TESTapp.txt" -Filter 'Version list=NAVW114.40.00,Test'
    ``` 

4. Convert the TXT file to AL by using the Txt2Al tool.

    ``` 
    txt2al --source=C:\exporttoal --target=C:\exporttoal\testapp\al --injectDotNetAddIns
    ``` 
5.  Create and set up an AL project in Visual Studio Code.

6. In the app.json file, make the following changes:

    - Add a dependency on the base application.

        ``` 
        "dependencies": [
        {
            "appId": "437dbf0e-84ff-417a-965d-ed2bb9650972",
            "publisher": "Microsoft",
            "name": "BaseApp",
            "version": "15.0.34982.0"
        }
        ],
        ```
    -  Set the `version` to the old application version, such as `14.4.0.0`.
7. Copy all of the AL files, except the dotnet.al file, that were generated in the previous step to the root folder of your project.

8. Build the project.

    Had to modify or remove LibraryAzureADUserMgmt.Codeunit.al, LibraryVerifyXMLSchema.Codeunit, LibraryVerifyXML.Codeunit.al, and LibraryLowerPermissions.Codeunit.al
-->
## Task 11: Publish your project
When your converted solutions compile to an app, you can deploy and run it. You can either create and publish to your own database, or use the recently release Docker AL Preview image.

### Publishing the AL solution to an empty database 

1. Use the [Create-NAVDatabase](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/create-navdatabase?view=businesscentral-ps) cmdlet to create a new database.

2. Create a new service instance and connect it to the newly created database. 

3. Use the [Publish-NAVApp](https://docs.microsoft.com/en-us/powershell/module/Microsoft.Dynamics.Nav.Apps.Management/Publish-NAVApp?view=businesscentral-ps) cmdlet to publish the System.app by specifying `-PackageType SymbolsOnly`.

4. Add any custom .NET assemblies to your service's Add-Ins folder or create symbolic links in the Add-Ins folder pointing to the folders in your project's `assemblyProbingPaths`. 

5. Publish your extension, either using:  

- PowerShell cmdlets as described in [Publishing and Installing an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md), or  

- Publish from within Visual Studio Code by defining the server configuration in launch.json and publish with **Ctrl+F5**. 

### Publishing to a Docker AL Preview image
We recently released a Docker AL Preview image as part of the Insider program, containing the BaseApp published as an extension. You can use this to deploy your own modified AL application.

1. Uninstall and unpublish the BaseApp extension and any other extensions that might depend on it. 

2. Add any custom .NET assemblies to your service's Add-Ins folder or create symbolic links in the Add-Ins folder pointing to the folders in your project's `assemblyProbingPaths`. 

3. Publish your extension: 

    - Using the PowerShell cmdlets as described in [Publishing and Installing an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md). 

    - Publish from within Visual Studio Code by defining the server configuration in `launch.json` and publish with **Ctrl+F5**. 

## See Also
[The Txt2Al Conversion Tool](../developer/devenv-txt2al-tool.md)  
[Developing Extensions](../developer/devenv-dev-overview.md)  
[AL Development Environment](../developer/devenv-reference-overview.md)  
[Page Extension Object](../developer/devenv-page-ext-object.md)  
[Report Object](../developer/devenv-report-object.md)  
[Page Properties](../developer/properties/devenv-page-property-overview.md)