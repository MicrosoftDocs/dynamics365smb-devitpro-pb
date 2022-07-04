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

# Table, Table Fields, and Table Extension Properties

This topic lists properties that apply to the [table object](../devenv-table-object.md), table fields, and [table extension object](../devenv-table-ext-object.md).

## Object Properties

The following properties all apply to the Table object, only some of these properties can be set for a Table extension object as specified below. This list is sorted alphabetically by property name. For Table properties sorted by method on a Table, see [Properties](devenv-properties.md).

|**Property Name**|**Extensible**|**Applies to**|
|-----------|------------|----------|
|[Access Property](devenv-access-property.md)| | -Codeunit <br />  -Query <br />  -Table <br />  -Table Field <br />  -Enum Type <br />  -Interface <br />  -Permission Set <br /> |
|[AccessByPermission Property](devenv-accessbypermission-property.md)| | -Table Field <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page <br />  -Report <br /> |
|[AutoFormatExpression Property](devenv-autoformatexpression-property.md)| | -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[AutoFormatType Property](devenv-autoformattype-property.md)| | -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[AutoIncrement Property](devenv-autoincrement-property.md)| | -Table Field <br /> |
|[AutoReplace Property](devenv-autoreplace-property.md)| | -Xml Port Table Element <br /> |
|[AutoSave Property](devenv-autosave-property.md)| | -Xml Port Table Element <br /> |
|[AutoUpdate Property](devenv-autoupdate-property.md)| | -Xml Port Table Element <br /> |
|[BlankNumbers Property](devenv-blanknumbers-property.md)| | -Table Field <br />  -Page Field <br /> |
|[BlankZero Property](devenv-blankzero-property.md)| True| -Table Field <br />  -Page Field <br /> |
|[CalcFields Property](devenv-calcfields-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[CalcFormula Property](devenv-calcformula-property.md)| | -Table Field <br /> |
|[Caption Property](devenv-caption-property.md)| True| -Table <br />  -Table Field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[CaptionClass Property](devenv-captionclass-property.md)| True| -Table Field <br />  -Page Label <br />  -Page Field <br /> |
|[CaptionML Property](devenv-captionml-property.md)| True| -Table <br />  -Table Field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[CharAllowed Property](devenv-charallowed-property.md)| | -Table Field <br />  -Page Field <br /> |
|[ClosingDates Property](devenv-closingdates-property.md)| True| -Table Field <br />  -Page Field <br /> |
|[Clustered Property](devenv-clustered-property.md)| | -Table Key <br /> |
|[ColumnStoreIndex Property](devenv-columnstoreindex-property.md)| | -Table <br /> |
|[Compressed Property](devenv-compressed-property.md)| | -Table Field <br /> |
|[CompressionType Property](devenv-compressiontype-property.md)| | -Table <br /> |
|[DataCaptionFields Property](devenv-datacaptionfields-property.md)| True| -Table <br />  -Page <br />  -Request Page <br /> |
|[DataClassification Property](devenv-dataclassification-property.md)| | -Table <br />  -Table Field <br /> |
|[DataPerCompany Property](devenv-datapercompany-property.md)| | -Table <br /> |
|[DateFormula Property](devenv-dateformula-property.md)| | -Table Field <br />  -Page Field <br /> |
|[DecimalPlaces Property](devenv-decimalplaces-property.md)| | -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[Description Property](devenv-description-property.md)| True| -Codeunit <br />  -Table Field <br />  -Table Key <br />  -Page <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Area <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Query <br />  -Query Column <br />  -Query Data Item <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Table <br />  -Xml Port <br />  -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br />  -Profile <br /> |
|[DrillDownPageId Property](devenv-drilldownpageid-property.md)| True| -Table <br />  -Page Field <br /> |
|[Editable Property](devenv-editable-property.md)| | -Table Field <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Field <br />  -Page Group <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Part <br /> |
|[Enabled Property](devenv-enabled-property.md)| | -Table Field <br />  -Table Key <br />  -Page Label <br />  -Page Field <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Action Group <br />  -Profile <br /> |
|[ExtendedDatatype Property](devenv-extendeddatatype-property.md)| | -Table Field <br />  -Page Field <br /> |
|[Extensible Property](devenv-extensible-property.md)| | -Report <br />  -Enum Type <br />  -Table <br />  -Page <br /> |
|[ExternalAccess Property](devenv-externalaccess-property.md)| | -Table Field <br /> |
|[ExternalName Property](devenv-externalname-property.md)| | -Table <br />  -Table Field <br /> |
|[ExternalSchema Property](devenv-externalschema-property.md)| | -Table <br /> |
|[ExternalType Property](devenv-externaltype-property.md)| | -Table Field <br /> |
|[FieldClass Property](devenv-fieldclass-property.md)| | -Table Field <br /> |
|[IncludedFields Property](devenv-includedfields-property.md)| | -Table Key <br /> |
|[InitValue Property](devenv-initvalue-property.md)| | -Table Field <br /> |
|[LinkedInTransaction Property](devenv-linkedintransaction-property.md)| | -Table <br /> |
|[LinkedObject Property](devenv-linkedobject-property.md)| | -Table <br /> |
|[LinkFields Property](devenv-linkfields-property.md)| | -Xml Port Table Element <br /> |
|[LinkTable Property](devenv-linktable-property.md)| | -Xml Port Table Element <br /> |
|[LinkTableForceInsert Property](devenv-linktableforceinsert-property.md)| | -Xml Port Table Element <br /> |
|[LookupPageId Property](devenv-lookuppageid-property.md)| True| -Table <br />  -Page Field <br /> |
|[MaintainSiftIndex Property](devenv-maintainsiftindex-property.md)| | -Table Key <br /> |
|[MaintainSqlIndex Property](devenv-maintainsqlindex-property.md)| | -Table Key <br /> |
|[MaxOccurs Property](devenv-maxoccurs-property.md)| | -Xml Port Text Element <br />  -Xml Port Table Element <br />  -Xml Port Field Element <br /> |
|[MaxValue Property](devenv-maxvalue-property.md)| | -Table Field <br />  -Page Field <br /> |
|[MinOccurs Property](devenv-minoccurs-property.md)| | -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br /> |
|[MinValue Property](devenv-minvalue-property.md)| | -Table Field <br />  -Page Field <br /> |
|[NamespacePrefix Property](devenv-namespaceprefix-property.md)| | -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br /> |
|[NotBlank Property](devenv-notblank-property.md)| | -Table Field <br />  -Page Field <br /> |
|[Numeric Property](devenv-numeric-property.md)| | -Table Field <br />  -Page Field <br /> |
|[ObsoleteReason Property](devenv-obsoletereason-property.md)| | -Page Action Ref <br />  -Table Field <br />  -Table <br />  -Table Key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Area <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteState Property](devenv-obsoletestate-property.md)| | -Page Action Ref <br />  -Table Field <br />  -Table <br />  -Table Key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Area <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteTag Property](devenv-obsoletetag-property.md)| | -Page Action Ref <br />  -Table Field <br />  -Table <br />  -Table Key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Area <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[OptionCaption Property](devenv-optioncaption-property.md)| True| -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[OptionCaptionML Property](devenv-optioncaptionml-property.md)| True| -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[OptionMembers Property](devenv-optionmembers-property.md)| | -Table Field <br />  -Report Column <br /> |
|[OptionOrdinalValues Property](devenv-optionordinalvalues-property.md)| | -Table Field <br /> |
|[PasteIsValid Property](devenv-pasteisvalid-property.md)| | -Table <br /> |
|[Permissions Property](devenv-permissions-property.md)| | -Codeunit <br />  -Table <br />  -Request Page <br />  -Page <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Permission Set <br />  -Permission Set Extension <br /> |
|[ReplicateData Property](devenv-replicatedata-property.md)| | -Table <br /> |
|[RequestFilterFields Property](devenv-requestfilterfields-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[RequestFilterHeading Property](devenv-requestfilterheading-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[RequestFilterHeadingML Property](devenv-requestfilterheadingml-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[Scope Property](devenv-scope-property.md)| | -Table <br />  -Page Action <br /> |
|[SignDisplacement Property](devenv-signdisplacement-property.md)| | -Table Field <br />  -Page Field <br /> |
|[SourceTableView Property](devenv-sourcetableview-property.md)| | -Page <br />  -Request Page <br />  -Xml Port Table Element <br /> |
|[SqlDataType Property](devenv-sqldatatype-property.md)| | -Table Field <br /> |
|[SqlIndex Property](devenv-sqlindex-property.md)| | -Table Key <br /> |
|[SqlTimestamp Property](devenv-sqltimestamp-property.md)| | -Table Field <br /> |
|[Subtype Property](devenv-subtype-property.md)| | -Codeunit <br />  -Table Field <br /> |
|[SumIndexFields Property](devenv-sumindexfields-property.md)| | -Table Key <br /> |
|[TableRelation Property](devenv-tablerelation-property.md)| True| -Table Field <br />  -Page Field <br /> |
|[TableType Property](devenv-tabletype-property.md)| | -Table <br /> |
|[TestTableRelation Property](devenv-testtablerelation-property.md)| | -Table Field <br /> |
|[Unbound Property](devenv-unbound-property.md)| | -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br /> |
|[Unique Property](devenv-unique-property.md)| | -Table Key <br /> |
|[UseTemporary Property](devenv-usetemporary-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[ValidateTableRelation Property](devenv-validatetablerelation-property.md)| | -Table Field <br /> |
|[ValuesAllowed Property](devenv-valuesallowed-property.md)| | -Table Field <br />  -Page Field <br /> |
|[Width Property](devenv-width-property.md)| True| -Table Field <br />  -Page Field <br />  -Page Label <br />  -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br /> |
|[XmlName Property](devenv-xmlname-property.md)| | -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br /> |


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  