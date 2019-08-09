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

For now, these steps are for a single tenant deployment.

## Non-modified application

For this scenario, I am upgrading a BC 14.0 unmodified base application. Because the application was unmodified, I upgraded to the BC 15 base app. 

1. Upgrade to Business Central Spring 2019.
2. Make backup of the database.
3. Uninstall extensions from the tenants.
4. Run a technical upgrade on the application:

    ```
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "demo database bc (14-0)"
    ```
5. Increase the application application version.

    ```
    Set-NAVApplication bc150 -ApplicationVersion 15.0.34737.0 -force
    ```
6. Publish platform system symbols:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```
7. Publish the application system app:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_System Application_15.0.34737.0.app" -SkipVerification
    ```

8. Publish the application base app:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_BaseApp_15.0.34737.0.app" -SkipVerification
    ```
10. Synchronize the tenant.

    ```  
    Sync-NAVTenant bc150
    ```
    
    Get lots of error about deletion
11. Deleted all objects except system objects here the second time
12. Synchronize the tenant with the application system extension (Microsoft_System Application_15.0.34737.0):

    ```
    Sync-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0
    ```
13. Synchronize the tenant with the base application extension (BaseApp):

    Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0

    **Error:**

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
    
14. Upgrade the tenant data:

    ```
    Start-NAVDataUpgrade bc150 -FunctionExecutionMode Serial -Force -SkipCompanyInitialization
    ```        
15. Install system application extension (Microsoft_System Application_15.0.34737.0) on tenant.

    ```
    Sync-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0
    ```
16. Install base application extension on the tenant:

    ```
    Install-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
    ```

## Customized application

### Option 1 - Convert entire solution to an extension

For this scenario, I used a BC 14.0 modified base application on a BC 14.0 server instance. This proecess will convert the entire BC 14 cusom application to an Extension on the BC 15 platform.

 ![Upgrade on unmodified Business Central application](../developer/media/bc15-upgrade-unmodified-app.png "Upgrade on unmodified Business Central application")  
 
1. Upgrade to Business Central Spring 2019.
2. Make backup of the database.
3. Uninstall extensions from the tenants.
4. Convert your application from C/AL to AL.

   1. Export all objects except system objects to txt in new syntax for AL. For this, I used Development Shell run as an admin:
    
      ```
      Export-NAVApplicationObject -DatabaseServer navdevvm-0127\b    cdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=1..1999999999'
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
3. Create a new application database on BC 15.
4. Connect to BC 15 server Instance to the database
5. Create a project for application in VS Code.

    - Connect to the BC 15 Server instance.
    - Set the target in the app.json to OnPrem
    - In the app.json change the idRange to include all the IDs.  
6. Manually copy the System symbols extension (Microsoft_System_15.0.34942.0.app) to the **.alpackages** folder.

    **Error:**

    I tried to us the Download Symbols command but could not because of errors.
7. Modify the settings.json file in Visual Studio Code to include paths to .NET assemblies. Set the `"al.assemblyProbingPaths"` parameter:

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

    **Error:**

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

### Option 1 - Convert entire solution to an extension

Use this process when you have a customized Business Central application that you want to upgrade to the Business Central Wave 2 platform. This will not upgrade the application to the latest version. With this process, you will convert the entire application from C/AL to an base application extension.


For this scenario, I used a BC 14.0 modified base application on a BC 14.0 server instance, which include some customization on C/AL objects in the base application and a custom extension that modified the Item table. is proecess will convert the entire BC 14 cusom application to an Extension on the BC 15 platform.

 ![Upgrade on customized Business Central application](../developer/media/bc15-upgrade-customized-app.png "Upgrade on customize Business Central application")  
 
 
1. Upgrade to Business Central Spring 2019.

1. Convert your application from C/AL to AL.

   1. Export all objects except system objects to txt in new syntax for AL. For this, I used Development Shell run as an admin:
    
      ```
      Export-NAVApplicationObject -DatabaseServer navdevvm-0127\b    cdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=1..1999999999'
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
3. Create a new application database on BC 15.
4. Connect to BC 15 server Instance to the database
5. Create a project for application in VS Code.

    - Connect to the BC 15 Server instance.
    - Set the target in the app.json to OnPrem
    - In the app.json change the idRange to include all the IDs.  
6. Manually copy the System symbols extension (Microsoft_System_15.0.34942.0.app) to the **.alpackages** folder.

    **Error:**

    I tried to us the Download Symbols command but could not because of errors.
7. Modify the settings.json file in Visual Studio Code to include paths to .NET assemblies. Set the `"al.assemblyProbingPaths"` parameter:

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

10. Build the project to compile objects.

### Upgrade the application to the Business Central V15.0 platform
 
1. Make backup of the database.
2. Uninstall extensions from the tenants.

    ``` 
    Get-NAVAppInfo -ServerInstance bc140 -Tenant default | % { Uninstall-NAVApp -ServerInstance bc140 -Name $_.Name -Version $_.Version }
    ``` 
3. Unpublish all system and application symbols.

    ``` 
    Get-NAVAppInfo -ServerInstance bc140 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance bc140 -Name $_.Name -Version $_.Version }
    ```     
4. Unpublish all extensions from the application server instance.

    1. Get a list of published extensions:

        get-navappinfo bc140

        <!-- here are mine apps:

            Id            : c526b3e9-b8ca-4683-81ba-fcd5f6b1472a
        Name          : Sales and Inventory Forecast
        Version       : 14.4.34866.0
        Publisher     : Microsoft
        ExtensionType : ModernDev
        Scope         : Global
        
        Id            : d71b8abb-71f9-47e2-8de5-9a066fa3aa5f
        Name          : My14Extension
        Version       : 1.0.0.0
        Publisher     : Default publisher
        ExtensionType : ModernDev
        Scope         : Tenant
        
        Id            : e97bbbc7-16b6-470b-9428-376baa778970
        Name          : Send remittance advice by email
        Version       : 14.4.34866.0
        Publisher     : Microsoft
        ExtensionType : ModernDev
        Scope         : Global
        
        Id            : 8b3609cf-3947-44c3-9f20-ce6edc6da33f
        Name          : _Exclude_ClientAddIns_
        Version       : 14.4.34866.0
        Publisher     : Microsoft
        ExtensionType : ModernDev
        Scope         : Global
        
        Id            : d09fa965-9a2a-424d-b704-69f3b54ed0ce
        Name          : PayPal Payments Standard
        Version       : 14.4.34866.0
        Publisher     : Microsoft
        ExtensionType : ModernDev
        Scope         : Global
        
        Id            : 334ef79e-547e-4631-8ba1-7a7f18e14de6
        Name          : Business Central Intelligent Cloud
        Version       : 14.4.34866.0
        Publisher     : Microsoft
        ExtensionType : ModernDev
        Scope         : Global
        
        Id            : 58623bfa-0559-4bc2-ae1c-0979c29fd9e0
        Name          : Intelligent Cloud Base
        Version       : 14.4.34866.0
        Publisher     : Microsoft
        ExtensionType : ModernDev
        Scope         : Global
        
        Id            : 2a89f298-7ffd-44a5-a7ce-e08dac98abce
        Name          : Essential Business Headlines
        Version       : 14.4.34866.0
        Publisher     : Microsoft
        ExtensionType : ModernDev
        Scope         : Global
        
        Id            : 8afe7b40-8c87-4beb-ada0-451d1761bf95
        Name          : _Exclude_APIV1_
        Version       : 14.4.34866.0
        Publisher     : Microsoft
        ExtensionType : ModernDev
        Scope         : Global-->

    2. Unpublish extensions:

        ```
        Get-NAVAppInfo -ServerInstance bc140 | % { Unpublish-NAVApp -ServerInstance bc140 -Name $_.Name -Version $_.Version }
        ```

5. Run a technical upgrade on the application in the old database using the Business Central 2019 Wave 2 Administration Shell. This will upgrade the system tables to the BC 15 platform. Start the Business Central Administration Shell as an admin, and run this command: 

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
    Publish-NAVApp -ServerInstance bc150 -Path "C:\Users\jswymer\Documents\AL\BC15BaseApp\Default publisher_BC15BaseApp_1.0.0.0.app" -SkipVerification
    ```

17. Synchronize the tenant.
  
    ```
    C:\windows\system32> Sync-NAVTenant bc150
    ```
    When completed the tenant state is OperationalDataUpgradePending.
18. Delete all objects except system objects from application database. No sync

19. Synchronize the tenant with the base application extension (BaseApp):

    ```
    Sync-NAVApp bc150 -Name "BC15BaseApp" -Version 1.0.0.0
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
23. Repair 3rd party extensions that have not been updated. 

    ```
    Repair-NAVApp bc150 -Name  My14Extension -Version 1.0.0.0
    ```   
24. Sync repaired app.:

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
        + FullyQualifiedErrorId : MicrosoftDynamicsNavServer$bc150/default,Microsoft.Dynamics.Nav.Apps.Management.Cmdlets.InstallNavApp
25. 

C:\windows\system32> publish-navapp bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\35032\W1DVD\Extensions\SalesAndInventoryForecast.app" -SkipVerification
publish-navapp : Extension compilation failed
error AL1024: A package with publisher 'Microsoft', name 'BaseApp', and a version compatible with '15.0.0.0' could not be loaded. Symbols for the requested app BaseApp by Microsoft 15.0.0.0 could not be found in the database
error AL1024: A package with publisher 'Microsoft', name 'System Application', and a version compatible with '15.0.0.0' could not be loaded. Symbols for the requested app System Application by Microsoft 15.0.0.0 could not be found in the database
src/Pag1851.SalesForecastNoChart.al(10,19): error AL0185: Table 'Item' is missing
src/Cod1850.SalesForecastHandler.al(8,15): error AL0185: Table 'Item' is missing
src/Cod1854.SalesForecastNotifier.al(8,29): error AL0185: Table '"My Notifications"' is missing
src/Pag1850.SalesForecast.al(10,19): error AL0185: Table 'Item' is missing
src/Cod1853.SalesForecastUpdate.al(12,15): error AL0185: Table 'Item' is missing
src/Cod1853.SalesForecastUpdate.al(13,26): error AL0185: Codeunit 'LogInManagement' is missing
src/Cod1853.SalesForecastUpdate.al(16,31): error AL0185: Codeunit 'Time Series Management' is missing
src/Cod1852.SalesForecastScheduler.al(18,24): error AL0185: Table 'Job Queue Entry' is missing
src/Cod1852.SalesForecastScheduler.al(24,54): error AL0185: Table 'Job Queue Entry' is missing
src/Cod1852.SalesForecastScheduler.al(26,29): error AL0185: Codeunit 'Job Queue Management' is missing
src/Cod1852.SalesForecastScheduler.al(39,24): error AL0185: Table 'Job Queue Entry' is missing
src/Cod1852.SalesForecastScheduler.al(40,29): error AL0185: Codeunit 'Job Queue Management' is missing
src/Cod1852.SalesForecastScheduler.al(41,32): error AL0185: Codeunit 'User Login Time Tracker' is missing
src/Cod1851.SalesForecastUpgrade.al(41,26): error AL0185: Table 'Service Password' is missing
src/Cod1851.SalesForecastUpgrade.al(63,26): error AL0185: Table 'Service Password' is missing
src/Cod1851.SalesForecastUpgrade.al(76,26): error AL0185: Table 'Service Password' is missing
src/Tab1850.SalesForecast.al(14,29): error AL0185: Table 'Item' is missing
src/Cod1852.SalesForecastScheduler.al(52,24): error AL0185: Table 'Job Queue Entry' is missing
src/Cod1850.SalesForecastHandler.al(21,43): error AL0185: Table 'Item' is missing
src/Cod1850.SalesForecastHandler.al(21,78): error AL0185: Codeunit 'Time Series Management' is missing
src/Cod1850.SalesForecastHandler.al(23,33): error AL0185: Table 'Time Series Forecast' is missing
src/Cod1850.SalesForecastHandler.al(41,141): error AL0185: Codeunit 'Time Series Management' is missing
src/Cod1850.SalesForecastHandler.al(43,26): error AL0185: Table 'Item Ledger Entry' is missing
src/Cod1850.SalesForecastHandler.al(44,31): error AL0185: Table 'Time Series Buffer' is missing
src/Cod1850.SalesForecastHandler.al(108,12): warning AL0667: 'Internal' is being deprecated in the versions: '4.0' or greater. The Internal scope is being deprecated. Use OnPrem instead. This warning will become an error in a future release.
src/Cod1850.SalesForecastHandler.al(109,62): error AL0185: Codeunit 'Time Series Management' is missing
src/Cod1850.SalesForecastHandler.al(111,23): error AL0185: Table 'Azure AI Usage' is missing
src/Tab1850.SalesForecast.al(52,29): error AL0185: Table 'General Ledger Setup' is missing
src/Tab1850.SalesForecast.al(54,62): error AL0185: Table 'Time Series Buffer' is missing
src/Tab1850.SalesForecast.al(66,66): error AL0185: Table 'Time Series Forecast' is missing
src/Cod1852.SalesForecastScheduler.al(68,26): error AL0185: Table 'My Notifications' is missing
src/Cod1852.SalesForecastScheduler.al(80,24): error AL0185: Table 'Job Queue Entry' is missing
src/Cod1852.SalesForecastScheduler.al(104,29): error AL0185: Table 'O365 Getting Started' is missing

## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
