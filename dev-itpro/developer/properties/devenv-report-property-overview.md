---
title: "Report, Report Fields, and Report Extension Properties"
description: "This topic lists properties that apply to the [report object](../devenv-report-object.md), report fields, and [report extension object](../devenv-report-ext-object.md)."
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

# report, report Fields, and report Extension Properties


This topic lists properties that apply to the [report object](../devenv-report-object.md), report fields, and [report extension object](../devenv-report-ext-object.md).

## Object Properties

The following properties all apply to the report object, only some of these properties can be set for a report extension object as specified below. This list is sorted alphabetically by property name. For report properties sorted by method on a report, see [report properties](devenv-properties.md).

|**Property Name**|**Extensible**|**Applies to**|
|-----------|------------|----------|
|AccessByPermission| | -Table Field
<br />  -Page Field
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Chart Part
<br />  -Page Action
<br />  -Page
<br />  -Report
<br /> |
|AdditionalSearchTerms| True| -Page
<br />  -Report
<br /> |
|AdditionalSearchTermsML| True| -Page
<br />  -Report
<br /> |
|AllowScheduling| | -Report
<br /> |
|ApplicationArea| True| -Page Label
<br />  -Page Field
<br />  -Page Part
<br />  -Page System Part
<br />  -Page Chart Part
<br />  -Page Action
<br />  -Page User Control
<br />  -Page
<br />  -Report
<br /> |
|AutoCalcField| | -Xml Port Field Attribute
<br />  -Xml Port Field Element
<br />  -Report Column
<br /> |
|AutoFormatExpression| | -Table Field
<br />  -Page Field
<br />  -Report Column
<br /> |
|AutoFormatType| | -Table Field
<br />  -Page Field
<br />  -Report Column
<br /> |
|CalcFields| | -Xml Port Table Element
<br />  -Report Data Item
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
|DataAccessIntent| | -Page
<br />  -Report
<br />  -Query
<br /> |
|DataItemLink| | -Report Data Item
<br />  -Query Data Item
<br /> |
|DataItemLinkReference| | -Report Data Item
<br /> |
|DataItemTableView| | -Report Data Item
<br /> |
|DecimalPlaces| | -Table Field
<br />  -Page Field
<br />  -Report Column
<br /> |
|DefaultLayout| | -Report
<br /> |
|DefaultRenderingLayout| | -Report
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
|EnableExternalAssemblies| | -Report
<br /> |
|EnableExternalImages| | -Report
<br /> |
|EnableHyperlinks| | -Report
<br /> |
|ExcelLayout| True| -Report
<br />  -Report Extension
<br /> |
|ExecutionTimeout| | -Report
<br /> |
|Extensible| | -Report
<br />  -Enum Type
<br />  -Table
<br />  -Page
<br /> |
|IncludeCaption| | -Report Column
<br /> |
|LayoutFile| | -Report Layout
<br /> |
|MaximumDatasetSize| | -Report
<br /> |
|MaximumDocumentCount| | -Report
<br /> |
|MaxIteration| | -Report Data Item
<br /> |
|MimeType| | -Report Layout
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
|PaperSourceDefaultPage| | -Report
<br /> |
|PaperSourceFirstPage| | -Report
<br /> |
|PaperSourceLastPage| | -Report
<br /> |
|PdfFontEmbedding| | -Report
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
|PreviewMode| | -Report
<br /> |
|PrintOnlyIfDetail| | -Report Data Item
<br /> |
|ProcessingOnly| | -Report
<br /> |
|RDLCLayout| True| -Report
<br />  -Report Extension
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
|ShowPrintStatus| | -Report
<br /> |
|Summary| | -Report Layout
<br /> |
|SummaryML| | -Report Layout
<br /> |
|TransactionType| | -Xml Port
<br />  -Report
<br /> |
|Type| | -Report Layout
<br />  -Entitlement
<br /> |
|UsageCategory| | -Page
<br />  -Report
<br /> |
|UseRequestPage| | -Xml Port
<br />  -Report
<br /> |
|UseSystemPrinter| | -Report
<br /> |
|UseTemporary| | -Xml Port Table Element
<br />  -Report Data Item
<br /> |
|WordLayout| True| -Report
<br />  -Report Extension
<br /> |
|WordMergeDataItem| | -Report
<br /> |


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  