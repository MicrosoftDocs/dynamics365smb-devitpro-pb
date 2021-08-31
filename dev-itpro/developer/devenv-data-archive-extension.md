---
title: "Extending the Data Archive Extension"
description: "Overview and examples of how to enable your app to archive data."
author: bholtorf

ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: bholtorf
ms.date: 04/01/2021
---

# Extending the Data Archive Extension
The Data Archive extension provides a basic framework for archiving and backing up data as part of date compression. When you use date compression, related entries are consolidated into a single entry, and the originals are deleted. For more information, see [Compress Data with Date Compression](admin-manage-documents.md#compress-data-with-date-compression). However, there might be value in keeping that data, so rather than deleting it, you can archive it for later use.

An application that wants to archive data does so by using the **Data Archive** codeunit, which is available in the System Application. 

The following patterns of use are supported:

* Store individual records by calling the **SaveRecord(Record)** method.
* Store a record set by calling the **SaveRecords(RecordRef)** method.
* Start recording deletions by calling the StartSubscriptionToDelete() method in the beginning of your code, and StopSubscriptionToDelete() after records have been deleted. Note that this pattern records *all* deletions, including those that happen in related tables and intermediate tables that might be used in the process (though temporary records are not recorded).

> [!NOTE]
> Recording deletions relies on the global database triggers, so for any deletions that have already been made on the relevant records, and the change log is not active for that table, you should consider using StartSubscriptionToDelete(**true**) to reset the session. Resetting the session will, however, also reset the state in the object, so we recommend caution when you test or use it.

The following example illustrates these patterns.

```
codeunit 50000 demo

{
    trigger OnRun()
    var
        DataArchive: Codeunit "Data Archive";
    begin
        if DataArchive.DataArchiveProviderExists() then begin
            SaveSingleRecords();
            SaveRecordSet();
            DeleteAndArchiveSomeCustomers();
        end;
    end;

    local procedure SaveSingleRecords()
    var
        Customer: Record Customer;
        DataArchive: Codeunit "Data Archive";
    begin
        Customer.SetRange("Country/Region Code", 'FO');
        If Customer.FindSet() then begin
            DataArchive.Create('Our Faroese customers');
            repeat
                DataArchive.SaveRecord(Customer);
            until Customer.Next() = 0;
            DataArchive.Save();
        end;
    end;

    local procedure SaveRecordSet()
    var
        Customer: Record Customer;
        DataArchive: Codeunit "Data Archive";
        RecRef: RecordRef;
    begin
        Customer.SetRange("Country/Region Code", 'FO');
        If not Customer.IsEmpty() then begin
            DataArchive.Create('Our Faroese customers');
            RecRef.GetTable(Customer);
            DataArchive.SaveRecords(RecRef);
            DataArchive.Save();
        end;
    end;

    local procedure DeleteAndArchiveSomeCustomers()
    var
        Customer: Record Customer;
        DataArchive: Codeunit "Data Archive";
    begin
        Customer.SetRange("Country/Region Code", 'FO');
        If not Customer.IsEmpty() then begin
            DataArchive.Create('Deleted Faroese customers');
            DataArchive.StartSubscriptionToDelete();

        Customer.DeleteAll(true);

            DataArchive.StopSubscriptionToDelete();
            DataArchive.Save();
            end;
    end;

}

```

## Methods in the Data Archive codeunit
The following table lists the methods that the Data Archive codeunit provides.

|Methods  |
|---------|
|// Creates a new archive entry.<br>procedure Create(Description: Text): Integer     |
|// Creates a new archive entry, resets the session and starts logging all new del<br> procedure CreateAndStartLoggingDeletions(Description: Text): Integer     |
|// Opens an existing archive entry so more can be added to it<br> procedure Open(ID: Integer)     |
|// Saves and closes the currently open archive entry.<br> procedure Save()     |
|// Discards any additions and closes the currently open archive entry.<br> procedure DiscardChanges()     |
|// Saves the supplied record to the currently open archive entry.<br> procedure SaveRecord(RecordVar: Variant) <br> procedure SaveRecord(var RecRef: RecordRef)     |
|// Saves all records within the filters to the currently open archive entry.<br> procedure SaveRecords(var RecRef: RecordRef)     |
|// Starts subscription to the OnDatabaseDelete trigger and calls SaveRecord with any deleted record.<br> procedure StartSubscriptionToDelete()<br> procedure StartSubscriptionToDelete(ResetSession: Boolean)     |
|// Stops the subscription to the OnDatabaseDelete trigger.<br> procedure StopSubscriptionToDelete()     |
|// Informs the consumer app whether there is a provider for this interface.<br> procedure DataArchiveProviderExists(): Boolean     |

<!-- REMOVING FOR NOW. CONSIDER ADDING LATER FOR OTHER FIRST PARTY APPS
## Application Objects
The application objects for data archiving are available in the System Application and in the Data Archive extension. 

### System Application
|File name  |Object ID  |Object name  |Comment  |
|---------|---------|---------|---------|
|DataArchive.codeunit.al     | 600        | “Data Archive”        | Relies on an implementation of IDataArchiveProvider        |
|DataArchiveImplementation.codeunit.al     | 601        | “Data Archive Implementation”        | Relies on an implementation of IDataArchiveProvider        |
|IDataArchiveProvider.interface.al     |         | IDataArchiveProvider        |         |

### Data Archive extension
|File name  |Object ID  |Object name  |
|---------|---------|---------|
|DataArchiveImplementation.codeunit.al      | 605         | “Data Archive Implementation”        |
|DataArchive.Table.al     | 600        | “Data Archive”        |
|DataArchiveTable.Table.al     | 601        | “Data Archive Table”        |
|DataArchiveManagement.Codeunit.al     | 602        | “Data Archive Management”        |
|DataArchiveDbSubscriber.codeunit.al     | 603        | “Data Archive DB Subscriber”        |
|DataArchiveList.Page.al     | 630        | “Data Archive List”        |
|DataArchiveTableList.Page.al     | 631        | “Data Archive Table List”       |
|DataArchiveTableListPart.Page.al     | 632        | “Data Archive Table ListPart”        |
|DataArchiveRecords.Page.al     | 633        | “Data Archive Records”        |
|DataArchiveExportToExcel.codeunit.al     | 608        | “Data Archive Export to Excel”        |
|DataArchiveExportToCsv.codeunit.al     | 609        | “Data Archive Export to Csv”        |

-->

## See Also
[]()