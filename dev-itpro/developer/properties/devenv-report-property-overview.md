---
title: "Report, Report fields, and Report extension properties"
description: "This article lists properties that apply to the [report object](../devenv-report-object.md), report fields, and [report extension object](../devenv-report-ext-object.md)."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Report, Report Fields, and Report extension properties

This article lists properties that apply to the [report object](../devenv-report-object.md), report fields, and [report extension object](../devenv-report-ext-object.md).

## Object properties

The following properties all apply to the Report object, only some of these properties can be set for a Report extension object as specified below. This list is sorted alphabetically by property name. For Report properties sorted by method on a Report, see [Properties](devenv-properties.md).

|**Property name**|**Extensible**|**Applies to**|
|-----------|------------|----------|
|[AccessByPermission property](devenv-accessbypermission-property.md)| | -Table field <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Page <br />  -Report <br /> |
|[AdditionalSearchTerms property](devenv-additionalsearchterms-property.md)| True| -Page <br />  -Report <br /> |
|[AdditionalSearchTermsML property](devenv-additionalsearchtermsml-property.md)| True| -Page <br />  -Report <br /> |
|[AllowScheduling property](devenv-allowscheduling-property.md)| | -Report <br /> |
|[ApplicationArea property](devenv-applicationarea-property.md)| True| -Page Label <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Page User Control <br />  -Page <br />  -Report <br /> |
|[AutoCalcField property](devenv-autocalcfield-property.md)| | -Xml Port Field Attribute <br />  -Xml Port Field Element <br />  -Report Column <br /> |
|[AutoFormatExpression property](devenv-autoformatexpression-property.md)| | -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[AutoFormatType property](devenv-autoformattype-property.md)| | -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[CalcFields property](devenv-calcfields-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[Caption property](devenv-caption-property.md)| True| -Table <br />  -Table field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[CaptionML property](devenv-captionml-property.md)| True| -Table <br />  -Table field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[DataAccessIntent property](devenv-dataaccessintent-property.md)| | -Page <br />  -Report <br />  -Query <br /> |
|[DataItemLinkReference property](devenv-dataitemlinkreference-property.md)| | -Report Data Item <br /> |
|[DataItemTableView property](devenv-dataitemtableview-property.md)| | -Report Data Item <br /> |
|[DecimalPlaces property](devenv-decimalplaces-property.md)| | -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[DefaultLayout property](devenv-defaultlayout-property.md)| | -Report <br /> |
|[DefaultRenderingLayout property](devenv-defaultrenderinglayout-property.md)| | -Report <br /> |
|[Description property](devenv-description-property.md)| True| -Codeunit <br />  -Table field <br />  -Table key <br />  -Page <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Area <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Query <br />  -Query Column <br />  -Query Data Item <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Table <br />  -Xml Port <br />  -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br />  -Profile <br /> |
|[EnableExternalAssemblies property](devenv-enableexternalassemblies-property.md)| | -Report <br /> |
|[EnableExternalImages property](devenv-enableexternalimages-property.md)| | -Report <br /> |
|[EnableHyperlinks property](devenv-enablehyperlinks-property.md)| | -Report <br /> |
|[ExcelLayout property](devenv-excellayout-property.md)| True| -Report <br />  -Report Extension <br /> |
|[ExcelLayoutMultipleDataSheets property](devenv-excellayoutmultipledatasheets-property.md)| | -Report <br /> |
|[ExecutionTimeout property](devenv-executiontimeout-property.md)| | -Report <br /> |
|[Extensible property](devenv-extensible-property.md)| | -Report <br />  -Enum Type <br />  -Table <br />  -Page <br /> |
|[FormatRegion property](devenv-formatregion-property.md)| | -Report <br /> |
|[IncludeCaption property](devenv-includecaption-property.md)| | -Report Column <br /> |
|[InherentEntitlements property](devenv-inherententitlements-property.md)| | -Query <br />  -Report <br />  -Xml Port <br />  -Table <br />  -Codeunit <br />  -Page <br /> |
|[InherentPermissions property](devenv-inherentpermissions-property.md)| | -Query <br />  -Report <br />  -Xml Port <br />  -Table <br />  -Codeunit <br />  -Page <br /> |
|[LayoutFile property](devenv-layoutfile-property.md)| | -Report Layout <br /> |
|[MaximumDatasetSize property](devenv-maximumdatasetsize-property.md)| | -Report <br /> |
|[MaximumDocumentCount property](devenv-maximumdocumentcount-property.md)| | -Report <br /> |
|[MaxIteration property](devenv-maxiteration-property.md)| | -Report Data Item <br /> |
|[MimeType property](devenv-mimetype-property.md)| | -Report Layout <br /> |
|[ObsoleteReason property](devenv-obsoletereason-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Table <br />  -Table field <br />  -Table key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page Field <br />  -Page Action Area <br />  -Page Area <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteState property](devenv-obsoletestate-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Table <br />  -Table field <br />  -Table key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page Field <br />  -Page Action Area <br />  -Page Area <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteTag property](devenv-obsoletetag-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Table <br />  -Table field <br />  -Table key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page Field <br />  -Page Action Area <br />  -Page Area <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[OptionCaption property](devenv-optioncaption-property.md)| True| -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[OptionCaptionML property](devenv-optioncaptionml-property.md)| True| -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[PaperSourceDefaultPage property](devenv-papersourcedefaultpage-property.md)| | -Report <br /> |
|[PaperSourceFirstPage property](devenv-papersourcefirstpage-property.md)| | -Report <br /> |
|[PaperSourceLastPage property](devenv-papersourcelastpage-property.md)| | -Report <br /> |
|[PdfFontEmbedding property](devenv-pdffontembedding-property.md)| | -Report <br /> |
|[Permissions property](devenv-permissions-property.md)| | -Codeunit <br />  -Table <br />  -Request Page <br />  -Page <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Permission Set <br />  -Permission Set Extension <br /> |
|[PreviewMode property](devenv-previewmode-property.md)| | -Report <br /> |
|[PrintOnlyIfDetail property](devenv-printonlyifdetail-property.md)| | -Report Data Item <br /> |
|[ProcessingOnly property](devenv-processingonly-property.md)| | -Report <br /> |
|[RDLCLayout property](devenv-rdlclayout-property.md)| True| -Report <br />  -Report Extension <br /> |
|[RequestFilterFields property](devenv-requestfilterfields-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[RequestFilterHeading property](devenv-requestfilterheading-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[RequestFilterHeadingML property](devenv-requestfilterheadingml-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[ShowPrintStatus property](devenv-showprintstatus-property.md)| | -Report <br /> |
|[Summary property](devenv-summary-property.md)| | -Report Layout <br /> |
|[SummaryML property](devenv-summaryml-property.md)| | -Report Layout <br /> |
|[TransactionType property](devenv-transactiontype-property.md)| | -Xml Port <br />  -Report <br /> |
|[UsageCategory property](devenv-usagecategory-property.md)| | -Query <br />  -Page <br />  -Report <br /> |
|[UseRequestPage property](devenv-userequestpage-property.md)| | -Xml Port <br />  -Report <br /> |
|[UseSystemPrinter property](devenv-usesystemprinter-property.md)| | -Report <br /> |
|[WordLayout property](devenv-wordlayout-property.md)| True| -Report <br />  -Report Extension <br /> |
|[WordMergeDataItem property](devenv-wordmergedataitem-property.md)| | -Report <br /> |


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  