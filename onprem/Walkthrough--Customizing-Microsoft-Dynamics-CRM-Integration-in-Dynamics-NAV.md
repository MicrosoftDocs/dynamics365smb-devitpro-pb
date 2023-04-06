---
title: "Walkthrough: Customizing Microsoft Dynamics 365 for Sales Integration in Dynamics NAV"
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0658548b-3a7b-4e9a-bd1a-d58c625bd0de
caps.latest.revision: 12
---
# Walkthrough: Customizing Microsoft Dynamics 365 for Sales Integration in Dynamics NAV
This walkthrough introduces customizing the integration of [!INCLUDE[navnow](includes/navnow_md.md)] and [!INCLUDE[crm](includes/crm_md.md)]. The walkthrough will guide you through setting up integration of campaigns in [!INCLUDE[navnow](includes/navnow_md.md)] and campaigns in [!INCLUDE[crm](includes/crm_md.md)].  

 The customization in this walkthrough is done entirely in [!INCLUDE[navnow](includes/navnow_md.md)], and does not describe how to modify your [!INCLUDE[crm](includes/crm_md.md)] solution, such as adding or modify entities and forms.  

## Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[crm](includes/crm_md.md)], including the following:  

    -   Campaign entity.  

    -   URL of the [!INCLUDE[crm](includes/crm_md.md)] Server.  

    -   User name and password of a user account that has full permissions to add and modify entities.  

-   [!INCLUDE[navnow](includes/navnow_md.md)], including the following:  

    -   [!INCLUDE[demolong](includes/demolong_md.md)].  

    -   [!INCLUDE[crm](includes/crm_md.md)] integration enabled, including the default synchronization setup and a working connection from [!INCLUDE[navnow](includes/navnow_md.md)] to [!INCLUDE[crm](includes/crm_md.md)].  

         For more information, see [How to: Set Up a Microsoft Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md).  

    -   [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  

    -   [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].  

## About This Walkthrough  
 This walkthrough illustrates the following tasks:  

-   Creating an integration table object in [!INCLUDE[navnow](includes/navnow_md.md)] for mapping a [!INCLUDE[crm](includes/crm_md.md)] entity to a [!INCLUDE[navnow](includes/navnow_md.md)] record type \(table\).  

-   Using a [!INCLUDE[crm](includes/crm_md.md)] integration table as source of a [!INCLUDE[navnow](includes/navnow_md.md)] page to display [!INCLUDE[crm](includes/crm_md.md)] entity records.  

-   Creating a page for coupling [!INCLUDE[crm](includes/crm_md.md)] entity records to [!INCLUDE[navnow](includes/navnow_md.md)] table records.  

-   Creating an integration table and field mappings between a [!INCLUDE[navnow](includes/navnow_md.md)] table and an integration table for [!INCLUDE[crm](includes/crm_md.md)] entity.  

-   Using events to develop custom code to transform data when synchronizing between [!INCLUDE[navnow](includes/navnow_md.md)] and [!INCLUDE[crm](includes/crm_md.md)].  

## Creating an Integration Table in Dynamics NAV for the Dynamics 365 for Sales Entity  
 To integrate data from a [!INCLUDE[crm](includes/crm_md.md)] entity into [!INCLUDE[navnow](includes/navnow_md.md)], you must create a [!INCLUDE[navnow](includes/navnow_md.md)] table object that is based on the [!INCLUDE[crm](includes/crm_md.md)] entity, and then import the new table into the [!INCLUDE[navnow](includes/navnow_md.md)] database. For this walkthrough, you will create a [!INCLUDE[navnow](includes/navnow_md.md)] table object for the [!INCLUDE[crm](includes/crm_md.md)] **Campaign** entity. This table describes the schema of the [!INCLUDE[crm](includes/crm_md.md)] entity in [!INCLUDE[navnow](includes/navnow_md.md)] database. The table can contain all or some of the fields from the [!INCLUDE[crm](includes/crm_md.md)] entity. However, if you intend to write back to [!INCLUDE[crm](includes/crm_md.md)], you should include all fields in the table.  

 Apart from creating a table object for the entity, you must also create a table object for any relationships that the entity has. For example, the **Campaign** entity has a relationship to the **ModifiedOn** and **CreatedBy** fields of the **Systemuser** entity. Therefore, you will also have to create a [!INCLUDE[navnow](includes/navnow_md.md)] table for this entity as well. However, the default [!INCLUDE[crm](includes/crm_md.md)] integration in [!INCLUDE[navnow](includes/navnow_md.md)] already includes the integration table **5340 CRM Systemuser** for the **Systemuser** entity. Therefore, you will only have to create the table object for the **Systemuser** entity to establish the relationships; you do not have to import this table into the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

#### To create the integration table for the [!INCLUDE[crm](includes/crm_md.md)] Campaign entity  

1.  Open the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)].

2. Run the following command:

    ```
    Import-NAVCrmModule
    ```

2.  At the command prompt, run the New-NAVCrmTable cmdlet as shown in the following example. Include parameters that specify the [!INCLUDE[crm](includes/crm_md.md)] Server URL, the logical names of the [!INCLUDE[crm](includes/crm_md.md)]**Systemuser** and **Campaign** entities, the ID and name of the corresponding business data table objects in [!INCLUDE[navnow](includes/navnow_md.md)], and the path in which to store the generated text files for the table objects.  

    ```  
    New-NAVCRMTable –CRMServer MyOrg.Crm4.Dynamics.Com –EntityLogicalName systemuser,campaign –ObjectId 5340,50001 –Name “CRM Systemuser”,“CRM Campaign” –OutputPath c:\CRMObjects  
    ```  

     Replace *MyOrg.Crm4.Dynamics.Com* with the URL to your [!INCLUDE[crm](includes/crm_md.md)] Server. Replace *c:\CRMObjects* with the path on your computer or network where you want to save the .txt files for the created tables.  

3.  When prompted, enter credentials of the [!INCLUDE[crm](includes/crm_md.md)] user account.  

     The process for creating the tables starts. When the process is completed, the output path contains the files TAB5342.txt and TAB50001.txt. The TAB50001.txt contains the description of the integration table **50001 CRM Campaign**. These tables are set to the type **CRM**, as specified by the [TableType Property](TableType-Property.md).  

4.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], import the TAB50001.txt into the [!INCLUDE[navnow](includes/navnow_md.md)] database to add the integration table **50001 CRM Campaign**, and then compile the new object.  

     You can compile the object by using the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or by using finsql.exe. For more information, see [Importing and Exporting Objects](Importing-and-Exporting-Objects.md).  

## Creating a Page for Displaying Dynamics 365 for Sales Data  
 For scenarios where you want to view [!INCLUDE[crm](includes/crm_md.md)] data for a specific entity, you can create a page object that uses the integration table for the [!INCLUDE[crm](includes/crm_md.md)] entity as its source. For example, you might want to have a page that displays a list of the current records in a [!INCLUDE[crm](includes/crm_md.md)] entity. In this walkthrough, you will create a list page that uses table 50001 CRM Campaigns as its source.  

#### To create a list page to display Dynamics 365 for Sales campaigns  

1.  In [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], add a new List page.  

2.  Set the source table to the integration table **50001 CRM Campaign**.  

3.  Add the table fields that you want to display on the page.  

4.  Save and compile the page. For purposes of this walkthrough, give the page the name **CRM Campaign List** and ID **50001**.  

5.  Run the page to view the [!INCLUDE[crm](includes/crm_md.md)] campaign list.  

## Enabling Coupling between Dynamics 365 for Sales Campaigns and Dynamics NAV Campaigns  
 To establish a relationship between a Dynamics NAV table record and a Dynamics 365 for Sales entity record, you create a coupling. A coupling consists of the primary ID \(typically a GUID\) from Dynamics 365 for Sales record and the Integration ID \(GUID\) from Dynamics NAV.  

 To enable users to create couplings between records in the two systems, you implement a coupling page in [!INCLUDE[navnow](includes/navnow_md.md)] for the [!INCLUDE[crm](includes/crm_md.md)] entity. The coupling page provides the user interface that users can use to couple a [!INCLUDE[navnow](includes/navnow_md.md)] record to a [!INCLUDE[crm](includes/crm_md.md)] record. The default [!INCLUDE[crm](includes/crm_md.md)] integration includes several coupling pages. To create a coupling page for [!INCLUDE[crm](includes/crm_md.md)] Campaigns, you will use page **5241 CRM Coupling Customer** and adapt it the campaign integration. The coupling page that you set up will use the integration table **50001 CRM Campaign** to retrieve campaign data from [!INCLUDE[crm](includes/crm_md.md)]. It will use page **50001 CRM Campaign List** that you created previously to display a list of the campaigns from which to choose.  

 Before you create the coupling page, you must enable integration records for [!INCLUDE[navnow](includes/navnow_md.md)] table that will be used for integration with [!INCLUDE[crm](includes/crm_md.md)], in this case, table **5071 Campaign**. After you create the coupling page, you will add actions on the campaign card and list pages that open the coupling page. You will also have to modify codeunit **5331 CRM Coupling Management**.  

#### To enable integration records on the Dynamics NAV Campaign table  

1.  In [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], open codeunit **5150 Integration Management**.  

2.  In the **IsIntegrationRecord** trigger, add the code `DATABASE::Campaign` to the database list as illustrated in the following code example:  

    ```  
    EXIT(TableID IN  
      [DATABASE::Campaign,  
       DATABASE::Resource,  
       DATABASE::"Payment Terms",  
       DATABASE::"Shipment Method",  
    ...  

    ```  

3.  In the **InitializeIntegrationRecords** trigger, add the code `AddToIntegrationPageList(PAGE::"Campaign Сard",DATABASE::Campaign,TempNameValueBuffer,NextId);` as illustrated in the following code example:   

    ```
    AddToIntegrationPageList(PAGE::"Contact Card",DATABASE::Contact,TempNameValueBuffer,NextId);  
    AddToIntegrationPageList(PAGE::"Countries/Regions",DATABASE::"Country/Region",TempNameValueBuffer,NextId);  
    AddToIntegrationPageList(PAGE::"Campaign Сard",DATABASE::Campaign,TempNameValueBuffer,NextId);  
    ```

4.  Restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

     For more information, see [How to: Start, Stop, Restart, or Remove a Microsoft Dynamics NAV Server Instance](How-to--Start--Stop--Restart--or-Remove-a-Microsoft-Dynamics-NAV-Server-Instance.md).  

 When changes occur in the table **5071 Campaign**, an integration record will be created or updated with a timestamp. You can now use the table to create a page for coupling [!INCLUDE[navnow](includes/navnow_md.md)] records with [!INCLUDE[crm](includes/crm_md.md)] records.  

<!--section deleted by CRM team -->  
#### To create actions on the campaign page for managing the coupling  

1.  Open page **5086 Campaign Card** in Page Designer, and then open Action Designer.  

     For more information about how to add actions, see [How to: Add Actions to a Page](How-to--Add-Actions-to-a-Page.md).  

2.  Add an **ActionGroup** control that is caption **Dynamics CRM**.  

3.  Add another **ActionGroup** control under **Dynamics CRM** that has the caption **Coupling**.  

4.  In the **Coupling** action group, add the following actions:  

    |Name|Caption|  
    |----|-------|  
    |ManageCRMCoupling|Manage Coupling|  
    |DeleteCRMCoupling|Delete Coupling|  

5.  Open the C/AL code for the actions, and follow these steps:  

    1.  In the code for the action `ManageCRMCoupling`, add a local variable that has name **CRMIntegrationManagement** and references codeunit **5330 CRM Integration Management** as its subtype, and then add the following line of code:  

        ```  
        CRMIntegrationManagement.DefineCoupling(RECORDID);  
        ```  

    2.  In the code for the action `DeleteCRMCoupling`, add a local variable that has the name **CRMCouplingManagement** and references codeunit **5331 CRM Coupling Management** as its subtype, and then add the following line of code:  

        ```  
        CRMCouplingManagement.RemoveCoupling(RECORDID);  

        ```  

6.  Save and compile the page.  

 The coupling page is now available from the Campaign page.  
<!--section deleted by CRM team -->  

 To enable users to open the [!INCLUDE[crm](includes/crm_md.md)] Campaign record from the [!INCLUDE[navnow](includes/navnow_md.md)] Campaign, the next step is to add an additional action to the Campaign Card page.  

#### To add actions to open the Dynamics 365 for Sales campaign record  

1.  Open page **5086 Campaign Card** in Page Designer, and then open Action Designer.  

2.  In the **Dynamics 365 for Sales** action group, before the **Coupling** action, add a new action that has the name **GotoCRMCampaign** and caption **Campaign**.  

3.  In the C/AL code for the action, add a variable that has the name **CRMIntegrationManagement** and references codeunit **5330 CRM Integration Management**, and then add the following line of code:  

    ```  
    CRMIntegrationManagement.ShowCRMEntityFromRecordID(RECORDID);  

    ```  

4.  Save and compile the card page.  

5.  Open codeunit **5334 CRM Setup Defaults** in Codeunit Designer.  

6.  Add the following code to the `GetTableIDCRMEntityNameMapping` function to add an entity table mapping for table **5081 Campaign** and integration table **50001 CRM Campaign**:  

    ```  
    AddEntityTableMapping('campaign',DATABASE::Campaign,TempNameValueBuffer);  
    AddEntityTableMapping('campaign',DATABASE::"CRM Campaign",TempNameValueBuffer);  

    ```  

7.  Save and compile the codeunit.  

 The coupling and links between [!INCLUDE[crm](includes/crm_md.md)] Campaign records and [!INCLUDE[navnow](includes/navnow_md.md)] Campaign records are now completed. Users can easily open the coupled [!INCLUDE[crm](includes/crm_md.md)] record directly from [!INCLUDE[navnow](includes/navnow_md.md)].  

## Creating an Integration Table Mapping for Synchronizing Dynamics 365 for Sales Campaigns and Dynamics NAV Campaigns  
 For synchronization of data between [!INCLUDE[navnow](includes/navnow_md.md)] and [!INCLUDE[crm](includes/crm_md.md)] to work, mappings must exist to associate the table ID and fields of the integration table \(in this case table **50001 CRM Campaign**\) with the [!INCLUDE[navnow](includes/navnow_md.md)] business data table \(in this case table **5081 Campaign**\). To accomplish this, you must create to types of mappings: *integration table mapping* and *integration field mapping*.  

-   An integration table mapping links the [!INCLUDE[navnow](includes/navnow_md.md)] business data table to the integration table for the [!INCLUDE[crm](includes/crm_md.md)] entity.  

-   A field mapping associates a field in a [!INCLUDE[crm](includes/crm_md.md)] entity record with a field in a [!INCLUDE[navnow](includes/navnow_md.md)] record. It basically determines which field in [!INCLUDE[navnow](includes/navnow_md.md)] corresponds to which field in [!INCLUDE[crm](includes/crm_md.md)]. You will typically have multiple field mappings for an entity.  

 You can create the integration table mapping directly in table **5335 Integration Table Mapping** and integration field mappings directly in table **5336 Integration Field Mappings** or you can add the mappings by modifying codeunit **5334 CRM Setup Defaults**. For a repeatable solution, we recommend that you integrate your changes in codeunit **5334 CRM Setup Defaults**.  

#### To Create an Integration Table Mapping  

To create an integration table mapping directly in the table **5335 Integration Table Mapping**, follow these steps:  

1.  Open the integration table **50001 CRM Campaign** in Table Designer, and then make a note the field numbers of the **CampaignId** and **ModifiedOn** fields. You will use these numbers later in this procedure.  

2.  From Object Designer in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], run table **5335 Integration Table Mapping** to open it in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

3.  Add a new record and fill in the following fields:  

    |Field|Value|  
    |-----------|-----------|  
    |Name|CAMPAIGN|  
    |Table ID|5071|  
    |Integration Table ID|50001|  
    |Synch. Codeunit ID|5340 \(CRM Integration Table Synch.\)|  
    |Integration Table UID Fld. No.|\[The field number of the primary key field **CampaignId** in table **CRM Campaign**\]|  
    |Int. Tbl. Modified On Fld. No.|\[The field number of the **ModifiedOn** field in the integration table **CRM Campaign**\]|  
    |Direction|Bidirectional \(synchronizes from [!INCLUDE[navnow](includes/navnow_md.md)] to [!INCLUDE[crm](includes/crm_md.md)] and from [!INCLUDE[crm](includes/crm_md.md)] to [!INCLUDE[navnow](includes/navnow_md.md)]\).|  

To add an integration table mapping in codeunit **5334 CRM Setup Defaults**, follow these steps:  

1.  Open the codeunit in Codeunit Designer.  

2.  Add a local function called **ResetCampaignMapping** with the following parameters:  

    |Name|DataType|SubType|Length|  
    |----|--------|-------|------|  
    |IntegrationTableMappingName|Code| |20|  
    |EnqueueJobQueEntry|Boolean| | |  

3.  Add the following local variables:  

    |Name|DataType|SubType|  
    |----------|--------------|-------------|  
    |IntegrationTableMapping|Record|Integration Table Mapping|  
    |IntegrationFieldMapping|Record|Integration Field Mapping|  
    |CRMCampaign|Record|CRM Campaign|  
    |Campaign|Record|Campaign|  

4.  Add the following code to the function:  

    ```  
    InsertIntegrationTableMapping(
      IntegrationTableMapping,IntegrationTableMappingName,
      DATABASE::Campaign,DATABASE::"CRM Campaign",
      CRMCampaign.FIELDNO(CampaignId),CRMCampaign.FIELDNO(ModifiedOn),
      '','',TRUE);

    RecreateJobQueueEntry(IntegrationTableMapping,30,EnqueueJobQueEntry);
    ```  

 For each integration table mapping entry, there must be integration field mapping entries to map the individual fields of the records in the business table and integration table. The next step is to add integration field mappings for each field in the [!INCLUDE[navnow](includes/navnow_md.md)] Campaign table that you want to map to the [!INCLUDE[crm](includes/crm_md.md)] Campaign entity.  

#### To Create Integration Fields Mappings  

To create an integration field mapping directly in table **5336 Integration Field Mapping**, follow these steps:  

1.  From Object Designer, run table **5336 Integration Field Mapping** to open it in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

2.  Add a new record and fill in the following fields:  

    |Field|Value|  
    |-----------|-----------|  
    |No.|\[An identification number for the field mapping entry, such as 1\]|  
    |Integration Table Map Name|CAMPAIGN|  
    |Field No.|\[Field number for the **Description** field of the table **Campaign**, for example **2**\]|  
    |Integration Table Field No.|\[Field number for the **Name** field of the integration table **CRM Campaign**, for example **3**\]|  
    |Direction|Bidirectional|  

3.  Repeat these steps for each field that you want to map.  

    > [!TIP]  
    >  If a field in one of the tables does not have a corresponding field in the other table, you can use a constant value. For an example of this, see the **CONTACTS Integration Table Mapping**.  

To add an integration field mapping in codeunit **5334 CRM Setup Defaults**, follow these steps:  

1.  Open the codeunit in Codeunit Designer.  

2.  In the function **ResetCampaignMapping**, add the following code. As an example, this code maps the `Description` field in the **Campaign** table to the `Name` field in the **CRM Campaign** integration table.  

    ```  
    InsertIntegrationFieldMap(  
      IntegrationTableMapName,  
      Campaign.FIELDNO("Description"),  
      CRMCampaign.FIELDNO(Name),  
      IntegrationFieldMap.Direction::Bidrectional,  
      '',FALSE,FALSE);  

    ```  

     Repeat this step for all fields that you want to map.  

3.  After you make the changes to the CRM Setup Defaults, you can update the mappings by running the **[!INCLUDE[crm](includes/crm_md.md)] Connection Setup** page and choosing **Use Default Synchronization Setup**.  

 The next step is to add an action on page **5086  Campaign Card** that lets users to manually synchronize data between coupled campaign records in [!INCLUDE[navnow](includes/navnow_md.md)] and [!INCLUDE[crm](includes/crm_md.md)].  

#### To add an action for manual synchronization  

1.  Open page **5086 Campaign Card** in Page Designer, and then open the Action Designer for the page.  

2.  In the **Dynamics CRM** action group, before the **Coupling** action group, add a new action that has the name **CRMSynchronizeNow** and the caption **Synchronize Now**.  

3.  In the C/AL code for the action, add a global variable that has the name **CRMIntegrationManagement** and references codeunit **5330 CRM Integration Management**, and then add the following line of code:  

    ```  
    CRMIntegrationManagement.UpdateOneNow(RECORDID);  
    ```  

4.  Save and compile the page.  

 Users can now manually synchronize [!INCLUDE[navnow](includes/navnow_md.md)] Campaign records with [!INCLUDE[crm](includes/crm_md.md)] Campaign entity records from the [!INCLUDE[navnow](includes/navnow_md.md)] client.  

> [!TIP]  
>  If you want to learn how to schedule the synchronization by using a job queue entry, examine the code on the **RecreateJobQueueEntry** function in codeunit **5330 CRM Integration Management** and see how it is called by the integration code for other [!INCLUDE[crm](includes/crm_md.md)] entities in the codeunit.  

## Customizing Synchronization  
 When synchronizing data, some entities may require custom code to successfully synchronize data. Other entities might require the initialization of fields, the validation of relationships, or the transformation of data.  

 During the synchronization process, certain events are published and raised by codeunit **5335 Integration Table Synch.**. You can add code that subscribes to these events, which enables you to add custom logic at different stages of the synchronization process. The following table describes the events that are published by codeunit 5345.  

|Event|Description|  
|-----------|-----------------|  
|OnFindUnCoupledDestinationRecord|Occurs when the process tries to synchronize an uncoupled record \(new record\). Use this event to implement custom resolution algorithms for automatic mapping between records. For example, you can use this event to automatically map records by fields. You can see an example in codeunit **5341 CRM Int. Table. Subscriber**, which includes the event subscriber function **CRMTransactionCurrencyFindUncoupledDestinationRecord**. The event is used to resolve [!INCLUDE[navnow](includes/navnow_md.md)] currency codes with ISO currency codes in [!INCLUDE[crm](includes/crm_md.md)].|  
|OnBeforeApplyRecordTemplate|Occurs before applying configuration templates to new records, and can be used to implement algorithms for determining what configuration template to use.|  
|OnAfterApplyRecordTemplate|Occurs after configuration templates are applied to new records, and can be used to change data after configuration templates have been applied.|  
|OnBeforeTransferRecordFields|Occurs before transferring data in modified fields \(which are defined in the Integration Field Mapping table\) from the source table to the destination table. It can be used to validate the source or destination before the data is moved.|  
|OnAfterTransferRecordFields|Occurs after transferring modified field data \(which are defined in the Integration Field Mapping table\) from the source table to the destination table. It can be used to transfer additional data, validate lookups, and so on. Setting the **AdditionalFieldsWereModified** parameter will cause a destination record modification even if no fields were modified.|  
|OnBeforeInsertRecord|Occurs before inserting a new destination record, and can be used to initialize fields, such as primary keys.|  
|OnAfterInsertRecord|Occurs after new destination record is inserted, and can be used to perform post-insert operations such as updating related data.|  
|OnBeforeModifyRecord|Occurs before modifying an existing destination record, and can be used to validate/change data before modification.|  
|OnAfterModifyRecord|Occurs after an existing destination record is modified, and can be used to perform post-modify operations such as updating related data.|  
|OnTransferFieldData|Occurs before an existing destination field value is going to be transferred to a source field, and can be used to perform specific transformations of data when types of the source and the destination field are different but can be mapped.|  

 For the synchronization of campaigns, you will use an event to create a custom rule that sets the **Comment** field in a [!INCLUDE[navnow](includes/navnow_md.md)] campaign to **TRUE** if the **Message** field in a [!INCLUDE[crm](includes/crm_md.md)] campaign has data. You do this by subscribing to the **OnAfterTransferRecordFields** event that is published by codeunit **5335 Integration Table Synch**.  

 For more general information about how to subscribe to events, see [Subscribing to Events](Subscribing-to-Events.md).  

#### To subscribe to the Integration Table Synch. OnAfterTransferRecordFields event  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], open the codeunit that has the ID **5341** and the name **CRM Int. Table. Subscriber**.  

2.  Add a new function with the name **UpdateCampaignComment**.  

3.  Add the following local variables to the function:  

    |Name|DataType|SubType|  
    |----------|--------------|-------------|  
    |CRMCampaign|Record|CRM Campaign|  
    |Campaign|Record|Campaign|  

4.  Add the following code to implement the logic to determine whether the **Message** field has a value:  

    ```  
    SourceRecordRef.SETTABLE(CRMCampaign);  
    DestinationRecordRef.SETTABLE(Campaign);  

    IF (CRMCampaign.Message <> '') AND (NOT Campaign.Comment) THEN BEGIN  
      Campaign.Comment := TRUE;  
      AdditionalFieldsWereModified := TRUE;  
    END ELSE BEGIN  
      IF (CRMCampaign.Message = '') AND Campaign.Comment THEN BEGIN  
        Campaign.Comment := FALSE;  
        AdditionalFieldsWereModified := TRUE;  
      END;  
    END;  

    IF AdditionalFieldsWereModified THEN  
      DestinationRecordRef.GETTABLE(Campaign);
    ```  

5.  Locate the **OnAfterTransferRecordFields** function, which is an EventSubscriber. Add the following code as a case after the Unit of Measure case:  

    ```  
    'CRM Campaign-Campaign':
      AdditionalFieldsWereModified :=
        UpdateCampaignComment(SourceRecordRef,DestinationRecordRef);

    ```

6.  Save and compile the codeunit.  

 When you choose **Synchronize Now** on the **Campaign** page, and then choose to synchronize from [!INCLUDE[crm](includes/crm_md.md)] to [!INCLUDE[navnow](includes/navnow_md.md)], the **Comment** field should be updated to indicate whether the **Message** field in the [!INCLUDE[crm](includes/crm_md.md)] campaign has a value.  

## See Also  
 [Customizing Dynamics 365 for Sales and Dynamics NAV Integration](Customizing-Dynamics-CRM-and-Dynamics-NAV-Integration.md)   
 [Introduction to Dynamics 365 for Sales Integration Customization in Dynamics NAV](Introduction-to-Dynamics-CRM-Integration-Customization-in-Dynamics-NAV.md)
