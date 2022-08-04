---
title: "Report, Report Fields, and Report Extension Properties"
description: "This topic lists properties that apply to the [report object](../devenv-report-object.md), report fields, and [report extension object](../devenv-report-ext-object.md)."
ms.author: solsen
ms.custom: na
ms.date: 08/04/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Report, Report Fields, and Report Extension Properties

This topic lists properties that apply to the [report object](../devenv-report-object.md), report fields, and [report extension object](../devenv-report-ext-object.md).

## Object Properties

The following properties all apply to the Report object, only some of these properties can be set for a Report extension object as specified below. This list is sorted alphabetically by property name. For Report properties sorted by method on a Report, see [Properties](devenv-properties.md).

|**Property Name**|**Extensible**|**Applies to**|
|-----------|------------|----------|
|[AccessByPermission Property](devenv-accessbypermission-property.md)| | -Table Field <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Custom Action <br />  -Page <br />  -Report <br /> |
|[AdditionalSearchTerms Property](devenv-additionalsearchterms-property.md)| True| -Page <br />  -Report <br /> |
|[AdditionalSearchTermsML Property](devenv-additionalsearchtermsml-property.md)| True| -Page <br />  -Report <br /> |
|[AllowScheduling Property](devenv-allowscheduling-property.md)| | -Report <br /> |
|[ApplicationArea Property](devenv-applicationarea-property.md)| True| -Page Label <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Custom Action <br />  -Page User Control <br />  -Page <br />  -Report <br /> |
|[AutoCalcField Property](devenv-autocalcfield-property.md)| | -Xml Port Field Attribute <br />  -Xml Port Field Element <br />  -Report Column <br /> |
|[AutoFormatExpression Property](devenv-autoformatexpression-property.md)| | -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[AutoFormatType Property](devenv-autoformattype-property.md)| | -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[CalcFields Property](devenv-calcfields-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[Caption Property](devenv-caption-property.md)| True| -Table <br />  -Table Field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page Custom Action <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[CaptionML Property](devenv-captionml-property.md)| True| -Table <br />  -Table Field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page Custom Action <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[DataAccessIntent Property](devenv-dataaccessintent-property.md)| | -Page <br />  -Report <br />  -Query <br /> |
|[DataItemLink Property](devenv-dataitemlink-property.md)| | -Report Data Item <br />  -Query Data Item <br /> |
|[DataItemLinkReference Property](devenv-dataitemlinkreference-property.md)| | -Report Data Item <br /> |
|[DataItemTableView Property](devenv-dataitemtableview-property.md)| | -Report Data Item <br /> |
|[DecimalPlaces Property](devenv-decimalplaces-property.md)| | -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[DefaultLayout Property](devenv-defaultlayout-property.md)| | -Report <br /> |
|[DefaultRenderingLayout Property](devenv-defaultrenderinglayout-property.md)| | -Report <br /> |
|[Description Property](devenv-description-property.md)| True| -Codeunit <br />  -Table Field <br />  -Table Key <br />  -Page <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Area <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Query <br />  -Query Column <br />  -Query Data Item <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Table <br />  -Xml Port <br />  -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br />  -Profile <br /> |
|[EnableExternalAssemblies Property](devenv-enableexternalassemblies-property.md)| | -Report <br /> |
|[EnableExternalImages Property](devenv-enableexternalimages-property.md)| | -Report <br /> |
|[EnableHyperlinks Property](devenv-enablehyperlinks-property.md)| | -Report <br /> |
|[ExcelLayout Property](devenv-excellayout-property.md)| True| -Report <br />  -Report Extension <br /> |
|[ExecutionTimeout Property](devenv-executiontimeout-property.md)| | -Report <br /> |
|[Extensible Property](devenv-extensible-property.md)| | -Report <br />  -Enum Type <br />  -Table <br />  -Page <br /> |
|[IncludeCaption Property](devenv-includecaption-property.md)| | -Report Column <br /> |
|[LayoutFile Property](devenv-layoutfile-property.md)| | -Report Layout <br /> |
|[MaximumDatasetSize Property](devenv-maximumdatasetsize-property.md)| | -Report <br /> |
|[MaximumDocumentCount Property](devenv-maximumdocumentcount-property.md)| | -Report <br /> |
|[MaxIteration Property](devenv-maxiteration-property.md)| | -Report Data Item <br /> |
|[MimeType Property](devenv-mimetype-property.md)| | -Report Layout <br /> |
|[ObsoleteReason Property](devenv-obsoletereason-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Table Field <br />  -Table <br />  -Table Key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Area <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteState Property](devenv-obsoletestate-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Table Field <br />  -Table <br />  -Table Key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Area <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteTag Property](devenv-obsoletetag-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Table Field <br />  -Table <br />  -Table Key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Area <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[OptionCaption Property](devenv-optioncaption-property.md)| True| -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[OptionCaptionML Property](devenv-optioncaptionml-property.md)| True| -Table Field <br />  -Page Field <br />  -Report Column <br /> |
|[OptionMembers Property](devenv-optionmembers-property.md)| | -Table Field <br />  -Report Column <br /> |
|[PaperSourceDefaultPage Property](devenv-papersourcedefaultpage-property.md)| | -Report <br /> |
|[PaperSourceFirstPage Property](devenv-papersourcefirstpage-property.md)| | -Report <br /> |
|[PaperSourceLastPage Property](devenv-papersourcelastpage-property.md)| | -Report <br /> |
|[PdfFontEmbedding Property](devenv-pdffontembedding-property.md)| | -Report <br /> |
|[Permissions Property](devenv-permissions-property.md)| | -Codeunit <br />  -Table <br />  -Request Page <br />  -Page <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Permission Set <br />  -Permission Set Extension <br /> |
|[PreviewMode Property](devenv-previewmode-property.md)| | -Report <br /> |
|[PrintOnlyIfDetail Property](devenv-printonlyifdetail-property.md)| | -Report Data Item <br /> |
|[ProcessingOnly Property](devenv-processingonly-property.md)| | -Report <br /> |
|[RDLCLayout Property](devenv-rdlclayout-property.md)| True| -Report <br />  -Report Extension <br /> |
|[RequestFilterFields Property](devenv-requestfilterfields-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[RequestFilterHeading Property](devenv-requestfilterheading-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[RequestFilterHeadingML Property](devenv-requestfilterheadingml-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[ShowPrintStatus Property](devenv-showprintstatus-property.md)| | -Report <br /> |
|[Summary Property](devenv-summary-property.md)| | -Report Layout <br /> |
|[SummaryML Property](devenv-summaryml-property.md)| | -Report Layout <br /> |
|[TransactionType Property](devenv-transactiontype-property.md)| | -Xml Port <br />  -Report <br /> |
|[Type Property](devenv-type-property.md)| | -Report Layout <br />  -Entitlement <br /> |
|[UsageCategory Property](devenv-usagecategory-property.md)| | -Page <br />  -Report <br /> |
|[UseRequestPage Property](devenv-userequestpage-property.md)| | -Xml Port <br />  -Report <br /> |
|[UseSystemPrinter Property](devenv-usesystemprinter-property.md)| | -Report <br /> |
|[UseTemporary Property](devenv-usetemporary-property.md)| | -Xml Port Table Element <br />  -Report Data Item <br /> |
|[WordLayout Property](devenv-wordlayout-property.md)| True| -Report <br />  -Report Extension <br /> |
|[WordMergeDataItem Property](devenv-wordmergedataitem-property.md)| | -Report <br /> |


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  