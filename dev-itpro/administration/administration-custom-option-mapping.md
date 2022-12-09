---
title: Customizing option mappings with Microsoft Dataverse
description: Learn how to customize option mappings in an integration with Microsoft Dataverse.
author: bholtorf
ms.custom: na
ms.reviewer: solsen
ms.topic: conceptual
ms.author: bholtorf
ms.date: 04/01/2021
---

# Customizing option mappings with Microsoft Dataverse

This walkthrough describes how to customize option mappings in an integration between [!INCLUDE[prod_short](../includes/prod_short.md)] and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The walkthrough will guide you through the steps to integrate industry groups in [!INCLUDE[prod_short](../includes/prod_short.md)] with industry codes in the Account table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. 

## About this walkthrough

This walkthrough describes how to integrate new and existing extensions with [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. At a high level, the process involves the following tasks:  

1. Develop an AL extension to integrate a table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] and an option set in [!INCLUDE[prod_short](../includes/prod_short.md)]. For more information, see [Developing Extensions in AL](../developer/devenv-dev-overview.md).
2. Create an integration table object in [!INCLUDE[prod_short](../includes/prod_short.md)] for mapping a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table to a [!INCLUDE[prod_short](../includes/prod_short.md)] record type.  
3. Create a temporary table for a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] option set and use that table as the data source for a page in [!INCLUDE[prod_short](../includes/prod_short.md)] that displays data from [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table option sets.  
4. Extend a page in [!INCLUDE[prod_short](../includes/prod_short.md)] for coupling and synchronizing table rows in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] with option sets in [!INCLUDE[prod_short](../includes/prod_short.md)].  
5. Use events to create an integration table and a field mapping between a table in [!INCLUDE[prod_short](../includes/prod_short.md)] and an integration table for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].  

> [!NOTE]  
> The customization in this walkthrough is done entirely in [!INCLUDE[prod_short](../includes/prod_short.md)] online, and does not describe how to modify your [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] solution, for example, by adding or modifying tables and forms.  

## Prerequisites

This walkthrough has the following requirements:  

- [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], including the following:  
    - Account table.
    - The URL of your [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] environment.
    - The user name and password of a user account that has full permissions to add and modify tables.  
- [!INCLUDE[prod_short](../includes/prod_short.md)], including the following:  
    - The CRONUS International Ltd. demonstration data.  

      Use a sandbox environment. For more information, see [Production and Sandbox Environments](environment-types.md).
    - Integration with [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] is enabled, including the default synchronization setup and a working connection between [!INCLUDE[prod_short](../includes/prod_short.md)] and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].
    - Feature switch **Feature Update: Map to option sets in Dataverse without code** is enabled.
    - Visual Studio Code with the AL Language extension installed. For more information, see [Get Started with AL](../developer/devenv-get-started.md) and [AL Language Extension Configuration](../developer/devenv-al-extension-configuration.md). The AL Language extension for Visual Studio is free, and you can download it from [Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al).

## Create an integration table in Business Central for the Dataverse option set  

To integrate data from a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] option set into [!INCLUDE[prod_short](../includes/prod_short.md)], you must create a temporary table object in [!INCLUDE[prod_short](../includes/prod_short.md)] that is based on the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] option set. You can then import the new table into the [!INCLUDE[prod_short](../includes/prod_short.md)] database. For this walkthrough, we will create a table object that describes the schema for the **Industry (industrycode)** option set in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] in the [!INCLUDE[prod_short](../includes/prod_short.md)] database. 

### To create the integration table for the Dataverse Industry table in Business Central 

1. Create a new AL extension. For more information, see [Developing Extensions in AL](../developer/devenv-dev-overview.md).
2. Name the table **Dataverse Industry**, and specify **50100** as the table ID.  
3. Set the table type as temporary.
4. Add the **Option ID** and **Code** fields.
5. Create a procedure for loading data from the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] option set into the table.

```al
table 50100 "Dataverse Industry"
{
    Caption = 'Dataverse Industry';
    Description = 'Industry';
    TableType = Temporary;

    fields
    {
        field(1; "Option Id"; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(2; "Code"; Text[250])
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Option Id")
        {
            Clustered = true;
        }
        key(Key2; "Code")
        {
        }
    }

    procedure Load(): Boolean
    var
        TableMetadata: Record "Table Metadata";
        CDSIntegrationMgt: Codeunit "CDS Integration Mgt.";
        OptionSetMetadataDictionary: Dictionary of [Integer, Text];
        OptionValue: Integer;
    begin
        if TableMetadata.Get(Database::"CRM Account") then
            OptionSetMetadataDictionary := CDSIntegrationMgt.GetOptionSetMetadata(TableMetadata.ExternalName, 'industrycode'); // Name of the table and field in Dataverse
        if OptionSetMetadataDictionary.Count() = 0 then
            exit(true);

        foreach OptionValue in OptionSetMetadataDictionary.Keys() do begin
            Clear(Rec);
            Rec."Option Id" := OptionValue;
            Rec."Code" := CopyStr(OptionSetMetadataDictionary.Get(OptionValue), 1, MaxStrLen(Rec."Code"));
            Rec.Insert();
        end;

        if not Rec.FindFirst() then
            exit(false);

        exit(true);
    end;
}
```

## Create a page for displaying Dataverse data  

For scenarios where we want to view [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] data for a specific table, we can create a page object that uses the temporary table for the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] option set as its data source. In this walkthrough, we will create a list page that uses the **Dataverse Industry** integration table with **ID 50100** as its data source.  

### To create a list page to display Dataverse workers  

1. Create a new page. For more information, see [Pages Overview](../developer/devenv-pages-overview.md). 
2. Name the page **Dataverse Industry List**, and specify **50100** as the page ID.  
3. Specify the **Dataverse Industry** integration table as the source table, as shown below.
4. Make sure to call the **Load** procedure that you created on the table in the **OnOpenPage** trigger.

```al
page 50100 "Dataverse Industry List"
{
    ApplicationArea = Suite;
    Caption = 'Industry - Dataverse';
    AdditionalSearchTerms = 'Industry CDS, Industry Common Data Service';
    Editable = false;
    PageType = List;
    SourceTable = "Dataverse Industry";
    SourceTableView = sorting("Code");
    SourceTableTemporary = true;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Suite;
                    Caption = 'Code';
                    StyleExpr = FirstColumnStyle;
                    ToolTip = 'Specifies data from a corresponding field in a Dataverse entity. For more information about Dataverse, see Dataverse Help Center.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CreateFromCRM)
            {
                ApplicationArea = Suite;
                Caption = 'Create in Business Central';
                Image = NewCustomer;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Generate the entity from the coupled Dataverse Industry.';
                Visible = OptionMappingEnabled;

                trigger OnAction()
                var
                    DataverseIndustry: Record "Dataverse Industry";
                    CRMIntegrationManagement: Codeunit "CRM Integration Management";
                begin
                    DataverseIndustry.Copy(Rec, true);
                    CurrPage.SetSelectionFilter(DataverseIndustry);
                    CRMIntegrationManagement.CreateNewRecordsFromSelectedCRMOptions(DataverseIndustry);
                end;
            }
        }
    }

    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"CRM Integration Management");
    end;

    trigger OnOpenPage()
    var
        CRMIntegrationManagmeent: Codeunit "CRM Integration Management";
    begin
        OptionMappingEnabled := CRMIntegrationManagmeent.IsOptionMappingEnabled();
        LoadRecords();
    end;

    var
        CurrentlyMappedDataverseIndustryOptionId: Integer;
        Coupled: Text;
        FirstColumnStyle: Text;
        LinesLoaded: Boolean;
        OptionMappingEnabled: Boolean;

    procedure SetCurrentlyMappedDataverseIndustryOptionId(OptionId: Integer)
    begin
        CurrentlyMappedDataverseIndustryOptionId := OptionId;
    end;

    procedure GetRec(OptionId: Integer): Record "Dataverse Industry"
    begin
        if Rec.Get(OptionId) then
            exit(Rec);
    end;

    procedure LoadRecords()
    begin
        if LinesLoaded then
            exit;

        LinesLoaded := Rec.Load();
    end;
}
``` 

### To create a column on a list page to display coupled records
To track whether an industry group is coupled to an industry code in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], do the following:

1. Add a boolean field called **Coupled to CRM** to your [!INCLUDE[prod_short](../includes/prod_short.md)] table. 

 > [!IMPORTANT]  
 > The name of the new field must be **Coupled to CRM**. <!--Shouldn't this be "Sales?"-->

3. Add a control that shows the **Coupled to CRM** field on the list page. There are no naming requirements for the control.

Every time you couple or uncouple a record from your [!INCLUDE[prod_short](../includes/prod_short.md)] table to a option set in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], the synchronization engine will update the Coupled to CRM field that you added.

This will only update records that you couple or uncouple after you have added the Coupled to CRM field. To update this field value on records that were coupled before you added the Coupled to CRM field, you must run the following code. We recommend that you run the code as a background task.

```al
local procedure SetCouplingFlags()
var
    CRMOptionMapping: Record "CRM Option Mapping";
    CRMIntegrationManagement: Codeunit "CRM Integration Management";
begin
    CRMOptionMapping.SetRange("Table ID", Database::"Industry Group");
    if CRMOptionMapping.FindSet() then
        repeat
            CRMIntegrationManagement.SetCoupledFlag(CRMOptionMapping, true);
        until CRMOptionMapping.Next() = 0;
end;
```

## Enable coupling and synchronization an industry in Dataverse and an industry group in Business Central
To connect a [!INCLUDE[prod_short](../includes/prod_short.md)] table record with a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] option set, you create an option mapping. An option mapping consists of the option ID from a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] option set and a record ID from [!INCLUDE[prod_short](../includes/prod_short.md)].  

1. Create a new codeunit.
2. In codeunit **CRM Setup Defaults** (ID 5334), subscribe to the **OnGetCDSTableNo** event, as follows:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
local procedure HandleOnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean)
begin
    if BCTableNo = Database::"Industry Group" then begin
        CDSTableNo := Database::"Dataverse Industry";
        handled := true;
    end;
end;
```
You can now use the table to create a page for coupling [!INCLUDE[prod_short](../includes/prod_short.md)] records with [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] option sets.

3. In codeunit **Lookup CRM Tables** (ID 5332), subscribe to the **OnLookupCRMOption** event, as follows:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", 'OnLookupCRMOption', '', true, true)]
local procedure HandleOnLookupCRMOption(CRMTableID: Integer; NAVTableId: Integer; SavedCRMOptionId: Integer; var CRMOptionCode: Text[250]; var CRMOptionId: Integer; IntTableFilter: Text; var Handled: Boolean)
begin
    if CRMTableID = Database::"Dataverse Industry" then
        Handled := LookupDataveseIndustry(SavedCRMOptionId, CRMOptionId, CRMOptionCode, IntTableFilter);
end;

local procedure LookupDataveseIndustry(SavedCRMId: Integer; var CRMOptionId: Integer; var CRMOptionCode: Text[250]; IntTableFilter: Text): Boolean
var
    DataverseIndustry: Record "Dataverse Industry";
    OriginalDataverseIndustry: Record "Dataverse Industry";
    DataverseIndustryList: Page "Dataverse Industry List";
begin
    if CRMOptionId <> 0 then begin
        DataverseIndustryList.LoadRecords();
        DataverseIndustry := DataverseIndustryList.GetRec(CRMOptionId);
        if DataverseIndustry."Option Id" <> 0 then
            DataverseIndustryList.SetRecord(DataverseIndustry);
        if SavedCRMId <> 0 then begin
            OriginalDataverseIndustry := DataverseIndustryList.GetRec(SavedCRMId);
            if OriginalDataverseIndustry."Option Id" <> 0 then
                DataverseIndustryList.SetCurrentlyMappedDataverseIndustryOptionId(SavedCRMId);
        end;
    end;
    DataverseIndustry.SetView(IntTableFilter);
    DataverseIndustryList.SetTableView(DataverseIndustry);
    DataverseIndustryList.LookupMode(true);
    Commit();
    if DataverseIndustryList.RunModal() = ACTION::LookupOK then begin
        DataverseIndustryList.GetRecord(DataverseIndustry);
        CRMOptionId := DataverseIndustry."Option Id";
        CRMOptionCode := DataverseIndustry."Code";
        exit(true);
    end;
    exit(false);
end;
```

4. In codeunit **CRM Integration Table Synch.** (ID 5340), subscribe to the **OnLoadCRMOption** event, as follows:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Integration Table Synch.", 'OnLoadCRMOption', '', true, true)]
local procedure HandleOnLoadCRMOption(var TempCRMRecordRef: RecordRef; IntegrationTableMapping: Record "Integration Table Mapping")
var
    DataverseIndustry: Record "Dataverse Industry";
begin
    if IntegrationTableMapping."Table ID" = Database::"Industry Group" then begin
        DataverseIndustry.Load();
        TempCRMRecordRef.GetTable(DataverseIndustry);
    end;
end;
```

5. In codeunit **Int. Option Synch. Invoke** (ID 5364), subscribe to the **OnPrepareNewDestination** event, as follows

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Int. Option Synch. Invoke", 'OnPrepareNewDestination', '', true, true)]
local procedure HandleOnPrepareNewDestination(IntegrationTableMapping: Record "Integration Table Mapping"; var CoupledRecordRef: RecordRef)
begin
    if IntegrationTableMapping."Table ID" = Database::"Industry Group" then
        CoupledRecordRef.Open(Database::"Dataverse Industry");
end;
```

6. In codeunit **CRM Option Mapping** (ID 5334), subscribe to the **OnGetMetadataInfo** and **OnIsCRMRecordRefMapped** events, as follows:

```al
[EventSubscriber(ObjectType::Table, Database::"CRM Option Mapping", 'OnGetMetadataInfo', '', true, true)]
local procedure HandleOnGetMetadataInfo(CRMRecordRef: RecordRef; var EntityName: Text; var FieldName: Text)
var
    TableMetadata: Record "Table Metadata";
begin
    if CRMRecordRef.Number = Database::"Dataverse Industry" then begin
        if TableMetadata.Get(Database::"CRM Account") then
            EntityName := TableMetadata.ExternalName
        else
            exit;

        FieldName := 'industrycode'; // Name of the field in Dataverse
    end;
end;

[EventSubscriber(ObjectType::Table, Database::"CRM Option Mapping", 'OnIsCRMRecordRefMapped', '', true, true)]
local procedure HandledOnIsCRMRecordRefMapped(CRMRecordRef: RecordRef; var CRMOptionMapping: Record "CRM Option Mapping"; var Handled: Boolean)
var
    CRMAccount: Record "CRM Account";
    DataverseIndustry: Record "Dataverse Industry";
begin
    if CRMRecordRef.Number = Database::"Dataverse Industry" then begin
        CRMOptionMapping.SetRange("Integration Table ID", Database::"CRM Account");
        CRMOptionMapping.SetRange("Integration Field ID", CRMAccount.FieldNo(IndustryCode));
        CRMOptionMapping.SetRange("Option Value", CRMRecordRef.Field(DataverseIndustry.FieldNo("Option Id")).Value());
        Handled := true;
    end;
end;
```

7. In codeunit **CRM Integration Management** (ID 5330), subscribe to the **OnIsCRMTable** and **OnGetTableIdFromCRMOption** events, as follows:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Integration Management", 'OnIsCRMTable', '', true, true)]
local procedure HandleOnIsCRMTable(TableID: Integer; var CRMTable: Boolean; var Handled: Boolean)
begin
    if TableID = Database::"Dataverse Industry" then begin
        CRMTable := true;
        Handled := true;
    end;
end;

[EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Integration Management", 'OnGetTableIdFromCRMOption', '', true, true)]
local procedure HandleOnGetTableIdFromCRMOption(RecRef: RecordRef; var TableId: Integer)
begin
    if RecRef.Number = Database::"Dataverse Industry" then
        TableId := Database::"Industry Group";
end;
```

8. In codeunit **Coupling Record Buffer** (ID 5332), subscribe to the **OnFindCRMOptionByName** event, as follows:

```al
[EventSubscriber(ObjectType::Table, Database::"Coupling Record Buffer", 'OnFindCRMOptionByName', '', true, true)]
local procedure HandleOnFindCRMOptionByName(CRMTableID: Integer; var EntityName: Text; var FieldName: Text; var Handled: Boolean)
var
    TableMetadata: Record "Table Metadata";
begin
    if CRMTableID = Database::"Dataverse Industry" then begin
        if TableMetadata.Get(Database::"CRM Account") then
            EntityName := TableMetadata.ExternalName
        else
            exit;

        FieldName := 'industrycode'; // Name of the field in Dataverse
        Handled := true;
    end;
end;
```

### To create actions on the Industry Groups page for managing coupling and synchronization

To enable users to couple records, we will extend the **Industry Groups** page with actions for creating and deleting couplings, and for synchronizing. The following code example adds those actions to the **Industry Groups** page.

```al
pageextension 50100 "Industry Synch Extension" extends "Industry Groups"
{
    actions
    {
        addlast(navigation)
        {
            group(ActionGroupDataverse)
            {
                Caption = 'Dataverse';
                Visible = CDSIntegrationEnabled;
                action(CDSSynchronizeNow)
                {
                    Caption = 'Synchronize';
                    ApplicationArea = All;
                    Visible = true;
                    Image = Refresh;
                    ToolTip = 'Send or get updated data to or from Dataverse.';

                    trigger OnAction()
                    var
                        IndustryGroup: Record "Industry Group";
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        IndustryGroupRecordRef: RecordRef;
                    begin
                        CurrPage.SetSelectionFilter(IndustryGroup);
                        IndustryGroupRecordRef.GetTable(IndustryGroup);
                        CRMIntegrationManagement.UpdateMultipleNow(IndustryGroupRecordRef, true);
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Dataverse record.';

                    action(ManageCDSCoupling)
                    {
                        Caption = 'Set Up Coupling';
                        ApplicationArea = All;
                        Visible = true;
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Dataverse Industry.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineOptionMapping(Rec.RecordId);
                        end;
                    }
                    action(DeleteCDSCoupling)
                    {
                        Caption = 'Delete Coupling';
                        ApplicationArea = All;
                        Visible = true;
                        Image = UnLinkAccount;
                        Enabled = CDSIsCoupledToRecord;
                        ToolTip = 'Delete the coupling to a Dataverse Industry.';

                        trigger OnAction()
                        var
                            IndustryGroup: Record "Industry Group";
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                            RecRef: RecordRef;
                        begin
                            CurrPage.SetSelectionFilter(IndustryGroup);
                            RecRef.GetTable(IndustryGroup);
                            CRMIntegrationManagement.RemoveOptionMapping(RecRef);
                        end;
                    }
                }
                action(ShowLog)
                {
                    Caption = 'Synchronization Log';
                    ApplicationArea = All;
                    Visible = true;
                    Image = Log;
                    ToolTip = 'View integration synchronization jobs for the industry group table.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowOptionLog(Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
    begin
        CDSIntegrationEnabled := CRMIntegrationManagement.IsCDSIntegrationEnabled() and CRMIntegrationManagement.IsOptionMappingEnabled();
    end;

    trigger OnAfterGetCurrRecord()
    var
        CRMOptionMapping: Record "CRM Option Mapping";
    begin
        if CDSIntegrationEnabled then begin
            CRMOptionMapping.SetRange("Record ID", Rec.RecordId);
            CDSIsCoupledToRecord := not CRMOptionMapping.IsEmpty();
        end;
    end;

    var
        CDSIntegrationEnabled: Boolean;
        CDSIsCoupledToRecord: Boolean;
}
```

We will also extend the **Industry Group** table to update the option mapping when a record is renamed.

```al
tableextension 50100 "Industry Group Extension" extends "Industry Group"
{
    trigger OnRename()
    var
        CRMSyncHelper: Codeunit "CRM Synch. Helper";
    begin
        CRMSyncHelper.UpdateCDSOptionMapping(xRec.RecordId(), RecordId());
    end;
}
```

## Create default integration table mappings and field mappings
For synchronization to work, mappings must exist to associate the table ID and fields of the integration table (in this case, **Dataverse Industry**) with the table in [!INCLUDE[prod_short](../includes/prod_short.md)] (in this case, **Industry Group**). There are two types of mappings:  

- **Integration table mapping** - Integration table mapping links the [!INCLUDE[prod_short](../includes/prod_short.md)] table to the integration table for the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table.  
- **Integration field mapping** - Field mapping links a field in a table row in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] with a field in a record in [!INCLUDE[prod_short](../includes/prod_short.md)]. This mapping determines which field in [!INCLUDE[prod_short](../includes/prod_short.md)] corresponds to which field in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. Typically, there are multiple field mappings for a table.  

In this scenario, we will create integration table and field mappings so that we can synchronize data for an industry in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] with an industry group in [!INCLUDE[prod_short](../includes/prod_short.md)]. 

### To create an integration table mapping  

We can create the integration table mapping by subscribing to the **OnAfterResetConfiguration** event in codeunit **CDS Setup Defaults** (ID 7204).

1. Create a codeunit.  
2. Add a local procedure called **InsertIntegrationTableMapping**, as follows:

    ```al
    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo,  IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::FromIntegrationTable, 'CDS');
    end;
    ```

> [!NOTE]  
> Options can only be synchronized either To Integration Table or From Integration Table. Bidirectional synchronization for options is not supported.  


3. In codeunit **CDS Setup Defaults**, subscribe to the **OnAfterResetConfiguration** event, as follows:

    ```al
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetConfiguration', '', true, true)]
    local procedure HandleOnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup")
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        CRMAccount: Record "CRM Account";
        IndustryGroup: Record "Industry Group";
    begin
        InsertIntegrationTableMapping(
          IntegrationTableMapping, 'INDUSTRY',
          Database::"Industry Group", Database::"CRM Account",
          CRMAccount.FieldNo(IndustryCode), 0,
          '', '', true);

        ..
    end;
    ``` 

For each integration table mapping entry, there must be integration field mapping entries to map the fields of the records in the table and the integration table. The next step is to add an integration field mapping for the **Code** field in the **Industry Group** table in [!INCLUDE[prod_short](../includes/prod_short.md)] thats maps it to the **Dataverse Industry** table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].  

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

2. In the event subscriber that we created for our integration table mapping (in step 3 in the previous process), after we insert the integration table mapping we'll add field mappings, as follows:

    ```al
    InsertIntegrationFieldMapping('INDUSTRY', IndustryGroup.FieldNo(Code), CRMAccount.FieldNo(IndustryCode), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
    ```

3. We can repeat these steps for each field that we want to map.  

    > [!TIP]  
    > If a field in one of the tables does not have a corresponding field in the other table, we can use a constant value.

3. After publishing the extension, we can update the default mappings to include our new integration table mapping by opening the **CDS Connection Setup** page in [!INCLUDE[prod_short](../includes/prod_short.md)] and choosing **Use Default Synchronization Setup**.  

Users can now manually synchronize industry group records in [!INCLUDE[prod_short](../includes/prod_short.md)] with industry option set on Account table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] from the [!INCLUDE[prod_short](../includes/prod_short.md)] client.  

> [!TIP]  
> To learn how to schedule the synchronization by using a job queue entry, explore the code on the **RecreateJobQueueEntryFromIntTableMapping** method in codeunit **CDS Setup Defaults** (ID 7204). The code shows how it's called by the integration code for other [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] tables in the codeunit. For more information, see [Scheduling a Synchronization](/dynamics365/business-central/admin-scheduled-synchronization-using-the-synchronization-job-queue-entries).

[Overview](/dynamics365/business-central/admin-common-data-service)  
[Setting Up User Accounts for Integrating with [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]](/dynamics365/business-central/admin-setting-up-integration-with-dynamics-sales)  
[Set Up a Connection to [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]](/dynamics365/business-central/admin-how-to-set-up-a-dynamics-crm-connection)  
[Synchronizing Business Central and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]](/dynamics365/business-central/admin-synchronizing-business-central-and-sales)  
[Mapping the Tables and Fields to Synchronize](/dynamics365/business-central/admin-how-to-modify-table-mappings-for-synchronization)  
[Manually Synchronize Table Mappings](/dynamics365/business-central/admin-manual-synchronization-of-table-mappings)  
[Schedule a Synchronization](/dynamics365/business-central/admin-scheduled-synchronization-using-the-synchronization-job-queue-entries)
