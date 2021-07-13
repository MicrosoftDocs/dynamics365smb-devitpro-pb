---
title: Upgrade to Business Central 2019 Wave 2
description: The article explains how to upgrade the application code and how to merge code from different versions of the application.
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
ROBOTS: NOINDEX
---
# Application Code Upgrade for [!INCLUDE[prodlong](../developer/includes/prodlong.md)] 2020 Release Wave 1
<!--
> [!IMPORTANT]  
> [!INCLUDE[vnext_preview](../developer/includes/vnext_preview.md)] 
>
> Please note that this topic is a draft in progress. We are still working on adding more details to the steps described in this topic.
-->
This article provides guidelines for upgrading a customized C/AL application to an AL-based application for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2020 release wave 2 (version 16), which is outlined in [Upgrade Overview](upgrade-overview-v15.md#upgradepath). 

When upgrading your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Spring 2019 (version 14) solution to version 15, the goal is to move towards a full uptake of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] base and system applications, as they are, and migrating code customizations to add-on extensions. We realize that the complexity of some solutions will make this path very difficult. If this path is not currently realistic for your solution, there are different levels to which you can upgrade your application to best suit your solution; some levels are required, while others are recommended.

![Upgrade path on Business Central application.](../developer/media/bc15-application-code-upgrade-path.png "Upgrade paths")

> [!NOTE]
> If your current base application has not been customized, or any customizations are part of either Microsoft (1st party) and customization extensions (3rd-party), then your application upgrade is fairly straightforward and you can go directly to [Upgrade an Unmodified Application](upgrade-unmodified-application.md).

## Application Code Upgrade Guide

The following table provides an overview of the upgrade levels to guide you through your application code upgrade. Some levels are required as indicated.

|Level|Description|Recommendation|See|
|-----|-----------|--------------|---|
|Upgrade to version 14|As a starting point, you must upgrade your solution to version 14. At this point, your application is still in C/AL.|Required|[Upgrading to version 14](upgrading-to-business-central-on-premises.md).|
|Revert breaking changes in tables|In this level, you revert breaking changes that you have made to base tables.|Required|[Revert Breaking Table Chenges](upgrade-revert-system-application-object-customizations.md)|
|Move customizations to extensions|At this level, you move as much code customization as feasible into extensions. This includes, for example, moving your custom page and table objects, added fields on pages, reports, and so one.<br /><br />**Considerations:**<br />This is not a requirement at this level, but moving as much of the customizations into extensions now will make it easier going to the next levels.<br/><br/>You can keep fils|Recommended|[Moving to Extensions](../developer/devenv-uplift-to-extensions.md)|
|Convert to AL|Convert your application from C/AL to AL.<br /><br />**Considerations:**<br /> At this point, you have the option to compile the converted application into a single base application, and perform a technical upgrade on tenants. We do not recommend this path, but [add more...]|Required|[Convert to AL](devenv-code-conversion.md)|
|Uptake the System Application|In this level, you will refactor your application to use the Microsoft System Application.<br /> This requires a significant amount of code rework.<br /><br />**Considerations:**<br /> |Miminum recommended level.|[Uptake System Application](upgrade-system-application-v14-v15.md)|
|Upgrade to version 15 application code |In this level, you will merge your version 14 application with the version 15 application source code to get the latest application features. <br /><br />**Considerations:**<br />|Recommended|[Upgrade to V15 Application Code](upgrade/upgrade-hybrid-upgrade-v14-v15.md)|
|Uptake the Microsoft Base Application|This is the final level of the upgrade path. In this level, you will move all remaining customizations into extensions. At this point, you solution will be based on the Microsoft System and Base application.|Highly recommended|[Uptaking the Base Application](upgrade/upgrade-full-upgrade-v14-v15.md)|


<!--
## Upgrade an unmodified [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application

Use this scenario if you have a Business Central application that does not include any code customization in C/AL. Customizations, if any, are done by extensions, which can be Microsoft (1st party) extensions and custom extensions (3rd party). With this upgrade, you will replace the C/AL base application with the new Business Central version 15 base application extension and the system application. The result will be a fully upgraded application and platform on [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2019 release wave 2.

 ![Upgrade on unmodified Business Central application.](../developer/media/bc15-upgrade-unmodified-app.png "Upgrade on unmodified Business Central application") 

For more information, see [Upgrading an Unmodified Application](upgrade-unmodified-application.md). 

## Technical upgrade of a custom application to version 15 platform

Use this process when you have a customized Business Central application that you want to upgrade to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2019 release wave 2 platform. This will not upgrade the application to the latest version. With this process, you will convert the entire application from C/AL to an base application extension.


 ![Upgrade on customized Business Central application.](../developer/media/bc15-upgrade-customized-app.png "Upgrade on customize Business Central application")  


For more information, see [Technical Upgrade](upgrade-technical-upgrade-v14-v15.md).


## Upgrade Customized Application to the Microsoft System Application

Use this process when you have a customized Business Central application that you want to upgrade to use the Microsoft System Application and the version 15 platform. With this process, you will convert the entire application from C/AL to AL and refactor to use the System Application  extension.

!["Upgrade to system application in Business Central.](../developer/media/bc15-system-application-upgrade-customized-app.png "Upgrade to system application in Business Central")  

For more information, see [Upgrade to the System Application](upgrade-system-application-v14-v15.md). 


## Upgrade Customized Application to the Microsoft Base Application

Use this process when you have a customized Business Central application that you want to upgrade to the Business Central Wave 2 application and platform. With this process, you will convert the entire application from C/AL to AL and refactor to use the system application layer extension.

 ![Upgrade on customized Business Central application.](../developer/media/bc15-full-upgrade-customized-app.png "Upgrade on customize Business Central application")  

For more information, see [Upgrade to the Microsoft Base Application](upgrade-full-upgrade-v14-v15.md). 
-->
<!--
## New and changed application features

There a several new and changed platform application features available in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] April 2019 release wave2 for users, administrators, and developers. For an overview of these features, see [Overview of Dynamics 365 Business Central 2019 release wave 2](/dynamics365-release-plan/2019wave2/dynamics365-business-central/).

To take advantage of these all these features, you will have to perform an application code upgrade, not just a technical (platform) upgrade.  -->

<!--
### Prerequisites

1. Upgrade to Business Central Spring 2019.

### Task 1: Convert your application from C/AL to AL

The first thing to do is convert your solution from C/AL to AL. For more information, see [Code Conversion from C/AL to AL](devenv-code-conversion.md).
<!--
1. Export all objects except system objects to txt in new syntax for AL. For this, I used Development Shell run as an admin:

    ```
    Export-NAVApplicationObject -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=1..1999999999'
    ```

    <!-- 
    Optionally, omit the text objects:


    ```
    Export-NAVApplicationObject -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=1..129999'
    ```
    
    ```
    Export-NAVApplicationObject -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=140000..1999999999'
    ```
    
    There is a switch that you can set to tartget the runtime to 4.0. You should set this so you will not get so many warnings.  This is not documented yet.

2. If you have custom .NET add-ins, create a declaration file (.al). I created a small file called mydotnet.al

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
    txt2al --source=C:\exporttoal\expoertedbc14app2.txt --target=C:\exporttoal\al2 --injectDotNetAddIns --dotNetAddInsPackage=C:\exporttoal\dotnet\mydotnet.al
    ```      

    This will create separate al file for each object.

3. Create a new application database on BC 15. Use the New-NAVApplicationDatabase cmdlet of the Administration Shell:

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

    This file is located in the 

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
<!--
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

   2. CodeViewer is no longer used. Either remove all references to it in the application (recommended) or copy the **CodeViewer** folder from the Addin folder of Business Central 140 RoleTailored client installation to the Add-ins folder of the Business Central 150 Server installation.

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
<!--
7. Build the project.

    Make a note of the name, ID, and publisher.

-->
<!--
### Task 2: Upgrade the application database to the version 15.0 platform
 
1. Make backup of the database.
2. Uninstall all extensions from the old tenants.

    Use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for Business Central Spring 2019 (run as an adminstrator):

    ``` 
    Get-NAVAppInfo -ServerInstance bc140 -Tenant default | % { Uninstall-NAVApp -ServerInstance bc140 -Name $_.Name -Version $_.Version -Tenant default}
    ``` 
3. Unpublish all system and application symbols.

## Components

### <a name="BaseApplication"></a>Base Application

The base application contains the objects (such as table, pages, codeunits, and reports) that define the business logic and functionality of the solution. In version 14 and earlier, the base application also contained system objects that were not specifically related to the business logic. In version 15, the standard business objects are now included in the Microsoft Base Application extension, and the system objects have been moved to the System Application extension. 

### <a name="SystemApplication"></a>System Application

In version 15.0, application functionality that is not related to the business logic has been moved into separate modules that are combined into an extension known as the System Application. For an introduction to the System Application, see For more information, see [Overview of the System Application](../developer/devenv-system-application-overview.md).

### <a name="Symbols"></a>Symbols

Symbols are the application programming interface between AL code and C/AL code. Symbols enable the ability to reference C/AL objects from AL objects. Symbols are provided as an extension package, and are published to the server instance similar to application extensions, but not installed on tenants.

In version 14.0, with the base application being C/AL, there are three types of symbols: system, application, and test. System symbols contained references to the platform system objects. The application symbols contained references to the business application objects. The test symbols contained references to the test libraries used by Microsoft extensions.

In version 15, with the move to AL, the only symbols required are the system systems, which are still provided on the version 15.0 installation media (DVD).

### Customization extensions
Customization extensions are AL extensions that add functionality to the base application or system application. These extensions can be Microsoft (1st party) or 3rd party extensions. 3rd party extensions are extensions that your organization provides or extensions that are provided by others, such as from ISVs or from App Source.

## New and changed application features

There a several new and changed platform application features available in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] April 2019 release wave2 for users, administrators, and developers. For an overview of these features, see [Overview of Dynamics 365 Business Central 2019 release wave 2](https://docs.microsoft.com/dynamics365-release-plan/2019wave2/dynamics365-business-central/).

To take advantage of these all these features, you will have to perform an application code upgrade, not just a technical (platform) upgrade.  
  
## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
[[!INCLUDE[prodlong](../developer/includes/prodlong.md)] Upgrade Compatibility Matrix](upgrade-v14-v15-compatibility.md)  
