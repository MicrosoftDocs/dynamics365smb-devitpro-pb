---
title: "Table Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Table Data Type



The following methods are available on instances of the Table data type.

|Method name|Description|
|-----------|-----------|
|[FindFirst()](table-findfirst-method.md)|Finds the first record in a table based on the current key and filter.|
|[FindLast()](table-findlast-method.md)|Finds the last record in a table based on the current key and filter.|
|[FindSet([Boolean], [Boolean])](table-findset-method.md)|Finds a set of records in a table based on the current key and filter.|
|[Get([Any,...])](table-get-method.md)|Gets a record based on values stored in primary key fields.|
|[Find([String])](table-find-method.md)|Finds a record in a table that is based on the values stored in keys.|
|[Next([Integer])](table-next-method.md)|Steps through a specified number of records and retrieves a record.|
|[Reset()](table-reset-method.md)|Removes all filters, including any special filters set by MARKEDONLY, and changes the current key to the primary key. Also removes any marks on the record and clears any AL variables on the record.|
|[SetCurrentKey(Any, [Any,...])](table-setcurrentkey-method.md)|Selects a key for a table.|
|[Ascending([Boolean])](table-ascending-method.md)|Gets or sets the order in which the system searches through a table.|
|[SetAscending(Any, Boolean)](table-setascending-method.md)|Sets the sort order for the records returned. Use this function after you have set the keys to sort after, using SETCURRENTKEY. The default sort order is ascending. You can use SETASCENDING to change the sort order to descending for a specific field, while the other fields in the specified key are sorted in ascending order.|
|[GetAscending(Any)](table-getascending-method.md)|Gets the sort order for the records returned. You can use GETASCENDING to identify the sort order of the specified field because fields can be sorted in ascending or descending order. For example, you can read data from an ODATA web service where the data is sorted in ascending order on the Name field but in descending order on the City field.|
|[LockTable([Boolean], [Boolean])](table-locktable-method.md)|Locks a table to protect it from write transactions that conflict with each other.|
|[CalcFields(Any, [Any,...])](table-calcfields-method.md)|Calculates the FlowFields in a record. You specify which fields to calculate by using parameters.|
|[CalcSums(Any, [Any,...])](table-calcsums-method.md)|Calculates the total of a column in a table. You specify which fields to calculate by using parameters.|
|[SetAutoCalcFields([Any,...])](table-setautocalcfields-method.md)|Sets the FlowFields that you specify to be automatically calculated when the record is retrieved from the database.|
|[Count()](table-count-method.md)|Counts the number of records in a table.|
|[IsEmpty()](table-isempty-method.md)|Determines whether a table or a filtered set of records is empty.|
|[CountApprox()](table-countapprox-method.md)||
|[TableName()](table-tablename-method.md)|Gets the name of a table.|
|[TableCaption()](table-tablecaption-method.md)|Gets the current caption of a table as a string.|
|[ChangeCompany([String])](table-changecompany-method.md)|Redirects references to table data from one company to another.|
|[CurrentKey()](table-currentkey-method.md)|Gets the current key of a database table.|
|[Consistent(Boolean)](table-consistent-method.md)|Marks a table as being consistent or inconsistent.|
|[GetPosition([Boolean])](table-getposition-method.md)|Gets a string that contains the primary key of the current record.|
|[SetPosition(String)](table-setposition-method.md)|Sets the fields in a primary key on a record to the values specified in the supplied string. The remaining fields are not changed.|
|[Init()](table-init-method.md)|Initializes a record in a table.|
|[Insert([Boolean])](table-insert-method.md)|Inserts a record into a table.|
|[Modify([Boolean])](table-modify-method.md)|Modifies a record in a table.|
|[Delete([Boolean])](table-delete-method.md)|Deletes a record in a table.|
|[Rename(Any, [Any,...])](table-rename-method.md)|Changes the value of a primary key in a table.|
|[ModifyAll(Any, Any, [Boolean])](table-modifyall-method.md)|Modifies a field in all records within a range that you specify.|
|[DeleteAll([Boolean])](table-deleteall-method.md)|Deletes all records in a table that fall within a specified range.|
|[ReadPermission()](table-readpermission-method.md)|Determines whether a user is granted read permission to the table that contains a record. This function can test for both full read permission and partial read permission that has been granted with a security filter.|
|[WritePermission()](table-writepermission-method.md)|Determines whether a user can write to a table. This function can test for both full write permission and partial write permission that has been granted with a security filter. A write permission consists of Insert, Delete, and Modify permissions.|
|[ReadConsistency()](table-readconsistency-method.md)||
|[RecordLevelLocking()](table-recordlevellocking-method.md)||
|[Copy(var Table, [Boolean])](table-copy-method.md)|Copies a specified record, filters, marks, and keys that are associated with the record from a table or creates a reference to a record.|
|[AddLink(String, [String])](table-addlink-method.md)|Adds a link to a record.|
|[DeleteLink(Integer)](table-deletelink-method.md)|Deletes a specified link from a record in a table.|
|[DeleteLinks()](table-deletelinks-method.md)|Deletes all of the links that have been added to a record.|
|[CopyLinks(var Table)](table-copylinks-method.md)|Copies all the links from a specified record.|
|[HasLinks()](table-haslinks-method.md)|Determines whether a record contains any links.|
|[SetRange(Any, [Any], [Any])](table-setrange-method.md)|Sets a simple filter, such as a single range or a single value, on a field.|
|[SetFilter(Any, String, [Any,...])](table-setfilter-method.md)|Assigns a filter to a field that you specify.|
|[GetFilter(Any)](table-getfilter-method.md)|Gets a list of the filters within the current filter group that are applied to a field.|
|[GetFilters()](table-getfilters-method.md)|Gets a string that contains a list of the filters within the current filter group for all fields in a record. In addition, this function also returns the state of the MARKEDONLY function (Record).|
|[GetView([Boolean])](table-getview-method.md)|Gets a string that describes the current sort order, key, and filters on a table.|
|[SetView(String)](table-setview-method.md)|Sets the current sort order, key, and filters on a table.|
|[GetRangeMin(Any)](table-getrangemin-method.md)|Gets the minimum value in a range for a field.|
|[GetRangeMax(Any)](table-getrangemax-method.md)|Gets the maximum value in a range for a field.|
|[CopyFilter(Any, Any)](table-copyfilter-method.md)|Copies the filter that has been set for one field and applies it to another field.|
|[CopyFilters(var Table)](table-copyfilters-method.md)|Copies all the filters set by the SETFILTER function (Record) or the SETRANGE function (Record) from one record to another.|
|[HasFilter()](table-hasfilter-method.md)|Determines whether a filter is attached to a record within the current filter group.|
|[SetRecFilter()](table-setrecfilter-method.md)|Sets the values in the current key of the current record as a record filter.|
|[FilterGroup([Integer])](table-filtergroup-method.md)|Gets or sets the filter group that is applied to a table.|
|[SetPermissionFilter()](table-setpermissionfilter-method.md)||
|[Mark([Boolean])](table-mark-method.md)|Marks a record. You can also use this function to determine whether a record is marked.|
|[ClearMarks()](table-clearmarks-method.md)|Removes all the marks from a record.|
|[MarkedOnly([Boolean])](table-markedonly-method.md)|Activates a special filter. After you use this function, your view of the table includes only records marked by this function.|
|[Validate(Any, [Any])](table-validate-method.md)|Calls the OnValidate trigger for the field that you specify.|
|[TestField(Any)](table-testfield-joker-method.md)|Tests whether the contents of a field match a given value.|
|[TestField(Any, Boolean)](table-testfield-joker-boolean-method.md)|Tests whether the contents of a field match a given value.|
|[TestField(Any, Integer)](table-testfield-joker-integer-method.md)|Tests whether the contents of a field match a given value.|
|[TestField(Any, BigInteger)](table-testfield-joker-biginteger-method.md)|Tests whether the contents of a field match a given value.|
|[TestField(Any, Decimal)](table-testfield-joker-decimal-method.md)|Tests whether the contents of a field match a given value.|
|[TestField(Any, Guid)](table-testfield-joker-guid-method.md)|Tests whether the contents of a field match a given value.|
|[TestField(Any, Text)](table-testfield-joker-text-method.md)|Tests whether the contents of a field match a given value.|
|[TestField(Any, Code)](table-testfield-joker-code-method.md)|Tests whether the contents of a field match a given value.|
|[TestField(Any, String)](table-testfield-joker-string-method.md)|Tests whether the contents of a field match a given value.|
|[TestField(Any, Any)](table-testfield-joker-joker-method.md)|Tests whether the contents of a field match a given value.|
|[FieldError(Any, [String])](table-fielderror-method.md)|Stops the execution of the code causing a run-time error, and creates an error message for a field.|
|[TransferFields(var Table, [Boolean])](table-transferfields-method.md)|Copies all matching fields in one record to another record.|
|[FieldName(Any)](table-fieldname-method.md)|Gets the name of a field as a string.|
|[FieldCaption(Any)](table-fieldcaption-method.md)|Gets the current caption of the specified field as a string.|
|[FieldActive(Any)](table-fieldactive-method.md)|Checks whether a field is enabled.|
|[FieldNo(Any)](table-fieldno-method.md)|Gets the number assigned to a field in the table description.|
|[Relation(Any)](table-relation-method.md)|Determines the table relationship of a given field.|
|[SecurityFiltering([SecurityFilter])](table-securityfiltering-method.md)||
|[RecordId()](table-recordid-method.md)||
|[IsTemporary()](table-istemporary-method.md)|Determines whether a record refers to a temporary table.|
|[CurrentCompany()](table-currentcompany-method.md)|Gets the current company of a database table record.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  