---
title: Upgrade Application Code
description: The article explains how to upgrade the application code and how to merge code from different versions of the application.
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
manager: edupont
ms.service: "dynamics365-business-central"
---
# Upgrading to [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Wave 2

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2019 Wave 2 marks the first release where C/AL is fully deprecated and replaced with AL. This means that the entire system and base application is based on extensions. This change will influence how you perform the upgrade compared to earlier releases.

For now, these steps are for a single tenant deployment.

## Upgrading an unmodified application

Use this scenario if you have a Business Central application that has not been modified. The application might include Microsoft (1st party) extensions and custom extensions (3rd party). With this upgrade, you will replace the C/AL base application with the new Business Central V15.0 base app extension. The result will be a fully upgraded application and platform on V15.0.

<!-- For this scenario, I am upgrading a BC 14.0 unmodified base application. Because the application was unmodified, I upgraded to the BC 15 base app.-->

 ![Upgrade on unmodified Business Central application](../developer/media/bc15-upgrade-unmodified-app.png "Upgrade on unmodified Business Central application") 

### Prerequisite

1. Upgrade to the latest Business Central Spring 2019 Cumulative Update.

### Prepare the old application and tenant databases for upgrade

1. Make backup of the databases.
2. Uninstall all extensions from the tenants.

    ``` 
    Get-NAVAppInfo -ServerInstance bc140 -Tenant default | % { Uninstall-NAVApp -ServerInstance bc140 -Name $_.Name -Version $_.Version }
    ``` 
3. Unpublish all system, test, and application symbols from the application.

    ``` 
    Get-NAVAppInfo -ServerInstance bc140 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance bc140 -Name $_.Name -Version $_.Version }

        ``` 
5. Dismount the tenant from the old application and stop the old Server instance.

### Upgrade the application to the 15.0 platform
     
1. Run a technical upgrade on the application to convert ot to the 15.0 platform.

    Start the Dynamics NAV Dev Shell as and administrator, and run the Invoke-NAVApplicationDatabaseConversion cmdlet:

    ```
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "demo database bc (14-0)"
    ```
2. Connect a Business Central 15.0 server instance to the database and start the instance.
3. Increase the application version.

    ```
    Set-NAVApplication bc150 -ApplicationVersion 15.0.34737.0 -force
    ```
4. Publish platform system symbols.

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```
5. Publish the System Application extension.

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_System Application_15.0.34737.0.app" -SkipVerification
    ```

6. Publish the Business Central Base Application extension:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_BaseApp_15.0.34737.0.app" -SkipVerification
    ```

### Synchronize and upgrade the tenant

1. Mount the tenant to the application server instance.
2. Synchronize the tenant with the application.

    ```  
    Sync-NAVTenant bc150
    ```
    At this stage, the tenant state is **OperationalDataUpgradePending**.

3. Delete all objects except system objects. Do not synchronize the tenant/tables. 
4. Synchronize the tenant with the System Application extension (Microsoft_System Application_15.0.34737.0):

    ```
    Sync-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0
    ```
5. Synchronize the tenant with the Business Central Base Application extension (BaseApp):

    Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0 -Mode ForceSync

    This can take several minutes. 

    <!--**Error:**

    Got this error the second time:
    
    ```
    Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
    Sync-NAVApp : Table Invoice Post. Buffer :: Unsupported field change.
    Field:Additional Grouping Identifier; Change:LengthChanged
    Table Incoming Document :: Unsupported field change. Field:URL1; Change:Remove
    Table Incoming Document :: Unsupported field change. Field:URL2; Change:Remove
    Table Incoming Document :: Unsupported field change. Field:URL3; Change:Remove
    Table Incoming Document :: Unsupported field change. Field:URL4; Change:Remove
    At line:1 char:1
    + Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : InvalidOperation: (:) [Sync-NAVApp], InvalidOper
       ationException
        + FullyQualifiedErrorId : MicrosoftDynamicsNavServer$bc150/nav-systemappli
       cation,Microsoft.Dynamics.Nav.Apps.Management.Cmdlets.SyncNavApp
    ```
    
    To fix this I synced again using `-mode forcesync`.

    -->
    

6. Upgrade the tenant data:

    ```
    Start-NAVDataUpgrade bc150 -FunctionExecutionMode Serial -Force -SkipCompanyInitialization
    ```        

    This upgrades the data and installs the System Application and BaseApp extensions on the tenant. If you do not want to install the extensions, use the `-ExcludeExtensions` parameter. In this, case you will have to manually install these extensions before the next step and to open the client.

    To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch.
    
    When completed, the tenant state should be **Operational**.

<!--
15. The upgrade installs System Application on the tenant. If it does not, manually install it on the tenant.

    ```
    Install-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0
    ```
16. Install base application extension on the tenant:

    ```
    Install-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
    ```
-->
### Publish and upgrade Microsoft extensions

1. Publish an extension:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\W1DVD\Extensions\SalesAndInventoryForecast.app" -SkipVerification
    ```
2. Sync the tenant with the extension:

    ```
    sync-navapp bc150 -Name "Sales and Inventory Forecast" -Version 15.0.34737.0
    ```
3. Upgrade the data to the extension:

    ```
    Start-NAVAppDataUpgrade bc150 -Name "Sales and Inventory Forecast" -Version 15.0.34737.0
    ```    


### Publish and install 3rd party extensions.

**Option one - upgrade extension code**

1. (optional) Upgrade the extension package to reference the base app and system app.

    1. Open the project in Visual Studio Code.
    2. Download the symbols.
    3. Modify the `dependencies` parameter in the app.json file to include dependencies on the base app and system app: 

        ```
            "dependencies": [      {
            "appId": "63ca2fa4-4f03-4f2b-a480-172fef340d3f",
            "publisher": "Microsoft",
            "name": "System Application",
            "version": "15.0.0.0"
            },
            {
            "appId": "437dbf0e-84ff-417a-965d-ed2bb9650972",
            "publisher": "Microsoft",
            "name": "BaseApp",
            "version": "15.0.0.0"
            }]

    4. Build the project.

2. Publish Microsoft and 3rd-party extensions that were previously published:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "C:\Users\jswymer\Documents\AL\My14Extension\Default publisher_My14Extension_1.0.0.3.app" -SkipVerification
    ```
3. Synchronize the tenant with the extension:

    ```
    Sync-NAVApp bc150 -Name My14Extension -Version 1.0.0.3
    ```
4. Upgrade the data to the extension:

    ```
    Start-NAVAppDataUpgrade bc150 -Name My14Extension -Version 1.0.0.3
    ```    

    This upgrades the data and installs the extension version.

**Option two - configure server:**

You can only use this option if you unpublish the old 3rd party extension version.

1. Unpublish all 3rd party extensions.

    This is only necessary if you do not modify the extension code to include a dependency on the baseApp and System Application extension.
2. Configure the Server Instance :

    ```
    Set-NAVServerConfiguration bc150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"BaseApp", "publisher": "Microsoft"},{"appId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f", "name":"System Application", "publisher": "Microsoft"} ]'
    ```
2. Publish Microsoft and 3rd-party extensions that were previously published:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "C:\Users\jswymer\Documents\AL\My14Extension\Default publisher_My14Extension_1.0.0.3.app" -SkipVerification
    ```
4. Synchronize the tenant with the extension:

    ```
    Sync-NAVApp bc150 -Name My14Extension -Version 1.0.0.3
    ```
5. Install the extension:

    ```
    Install-NAVApp bc150 -Name My14Extension -Version 1.0.0.3
    ```

## Upgrading a Customized Application to the 15.0 Platform - Technical Upgrade

<!--
### Option 1 - Convert entire solution to an extension

For this scenario, I used a BC 14.0 modified base application on a BC 14.0 server instance. This process will convert the entire BC 14 cusom application to an Extension on the BC 15 platform.

 
1. Upgrade to Business Central Spring 2019.
2. Make backup of the database.
3. Uninstall extensions from the tenants.
4. Convert your application from C/AL to AL.

   1. Export all objects except system objects to txt in new syntax for AL. For this, I used Development Shell run as an admin:
    
      ```
      Export-NAVApplicationObject -DatabaseServer navdevvm-0127\BCDemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=1..1999999999'
      ```
    There is a switch that you can set to tartget the runtime to 4.0. You should set this so you will not get so many warnings.  This is not documented yet.

    2. If you have custom .Net addins, create a declaration file (.al). I created a small file called mydotnet.al

        ```
        dotnet
        {
            assembly("Microsoft.Dynamics.Nav.Client.BusinessChart")
            {
                type("Microsoft.Dynamics.Nav.Client.BusinessChart.BusinessChartAddIn";"Microsoft.Dynamics.Nav.Client.BusinessChart")
                {
                    IsControlAddIn = true;
                }
            }
        
            assembly("Microsoft.Dynamics.Nav.Client.TimelineVisualization")
            {
                type("Microsoft.Dynamics.Nav.Client.TimelineVisualization.InteractiveTimelineVisualizationAddIn";"Microsoft.Dynamics.Nav.Client.TimelineVisualization")
                {
                    IsControlAddIn = true;
                }
            }
        }
        ```
    3. Start a command prompt as administrator, navigate to the txt2al.exe location, and run the following command to convert to *.al. By default, the location is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client

       ```      
        txt2al --source=C:\exporttoal --target=C:\exporttoal\al --dotNetAddInsPackage=C:\exporttoal\dotnet\mydotnet.al
       ```      
    
    This will create separate al file for each object.
3. Create a new application database on BC 15. Use the New-NAVApplicationDatabase cmdlet of the Aministration Shell:

    ```
    New-NAVApplicationDatabase -DatabaseServer navdevvm-0127\BCDEMO -DatabaseName MyTest15Db
    ```
    
4. Connect to BC 15 server Instance to the database
5. Create a project for application in VS Code.

    - Connect to the BC 15 Server instance.
6. Modify the app.json:

    - Set the `id`:

        ```
          "id": "437dbf0e-84ff-417a-965d-ed2bb9650972",
          "name": "BaseApp",
          "publisher": "Microsoft",
          "version": "15.0.34982.0"
        ```
    - Set the target in the app.json to OnPrem.
    - In the app.json change the `idRange` to include all the IDs (leave blank).
    - Delete the values in the `dependencies` parameter  
7. Manually copy the System symbols extension (Microsoft_System_15.0.34942.0.app) to the **.alpackages** folder.

    <!-- **Error:**

    I tried to us the Download Symbols command but could not because of error: {
	"resource": "/c:/Users/jswymer/Documents/AL/CusomtBaseApp2/app.json",
	"owner": "_generated_diagnostic_collection_name_#1",
	"code": "AL1045",
	"severity": 8,
	"message": "The package cache c:\\Users\\jswymer\\Documents\\AL\\CusomtBaseApp2\\./.alpackages could not be found.",
	"source": "AL",
	"startLineNumber": 1,
	"startColumn": 1,
	"endLineNumber": 1,
	"endColumn": 1


8. Modify the settings.json file in Visual Studio Code to include paths to .NET assemblies. Set the `"al.assemblyProbingPaths"` parameter:

    ```
    	"al.assemblyProbingPaths": [
		"./.netpackages", "C:/Windows/Microsoft.NET/assembly", "C:/Program Files/Microsoft Dynamics 365 Business Central/150","C:/Program Files/Microsoft Dynamics 365 Business Central/150/service/Addins",
		"C:/NugetCache/NET_Framework_472_TargetingPack.4.7.03081.00",
		"C:/NugetCache/Microsoft.Nav.Platform.Main.14.0.28217",
		"C:/windows/assembly/GAC/ADODB",
		"C:/Depot/NAV/test/App/MockService/MockService",
		"C:/Depot/NAV/test/App/MockTest",
		"C:/Depot/NAV/test/App/ALTest/DGMLVisualizationAddIn", "C:/Program Files (x86)/Microsoft Dynamics 365 Business Central/150/RoleTailored Client"
	],
    ```
8. Open the **dotnet.al** file and remove all instances of "Version=14.0.0.0" for **Microsoft.Nav** assemblies. Set reove the version and culture key from DocumentFormat.OpenXml and set the PublicKeyToken = '8fb06cb64d019a17'


    ```
    assembly("DocumentFormat.OpenXml")
    {
        PublicKeyToken = '8fb06cb64d019a17';

9. Build the project.

  <!--  **Error:**

    I got errors compiling the following objects. To fix, I had to comment out code:

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

11. Build project again. This time the package build succeeded.

12. Copy the CodeViewer addin from the RoleTailored client installation to the BC 15 Server installation add-ind folder. Replace all.

12. Run a technical upgrade on the application in the old database. This will upgrade the system tables to the BC 15 platform. Start the Business Central Administration Shell as an admin, and run this command: 

    ``` 
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "demo database bc (14-0)"
    ``` 

    What id to made changes to system tables?

13. Connect the BC 15 server to the old database.
14. Increase the application application version.

    ``` 
    Set-NAVApplication bc150 -ApplicationVersion 15.0.34737.0 -force

    ``` 
15. Publish platform system symbols:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```

    Should you unpublish old all old symbols?
16. Publish the custom base app:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_BaseApp_15.0.34737.0.app" -SkipVerification
    ```

    **Error:**

    I got several error on various objects, which prevented me from going any further:
    - ExcelBuffer.Table.al
    - ConfigExcelExchange.Codeunit.al
    - OpenXMLManagement.Codeunit.al
    - QuestionnaireManagement.Codeunit.al
    - dotnet.al(1995,14): error AL0451: An assembly named 'Microsoft.Dynamics.Nav.Client.CodeViewer, PublicKeyToken=null' could not be found in the assembly probing paths 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\
Central\150\Service\, C:\windows\Microsoft.NET\assembly\'
DebuggerCodeViewer.Page.al(14,36): error AL0417: Control add-in '"Microsoft.Dynamics.Nav.Client.CodeViewer"' not found
    
17. Synchronize the tenant.
  
    ```
    C:\windows\system32> Sync-NAVTenant bc150
    ```
 
18. Delete all objects except system objects from application database.

19. Synchronize the tenant with the base application extension (BaseApp):

    ```
    Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
    ```
20. Upgrade the tenant data:

    ```
    Start-NAVDataUpgrade bc150 -FunctionExecutionMode Serial -Force -SkipCompanyInitialization
    ```
        
21. Install system application extension (Microsoft_System Application_15.0.34737.0) on tenant.

    ```
    Sync-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0
    ```

22. Install base Application extension on the tenant:

    ```
    Install-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
    ```


### Clean steps
-->

Use this process when you have a customized Business Central application that you want to upgrade to the Business Central Wave 2 platform. This will not upgrade the application to the latest version. With this process, you will convert the entire application from C/AL to an base application extension.

<!-- For this scenario, I used a BC 14.0 modified base application on a BC 14.0 server instance, which include some customization on C/AL objects in the base application and a custom extension that modified the Item table. is proecess will convert the entire BC 14 custom application to an Extension on the BC 15 platform.-->

 ![Upgrade on customized Business Central application](../developer/media/bc15-upgrade-customized-app.png "Upgrade on customize Business Central application")  
 
### Prerequisites

1. Upgrade to Business Central Spring 2019.

### Convert your application from C/AL to AL

1. Export all objects except system objects to txt in new syntax for AL. For this, I used Development Shell run as an admin:

    ```
    Export-NAVApplicationObject -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=1..1999999999'
    ```

    Optionally, omit the text objects:


    ```
    Export-NAVApplicationObject -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=1..129999'
    ```
    
    ```
    Export-NAVApplicationObject -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=140000..1999999999'
    ```
    
    There is a switch that you can set to tartget the runtime to 4.0. You should set this so you will not get so many warnings.  This is not documented yet.

2. If you have custom .Net addins, create a declaration file (.al). I created a small file called mydotnet.al

    ```
    dotnet
    {
        assembly("Microsoft.Dynamics.Nav.Client.BusinessChart")
        {
            type("Microsoft.Dynamics.Nav.Client.BusinessChart.BusinessChartAddIn";"Microsoft.Dynamics.Nav.Client.BusinessChart")
            {
                IsControlAddIn = true;
            }
        }
    
        assembly("Microsoft.Dynamics.Nav.Client.TimelineVisualization")
        {
            type("Microsoft.Dynamics.Nav.Client.TimelineVisualization.InteractiveTimelineVisualizationAddIn";"Microsoft.Dynamics.Nav.Client.TimelineVisualization")
            {
                IsControlAddIn = true;
            }
        }
    }
    ```
3. Start command prompt as administrator, navigate to txt2al.exe, and run the following command to convert to *.al. By default, the location is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client

    ```      
    txt2al --source=C:\exporttoal --target=C:\exporttoal\al --dotNetAddInsPackage=C:\exporttoal\dotnet\mydotnet.al
    ```      

    This will create separate al file for each object.

3. Create a new application database on BC 15. Use the New-NAVApplicationDatabase cmdlet of the Aministration Shell:

    ```
    New-NAVApplicationDatabase -DatabaseServer navdevvm-0127\BCDEMO -DatabaseName MyTest15Db
    ```
4. Connect to BC 15 server Instance to the database.
5. Create a project for application in VS Code.

    - Connect to the BC 15 Server instance.
6. Modify the app.json:

    - Set the `id`:

        ```
          "id": "437dbf0e-84ff-417a-965d-ed2bb9650972",
          "name": "BaseApp",
          "publisher": "Microsoft",
          "version": "15.0.34982.0"
        ```
    - Set the target in the app.json to OnPrem.
    - In the app.json change the `idRange` to include all the IDs (leave blank).
    - Delete the values in the `dependencies` parameter  
7. Manually copy the system (platform) symbols extension (Microsoft_System_15.0.34942.0.app) to the **.alpackages** folder.

    <!-- **Error:**

    I tried to us the Download Symbols command but could not because of error: {
	"resource": "/c:/Users/jswymer/Documents/AL/CusomtBaseApp2/app.json",
	"owner": "_generated_diagnostic_collection_name_#1",
	"code": "AL1045",
	"severity": 8,
	"message": "The package cache c:\\Users\\jswymer\\Documents\\AL\\CusomtBaseApp2\\./.alpackages could not be found.",
	"source": "AL",
	"startLineNumber": 1,
	"startColumn": 1,
	"endLineNumber": 1,
	"endColumn": 1
    -->
8. Modify the settings.json file in Visual Studio Code to include paths to .NET assemblies. Set the `"al.assemblyProbingPaths"` parameter:

    ```
    	"al.assemblyProbingPaths": [
		"./.netpackages", "C:/Windows/Microsoft.NET/assembly", "C:/Program Files/Microsoft Dynamics 365 Business Central/150","C:/Program Files/Microsoft Dynamics 365 Business Central/150/service/Addins",
		"C:/NugetCache/NET_Framework_472_TargetingPack.4.7.03081.00",
		"C:/NugetCache/Microsoft.Nav.Platform.Main.14.0.28217",
		"C:/windows/assembly/GAC/ADODB", "C:/Program Files (x86)/Microsoft Dynamics 365 Business Central/150/RoleTailored Client"
	],
    ```
8. Modify the **dotnet.al** file to remove all instances of "Version=14.0.0.0" for **Microsoft.Nav** assemblies and for the `DocumentFormat.OpenXml` assembly declaration, remove the `version` and `culture` keys and set `PublicKeyToken = '8fb06cb64d019a17'`.


    ```
    assembly("DocumentFormat.OpenXml")
    {
        PublicKeyToken = '8fb06cb64d019a17';

9. Make the following modifications to the application:
    1. Comment out code in the following objects:

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

   2. CodeViewer is no longer used. Either remove all references to it in the application (recommended) or copy the **CodeViewer** folder from the Addin folder of Business Central 140 RoleTailored client installation to the Addins folder of the Business Central 150 Server installation.

10. Build the extension package.

### Convert the test application to AL

At minimum, you must create an extension that contains the test libraries (CALTestLibraries.W1.fob) and test runner objects (CALTestRunner.fob). This is required for re-pubishing Microsoft extensions as part of the upgrade.. 
 
 Contains codeunits with generic and application-specific functions to reduce duplication of test code.
 
CALTestRunner.fob
 
 
1. If not already done, import the CALTestLibraries.W1.fob and CALTestRunner.fob files into the old database. Theese are available in the TestToolki folder of the installation DVD.

2. Export all test objects to a txt file in new syntax for AL. For this, I used Development Shell run as an admin:
    
      ```
      Export-NAVApplicationObject -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=130000..139999'

3. Start command prompt as administrator, navigate to txt2al.exe, and run the following command to convert to *.al. By default, the location is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client

    ```      
    txt2al --source=C:\exporttoal --target=C:\exporttoal\al --dotNetAddInsPackage=C:\exporttoal\dotnet\mydotnet.al
    ```      
4. Create an Al project.

5. Connect to Business Central 15.0 Server instance.

5. Add the system symbols and custom base application extensions to the **.alpackages** folder of the project.

6. In the app.json, add a dependency on the custom base app.

    <!-- 
    I had to remove AppliedPaymentEntriesTest.Codeunit, BankPmtApplAlgorithm.Codeunit, BankPmtApplTolerance.Codeunit, GetSemiManualTestCodeunits.Page, LibraryAzureADUserMgmt.Codeunit, LibraryVerifyXMLSchema.Codeunit files because of errors I also had to comment out refereences to PermissionTestHelper in LibraryLowerPermissions.Codeunit.al-->

7. Build the project.

    Make a note of the name, ID, and publisher.


### Upgrade the application database to the Business Central V15.0 platform
 
1. Make backup of the database.
2. Uninstall all extensions from the old tenants. Use the Admin Shell for Business Central Spring 2019:

    ``` 
    Get-NAVAppInfo -ServerInstance bc140 -Tenant default | % { Uninstall-NAVApp -ServerInstance bc140 -Name $_.Name -Version $_.Version }
    ``` 
3. Unpublish all system and application symbols.

    ``` 
    Get-NAVAppInfo -ServerInstance bc140 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance bc140 -Name $_.Name -Version $_.Version }
    ```     
4. Unpublish all extensions from the application.

    1. Get a list of published extensions:

        ```    
        Get-NAVAppInfo bc140
        ``` 
    2. Unpublish all extensions from the application service:

        ```
        Get-NAVAppInfo -ServerInstance bc140 | % { Unpublish-NAVApp -ServerInstance bc140 -Name $_.Name -Version $_.Version }

1. Dismount tenant and stop BC14 Server instance.

4. Run a technical upgrade on the old application database by using the Business Central 2019 Wave 2 Administration Shell. This will upgrade the system tables to the BC 15 platform. Start the Business Central Administration Shell as an admin, and run this command: 

    ``` 
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "demo database bc (14-0)"
    ``` 

    <!--What if to made changes to system tables?-->


### Upgrade the application

1. Connect the Business Central 15.0 Server instance to the old application database.

2. Increase the application version:

    ``` 
    Set-NAVApplication bc150 -ApplicationVersion 15.0.34982.0 -force

    ``` 
3. Publish platform system symbols:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```
4. Publish the custom base app extension:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "C:\Users\jswymer\Documents\AL\CusomtBaseApp2\Microsoft_BaseApp_15.0.34982.0.app" -SkipVerification
    ```

5. Synchronize the tenant.
  
    ```
    Sync-NAVTenant bc150
    ```
    When completed the tenant state is OperationalDataUpgradePending.
6. Delete all objects except system objects from application database (IDs 2000000000 and greater). Do not synchronize the tenant/tables. 

7. Synchronize the tenant with the base application extension (BaseApp):

    ```
    Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34982.0
    ```

    This will append tables in database with guids extensions.
8. Upgrade the tenant data:

    ```
    Start-NAVDataUpgrade bc150 -FunctionExecutionMode Serial -Force -SkipCompanyInitialization
    ```
<!-- not required with full cusom app       
21. Install system application extension (Microsoft_System Application_15.0.34737.0) on tenant.

    ```
    Install-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0
    ```
-->

9. Install custom base application extension on the tenant:

    ```
    Install-NAVApp bc150 -Name "BaseApp" -Version 15.0.34982.0
    ```

    <!-- I got an error when I tried to do this at first: The get-navdataupgrade indicates that it is done.
        C:\windows\system32> Get-NAVDataUpgrade bc150 -Tenant default
        
        
        ExtensionData             : System.Runtime.Serialization.ExtensionDataObject
        TenantId                  : default
        TotalFunctionCount        : 17
        ExecutedFunctions         : 17
        UpgradeExecutionMode      : UsingParallelOrSerialTransaction
        Progress                  : 100.00 %
        Details                   : {}
        Errors                    :
        ExecutionDetails          : {BASE, BASE, BASE, BASE...}
        ExecutionErrors           :
        State                     : Completed
        NumericProgress           : 1
        IsTenantInExclusiveAccess : False
        
        
        
        C:\windows\system32> Install-NAVApp bc150 -Name "BaseApp" -Version 15.0.34982.0
        Install-NAVApp : Could not install the extension BaseApp on tenant default due to the following error: Error code: 85132273
        At line:1 char:1
        + Install-NAVApp bc150 -Name "BaseApp" -Version 15.0.34982.0
        + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            + CategoryInfo          : InvalidOperation: (:) [Install-NAVApp], InvalidOperationException
            + FullyQualifiedErrorId : MicrosoftDynamicsNavServer$bc150/default,Microsoft.Dynamics.Nav.Apps.Management.Cmdlets.InstallNavApp 

            C:\windows\system32> Install-NAVApp bc150 -Name BaseApp -Version 15.0.34982.0
            Install-NAVApp : Could not install the extension BaseApp on tenant default due to the following error: Error code: 85132273
            At line:1 char:1
            + Install-NAVApp bc150 -Name BaseApp -Version 15.0.34982.0
            + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                + CategoryInfo          : InvalidOperation: (:) [Install-NAVApp], InvalidOperationException
                + FullyQualifiedErrorId : MicrosoftDynamicsNavServer$bc150/default,Microsoft.Dynamics.Nav.Apps.Management.Cmdlets.InstallNavApp
            
            C:\windows\system32> Install-NAVApp bc150 -Name BaseApp -Version 15.0.34982.0 -Tenant default
            Install-NAVApp : Could not install the extension BaseApp on tenant default due to the following error: Error code: 85132273
            At line:1 char:1
            + Install-NAVApp bc150 -Name BaseApp -Version 15.0.34982.0 -Tenant defa ...
            + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                + CategoryInfo          : InvalidOperation: (:) [Install-NAVApp], InvalidOperationException
                + FullyQualifiedErrorId : MicrosoftDynamicsNavServer$bc150/default,Microsoft.Dynamics.Nav.Apps.Management.Cmdlets.InstallNavApp
            
            C:\windows\system32> Restart-NAVServerInstance bc150
            
            
            ServerInstance : MicrosoftDynamicsNavServer$BC150
            DisplayName    : Microsoft Dynamics 365 Business Central Server [BC150]
            State          : Running
            ServiceAccount : NT AUTHORITY\NETWORK SERVICE
            Version        : 15.0.34942.0
            Default        : True
            
            --> 
        
9. Prepare to publish and upgrade Microsoft and 3rd party extensions

    To publish 3rd party extensions, the extensions must be modified with a dependency on the custom base application extension. There are two ways you can do this. One way is to modify the extension code and build the package again. The other way is to configure the Business Central Server instance. This is the recommended way.

   <!-- 1. Either change teh app.json file for each extension, so that the application version is removed and the dependency is added for the custom Base App.Or, configure the DestinationAppsForMigration server setting. 

    ```
    Repair-NAVApp bc150 -Name  My14Extension -Version 1.0.0.0
    ``` 1. Sync repaired app.:

    ```
    Repair-NAVApp bc150 -Name  My14Extension -Version 1.0.0.0
    ```
    
    **Error:**

    C:\windows\system32> sync-navApp bc150 -Name  My14Extension -Version 1.0.0.0
    WARNING: Cannot synchronize the extension My14Extension because it is already synchronized.
    C:\windows\system32> install-navApp bc150 -Name  My14Extension -Version 1.0.0.0
    install-navApp : Object of type Table with ID 18 could not be found.
    At line:1 char:1
    + install-navApp bc150 -Name  My14Extension -Version 1.0.0.0
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : InvalidOperation: (:) [Install-NAVApp], InvalidOperationException
        + FullyQualifiedErrorId : MicrosoftDynamicsNavServer$bc150/default,Microsoft.Dynamics.Nav.Apps.Management.Cmdlets.InstallNavApp  -->

    
    **Modifying extensions code:**

    1. Open the project for the custom extensions.
    2. Connect to the BC 150 server instance  
    3. In the app.json:
        
        1. Set a dependency for the custom base app:

         "dependencies": [{
            "appId": "437dbf0e-84ff-417a-965d-ed2bb9650972",
            "publisher": "Microsoft",
            "name": "BaseApp",
            "version": "15.0.34982.0"
          }]

        2. Delete the application parameter
        3. set the platform the 15.0.x.0
    3. Build package.

    ** Set the Server**

    ```
    Set-NAVServerConfiguration bc150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"BaseApp", "publisher": "Microsoft"},{"appId":"2b2a78d9-962c-498a-8d97-6d4de94edffc", "name":"TestApp", "publisher": "Microsoft"}]'
    ```

25. Publish 3rd party extensions.


    If you modified code:

    1. Publish Microsoft and 3rd-party extensions that were previously published:
    
        ```
        Publish-NAVApp -ServerInstance bc150 -Path "C:\Users\jswymer\Documents\AL\My14Extension\Default publisher_My14Extension_1.0.0.4.app" -SkipVerification
        ```
    2. Synchronize the tenant with the extension:

        ```
        Sync-NAVApp bc150 -Name My14Extension -Version 1.0.0.4
        ```
    3. Upgrade the data to the extension:

        ```
        Start-NAVAppDataUpgrade bc150 -Name My14Extension -Version 1.0.0.4
        ```    

        This upgrades the data and installs the extension version.

    If you configured server:

        1. Publish Microsoft and 3rd-party extensions that were previously published:
    
        ```
        Publish-NAVApp -ServerInstance bc150 -Path "C:\Users\jswymer\Documents\AL\My14Extension\Default publisher_My14Extension_1.0.0.4.app" -SkipVerification
        ```
    2. Install the tenant with the extension:

        ```
        Install-NAVApp bc150 -Name My14Extension -Version 1.0.0.4
        ```


## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
