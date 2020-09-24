---
title: "Loading Partial Records"
description: Describes the partial records capability in Business Central
ms.author: jswymer
ms.custom: na
ms.date: 08/06/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Using Partial Records

[!INCLUDE[d365fin_long_md](../includes/2020_releasewave2.md)]

The partial records capability in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]  allows for loading a subset of normal table fields when accessing a SQL based data source. Using partial records improves performance of objects like reports and OData pages - objects whose source code loops through records. It's particularly beneficial when table extensions are used in the application.  

Accessing a data source from AL code is typically done by using the methods like GET, FIND, NEXT, and so on. Without using partial records, the runtime loads all normal fields when accessing the data source. Using the partial records API, you can now add code that loads only a selected set of fields.

## API Overview

To accommodate partial record loading, the following methods are available on both the RecordRef and Record data type in AL. These methods operate on the record instance that they're called on, changing the set of fields to load until otherwise altered. The methods are divided into two groups: methods that pertain to subsequent loads and methods that pertain to the currently loaded record.

**Subsequent load methods**

|Method|Description|See more|
|------|-----------|--------|
|SetLoadFields|Specifies a set of fields to be initially loaded when the record is retrieved from its data source. A call to this method will overwrite any fields that were previously set to load.|[Record.SetLoadFields](methods-auto/record/record-setloadfields-method.md)<br /><br />[RecordRef.SetLoadFields](methods-auto/recordref/recordref-setloadfields-method.md)|
|AddLoadFields|Adds fields to the current set of fields to be initially loaded when the record is retrieved from its data source. Subsequent calls to this method won't overwrite fields that were previously selected for loading.|[Record.AddLoadFields](methods-auto/record/record-addloadfields-method.md)<br /><br />[RecordRef.AddLoadFields](methods-auto/recordref/recordref-addloadfields-method.md)|

**Current load methods**

|Method|Description|See more|
|------|-----------|--------|
|AreFieldsLoaded|Checks whether the specified fields are all initially loaded.|[Record.AreFieldsLoaded](methods-auto/record/record-arefieldsloaded-method.md)<br /><br />[RecordRef.AreFieldsLoaded](methods-auto/recordref/recordref-arefieldsloaded-method.md)|
|LoadFields|Accesses the table's corresponding data source to load the specified fields.|[Record.LoadFields](methods-auto/record/record-loadfields-method.md)<br /><br />[RecordRef.LoadFields](methods-auto/recordref/recordref-loadfields-method.md)|

## Example

The following code shows a way to load only a single field from the **Item** table for computing the arithmetic mean.

```
procedure ComputeArithmeticMean(): Decimal;
var
    item: Record Item;
    acc: Decimal;
    cou: Integer;
begin
    item.SetLoadFields(item."Standard Cost");
    if (item.FindSet()) then begin
        repeat
            acc += item."Standard Cost";
            cou += 1;
        until (item.Next = 0)
    end;

    exit(acc / cou);
end;
```

Notice that the call to SetLoadFields occurs before the data fetching operations. This call determines which fields are needed for the FindSet call. You use the same pattern for AddLoadFields calls.

## Usage guidelines

This feature gives you the ability to limit the fields that load for a record to only those fields that are necessary. In general, loading fewer fields will make operations faster. But the most significant performance gains can be seen with table extensions - by not loading unnecessary fields in table extensions. Table extensions that don't have any fields for loading won't be part of the data join, which saves time.

<!--
The main goal of the feature is to provide the ability to limit the number of fields that are necessary to load. In general, loading fewer fields will make operations more performant. But the most significant performance gain  gain more importantly, limiting the set of fields needed to not load any fields from other table extensions is where the majority gain will be seen. Some of the performance issues that customers have observed with many table extensions on a base table will go away with this optimization.
-->

> [!TIP]
> Testing on the example code above showed that the execution time for loading only the "Standard Cost" field was nine times faster than loading all normal fields. Your performance numbers will vary depending on the machine and the setup with the SQL database.

For performance reasons, it's not recommended to use partial records on a record that will do inserts, deletes, or copies to temporary records. All these operations require that the record is fully loaded out. So you lose the performance gains of loading fewer. For this reason, the feature is especially advantageous in reading-based scenarios.

## Reports and OData pages

Currently, the platform uses partial records when fetching data for reports and calling pages through OData.

For reports, the fields that are selected for loading are fields set up as columns in the report data set. If a report accesses a field that isn't in the data set, it's beneficial to do one of the following to avoid just-in-time (JIT) loading:

- Add the field as a column in the data set.
- Add the field on the [OnPreDataItem trigger](/triggers/devenv-onpredataitem-trigger.md).

    The following example code snippet illustrates how to use the AddLoadFields method on a report's OnPreDataItem trigger add a field for loading:
    
    ```
    trigger OnPreDataItem()
    begin
        CurrencyDataItem.AddLoadFields(CurrencyDataItem."ISO Numeric Code");
    end;
    
    trigger OnAfterGetRecord()
    begin
        if (CurrencyDataItem."ISO Numeric Code" <> 'DKK') then
        begin
            CurrReport.Skip();
        end;
    end;
    ```

The same issue arises for API pages called through OData. If a field isn't requested for the OData output, it won't be loaded. In this case, it's beneficial to add the fields using the AddLoadFields method in the OnOpenPage trigger.

## Just-in-time (JIT) loading

When a record is loaded as a partial record, the obvious question is: What happens when accessing a field that hasn't been selected for loading?". The answer is JIT loading. The platform, in this case, does an implicit GET on the record and loads out the missing field.

When JIT loading occurs, another access to the data source is required. These operations are generally fast because they're GET calls. GET calls can often be served by the servers data cache or become clustered index seeks on the database.

A JIT load may fail for multiple reasons, like:

- The record has been modified between the original load and the subsequent JIT load.
- The record has been deleted between the original load and the subsequent JIT load.
- The record has been renamed between the original load and the subsequent JIT load.

## Iterating over records

When iterating over records in the database, an enumerator is created based on selected fields and a row is fetched when NEXT is called. This behavior is an optimization that allows for large parts of the operation to be done only once.

Certain operations will invalidate the enumerator and force the creation of a new one, which adds some overhead. As long as the enumerator isn't invalidated too frequently, this model is an effective optimization. When accessing fields that aren't loaded, the platform does a JIT load, followed by an update of the enumerator. This process eliminates the need to trigger a JIT load on subsequent iterations.

When passing a Record by value, without using a VAR, a new copy of the record is created. The original record and its copy don't share filters, fields selected for load, and so on. So accessing an unloaded field will trigger a JIT load. But it won't update the enumerator, which means future iterations will also require JIT load.

There are a few options to remedy this situation:

- Pass the record reference using VAR parameter allows for updating of enumerator.
- Call ADDLOADFIELDS(fieldnames) on the original record before passing by value.
- Before calling FIND, GET, NEXT, and so on, use the SETLOADFIELDS(fieldnames) to set all fields needed for load.

## See Also

[FAQ for Partial Records](devenv-partial-records.md)  
[Performance Articles For Developers](../performance/performance-developer.md)  
[Get, Find, and Next Methods](devenv-get-find-and-next-methods.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md)  