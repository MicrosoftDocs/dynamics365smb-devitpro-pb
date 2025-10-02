---
title: "RecordRef data type"
description: "References a record in a table."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef data type
> **Version**: _Available or changed with runtime version 1.0._

References a record in a table.



## Instance methods
The following methods are available on instances of the RecordRef data type.

|Method name|Description|
|-----------|-----------|
|[AddLink(Text [, Text])](recordref-addlink-method.md)|Adds a link to a record in a table.|
|[AddLoadFields([Integer,...])](recordref-addloadfields-method.md)|Specifies additional fields to be initially loaded when the record is retrieved from its data source. Subsequent calls to AddLoadFields will not overwrite fields already selected for the initial load.|
|[AreFieldsLoaded(Integer,...)](recordref-arefieldsloaded-method.md)|Checks whether the specified fields are all initially loaded.|
|[Ascending([Boolean])](recordref-ascending-method.md)|Changes or checks the order in which a search through the table that is referred to by RecordRef will be performed.|
|[Caption()](recordref-caption-method.md)|Gets the caption of the table that is currently selected. Returns an error if no table is selected.|
|[ChangeCompany([Text])](recordref-changecompany-method.md)|Redirects references to table data from one company to another.|
|[ClearMarks()](recordref-clearmarks-method.md)|Removes all the marks from a record.|
|[Close()](recordref-close-method.md)|Closes the current page or table.|
|[Copy(var Record [, Boolean])](recordref-copy-table-boolean-method.md)|Copies a specified record's filters, views, automatically calculated FlowFields, marks, fields, and keys that are associated with the record from a table or creates a reference to a record.|
|[Copy(RecordRef [, Boolean])](recordref-copy-recordref-boolean-method.md)|Copies a specified record referece's filters, views, automatically calculated FlowFields, marks, fields, and keys that are associated with the record from a table or creates a reference to a record.|
|[CopyLinks(Record)](recordref-copylinks-table-method.md)|Copies all the links from a particular record.|
|[CopyLinks(RecordRef)](recordref-copylinks-recordref-method.md)|Copies all the links from a particular record.|
|[CopyLinks(Variant)](recordref-copylinks-variant-method.md)|Copies all the links from a particular record.|
|[Count()](recordref-count-method.md)|Counts the number of records that are in the filters that are currently applied to the table referred to by the RecordRef.|
|[CountApprox()](recordref-countapprox-method.md)|Gets an approximate count of the number of records in the table|
|[CurrentCompany()](recordref-currentcompany-method.md)|Gets the current company of a database table referred to by a RecordRef.|
|[CurrentKey()](recordref-currentkey-method.md)|Gets the current key of the table referred to by the RecordRef. The current key is returned as a string.|
|[CurrentKeyIndex([Integer])](recordref-currentkeyindex-method.md)|Gets or sets the current key of the table referred to by the RecordRef. The current key is set or returned as a number. This first key = 1, and so on. If RecordRef does not have an active record, CURRENTKEYINDEX will return -1. If this value is then passed to KEYINDEX, an index out of bounds error will occur. Therefore it is important to implement a check of the RecordRef parameter.|
|[Delete([Boolean])](recordref-delete-method.md)|Deletes a record in a table.|
|[DeleteAll([Boolean])](recordref-deleteall-method.md)|Deletes all records in a table that fall within a specified range.|
|[DeleteLink(Integer)](recordref-deletelink-method.md)|Deletes a specified link from a record in a table.|
|[DeleteLinks()](recordref-deletelinks-method.md)|Deletes all of the links that have been added to a record.|
|[Duplicate()](recordref-duplicate-method.md)|Duplicates the table that contains the RecordRef.|
|[Field(Integer)](recordref-field-integer-method.md)|Gets a FieldRef for the field that has the number FieldNo in the table that is currently selected. If no field has this number, the method returns an error.|
|[Field(Text)](recordref-field-string-method.md)|Gets a FieldRef for the field that has the name FieldName in the table that is currently selected. If no field has this name, the method returns an error.|
|[FieldCount()](recordref-fieldcount-method.md)|Gets the number of fields in the table that is currently selected or returns the number of fields that have been defined in a key. Returns an error if no table or no key is selected.|
|[FieldExist(Integer)](recordref-fieldexist-integer-method.md)|Determines if the field that has the number FieldNo exists in the table that is referred to by the RecordRef. Returns an error if no table is currently selected.|
|[FieldExist(Text)](recordref-fieldexist-string-method.md)|Determines if the field that has the name FieldName exists in the table that is referred to by the RecordRef. Returns an error if no table is currently selected.|
|[FieldIndex(Integer)](recordref-fieldindex-method.md)|Gets the FieldRef of the field that has the specified index in the table that is referred to by the RecordRef.|
|[FilterGroup([Integer])](recordref-filtergroup-method.md)|Changes the filter group that is being applied to the table. You can also use this method to return the number of the current filtergroup. You cannot return the number of the filtergroup and set a new filtergroup at the same time.|
|[Find([Text])](recordref-find-method.md)|Finds a record in a table based on the values stored in the key fields.|
|[FindFirst()](recordref-findfirst-method.md)|Finds the first record in a table based on the current key and filter.|
|[FindLast()](recordref-findlast-method.md)|Finds the last record in a table based on the current key and filter.|
|[FindSet([Boolean])](recordref-findset-boolean-method.md)|Finds a set of records in a table based on the current key and filter. FINDSET can only retrieve records in ascending order.|
|[FindSet(Boolean, Boolean)](recordref-findset-boolean-boolean-method.md)|Finds a set of records in a table based on the current key and filter. FindSet can only retrieve records in ascending order.|
|[Get(RecordId)](recordref-get-method.md)|Gets a record based on the ID of the record.|
|[GetBySystemId(Guid)](recordref-getbysystemid-method.md)|Gets a record based on the ID of the record. The RecordRef must already be opened.|
|[GetFilters()](recordref-getfilters-method.md)|Determines which filters have been applied to the table referred to by the RecordRef.|
|[GetPosition([Boolean])](recordref-getposition-method.md)|Gets a string that contains the primary key of the current record.|
|[GetTable(Record)](recordref-gettable-method.md)|Gets the table of a Record variable and causes the RecordRef to refer to the same table.|
|[GetView([Boolean])](recordref-getview-method.md)|Returns a string that describes the current sort order, key, and filters on a table.|
|[HasFilter()](recordref-hasfilter-method.md)|Determines whether a filter has been applied to the table that the RecordRef refers to.|
|[HasLinks()](recordref-haslinks-method.md)|Determines whether a record contains any links.|
|[Init()](recordref-init-method.md)|Initializes a record in a table.|
|[Insert()](recordref-insert--method.md)|Inserts a record into a table without executing the code in the OnInsert trigger.|
|[Insert(Boolean)](recordref-insert-boolean-method.md)|Inserts a record into a table.|
|[Insert(Boolean, Boolean)](recordref-insert-boolean-boolean-method.md)|Inserts a record into a table.|
|[IsDirty()](recordref-isdirty-method.md)|Gets a boolean value that indicates whether the current in-memory instance of a record or filtered set of records has changed since being retrieved from the database.|
|[IsEmpty()](recordref-isempty-method.md)|Determines whether any records exist in a filtered set of records in a table.|
|[IsTemporary()](recordref-istemporary-method.md)|Determines whether a RecordRef refers to a temporary table.|
|[KeyCount()](recordref-keycount-method.md)|Gets the number of keys that exist in the table that is referred to by the RecordRef. Returns an error if no table is selected.|
|[KeyIndex(Integer)](recordref-keyindex-method.md)|Gets the KeyRef of the key that has the index specified in the table that is currently selected. The key can be composed of fields of any supported data type. Data types that are not supported include BLOBs, FlowFilters, variables, and functions. If the sorting key is set to a field that is not part of a key, then the KEYINDEX is -1.|
|[LoadFields(Integer,...)](recordref-loadfields-method.md)|Accesses the table's corresponding data source and loads the values of the specified fields on the record.|
|[LockTable([Boolean] [, Boolean])](recordref-locktable-method.md)|Starts locking on a table to protect it from write transactions that conflict with each other.|
|[Mark([Boolean])](recordref-mark-method.md)|Marks a record. You can also use this method to determine whether a record is marked.|
|[MarkedOnly([Boolean])](recordref-markedonly-method.md)|Activates a special filter. After you use this function, your view of the table includes only records marked by the Mark method (RecordRef).|
|[Modify([Boolean])](recordref-modify-method.md)|Modifies a record in a table.|
|[Name()](recordref-name-method.md)|Identifies the name of the table|
|[Next([Integer])](recordref-next-method.md)|Steps through a specified number of records and retrieves a record.|
|[Number()](recordref-number-method.md)|Gets the table ID (number) of the table that contains the record that was referred to by the RecordRef.|
|[Open(Integer [, Boolean] [, Text])](recordref-open-method.md)|Causes a RecordRef variable to refer to a table, which is identified by its number in a particular company.|
|[ReadConsistency()](recordref-readconsistency-method.md)|Gets a value indicating whether read consistency is enabled.|
|[ReadIsolation([IsolationLevel])](recordref-readisolation-method.md)|Gets or sets the read isolation level.|
|[ReadPermission()](recordref-readpermission-method.md)|Determines if you can read from a table.|
|[RecordId()](recordref-recordid-method.md)|Gets the RecordID of the record that is currently selected in the table. If no table is selected, an error is generated.|
|[RecordLevelLocking()](recordref-recordlevellocking-method.md)|Gets a value indicating whether record level locking is enabled.|
|[Rename(Any [, Any,...])](recordref-rename-method.md)|Changes the value of a primary key in a table.|
|[Reset()](recordref-reset-method.md)|Removes all filters, including any special filters set by the MarkedOnly method (Record), changes fields select for loading back to all, sets the read isolation level to the default value, and changes the current key to the primary key. Also removes any marks on the record and clears any AL variables defined on its table definition.|
|[SecurityFiltering([SecurityFilter])](recordref-securityfiltering-method.md)|Gets or sets how security filters are applied to the RecordRef.|
|[SetAutoCalcFields([Integer,...])](recordref-setautocalcfields-method.md)|Sets the FlowFields that you specify to be automatically calculated when the RecordRef is retrieved from the database.|
|[SetLoadFields([Integer,...])](recordref-setloadfields-method.md)|Sets the fields to be initially loaded when the record is retrieved from its data source. This will overwrite fields previously selected for initial load.|
|[SetPermissionFilter()](recordref-setpermissionfilter-method.md)|Applies the user's security filter to the referenced record. The security filter is combined with any other filters that are placed on the record with SetFilter or SetRange. The combined filter will not include any records outside the range of the security filter and this will prevent a runtime permission error from occuring when the record is read. If the permission filter is not set, an error can occur if you attempt to read a record that is outside the range of the user's security filter.|
|[SetPosition(Text)](recordref-setposition-method.md)|Sets the fields in a primary key on a record to the values specified in the String parameter. The remaining fields are not changed.|
|[SetRecFilter()](recordref-setrecfilter-method.md)|Sets a filter on a record that is referred to by a RecordRef.|
|[SetTable(Record)](recordref-settable-table-method.md)|Sets the table to which a Record variable refers as the same table as a RecordRef variable.|
|[SetTable(Record, Boolean)](recordref-settable-table-boolean-method.md)|Sets the table to which a Record variable refers as the same table as a RecordRef variable.|
|[SetView(Text)](recordref-setview-method.md)|Sets the current sort order, key, and filters on a table.|
|[SystemCreatedAtNo()](recordref-systemcreatedatno-method.md)|Gets the field number that is used by the SystemCreatedAt field. The SystemCreatedAt field is a system field that the platform adds to all table objects.|
|[SystemCreatedByNo()](recordref-systemcreatedbyno-method.md)|Gets the field number that is used by the SystemCreatedBy field. The SystemCreatedBy field is a system field that the platform adds to all table objects.|
|[SystemIdNo()](recordref-systemidno-method.md)|Gets the field number that is used by the SystemId field. The SystemId field is a system field that the platform adds to all table objects.|
|[SystemModifiedAtNo()](recordref-systemmodifiedatno-method.md)|Gets the field number that is used by the SystemModifiedAt field. The SystemModifiedAt field is a system field that the platform adds to all table objects.|
|[SystemModifiedByNo()](recordref-systemmodifiedbyno-method.md)|Gets the field number that is used by the SystemModifiedBy field. The SystemModifiedBy field is a system field that the platform adds to all table objects.|
|[Truncate([Boolean])](recordref-truncate-method.md)|Deletes all records in a table that fall within a specified range, in an efficient maner.<br>Keep in mind that Truncate allows for less concurrency than DeleteAll, as the entire table will be locked until the transaction is committed.<br><br>Truncate with a filter should only be used when the majority of the table is being deleted, as otherwise DeleteAll will be more efficient.<br><br>Truncate is currently not supported in the following cases:<br>- Temporary tables, system tables, and tables of type other than Normal.<br>- When running within a try function.<br>- Tables that have a security filter applied.<br>- When the current filters contain flow fields, or use a high number of marked records.<br>- When the OnAfter/OnBefore events are subscribed for the table.<br>- Tables with media fields.<br><br>In this case, it is recommended to use DeleteAll instead. |
|[WritePermission()](recordref-writepermission-method.md)|Determines if you can write to a table.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
 
The `RecordRef` object can refer to any table in the database, if the extension target in [app.json](../../devenv-json-files.md#appjson-file) doesn't conflict with the field/table [scope](../../attributes/devenv-scope-attribute.md). Example, an extension with target `Cloud` can't use `RecordRef` to access a table with scope `OnPrem`.
Use the [Open method](recordref-open-method.md) to use the table number to select the table that you want to access, or use the [GetTable method](recordref-gettable-method.md) to use another record variable to select the table that you want to access.  
  
If one `RecordRef` variable is assigned to another `RecordRef` variable, then they both refer to the same table instance. 

## Related information  
[Get started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
