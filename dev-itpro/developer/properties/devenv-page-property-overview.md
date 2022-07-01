---
title: "Page, Page Fields, and Page Extension Properties"
description: "This topic lists properties that apply to the [page object](../devenv-page-object.md), page fields, and [page extension object](../devenv-page-ext-object.md)."
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

# Page, Page Fields, and Page Extension Properties

This topic lists properties that apply to the [page object](../devenv-page-object.md), page fields, and [page extension object](../devenv-page-ext-object.md).

## Object Properties

The following properties all apply to the Page object, only some of these properties can be set for a Page extension object as specified below. This list is sorted alphabetically by property name. For Page properties sorted by method on a Page, see [Properties](devenv-properties).

|**Property Name**|**Extensible**|**Applies to**|
|-----------|------------|----------|
|AboutText| True| -Page<br />  -Page Action<br />  -Page Action Group<br />  -Page Field<br />  -Page Part<br />  -Page Group<br />  -Request Page<br /> |
|AboutTextML| True| -Page<br />  -Page Action<br />  -Page Action Group<br />  -Page Field<br />  -Page Part<br />  -Page Group<br />  -Request Page<br /> |
|AboutTitle| True| -Page<br />  -Page Action<br />  -Page Action Group<br />  -Page Field<br />  -Page Part<br />  -Page Group<br />  -Request Page<br /> |
|AboutTitleML| True| -Page<br />  -Page Action<br />  -Page Action Group<br />  -Page Field<br />  -Page Part<br />  -Page Group<br />  -Request Page<br /> |
|AccessByPermission| | -Table Field<br />  -Page Field<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Action<br />  -Page<br />  -Report<br /> |
|AdditionalSearchTerms| True| -Page<br />  -Report<br /> |
|AdditionalSearchTermsML| True| -Page<br />  -Report<br /> |
|APIGroup| | -Page<br />  -Query<br /> |
|APIPublisher| | -Page<br />  -Query<br /> |
|APIVersion| | -Page<br />  -Query<br /> |
|ApplicationArea| True| -Page Label<br />  -Page Field<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Action<br />  -Page User Control<br />  -Page<br />  -Report<br /> |
|AssistEdit| True| -Page Field<br /> |
|AutoFormatExpression| | -Table Field<br />  -Page Field<br />  -Report Column<br /> |
|AutoFormatType| | -Table Field<br />  -Page Field<br />  -Report Column<br /> |
|AutoSplitKey| | -Page<br />  -Request Page<br /> |
|BlankNumbers| | -Table Field<br />  -Page Field<br /> |
|BlankZero| True| -Table Field<br />  -Page Field<br /> |
|Caption| True| -Table<br />  -Table Field<br />  -Page Field<br />  -Field Group<br />  -Page<br />  -Request Page<br />  -Page Label<br />  -Page Group<br />  -Page Part<br />  -Page System Part<br />  -Page Action<br />  -Page Action Separator<br />  -Page Action Group<br />  -Xml Port<br />  -Report<br />  -Query<br />  -Query Column<br />  -Query Filter<br />  -Report Column<br />  -Enum Value<br />  -Page View<br />  -Report Layout<br />  -Profile<br />  -Enum Type<br />  -Permission Set<br /> |
|CaptionClass| True| -Table Field<br />  -Page Label<br />  -Page Field<br /> |
|CaptionML| True| -Table<br />  -Table Field<br />  -Page Field<br />  -Field Group<br />  -Page<br />  -Request Page<br />  -Page Label<br />  -Page Group<br />  -Page Part<br />  -Page System Part<br />  -Page Action<br />  -Page Action Separator<br />  -Page Action Group<br />  -Xml Port<br />  -Report<br />  -Query<br />  -Query Column<br />  -Query Filter<br />  -Report Column<br />  -Enum Value<br />  -Page View<br />  -Report Layout<br />  -Profile<br />  -Enum Type<br />  -Permission Set<br /> |
|CardPageId| | -Page<br />  -Request Page<br /> |
|ChangeTrackingAllowed| | -Page<br /> |
|CharAllowed| | -Table Field<br />  -Page Field<br /> |
|ClosingDates| True| -Table Field<br />  -Page Field<br /> |
|ColumnSpan| | -Page Label<br />  -Page Field<br /> |
|ContextSensitiveHelpPage| True| -Page<br />  -Request Page<br /> |
|CuegroupLayout| | -Page Group<br /> |
|DataAccessIntent| | -Page<br />  -Report<br />  -Query<br /> |
|DataCaptionExpression| True| -Page<br />  -Request Page<br /> |
|DataCaptionFields| True| -Table<br />  -Page<br />  -Request Page<br /> |
|DateFormula| | -Table Field<br />  -Page Field<br /> |
|DecimalPlaces| | -Table Field<br />  -Page Field<br />  -Report Column<br /> |
|DelayedInsert| | -Page<br /> |
|DeleteAllowed| | -Page<br />  -Request Page<br /> |
|Description| True| -Codeunit<br />  -Table Field<br />  -Table Key<br />  -Page<br />  -Page Action<br />  -Page Action Area<br />  -Page Action Group<br />  -Page Area<br />  -Page Field<br />  -Page Group<br />  -Page Label<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Query<br />  -Query Column<br />  -Query Data Item<br />  -Query Filter<br />  -Report<br />  -Report Data Item<br />  -Report Column<br />  -Request Page<br />  -Table<br />  -Xml Port<br />  -Xml Port Text Element<br />  -Xml Port Field Element<br />  -Xml Port Table Element<br />  -Xml Port Field Attribute<br />  -Xml Port Text Attribute<br />  -Profile<br /> |
|DrillDown| | -Page Field<br /> |
|DrillDownPageId| True| -Table<br />  -Page Field<br /> |
|Editable| | -Table Field<br />  -Page<br />  -Request Page<br />  -Page Label<br />  -Page Field<br />  -Page Group<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Part<br /> |
|Ellipsis| | -Page Action<br /> |
|Enabled| | -Table Field<br />  -Table Key<br />  -Page Label<br />  -Page Field<br />  -Page Group<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Action<br />  -Page Action Group<br />  -Profile<br /> |
|EntityCaption| | -Page<br />  -Query<br /> |
|EntityCaptionML| | -Page<br />  -Query<br /> |
|EntityName| | -Page<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Query<br /> |
|EntitySetCaption| | -Page<br />  -Query<br /> |
|EntitySetCaptionML| | -Page<br />  -Query<br /> |
|EntitySetName| | -Page<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Query<br /> |
|ExtendedDatatype| | -Table Field<br />  -Page Field<br /> |
|Extensible| | -Report<br />  -Enum Type<br />  -Table<br />  -Page<br /> |
|Filters| | -Page View<br /> |
|FreezeColumn| True| -Page Group<br /> |
|Gesture| | -Page Action<br /> |
|GridLayout| | -Page Group<br /> |
|HelpLink| | -Page<br />  -Request Page<br /> |
|HideValue| True| -Page Label<br />  -Page Field<br /> |
|Image| | -Page Field<br />  -Page Action<br />  -Page Action Group<br /> |
|Importance| True| -Page Label<br />  -Page Field<br /> |
|IndentationColumn| True| -Page Group<br /> |
|IndentationControls| True| -Page Group<br /> |
|InFooterBar| True| -Page Action<br /> |
|InsertAllowed| | -Page<br />  -Request Page<br /> |
|InstructionalText| True| -Page<br />  -Request Page<br />  -Page Group<br /> |
|InstructionalTextML| True| -Page<br />  -Request Page<br />  -Page Group<br /> |
|IsHeader| | -Page Action Separator<br /> |
|LinksAllowed| | -Page<br />  -Request Page<br /> |
|Lookup| | -Page Field<br /> |
|LookupPageId| True| -Table<br />  -Page Field<br /> |
|MaxValue| | -Table Field<br />  -Page Field<br /> |
|MinValue| | -Table Field<br />  -Page Field<br /> |
|ModifyAllowed| | -Page<br />  -Request Page<br /> |
|MultiLine| | -Page Label<br />  -Page Field<br /> |
|MultipleNewLines| | -Page<br />  -Request Page<br /> |
|Multiplicity| | -Page Part<br /> |
|NavigationPageId| | -Page Field<br /> |
|NotBlank| | -Table Field<br />  -Page Field<br /> |
|Numeric| | -Table Field<br />  -Page Field<br /> |
|ObsoleteReason| | -Page Action Ref<br />  -Table Field<br />  -Table<br />  -Table Key<br />  -Codeunit<br />  -Enum Type<br />  -Enum Value<br />  -Page Action<br />  -Page Action Area<br />  -Page Action Group<br />  -Page Action Separator<br />  -Page Area<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Field<br />  -Page Group<br />  -Page Label<br />  -Query<br />  -Query Column<br />  -Query Filter<br />  -Report<br />  -Report Data Item<br />  -Report Column<br />  -Request Page<br />  -Xml Port<br />  -Page<br />  -Page View<br />  -Profile<br />  -Interface<br />  -Control Add In<br />  -Permission Set<br />  -Field Group<br /> |
|ObsoleteState| | -Page Action Ref<br />  -Table Field<br />  -Table<br />  -Table Key<br />  -Codeunit<br />  -Enum Type<br />  -Enum Value<br />  -Page Action<br />  -Page Action Area<br />  -Page Action Group<br />  -Page Action Separator<br />  -Page Area<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Field<br />  -Page Group<br />  -Page Label<br />  -Query<br />  -Query Column<br />  -Query Filter<br />  -Report<br />  -Report Data Item<br />  -Report Column<br />  -Request Page<br />  -Xml Port<br />  -Page<br />  -Page View<br />  -Profile<br />  -Interface<br />  -Control Add In<br />  -Permission Set<br />  -Field Group<br /> |
|ObsoleteTag| | -Page Action Ref<br />  -Table Field<br />  -Table<br />  -Table Key<br />  -Codeunit<br />  -Enum Type<br />  -Enum Value<br />  -Page Action<br />  -Page Action Area<br />  -Page Action Group<br />  -Page Action Separator<br />  -Page Area<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Field<br />  -Page Group<br />  -Page Label<br />  -Query<br />  -Query Column<br />  -Query Filter<br />  -Report<br />  -Report Data Item<br />  -Report Column<br />  -Request Page<br />  -Xml Port<br />  -Page<br />  -Page View<br />  -Profile<br />  -Interface<br />  -Control Add In<br />  -Permission Set<br />  -Field Group<br /> |
|ODataEDMType| True| -Page Field<br /> |
|ODataKeyFields| | -Page<br /> |
|OptionCaption| True| -Table Field<br />  -Page Field<br />  -Report Column<br /> |
|OptionCaptionML| True| -Table Field<br />  -Page Field<br />  -Report Column<br /> |
|OrderBy| | -Page View<br />  -Query<br /> |
|PageType| | -Page<br /> |
|Permissions| | -Codeunit<br />  -Table<br />  -Request Page<br />  -Page<br />  -Xml Port<br />  -Report<br />  -Query<br />  -Permission Set<br />  -Permission Set Extension<br /> |
|PopulateAllFields| | -Page<br />  -Request Page<br /> |
|Promoted| True| -Page Action<br />  -Profile<br /> |
|PromotedActionCategories| True| -Page<br /> |
|PromotedActionCategoriesML| True| -Page<br /> |
|PromotedCategory| True| -Page Action<br /> |
|PromotedIsBig| True| -Page Action<br /> |
|PromotedOnly| True| -Page Action<br /> |
|Provider| | -Page Part<br />  -Page System Part<br />  -Page Chart Part<br /> |
|QueryCategory| | -Page<br />  -Query<br /> |
|QuickEntry| True| -Page Field<br /> |
|RefreshOnActivate| | -Page<br /> |
|RowSpan| | -Page Label<br />  -Page Field<br /> |
|RunObject| | -Page Action<br /> |
|RunPageLink| | -Page Action<br /> |
|RunPageMode| | -Page Action<br /> |
|RunPageOnRec| | -Page Action<br /> |
|RunPageView| | -Page Action<br /> |
|SaveValues| | -Page<br />  -Request Page<br /> |
|Scope| | -Table<br />  -Page Action<br /> |
|SharedLayout| | -Page View<br /> |
|ShortcutKey| True| -Page Action<br /> |
|ShowAs| True| -Page Action Group<br /> |
|ShowAsTree| | -Page Group<br /> |
|ShowCaption| True| -Page Label<br />  -Page Field<br />  -Page Group<br /> |
|ShowFilter| | -Page<br />  -Request Page<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Part<br /> |
|ShowMandatory| True| -Page Field<br /> |
|SignDisplacement| | -Table Field<br />  -Page Field<br /> |
|SourceTable| | -Page<br />  -Request Page<br /> |
|SourceTableTemporary| | -Page<br />  -Request Page<br /> |
|SourceTableView| | -Page<br />  -Request Page<br />  -Xml Port Table Element<br /> |
|Style| True| -Page Label<br />  -Page Field<br /> |
|StyleExpr| True| -Page Label<br />  -Page Field<br /> |
|SubPageLink| | -Page Part<br />  -Page System Part<br />  -Page Chart Part<br /> |
|SubPageView| | -Page Part<br />  -Page System Part<br />  -Page Chart Part<br /> |
|TableRelation| True| -Table Field<br />  -Page Field<br /> |
|Title| | -Page Field<br /> |
|ToolTip| True| -Page Label<br />  -Page Field<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Action Area<br />  -Page Action<br />  -Page Action Group<br /> |
|ToolTipML| True| -Page Label<br />  -Page Field<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Action Area<br />  -Page Action<br />  -Page Action Group<br /> |
|TreeInitialState| True| -Page Group<br /> |
|UpdatePropagation| | -Page Part<br />  -Page System Part<br />  -Page Chart Part<br /> |
|UsageCategory| | -Page<br />  -Report<br /> |
|ValuesAllowed| | -Table Field<br />  -Page Field<br /> |
|Visible| True| -Page Label<br />  -Page Field<br />  -Page Group<br />  -Page Part<br />  -Page System Part<br />  -Page Chart Part<br />  -Page Action<br />  -Page Action Group<br />  -Page Action Ref<br />  -Page View<br />  -Page User Control<br /> |
|Width| True| -Table Field<br />  -Page Field<br />  -Page Label<br />  -Xml Port Text Element<br />  -Xml Port Field Element<br />  -Xml Port Table Element<br />  -Xml Port Field Attribute<br />  -Xml Port Text Attribute<br /> |


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  