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

## Non-customized application
For this scenario, I am upgrading a BC 14.0 unmodified base application. Because the application was unmodified, I upgraded to the BC 15 base app. 

1. Upgrade to Business Central Spring 2019.
2. Make backup of the database.
3. Uninstall extensions from the tenants.
4. Run a technical upgrade on the application:

    ```
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "demo database bc (14-0)"
    ```
1. Increase the application application version.

    ```
    Set-NAVApplication bc150 -ApplicationVersion 15.0.34737.0 -force
    ```
6. Publish platform system symbols:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```
7. Publishing the application system app:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_System Application_15.0.34737.0.app" -SkipVerification
    ```

8. Publishing the application base app:

    ```
    Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_BaseApp_15.0.34737.0.app" -SkipVerification
    ```
10. Synchronize the tenant.

    ```  
    Sync-NAVTenant bc150
    ```
    
    Get lots of error about deletion
11. Deleted all objects except system objects here the second time
11. Synchronize the tenant with the application system extension (Microsoft_System Application_15.0.34737.0):

    C:\windows\system32> Sync-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0

12. Synchronize the tenant with the base application extension (BaseApp):

   Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0

    **Error:**
    Got this error the second time:
    
    ```
    C:\windows\system32> Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
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
    
13. Upgrade the tenant data:

    ```
    Start-NAVDataUpgrade bc150 -FunctionExecutionMode Serial -Force -SkipCompanyInitialization
    ```        
13. Install system application extension (Microsoft_System Application_15.0.34737.0) on tenant.

    ```
    Sync-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0
    ```
12. Install base application extension on the tenant:

    ```
    Install-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
    ```

## Customized application

### Option 1 - Convert entire solution to an extension

For this scenario, I used a BC 14.0 modified base application on a BC 14.0 server instance. This proecess will convert the entire BC 14 cusom application to an Extension on the BC 15 platform.
 
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
8. Open the **dotnet.al** file and remove all instances of "Version=14.0.0.0" for **Microsoft.Nav** assemblies.
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
    C:\windows\system32> Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_BaseApp_15.0.34737.0.app" -SkipVerification
    ```

    **Error:**

    I got several error on various objects, which prevented me from going any further:
    - ExcelBuffer.Table.al
    - ConfigExcelExchange.Codeunit.al
    - OpenXMLManagement.Codeunit.al
    - QuestionnaireManagement.Codeunit.al
    
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

## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
