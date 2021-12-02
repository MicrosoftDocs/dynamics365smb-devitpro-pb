---
title: "Fixing Compilation Errors"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
ms.author: jswymer
---

# Rewriting Code for Breaking Changes

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2020 Release Wave 1 (version 16) introduced some breaking changes when compared to version 14 and 15. For example, several system tables have been deprecated and replaced (see [Deprecated Tables](deprecated-tables.md)). When upgrading to version 16 or version, you might experience errors compiling your application and extensions because of these breaking changes. So, you'll have to rewrite some of your application to resolve these errors. This article lists some of the errors you might experience, and provides solutions.

## Table 'NAV App' is removed. Reason: This table is deprecated in favour of the \"Published Application\" table. 

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|UploadAndDeployExtension.Page.al| page 2507 "Upload And Deploy Extension"|
|ExtensionMarketplace.Codeunit.al|codeunit 2501 "Extension Marketplace"|
|ExtensionManagement.Page.al| page 2500 "Extension Management"|
|ExtensionLogoPart.Page.al| page 2506 "Extension Logo Part"|
|ExtensionInstallationDialog.Page.al |page 2505 "Extension Installation Dialog"|
|ExtensionInstallationImpl.Codeunit.al|codeunit 2500 "Extension Installation Impl"|
|ExtensionInstallation.Page.al| page 2503 "Extension Installation"|
|ExtensionDetailsPart.Page.al| page 2504 "Extension Details Part"|
|ExtensionDetails.Page.al| page 2501 "Extension Details"|
|ExtensionOperationImpl.Codeunit.al|codeunit 2503 "Extension Operation Impl"|
|ExtensionSettings.Page.al|page 2511 "Extension Settings"|
|Objects.Page.al|page 358 Objects|
|AutomationExtensionsEntity.Page.al| page 5441 "Automation Extensions Entity"|

#### Solution

Any of the following changes:

- Replace `SourceTable = "NAV App";` with `SourceTable = "Published Application";`

- Replace `TableData "NAV App"` with `TableData "Published Application"`

- Replace `Record "NAV App"` with `Record "Published Application"`
 
## Table 'NAV App' is missing

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|Objects.Page.al|page 358 Objects|
|NavExtensionInstallationMgmt.Codeunit.al| page 2500 "Extension Management"|
|MarketplaceExtnDeployment.Page.al |page 2510 "Marketplace Extn. Deployment"|
|ExtensionSettings.Page.al |page 2511 "Extension Settings"|
|ExtensionMarketplaceMgmt.Codeunit.al| codeunit 2501 ExtensionMarketplaceMgmt"|
|ExtensionDetails.Page.al| page 2501 "Extension Details"|
|DataClassificationMgt.Codeunit.al| codeunit 1750 "Data Classification Mgt."|
|BusinessSetup.Table.al| table 1875 "Business Setup"|


#### Solution 

Replace `Record "NAV App"` with `Record "Published Application"`

## Table 'NAV App Object Metadata' is removed. Reason: This table is deprecated in favour of the \"Application Object Metadata\" table 

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|DataClassificationMgt.Codeunit.al| codeunit 1750 "Data Classification Mgt."|
|GenericChartMgt.Codeunit.al | codeunit 9180 "Generic Chart Mgt"|
|PageInspection.Page.al |page 9631 "Page Inspection"|
|PageInspectionExtensions.Page.al|page 9633 "Page Inspection Extensions"|
|ExtensionInstallationImpl.Codeunit.al|codeunit 2500 "Extension Installation Impl"|
|ExtensionOperationImpl.Codeunit.al|codeunit 2503 "Extension Operation Impl"|
|ExtensionSettings.Page.al |page 2511 "Extension Settings"|

#### Solution

Replace `Record "NAV App Object Metadata"` with `Record "Application Object Metadata"` 
  

## The name '\"App Package ID\"' does not exist in the current context"

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|DataClassificationMgt.Codeunit.al| codeunit 1750 "Data Classification Mgt."|
|GenericChartMgt.Codeunit.al | codeunit 9180 "Generic Chart Mgt"|
|PageInspection.Page.al |page 9631 "Page Inspection"|
|PageInspectionExtensions.Page.al|page 9633 "Page Inspection Extensions"|
 
#### Solution

Replace `"App Package ID"` with `"Runtime Package ID"`
 
## The name 'scope' does not exist in the current context" 
 
#### Affected objects

|AL File|Object|
|---------------------|--------------|
|AutomationExtensionsEntity.Page.al| page 5441 "Automation Extensions Entity"|

#### Solution 

Delete field definition for `field(scope; Scope)`
 
#### Affected objects

|AL File|Object|
|---------------------|--------------|
|ExtensionManagement.Page.al| page 2500 "Extension Management"|

#### Solution

Any of the following changes:

- Delete line `IsTenantExtension := Scope = 1;`

- Remove lines:

    ```
    /*
    if Scope = 1 then
        IsTenantExtension := true
    else
    */
    ```

## 'Record \"Published Application\"' does not contain a definition for 'Scope'

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|ExtensionOperationImpl.Codeunit.al|codeunit 2503 "Extension Operation Impl"|

#### Solution

Remove lines:

```
/*
if (NavApp.Scope <> 1) then
    exit(false); */
*/
```

## No overload for method 'Initialize' takes 5 arguments"

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|FlowTemplateSelector.Page.al| page 6400 "Flow Template Selector"|
|FlowSelector.Page.al| page 6401 "Flow Selector"|

#### Solution


Remove code on the trigger `ControlAddInReady()`:

```
trigger ControlAddInReady() 
begin 
/* 
    CurrPage.FlowAddin.Initialize( 
    FlowServiceManagement.GetFlowUrl,FlowServiceManagement.GetLocale, 
    AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowARMResourceUrl,FlowServiceManagement.GetFlowResourceName,false), 
    AzureAdMgt.GetAccessToken(FlowServiceManagement.GetAzureADGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,false), 
    AzureAdMgt.GetAccessToken(FlowServiceManagement.GetMicrosoftGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,false)); 

LoadTemplates; 

AddInReady := true;
*/ 
end; 
```
  
## Field 'URL2' is removed. Reason: URL1 field size increased 

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|JobQueueSendNotification.Codeunit.al| codeunit 454 "Job Queue - Send Notification"|
|NotificationEntryDispatcher.Codeunit.al| codeunit 1509 "Notification Entry Dispatcher"|
 
#### Solution

Delete lines shown as commented out:

```
RecordLink.URL1 := CopyStr(Link, 1, MaxStrLen(RecordLink.URL1)); 
/*
if StrLen(Link) > MaxStrLen(RecordLink.URL1) then 
RecordLink.URL2 := CopyStr(Link, MaxStrLen(RecordLink.URL1) + 1, MaxStrLen(RecordLink.URL2));
*/ 
end;
``` 
 
## There is no argument given that corresponds to the required formal parameter 'overwrite' of 'ImportReportRequest(DotNet \"System.Guid\", DotNet \"System.IO.Stream\", DotNet \"System.String\", DotNet \"System.String\", DotNet \"System.Boolean\")'

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|PowerBIServiceMgt.Codeunit.al| codeunit 6301 "Power BI Service Mgt."|

#### Solution

Delete code:

```
then begin 
/*
    PowerBIBlob.CalcFields("Blob File"); // Calcfields necessary for accessing stored Blob bytes. 
    PowerBIBlob."Blob File".CreateInStream(BlobStream); 
    ApiRequest := ApiRequest.ImportReportRequest 
        (PowerBIBlob.Id, BlobStream, PowerBIBlob.Name, not PowerBIReportUploads.IsEmpty); 
    ApiRequestList.Add(ApiRequest);
 */ 
end; 
```

Delete code:

```
then begin 
  /*
  PowerBICustomerReports.CalcFields("Blob File"); // Calcfields necessary for accessing stored Blob bytes. 
    PowerBICustomerReports."Blob File".CreateInStream(BlobStream); 
    ApiRequest := ApiRequest.ImportReportRequest 
        (PowerBICustomerReports.Id, BlobStream, PowerBICustomerReports.Name, not PowerBIReportUploads.IsEmpty); 
    ApiRequestList.Add(ApiRequest);
   */ 
end; 
```
  
## There is no argument given that corresponds to the required formal parameter 'maxRetries' of 'ImportReports(DotNet \"Microsoft.Dynamics.Nav.PowerBIEmbedded.Models.ImportReportRequestList\", DotNet \"System.String\", DotNet \"System.String\", DotNet \"System.String\", DotNet \"System.Int32\")'

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|PowerBIServiceMgt.Codeunit.al| codeunit 6301 "Power BI Service Mgt."|

#### Solution

Delete code:

```
/*
if FinancialsAccessToken <> '' then 
    ApiResponseList := PbiServiceWrapper.ImportReports(ApiRequestList, 
        CompanyName, FinancialsAccessToken, GetServiceRetries) 
else
*/ 
```

## There is no argument given that corresponds to the required formal parameter 'maxRetries' of 'GetImportedReports(DotNet \"System.Collections.Generic.IList<System.String>\", DotNet \"System.String\", DotNet \"System.String\", DotNet \"System.String\", DotNet \"System.Int32\")'

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|PowerBIServiceMgt.Codeunit.al| codeunit 6301 "Power BI Service Mgt."|
 
#### Solution

Delete code:

```
/*
if FinancialsAccessToken <> '' then 
    ApiResponseList := PbiServiceWrapper.GetImportedReports(ImportIdList, 
        CompanyName, FinancialsAccessToken, GetServiceRetries) 
else
*/
```

## The name '"Runtime Package ID"' does not exist in the current context

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|Objects.Page.al| page 358 Objects|
|AllObjectswithCaption.Page.al|page 9174 "All Objects with Caption"|
|ALTestObjectsToSelect.Page.al|page 130409 "AL Test Objects To Select"|
|CodeCoverageALObject.Page.al|page 9993 "Code Coverage AL Object"|
|codeunit 130401 "CAL Test Management"|CALTestManagement.Codeunit.al|


#### Solution

Replace `"Runtime Package ID"` with `"App Runtime Package ID"`:

## Record AllObj' does not contain a definition for 'Runtime Package ID'

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|CALTestManagement.Codeunit.al|codeunit 130401 "CAL Test Management"||
|GenericChartMgt.Codeunit.al|codeunit 9180 "Generic Chart Mgt"|
|GenericChartMgt.Codeunit.al|codeunit 9180 "Generic Chart Mgt"|
|ODataColumnChooseSubForm.Page.al|page 6710 "OData Column Choose SubForm"|
|ODataUtility.Codeunit.al|codeunit 6710 ODataUtility|
|RolecenterSelectorMgt.Codeunit.al|codeunit 1485 "Rolecenter Selector Mgt."|

#### Solution

Replace `"Runtime Package ID"` with `"App Runtime Package ID"`:


## No overload for method 'Initialize' takes 5 arguments. Candidates: built-in method 'Initialize(DotNet "System.String", DotNet "System.String", DotNet "System.String")'

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|FlowSelectorTemplate.Page.al|page 6401 "Flow Selector"|
|FlowTemplateSelector.Page.al|page 6400 "Flow Template Selector"|

#### Solution

FlowSelectorTemplate.Page.al

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


FlowTemplateSelector.Page.al:

```   
usercontrol(FlowAddin; "Microsoft.Dynamics.Nav.Client.FlowIntegration")
{
    ApplicationArea = Basic, Suite;

    trigger ControlAddInReady()
    begin
/*                                 CurrPage.FlowAddin.Initialize(
            FlowServiceManagement.GetFlowUrl, FlowServiceManagement.GetLocale,
            AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowARMResourceUrl, FlowServiceManagement.GetFlowResourceName, false),
            AzureAdMgt.GetAccessToken(FlowServiceManagement.GetAzureADGraphhResourceUrl, FlowServiceManagement.GetFlowResourceName, false),
            AzureAdMgt.GetAccessToken(FlowServiceManagement.GetMicrosoftGraphhResourceUrl, FlowServiceManagement.GetFlowResourceName, false));

        LoadTemplates;

        AddInReady := true; */
    end;
```  

## There is no argument given that corresponds to the required formal parameter 'overwrite' of 'ImportReportRequest(DotNet "System.Guid", DotNet "System.IO.Stream", DotNet "System.String", DotNet "System.String", DotNet "System.Boolean")'

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|PowerBIServiceMgt.Codeunit.al|codeunit 6301 "Power BI Service Mgt."|

#### Solution

```  
/*             ApiRequest := ApiRequest.ImportReportRequest
              (PowerBIBlob.Id, BlobStream, PowerBIBlob.Name, not PowerBIReportUploads.IsEmpty);
            ApiRequestList.Add(ApiRequest); */

/*                         ApiRequest := ApiRequest.ImportReportRequest
                          (PowerBICustomerReports.Id, BlobStream, PowerBICustomerReports.Name, not PowerBIReportUploads.IsEmpty);
                        ApiRequestList.Add(ApiRequest); */
```  

## There is no argument given that corresponds to the required formal parameter 'maxRetries' of 'ImportReports(DotNet "Microsoft.Dynamics.Nav.PowerBIEmbedded.Models.ImportReportRequestList", DotNet "System.String", DotNet "System.String", DotNet "System.String", DotNet "System.Int32")'

#### Affected objects

|AL File|Object|
|---------------------|--------------|
|PowerBIServiceMgt.Codeunit.al|codeunit 6301 "Power BI Service Mgt."|

#### Solution

```  
/*                 if FinancialsAccessToken <> '' then
                    ApiResponseList := PbiServiceWrapper.GetImportedReports(ImportIdList,
                        CompanyName, FinancialsAccessToken, GetServiceRetries)
                else */

/*                  if FinancialsAccessToken <> '' then
                    ApiResponseList := PbiServiceWrapper.ImportReports(ApiRequestList,
                        CompanyName, FinancialsAccessToken, GetServiceRetries)
                else begin
                    SetIsDeployingReports(false);
                    exit;
                end; */
```



## The procedure with name OnModify has the same name as a declared trigger



|AL File|Object|
|---------------------|--------------|
|Contact.Table.al|table 5050 Contact|

1. In the Contact.Table.al file, give the `procedure OnModify(xRec: Record Contact)` a different name.
2. Change the following calls to the new name in the Contact.Table.al file:

    `OnModify(xRec);`
        
    `Cont.OnModify(OldCont);`
3. Change the following calls to the new name in the Contact.Table.al file:

    `OnModify(xRec);`
 
## Triggers can be called directly

|AL File|Object|
|---------------------|--------------|       
|CustContUpdate.Codeunit.al|codeunit 5056 "CustCont-Update"|
|BankContUpdate.Codeunit.al|codeunit 5058 "BankCont-Update"|
|CustContUpdate.Codeunit.al|codeunit 5056 "CustCont-Update"|
|VendContUpdate.Codeunit.al|codeunit 5057 "VendCont-Update"|

Comment out this line:

```al
//Cont.OnModify(OldCont);
```


## Session list 

|AL File|Object|
|---------------------|--------------|       
|ChangeGlobalDimensions.Codeunit.al|codeunit 483 "Change Global Dimensions"|




    local procedure SendCloseSessionsNotification()
    var
        //DummySessionListPage: Page "Session List";
        Notification: Notification;
    begin
/*         PrepareNotification(Notification, GetCloseSessionsNotificationID, CloseActiveSessionsMsg);
        Notification.AddAction(DummySessionListPage.Caption, CODEUNIT::"Change Global Dimensions", 'ShowActiveSessions');
        Notification.Send; */

### See Also

[Technical Upgrade](upgrade-technical-upgrade-v15-v16.md)