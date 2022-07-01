---
title: "Table, Table Fields, and Table Extension Properties"
description: "This topic lists properties that apply to the [table object](../devenv-table-object.md), table fields, and [table extension object](../devenv-table-ext-object.md)."
ms.author: solsen
ms.custom: na
ms.date: 07/01/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# table, table Fields, and table Extension Properties


This topic lists properties that apply to the [table object](../devenv-table-object.md), table fields, and [table extension object](../devenv-table-ext-object.md).

## Object Properties

The following properties all apply to the table object, only some of these properties can be set for a table extension object as specified below. This list is sorted alphabetically by property name. For table properties sorted by method on a table, see [table properties](devenv-properties.md).

|**Property Name**|**Extensible**|**Applies to**|
|-----------|------------|----------|
|Access| | -Codeunit
<br />  -Query
<br />  -Table
<br />  -Table Field
<br />  -Enum Type
<br />  -Interface
<br />  -Permission Set
<br /> |
|AccessByPermission| | -Table Field
<br />  -Page Field
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Chart Part
<br />  -Page Action
<br />  -Page
<br />  -Report
<br /> |
|AutoFormatExpression| | -Table Field
<br />  -Page Field
<br />  -Report Column
<br /> |
|AutoFormatType| | -Table Field
<br />  -Page Field
<br />  -Report Column
<br /> |
|AutoIncrement| | -Table Field
<br /> |
|AutoReplace| | -Xml Port Table Element
<br /> |
|AutoSave| | -Xml Port Table Element
<br /> |
|AutoUpdate| | -Xml Port Table Element
<br /> |
|BlankNumbers| | -Table Field
<br />  -Page Field
<br /> |
|BlankZero| True| -Table Field
<br />  -Page Field
<br /> |
|CalcFields| | -Xml Port Table Element
<br />  -Report Data Item
<br /> |
|CalcFormula| | -Table Field
<br /> |
|Caption| True| -Table
<br />  -Table Field
<br />  -Page Field
<br />  -Field Group
<br />  -Page
<br />  -Request Page
<br />  -Page Label
<br />  -Page Group
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Action
<br />  -Page Action Separator
<br />  -Page Action Group
<br />  -Xml Port
<br />  -Report
<br />  -Query
<br />  -Query Column
<br />  -Query Filter
<br />  -Report Column
<br />  -Enum Value
<br />  -Page View
<br />  -Report Layout
<br />  -Profile
<br />  -Enum Type
<br />  -Permission Set
<br /> |
|CaptionClass| True| -Table Field
<br />  -Page Label
<br />  -Page Field
<br /> |
|CaptionML| True| -Table
<br />  -Table Field
<br />  -Page Field
<br />  -Field Group
<br />  -Page
<br />  -Request Page
<br />  -Page Label
<br />  -Page Group
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Action
<br />  -Page Action Separator
<br />  -Page Action Group
<br />  -Xml Port
<br />  -Report
<br />  -Query
<br />  -Query Column
<br />  -Query Filter
<br />  -Report Column
<br />  -Enum Value
<br />  -Page View
<br />  -Report Layout
<br />  -Profile
<br />  -Enum Type
<br />  -Permission Set
<br /> |
|CharAllowed| | -Table Field
<br />  -Page Field
<br /> |
|ClosingDates| True| -Table Field
<br />  -Page Field
<br /> |
|Clustered| | -Table Key
<br /> |
|ColumnStoreIndex| | -Table
<br /> |
|Compressed| | -Table Field
<br /> |
|CompressionType| | -Table
<br /> |
|DataCaptionFields| True| -Table
<br />  -Page
<br />  -Request Page
<br /> |
|DataClassification| | -Table
<br />  -Table Field
<br /> |
|DataPerCompany| | -Table
<br /> |
|DateFormula| | -Table Field
<br />  -Page Field
<br /> |
|DecimalPlaces| | -Table Field
<br />  -Page Field
<br />  -Report Column
<br /> |
|Description| True| -Codeunit
<br />  -Table Field
<br />  -Table Key
<br />  -Page
<br />  -Page Action
<br />  -Page Action Area
<br />  -Page Action Group
<br />  -Page Area
<br />  -Page Field
<br />  -Page Group
<br />  -Page Label
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Chart Part
<br />  -Query
<br />  -Query Column
<br />  -Query Data Item
<br />  -Query Filter
<br />  -Report
<br />  -Report Data Item
<br />  -Report Column
<br />  -Request Page
<br />  -Table
<br />  -Xml Port
<br />  -Xml Port Text Element
<br />  -Xml Port Field Element
<br />  -Xml Port Table Element
<br />  -Xml Port Field Attribute
<br />  -Xml Port Text Attribute
<br />  -Profile
<br /> |
|DrillDownPageId| True| -Table
<br />  -Page Field
<br /> |
|Editable| | -Table Field
<br />  -Page
<br />  -Request Page
<br />  -Page Label
<br />  -Page Field
<br />  -Page Group
<br />  -Page System Part
<br />  -Page Chart Part
<br />  -Page Part
<br /> |
|Enabled| | -Table Field
<br />  -Table Key
<br />  -Page Label
<br />  -Page Field
<br />  -Page Group
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Chart Part
<br />  -Page Action
<br />  -Page Action Group
<br />  -Profile
<br /> |
|ExtendedDatatype| | -Table Field
<br />  -Page Field
<br /> |
|Extensible| | -Report
<br />  -Enum Type
<br />  -Table
<br />  -Page
<br /> |
|ExternalAccess| | -Table Field
<br /> |
|ExternalName| | -Table
<br />  -Table Field
<br /> |
|ExternalSchema| | -Table
<br /> |
|ExternalType| | -Table Field
<br /> |
|FieldClass| | -Table Field
<br /> |
|IncludedFields| | -Table Key
<br /> |
|InitValue| | -Table Field
<br /> |
|LinkedInTransaction| | -Table
<br /> |
|LinkedObject| | -Table
<br /> |
|LinkFields| | -Xml Port Table Element
<br /> |
|LinkTable| | -Xml Port Table Element
<br /> |
|LinkTableForceInsert| | -Xml Port Table Element
<br /> |
|LookupPageId| True| -Table
<br />  -Page Field
<br /> |
|MaintainSiftIndex| | -Table Key
<br /> |
|MaintainSqlIndex| | -Table Key
<br /> |
|MaxOccurs| | -Xml Port Text Element
<br />  -Xml Port Table Element
<br />  -Xml Port Field Element
<br /> |
|MaxValue| | -Table Field
<br />  -Page Field
<br /> |
|MinOccurs| | -Xml Port Text Element
<br />  -Xml Port Field Element
<br />  -Xml Port Table Element
<br /> |
|MinValue| | -Table Field
<br />  -Page Field
<br /> |
|NamespacePrefix| | -Xml Port Text Element
<br />  -Xml Port Field Element
<br />  -Xml Port Table Element
<br />  -Xml Port Field Attribute
<br />  -Xml Port Text Attribute
<br /> |
|NotBlank| | -Table Field
<br />  -Page Field
<br /> |
|Numeric| | -Table Field
<br />  -Page Field
<br /> |
|ObsoleteReason| | -Page Action Ref
<br />  -Table Field
<br />  -Table
<br />  -Table Key
<br />  -Codeunit
<br />  -Enum Type
<br />  -Enum Value
<br />  -Page Action
<br />  -Page Action Area
<br />  -Page Action Group
<br />  -Page Action Separator
<br />  -Page Area
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Chart Part
<br />  -Page Field
<br />  -Page Group
<br />  -Page Label
<br />  -Query
<br />  -Query Column
<br />  -Query Filter
<br />  -Report
<br />  -Report Data Item
<br />  -Report Column
<br />  -Request Page
<br />  -Xml Port
<br />  -Page
<br />  -Page View
<br />  -Profile
<br />  -Interface
<br />  -Control Add In
<br />  -Permission Set
<br />  -Field Group
<br /> |
|ObsoleteState| | -Page Action Ref
<br />  -Table Field
<br />  -Table
<br />  -Table Key
<br />  -Codeunit
<br />  -Enum Type
<br />  -Enum Value
<br />  -Page Action
<br />  -Page Action Area
<br />  -Page Action Group
<br />  -Page Action Separator
<br />  -Page Area
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Chart Part
<br />  -Page Field
<br />  -Page Group
<br />  -Page Label
<br />  -Query
<br />  -Query Column
<br />  -Query Filter
<br />  -Report
<br />  -Report Data Item
<br />  -Report Column
<br />  -Request Page
<br />  -Xml Port
<br />  -Page
<br />  -Page View
<br />  -Profile
<br />  -Interface
<br />  -Control Add In
<br />  -Permission Set
<br />  -Field Group
<br /> |
|ObsoleteTag| | -Page Action Ref
<br />  -Table Field
<br />  -Table
<br />  -Table Key
<br />  -Codeunit
<br />  -Enum Type
<br />  -Enum Value
<br />  -Page Action
<br />  -Page Action Area
<br />  -Page Action Group
<br />  -Page Action Separator
<br />  -Page Area
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Chart Part
<br />  -Page Field
<br />  -Page Group
<br />  -Page Label
<br />  -Query
<br />  -Query Column
<br />  -Query Filter
<br />  -Report
<br />  -Report Data Item
<br />  -Report Column
<br />  -Request Page
<br />  -Xml Port
<br />  -Page
<br />  -Page View
<br />  -Profile
<br />  -Interface
<br />  -Control Add In
<br />  -Permission Set
<br />  -Field Group
<br /> |
|OptionCaption| True| -Table Field
<br />  -Page Field
<br />  -Report Column
<br /> |
|OptionCaptionML| True| -Table Field
<br />  -Page Field
<br />  -Report Column
<br /> |
|OptionMembers| | -Table Field
<br />  -Report Column
<br /> |
|OptionOrdinalValues| | -Table Field
<br /> |
|PasteIsValid| | -Table
<br /> |
|Permissions| | -Codeunit
<br />  -Table
<br />  -Request Page
<br />  -Page
<br />  -Xml Port
<br />  -Report
<br />  -Query
<br />  -Permission Set
<br />  -Permission Set Extension
<br /> |
|ReplicateData| | -Table
<br /> |
|RequestFilterFields| | -Xml Port Table Element
<br />  -Report Data Item
<br /> |
|RequestFilterHeading| | -Xml Port Table Element
<br />  -Report Data Item
<br /> |
|RequestFilterHeadingML| | -Xml Port Table Element
<br />  -Report Data Item
<br /> |
|Scope| | -Table
<br />  -Page Action
<br /> |
|SignDisplacement| | -Table Field
<br />  -Page Field
<br /> |
|SourceTableView| | -Page
<br />  -Request Page
<br />  -Xml Port Table Element
<br /> |
|SqlDataType| | -Table Field
<br /> |
|SqlIndex| | -Table Key
<br /> |
|SqlTimestamp| | -Table Field
<br /> |
|Subtype| | -Codeunit
<br />  -Table Field
<br /> |
|SumIndexFields| | -Table Key
<br /> |
|TableRelation| True| -Table Field
<br />  -Page Field
<br /> |
|TableType| | -Table
<br /> |
|TestTableRelation| | -Table Field
<br /> |
|Unbound| | -Xml Port Text Element
<br />  -Xml Port Field Element
<br />  -Xml Port Table Element
<br />  -Xml Port Field Attribute
<br />  -Xml Port Text Attribute
<br /> |
|Unique| | -Table Key
<br /> |
|UseTemporary| | -Xml Port Table Element
<br />  -Report Data Item
<br /> |
|ValidateTableRelation| | -Table Field
<br /> |
|ValuesAllowed| | -Table Field
<br />  -Page Field
<br /> |
|Width| True| -Table Field
<br />  -Page Field
<br />  -Page Label
<br />  -Xml Port Text Element
<br />  -Xml Port Field Element
<br />  -Xml Port Table Element
<br />  -Xml Port Field Attribute
<br />  -Xml Port Text Attribute
<br /> |
|XmlName| | -Xml Port Text Element
<br />  -Xml Port Field Element
<br />  -Xml Port Table Element
<br />  -Xml Port Field Attribute
<br />  -Xml Port Text Attribute
<br /> |


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  