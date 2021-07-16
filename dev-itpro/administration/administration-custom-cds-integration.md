---
title: Customizing an Integration with Microsoft Dataverse
description: Learn how to integrate your extension with Microsoft Dataverse in this walkthrough that takes you through each step.
author: bholtorf
ms.custom: na
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: bholtorf
ms.date: 07/16/2021
---

# Customizing an Integration with Microsoft Dataverse

[!INCLUDE[cc_data_platform_banner](../includes/cc_data_platform_banner.md)]

This walkthrough describes how to customize an integration between [!INCLUDE[prod_short](../includes/prod_short.md)] and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The walkthrough will guide you through setting up an integration between an employee in [!INCLUDE[prod_short](../includes/prod_short.md)] and a worker in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. 

> [!TIP]
> Sample code that shows how to integrate an employee in [!INCLUDE[prod_short](../includes/prod_short.md)] and a worker in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] is available in the [BCTech](https://github.com/microsoft/BCTech/tree/master/samples/CDSCustomEmployeeWorkerIntegration) repository.

## About this walkthrough

This walkthrough describes how to integrate new and existing extensions with [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. At a high-level, those process involve the following tasks:  

1. Develop an AL extension to integrate tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] and [!INCLUDE[prod_short](../includes/prod_short.md)]. For more information, see [Developing Extensions in AL](../developer/devenv-dev-overview.md).
2. Create an integration table object in [!INCLUDE[prod_short](../includes/prod_short.md)] for mapping a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table to a [!INCLUDE[prod_short](../includes/prod_short.md)] record type.  
3. Use a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] integration table as the data source for a page in [!INCLUDE[prod_short](../includes/prod_short.md)] that displays data from [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table rows.  
4. Extend a page in [!INCLUDE[prod_short](../includes/prod_short.md)] for coupling and synchronizing table rows in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] with table records in [!INCLUDE[prod_short](../includes/prod_short.md)].  
5. Use events to create an integration table and a field mapping between a table in [!INCLUDE[prod_short](../includes/prod_short.md)] and an integration table for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].  
6. Develop another AL extension to extend an existing integration between tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] and [!INCLUDE[prod_short](../includes/prod_short.md)]. 
7. Create a table extension for an existing integration table object.
8. Use events to add custom integration field mappings for existing integration table mappings.

> [!NOTE]  
> The customization in this walkthrough is done entirely in [!INCLUDE[prod_short](../includes/prod_short.md)] online, and does not describe how to modify your [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] solution, for example, by adding or modifying tables and forms.  

## Prerequisites

This walkthrough requires the following:  

- [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], including the following:  
    - Worker table.

    > [!NOTE]  
    > To get the worker table you must install the Talent Core HR solution. For more information, see [Microsoft Dataverse tables](/dynamics365/human-resources/hr-developer-entities).
    - The URL of your [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] environment.
    - The user name and password of a user account that has full permissions to add and modify tables.  
- [!INCLUDE[prod_short](../includes/prod_short.md)], including the following:  
    - The CRONUS International Ltd. demonstration data.  

      Use a sandbox environment. For more information, see [Production and Sandbox Environments](environment-types.md).
    - Integration with [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] is enabled, including the default synchronization setup and a working connection between [!INCLUDE[prod_short](../includes/prod_short.md)] and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].
    - Visual Studio Code with the AL Language extension installed. For more information, see [Getting Started with AL](../developer/devenv-get-started.md) and [AL Language Extension Configuration](../developer/devenv-al-extension-configuration.md). The AL Language extension for Visual Studio is free, and you can download it from [Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al).

    > [!NOTE]  
    > Make sure that your integration user has permission to access the Worker table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].

## Create an integration table in Business Central for the Dataverse table  

To integrate data from a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table into [!INCLUDE[prod_short](../includes/prod_short.md)], you must create a table object in [!INCLUDE[prod_short](../includes/prod_short.md)] that is based on the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table, and then import the new table into the [!INCLUDE[prod_short](../includes/prod_short.md)] database. For this walkthrough we will create a table object that describes the schema for the **Worker** table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] in the [!INCLUDE[prod_short](../includes/prod_short.md)] database. 

> [!NOTE]  
> The table can contain some or all of the fields from the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table. However, if you want to set up bi-directional synchronization you must include all fields in the table.  

### To create the integration table for the worker table in Business Central 

1. Create a new AL extension. For more information, see [Developing Extensions in AL](../developer/devenv-dev-overview.md).
2. Export the **AL Table Proxy Generator** tool called **altpgen.exe** from the Visual Studio Code AL extension. This executable tool allows you to create integration tables. When you have installed the AL Language extension, go to the equivalent of this folder: `C:\Users\<myname>\.vscode\extensions\microsoft.al-4.0.209721\bin` and find the `altpgen.exe` file. For more information, see [AL Table Proxy Generator](../developer/devenv-al-table-proxy-generator.md).
3. In PowerShell, run the tool with the following arguments:
    ```powershell
    -project:<Your AL project folder>
    -packagecachepath:<Your AL project cache folder>
    -serviceuri:<Microsoft Dataverse server URL>
    -entities:cds_worker
    -baseid:50000
    ```
    
    This starts the process for creating the table. When completed, the output path contains the `.al` file that contains the description of the **CDS Worker** integration table with ID 50000. This table is set to the table type **CDS**.

## Create a page for displaying Dataverse data  

For scenarios where we want to view [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] data for a specific table, we can create a page object that uses the integration table for the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table as its data source. For example, we might want to have a list page that displays the current records in a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table, such as all workers. In this walkthrough we will create a list page that uses the generated integration table **CDS Worker** with ID 50000 as its data source.  

### To create a list page to display Dataverse workers  

1. Create a new page. For more information, see [Pages Overview](../developer/devenv-pages-overview.md). 
2. Name the page **CDS Worker List**, and specify **50001** as the page ID.  
3. Specify the **CDS Worker** integration table as the source table as shown below:

```al
page 50001 "CDS Worker List"
{
    PageType = List;
    SourceTable = "CDS Worker";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    ...
    
    layout
    {
        // add fields to display on the page
    }

    actions
    {
        area(processing)
        {
            action(CreateFromCDS)
            {
                ApplicationArea = All;
                Caption = 'Create in Business Central';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Generate the table from the coupled Microsoft Dataverse worker.';

                trigger OnAction()
                var
                    CDSWorker: Record "CDS Worker";
                    CRMIntegrationManagement: Codeunit "CRM Integration Management";
                begin
                    CurrPage.SetSelectionFilter(CDSWorker);
                    CRMIntegrationManagement.CreateNewRecordsFromCRM(CDSWorker);
                end;
            }
        }
    }

    var
        CurrentlyCoupledCDSWorker: Record "CDS Worker";

    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"CRM Integration Management");
    end;

    procedure SetCurrentlyCoupledCDSWorker(CDSWorker: Record "CDS Worker")
    begin
        CurrentlyCoupledCDSWorker := CDSWorker;
    end;
}
``` 

4. Add the fields from the integration table to display on the page in the `layout` section. 


## Enable coupling and synchronization between Worker in Dataverse and in Business Central

To connect a [!INCLUDE[prod_short](../includes/prod_short.md)] table record with a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table row, you create a coupling. A coupling consists of the primary ID, which is typically a GUID, from a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] row and the integration ID, also often a GUID, from [!INCLUDE[prod_short](../includes/prod_short.md)].  

1. Create a new codeunit.
2. In codeunit **CRM Setup Defaults** (ID 5334), subscribe to the **OnGetCDSTableNo** event, as follows:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
local procedure HandleOnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean)
begin
    if BCTableNo = DATABASE::Employee then begin
        CDSTableNo := DATABASE::"CDS Worker";
        handled := true;
    end;
end;
```
You can now use the table to create a page for coupling [!INCLUDE[prod_short](../includes/prod_short.md)] records with [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] rows.

3. In codeunit **Lookup CRM Tables** (ID 5332), subscribe to the **OnLookupCRMTables** event, as follows:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", 'OnLookupCRMTables', '', true, true)]
local procedure HandleOnLookupCRMTables(CRMTableID: Integer; NAVTableId: Integer; SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text; var Handled: Boolean)
begin
    if CRMTableID = Database::"CDS Worker" then
        Handled := LookupCDSWorker(SavedCRMId, CRMId, IntTableFilter);
end;

local procedure LookupCDSWorker(SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text): Boolean
var
    CDSWorker: Record "CDS Worker";
    OriginalCDSWorker: Record "CDS Worker";
    CDSWorkerList: Page "CDS Worker List";
begin
    if not IsNullGuid(CRMId) then begin
        if CDSWorker.Get(CRMId) then
            CDSWorkerList.SetRecord(CDSWorker);
        if not IsNullGuid(SavedCRMId) then
            if OriginalCDSWorker.Get(SavedCRMId) then
                CDSWorkerList.SetCurrentlyCoupledCDSWorker(OriginalCDSWorker);
    end;

    CDSWorker.SetView(IntTableFilter);
    CDSWorkerList.SetTableView(CDSWorker);
    CDSWorkerList.LookupMode(true);
    if CDSWorkerList.RunModal = ACTION::LookupOK then begin
        CDSWorkerList.GetRecord(CDSWorker);
        CRMId := CDSWorker.WorkerId;
        exit(true);
    end;
    exit(false);
end;
```

4. In codeunit **CRM Setup Defaults** (ID 5334), subscribe to the **OnAddEntityTableMapping** event in order to enable deep linking between coupled [!INCLUDE[prod_short](../includes/prod_short.md)] records and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] records.

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnAddEntityTableMapping', '', true, true)]
    local procedure HandleOnAddEntityTableMapping(var TempNameValueBuffer: Record "Name/Value Buffer" temporary);
    var
        CRMSetupDefaults: Codeunit "CRM Setup Defaults";
    begin
        CRMSetupDefaults.AddEntityTableMapping('worker', DATABASE::Employee, TempNameValueBuffer);
        CRMSetupDefaults.AddEntityTableMapping('worker', DATABASE::"CDS Worker", TempNameValueBuffer);
    end;
}
```

### To create actions on the employee page for managing coupling and synchronization

To enable users to create couplings between records in the two systems, we will extend the **Employee Card** page with actions for creating and deleting couplings, for synchronizing and for deep linking. The following code example adds those actions to **Employee Card**.

```al
pageextension 50101 "Employee Synch Extension" extends "Employee Card"
{
    actions
    {
        addlast(navigation)
        {
            group(ActionGroupCDS)
            {
                Caption = 'Dataverse';
                Visible = CDSIntegrationEnabled;

                action(CDSGotoWorker)
                {
                    Caption = 'Worker';
                    Image = CoupledCustomer;
                    ToolTip = 'Open the coupled Dataverse worker.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(RecordId);
                    end;
                }
                action(CDSSynchronizeNow)
                {
                    Caption = 'Synchronize';
                    ApplicationArea = All;
                    Visible = true;
                    Image = Refresh;
                    Enabled = CDSIsCoupledToRecord;
                    ToolTip = 'Send or get updated data to or from Microsoft Dataverse.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.UpdateOneNow(RecordId);
                    end;
                }
                action(ShowLog)
                {
                    Caption = 'Synchronization Log';
                    ApplicationArea = All;
                    Visible = true;
                    Image = Log;
                    ToolTip = 'View integration synchronization jobs for the customer table.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(RecordId);
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Microsoft Dataverse row.';

                    action(ManageCDSCoupling)
                    {
                        Caption = 'Set Up Coupling';
                        ApplicationArea = All;
                        Visible = true;
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Microsoft Dataverse Worker.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(RecordId);
                        end;
                    }
                    action(DeleteCDSCoupling)
                    {
                        Caption = 'Delete Coupling';
                        ApplicationArea = All;
                        Visible = true;
                        Image = UnLinkAccount;
                        Enabled = CDSIsCoupledToRecord;
                        ToolTip = 'Delete the coupling to a Microsoft Dataverse Worker.';

                        trigger OnAction()
                        var
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(RecordId);
                        end;
                    }
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        CDSIntegrationEnabled := CRMIntegrationManagement.IsCDSIntegrationEnabled();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if CDSIntegrationEnabled then
            CDSIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(RecordId);
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        CDSIntegrationEnabled: Boolean;
        CDSIsCoupledToRecord: Boolean;

}
```

## Customizing the matching algorithm

Based on the fields that you choose to match on, the algorithm to find a match sets an equality filter by default. However, at the moment when it sets a filter, an event is raised by codeunit 5360, `CDSIntTableCouple`:

```al
    [IntegrationEvent(false, false)]
    local procedure OnBeforeSetMatchingFilter(var IntegrationRecordRef: RecordRef; var MatchingIntegrationRecordFieldRef: FieldRef; var LocalRecordRef: RecordRef; var MatchingLocalFieldRef: FieldRef; var SetMatchingFilterHandled: Boolean)
```

By subscribing to this event, you can modify the filter that is set on `MatchingIntegrationRecordFieldRef`. The following table outlines the parameters:

|Parameter  |Description  |
|-----------|-------------|
|LocalRecordRef |The Business Central record for which you are trying to find a match for.  |
|MatchingLocalFieldRef| the Business Central field that you want to use for finding a match in Dataverse. Use its value to set the filter on the Dataverse entity.  |
|IntegrationRecordRef| The record ref to the proxy record that represents the Dataverse entity.|
|MatchingIntegrationRecordFieldRef| The field reference to the proxy table field that represents the Dataverse entity attribute. To override the default behavior (equality filter), set your custom filter on this field, and then set `SetMatchingFilterHandled` flag to `true`.|

## Customizing Uncoupling

Tables might require custom code to remove couplings, for example, to change tables before or after uncoupling. To enable custom uncoupling, specify the uncoupling codeunit when you create an integration table mapping. To do this, adjust the function **InsertIntegrationTableMapping** in your codeunit, as follows:

```al
local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
begin
    IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo,  IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::Bidirectional, 'CDS', Codeunit::"CRM Integration Table Synch.", Codeunit::"CDS Int. Table Uncouple");
end;

```

During the custom uncoupling process, codeunit Int. Rec. Uncouple Invoke (ID 5357) raises and publishes events. You can add code that subscribes to these events so that you can add custom logic at different stages of the uncoupling process. The following table describes the events that are published by codeunit Int. Rec. Uncouple Invoke. 

* **OnBeforeUncoupleRecord** - Occurs before remove coupling, and can be used to change data before uncoupling. For an example, see codeunit CDS Int. Table. Subscriber, which includes the event subscriber function HandleOnBeforeUncoupleRecord. The event resets the company ID on the uncoupled tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].
* **OnAfterUncoupleRecord** - Occurs after coupling is removed, and can be used to change data after uncoupling. For an example, see codeunit CDS Int. Table. Subscriber, which includes the event subscriber function HandleOnAfterUncoupleRecord. The event removes couplings to the contacts linked to the uncoupled customers and vendors.

For more information about how to subscribe to events, see [Subscribing to Events](../developer/devenv-subscribing-to-events.md).

Be aware that custom uncoupling is running in background as it could modify [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] tables and it might take significant time.

> [!TIP]
> To reset Company ID on uncoupling custom tables just like the base [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] tables, users can subscribe to the OnHasCompanyIdField event in codeunit CDS Integration Mgt. (ID 7200), as follows:
>
> ```al
> [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Integration Mgt.", 'OnHasCompanyIdField', '', false, false)]
> local procedure HandleOnHasCompanyIdField(TableId: Integer; var HasField: Boolean)
> begin
>   if TableId = Database::"CDS Worker" then
>     HasField := true;
> end;
> ```

## Create default integration table mappings and field mappings

For synchronization to work, mappings must exist to associate the table ID and fields of the integration table (in this case, **CDS Worker**) with the table in [!INCLUDE[prod_short](../includes/prod_short.md)] (in this case table **Employee**). There are two types of mapping:  

- **Integration table mapping** - Integration table mapping links the [!INCLUDE[prod_short](../includes/prod_short.md)] table to the integration table for the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table.  
- **Integration field mapping** - Field mapping links a field in a table row in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] with a field in a record in [!INCLUDE[prod_short](../includes/prod_short.md)]. This determines which field in [!INCLUDE[prod_short](../includes/prod_short.md)] corresponds to which field in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. Typically, there are multiple field mappings for a table.  

In this scenario, we will create integration table and field mappings so that we can synchronize data for a worker in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] with an employee in [!INCLUDE[prod_short](../includes/prod_short.md)]. 

### To create an integration table mapping  

We can create the integration table mapping by subscribing to the **OnAfterResetConfiguration** event in codeunit **CDS Setup Defaults** (ID 7204).

1. Create a codeunit.  
2. Add a local procedure called **InsertIntegrationTableMapping**, as follows:

    ```al
    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo,  IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::Bidirectional, 'CDS');
    end;
    ```

3. In codeunit **CDS Setup Defaults**, subscribe to the **OnAfterResetConfiguration** event, as follows:

    ```al
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetConfiguration', '', true, true)]
    local procedure HandleOnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup")
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        CDSWorker: Record "CDS Worker";
        Employee: Record Employee;
    begin
        InsertIntegrationTableMapping(
            IntegrationTableMapping, 'EMPLOYEE-WORKER',
            DATABASE::Employee, DATABASE::"CDS Worker",
            CDSWorker.FieldNo(cdm_workerId), CDSWorker.FieldNo(ModifiedOn),
            '', '', true);

        ...
    end;
    ``` 

   For each integration table mapping entry, there must be integration field mapping entries to map the fields of the records in the table and the integration table. The next step is to add integration field mappings for each field in the **Employee** table in [!INCLUDE[prod_short](../includes/prod_short.md)] that we want to map to the **Worker** table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].  

### To create integration fields mappings  

To create an integration field mapping, follow these steps:  

1. Add a local procedure called **InsertIntegrationFieldMapping** to the codeunit that you created in step 1 of the previous process, as follows:

    ```al
    procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;
    ```

2. In the event subscriber that we created for our integration table mapping (in step 3 in the previous process), after we insert the integration table mapping we will add field mappings, as follows:

    ```al
    InsertIntegrationFieldMapping('EMPLOYEE-WORKER', Employee.FieldNo("First Name"), CDSWorker.FieldNo(cdm_FirstName), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    ```

3. Now repeat these steps for each field that we want to map.  

    > [!TIP]  
    > If a field in one of the tables does not have a corresponding field in the other table, we can use a constant value.

3. After publishing the extension, we can update the default mappings to include our new integration table mapping by opening the **CDS Connection Setup** page in [!INCLUDE[prod_short](../includes/prod_short.md)] and choosing **Use Default Synchronization Setup**.  

Users can now manually synchronize employee records in [!INCLUDE[prod_short](../includes/prod_short.md)] with Worker table rows in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] from the [!INCLUDE[prod_short](../includes/prod_short.md)] client.  

> [!TIP]  
> To learn how to schedule the synchronization by using a job queue entry, examine the code on the **RecreateJobQueueEntryFromIntTableMapping** function in codeunit **CDS Setup Defaults** (ID 7204) and see how it is called by the integration code for other [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] tables in the codeunit. For more information, see [Scheduling a Synchronization](/dynamics365/business-central/admin-scheduled-synchronization-using-the-synchronization-job-queue-entries).

### Enable customers to reset selected integration table mappings to the default settings

Customers might make changes to the integration table mappings that they later regret. To enable them to reset selected custom integration table mappings to the default, rather than all custom table mappings, follow these steps:

* In the same codeunit created for this section, add an event subscriber to **OnBeforeHandleCustomIntegrationTableMapping** and point to the default behavior, as follows:

    ```al
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Integration Management", 'OnBeforeHandleCustomIntegrationTableMapping', '', false, false)]
    local procedure HandleCustomIntegrationTableMappingReset(var IsHandled: Boolean; IntegrationTableMappingName: Code[20])
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
    begin
        case IntegrationTableMappingName of
            'EMPLOYEE-WORKER':
                begin
                    InsertIntegrationTableMapping(
                        IntegrationTableMapping, 'EMPLOYEE-WORKER',
                        DATABASE::Employee, DATABASE::"CDS Worker", C
                        DSWorker.FieldNo(cdm_workerId), CDSWorker.FieldNo(ModifiedOn),
                        '', '', true);
                    InsertIntegrationFieldMapping('EMPLOYEE-WORKER',
                        Employee.FieldNo("First Name"), CDSWorker.FieldNo(cdm_FirstName),
                        IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    ...
                    IsHandled := true;
                end;
                ...
        end;
    end;
    ```
> [!Important]  
> You must set the the IsHandled property to `true` to avoid triggering the default implementation. Otherwise, all custom table mappings will be reset to default, regardless of the user's selection.

## Customizing Synchronization  

When synchronizing data, some tables may require custom code to successfully synchronize data. Other tables might require the initialization of fields, the validation of relationships, or the transformation of data.  

You can either use the standard transformation rules on page **Integration Field Mapping List** (ID 5361) or you can transform data programmatically. For more information, see [Transformation Rules](/dynamics365/business-central/across-how-to-set-up-data-exchange-definitions#transformation-rules).

During the synchronization process, certain events are published and raised by codeunit **Integration Table Synch.** (ID 5335). We can add code that subscribes to these events so that we can add custom logic at different stages of the synchronization process. The following table describes the events that are published by codeunit **Integration Table Synch.**.  

|Event|Description|  
|-----|-----------|  
|**OnFindUnCoupledDestinationRecord**|Occurs when the process tries to synchronize an uncoupled record (new record). Use this event to implement custom resolution algorithms for automatic mapping between records. For example, use this event to automatically map records by fields. For an example, see codeunit **CRM Int. Table. Subscriber**, which includes the event subscriber function **CRMTransactionCurrencyFindUncoupledDestinationRecord**. The event resolves [!INCLUDE[prod_short](../includes/prod_short.md)] currency codes with ISO currency codes in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].|  
|**OnBeforeApplyRecordTemplate**|Occurs before applying configuration templates to new records, and can be used to implement algorithms for determining which configuration template to use.<!--point to section about templates.-->|  
|**OnAfterApplyRecordTemplate**|Occurs after configuration templates are applied to new records, and can be used to change data after configuration templates have been applied.|  
|**OnBeforeTransferRecordFields**|Occurs before transferring data in modified fields (which are defined in the **Integration Field Mapping** table) from the source table to the destination table. It can be used to validate the source or destination before the data is moved.|  
|**OnAfterTransferRecordFields**|Occurs after transferring modified field data (which are defined in the Integration Field Mapping table) from the source table to the destination table. It can be used to transfer additional data, validate lookups, and so on. Setting the **AdditionalFieldsWereModified** parameter will cause a destination record modification even though no fields were modified.|  
|**OnBeforeInsertRecord**|Occurs before inserting a new destination record, and can be used to initialize fields, such as primary keys.|  
|**OnAfterInsertRecord**|Occurs after a new destination record is inserted, and can be used to perform post-insert operations such as updating related data.|  
|**OnBeforeModifyRecord**|Occurs before modifying an existing destination record, and can be used to validate or change data before modification.|  
|**OnAfterModifyRecord**|Occurs after an existing destination record is modified, and can be used to perform post-modify operations such as updating related data.|  
|**OnTransferFieldData**|Occurs before an existing destination field value is transferred to a source field, and can be used to perform specific transformations of data when the data types of the source and the destination field are different but can be mapped.|  

For more information about how to subscribe to events, see [Subscribing to Events](../developer/devenv-subscribing-to-events.md).

> [!TIP]  
> In order to have Company ID mapping for custom tables just like the base [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] tables , users can subscribe to the **OnBeforeInsertRecord** event in codeunit **Integration Rec. Synch. Invoke** (ID 5345), as follows:
> ```al
>   [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Rec. Synch. Invoke", 'OnBeforeInsertRecord', '', false, false)]
>   local procedure HandleOnBeforeInsertRecord(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef)
>   var
>       CDSIntegrationMgt: Codeunit "CDS Integration Mgt.";
>   begin
>   if DestinationRecordRef.Number() = Database::"CDS Worker" then
>       CDSIntegrationMgt.SetCompanyId(DestinationRecordRef);
>   end;
>``` 
For more information on base [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] tables, see [Data Ownership Models](/dynamics365/business-central/admin-cds-company-concept).

## Create a table extension for an integration table in Business Central

Let us explore another scenario. If we added an **Industry** field to the **Contact** table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], and now want to include the field in our integration with [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].

> [!TIP]
> Sample code that customizes an integration between a contact in [!INCLUDE[prod_short](../includes/prod_short.md)] and a contact in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] by adding a new field is available in the [BCTech](https://github.com/microsoft/BCTech/tree/master/samples/CDSCustomContactIntegration) repository. 

### To create the integration table extension for table "CRM Contact" (ID 5342)

1. Create a new AL extension.
2. Locate the **AL Table Proxy Generator** tool. See the previous [section](administration-custom-cds-integration.md#to-create-the-integration-table-for-the-worker-table-in-business-central).
3. In PowerShell, run the tool with the following arguments:

    ```powershell
    -project:<Your AL project folder>
    -packagecachepath:<Your AL project cache folder>
    -serviceuri:<CDS server URL>
    -entities:contact
    -baseid:60000
    ```

    The process for creating the table starts. The AL Table Proxy Generator tool finds that an integration table for the **Contact** table already exists, so it creates a table extension with only new fields; in this case **Industry**. When the process is completed, the output path contains the `WorkerExt.al` file.

## Extend the contact table and page with the Industry field

To synchronize the **Industry** field we need to add the field in [!INCLUDE[prod_short](../includes/prod_short.md)]. The following code example extends table **Contact** and page **Contact Card** with new the field. For example:

```al
tableextension 60001 ContactExtension extends Contact
{
    fields
    {
        field(70116; "Industry"; Text[100])
        {
        }
    }
}

pageextension 60001 ContactCardExtension extends "Contact Card"
{
    layout
    {
        addlast(General)
        {
            field("Industry"; "Industry")
            {
                ApplicationArea = All;
                Caption = 'Industry';
            }
        }
    }
}
```

## Add new integration field mapping for Industry

Now that we have the field in both [!INCLUDE[prod_short](../includes/prod_short.md)] and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], we can add a new integration field mapping for it. To do that we will subscribe to the **OnAfterResetContactContactMapping** event in codeunit **CDS Setup Defaults** (ID 7204), as follows:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetContactContactMapping', '', true, true)]
local procedure HandleOnAfterResetContactContactMapping(IntegrationTableMappingName: Code[20])
var
    CDSContact: Record "CRM Contact";
    Contact: Record Contact;
    IntegrationFieldMapping: Record "Integration Field Mapping";
begin
    InsertIntegrationFieldMapping(
        IntegrationTableMappingName,
        Contact.FieldNo("Industry"),
        CDSContact.FieldNo(cr07b_Industry),
        IntegrationFieldMapping.Direction::Bidirectional,
        '', true, false);
end;
```

After we publish the extension we can update the mappings by running the **CDS Connection Setup** page and choosing **Use Default Synchronization Setup**.  

## See Also

[Overview](/dynamics365/business-central/admin-common-data-service)  
[Setting Up User Accounts for Integrating with [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]](/dynamics365/business-central/admin-setting-up-integration-with-dynamics-sales)  
[Set Up a Connection to [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]](/dynamics365/business-central/admin-how-to-set-up-a-dynamics-crm-connection)  
[Synchronizing Business Central and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]](/dynamics365/business-central/admin-synchronizing-business-central-and-sales)  
[Mapping the Tables and Fields to Synchronize](/dynamics365/business-central/admin-how-to-modify-table-mappings-for-synchronization)  
[Manually Synchronize Table Mappings](/dynamics365/business-central/admin-manual-synchronization-of-table-mappings)  
[Schedule a Synchronization](/dynamics365/business-central/admin-scheduled-synchronization-using-the-synchronization-job-queue-entries)  
