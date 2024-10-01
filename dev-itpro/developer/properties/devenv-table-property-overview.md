---
title: "Table, Table fields, and Table extension properties"
description: "This article lists properties that apply to the [table object](../devenv-table-object.md), table fields, and [table extension object](../devenv-table-ext-object.md)."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Table, Table Fields, and Table extension properties

This article lists properties that apply to the [table object](../devenv-table-object.md), table fields, and [table extension object](../devenv-table-ext-object.md).

## Object properties

The following properties all apply to the Table object, only some of these properties can be set for a Table extension object as specified below. This list is sorted alphabetically by property name. For Table properties sorted by method on a Table, see [Properties](devenv-properties.md).

|**Property name**|**Extensible**|**Applies to**|
|-----------|------------|----------|
|[Access property](devenv-access-property.md)| | -Codeunit <br />  -Query <br />  -Table <br />  -Table field <br />  -Enum Type <br />  -Interface <br />  -Permission Set <br /> |
|[AccessByPermission property](devenv-accessbypermission-property.md)| | -Table field <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Page <br />  -Report <br /> |
|[AllowInCustomizations property](devenv-allowincustomizations-property.md)| | -Table field <br /> |
|[AutoFormatExpression property](devenv-autoformatexpression-property.md)| | -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[AutoFormatType property](devenv-autoformattype-property.md)| | -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[AutoIncrement property](devenv-autoincrement-property.md)| | -Table field <br /> |
|[AutoReplace property](devenv-autoreplace-property.md)| | -Xml Port Table Element <br /> |
|[AutoSave property](devenv-autosave-property.md)| | -Xml Port Table Element <br /> |
|[AutoUpdate property](devenv-autoupdate-property.md)| | -Xml Port Table Element <br /> |
|[BlankNumbers property](devenv-blanknumbers-property.md)| | -Table field <br />  -Page Field <br /> |
|[BlankZero property](devenv-blankzero-property.md)| True| -Table field <br />  -Page Field <br /> |
|[CalcFields property](devenv-calcfields-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[CalcFormula property](devenv-calcformula-property.md)| | -Table field <br /> |
|[Caption property](devenv-caption-property.md)| True| -Table <br />  -Table field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[CaptionClass property](devenv-captionclass-property.md)| True| -Table field <br />  -Page Label <br />  -Page Field <br /> |
|[CaptionML property](devenv-captionml-property.md)| True| -Table <br />  -Table field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[CharAllowed property](devenv-charallowed-property.md)| | -Table field <br />  -Page Field <br /> |
|[ClosingDates property](devenv-closingdates-property.md)| True| -Table field <br />  -Page Field <br /> |
|[Clustered property](devenv-clustered-property.md)| | -Table key <br /> |
|[ColumnStoreIndex property](devenv-columnstoreindex-property.md)| | -Table <br /> |
|[Compressed property](devenv-compressed-property.md)| | -Table field <br /> |
|[CompressionType property](devenv-compressiontype-property.md)| | -Table <br /> |
|[DataCaptionFields property](devenv-datacaptionfields-property.md)| True| -Table <br />  -Page <br />  -Request Page <br /> |
|[DataPerCompany property](devenv-datapercompany-property.md)| | -Table <br /> |
|[DateFormula property](devenv-dateformula-property.md)| | -Table field <br />  -Page Field <br /> |
|[DecimalPlaces property](devenv-decimalplaces-property.md)| | -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[Description property](devenv-description-property.md)| True| -Codeunit <br />  -Table field <br />  -Table key <br />  -Page <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Area <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Query <br />  -Query Column <br />  -Query Data Item <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Table <br />  -Xml Port <br />  -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br />  -Profile <br /> |
|[DrillDownPageId property](devenv-drilldownpageid-property.md)| True| -Table <br />  -Page Field <br /> |
|[Editable property](devenv-editable-property.md)| | -Table field <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Field <br />  -Page Group <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Part <br /> |
|[Enabled property](devenv-enabled-property.md)| | -Table field <br />  -Table key <br />  -Page Label <br />  -Page Field <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Action Group <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Profile <br /> |
|[ExtendedDatatype property](devenv-extendeddatatype-property.md)| | -Table field <br />  -Page Field <br /> |
|[Extensible property](devenv-extensible-property.md)| | -Report <br />  -Enum Type <br />  -Table <br />  -Page <br /> |
|[ExternalAccess property](devenv-externalaccess-property.md)| | -Table field <br /> |
|[ExternalName property](devenv-externalname-property.md)| | -Table <br />  -Table field <br /> |
|[ExternalSchema property](devenv-externalschema-property.md)| | -Table <br /> |
|[ExternalType property](devenv-externaltype-property.md)| | -Table field <br /> |
|[FieldClass property](devenv-fieldclass-property.md)| | -Table field <br /> |
|[IncludedFields property](devenv-includedfields-property.md)| | -Table key <br /> |
|[InherentEntitlements property](devenv-inherententitlements-property.md)| | -Query <br />  -Report <br />  -Xml Port <br />  -Table <br />  -Codeunit <br />  -Page <br /> |
|[InherentPermissions property](devenv-inherentpermissions-property.md)| | -Query <br />  -Report <br />  -Xml Port <br />  -Table <br />  -Codeunit <br />  -Page <br /> |
|[InitValue property](devenv-initvalue-property.md)| | -Table field <br /> |
|[LinkedInTransaction property](devenv-linkedintransaction-property.md)| | -Table <br /> |
|[LinkedObject property](devenv-linkedobject-property.md)| | -Table <br /> |
|[LinkFields property](devenv-linkfields-property.md)| | -Xml Port Table Element <br /> |
|[LinkTable property](devenv-linktable-property.md)| | -Xml Port Table Element <br /> |
|[LinkTableForceInsert property](devenv-linktableforceinsert-property.md)| | -Xml Port Table Element <br /> |
|[LookupPageId property](devenv-lookuppageid-property.md)| True| -Table <br />  -Page Field <br /> |
|[MaintainSiftIndex property](devenv-maintainsiftindex-property.md)| | -Table key <br /> |
|[MaintainSqlIndex property](devenv-maintainsqlindex-property.md)| | -Table key <br /> |
|[MaxOccurs property](devenv-maxoccurs-property.md)| | -Xml Port Text Element <br />  -Xml Port Table Element <br />  -Xml Port Field Element <br /> |
|[MaxValue property](devenv-maxvalue-property.md)| | -Table field <br />  -Page Field <br /> |
|[MinOccurs property](devenv-minoccurs-property.md)| | -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br /> |
|[MinValue property](devenv-minvalue-property.md)| | -Table field <br />  -Page Field <br /> |
|[MovedFrom property](devenv-movedfrom-property.md)| | -Table <br />  -Table field <br /> |
|[MovedTo property](devenv-movedto-property.md)| | -Table <br />  -Table field <br /> |
|[NamespacePrefix property](devenv-namespaceprefix-property.md)| | -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br /> |
|[NotBlank property](devenv-notblank-property.md)| | -Table field <br />  -Page Field <br /> |
|[Numeric property](devenv-numeric-property.md)| | -Table field <br />  -Page Field <br /> |
|[ObsoleteReason property](devenv-obsoletereason-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Table <br />  -Table field <br />  -Table key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page Field <br />  -Page Action Area <br />  -Page Area <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteState property](devenv-obsoletestate-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Table <br />  -Table field <br />  -Table key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page Field <br />  -Page Action Area <br />  -Page Area <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteTag property](devenv-obsoletetag-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Table <br />  -Table field <br />  -Table key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page Field <br />  -Page Action Area <br />  -Page Area <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[OptimizeForTextSearch property](devenv-optimizefortextsearch-property.md)| | -Table field <br /> |
|[OptionCaption property](devenv-optioncaption-property.md)| True| -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[OptionCaptionML property](devenv-optioncaptionml-property.md)| True| -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[OptionOrdinalValues property](devenv-optionordinalvalues-property.md)| | -Table field <br /> |
|[PasteIsValid property](devenv-pasteisvalid-property.md)| | -Table <br /> |
|[Permissions property](devenv-permissions-property.md)| | -Codeunit <br />  -Table <br />  -Request Page <br />  -Page <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Permission Set <br />  -Permission Set Extension <br /> |
|[ReplicateData property](devenv-replicatedata-property.md)| | -Table <br /> |
|[RequestFilterFields property](devenv-requestfilterfields-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[RequestFilterHeading property](devenv-requestfilterheading-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[RequestFilterHeadingML property](devenv-requestfilterheadingml-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[SignDisplacement property](devenv-signdisplacement-property.md)| | -Table field <br />  -Page Field <br /> |
|[SqlDataType property](devenv-sqldatatype-property.md)| | -Table field <br /> |
|[SqlIndex property](devenv-sqlindex-property.md)| | -Table key <br /> |
|[SqlTimestamp property](devenv-sqltimestamp-property.md)| | -Table field <br /> |
|[SumIndexFields property](devenv-sumindexfields-property.md)| | -Table key <br /> |
|[TableRelation property](devenv-tablerelation-property.md)| True| -Table field <br />  -Page Field <br /> |
|[TableType property](devenv-tabletype-property.md)| | -Table <br /> |
|[TestTableRelation property](devenv-testtablerelation-property.md)| | -Table field <br /> |
|[ToolTip property](devenv-tooltip-property.md)| True| -Page Label <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action Area <br />  -Page Action <br />  -Page Action Group <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Query Column <br />  -Table field <br /> |
|[ToolTipML property](devenv-tooltipml-property.md)| True| -Page Label <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action Area <br />  -Page Action <br />  -Page Action Group <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Query Column <br />  -Table field <br /> |
|[Unbound property](devenv-unbound-property.md)| | -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br /> |
|[Unique property](devenv-unique-property.md)| | -Table key <br /> |
|[ValidateTableRelation property](devenv-validatetablerelation-property.md)| | -Table field <br /> |
|[ValuesAllowed property](devenv-valuesallowed-property.md)| | -Table field <br />  -Page Field <br /> |
|[XmlName property](devenv-xmlname-property.md)| | -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br /> |


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  