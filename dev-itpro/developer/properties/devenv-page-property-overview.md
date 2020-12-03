---
title: "Page, Page Fields, and Page Extension Properties"
description: "Description of the available properties on page extensions."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
---

# Page, Page Fields, and Page Extension Properties

This topic lists properties that apply to the [page object](../devenv-page-object.md), page fields, and [page extension object](../devenv-page-ext-object.md).

## Page object properties

The following properties all apply to the page object, only some of these properties can be set for a page extension object as specified below. This list is sorted alphabetically by property name. For page properties sorted by function on a page, see [Page Properties](devenv-page-properties.md).

|Property Name|Available for Page Extension Object|Applies to|
|-------------|-----------|---------------------|
|[Access Property](devenv-access-property.md)||<ul><li>Codeunit</li><li>Query</li><li>Table</li><li>Table Field</li><li>Enum Type</li><li>Interface</li><ul>|
|[AccessByPermission Property](devenv-accessbypermission-property.md)||<ul><li>Page object</li><li>Field control</li><li>Part control</li><li>Action</li></ul>|
|[AdditionalSearchTerms Property](devenv-additionalsearchterms-property.md)||<ul><li>Page object</li></ul>|
|[AdditionalSearchTermsML Property](devenv-additionalsearchtermsml-property.md)||<ul><li>Page object</li></ul>|
|[ApplicationArea Property](devenv-applicationarea-property.md)|X (see next column)|<ul><li>Page object (cannot be specified for a page extension object)</li><li>Field control</li><li>Part control</li><li>Action</li></ul>|
|[AssistEdit Property](devenv-assistedit-property.md)||<ul><li>Field control</li></ul>|
|[AutoFormatExpression Property](devenv-autoformatexpression-property.md)||<ul><li>Field control</li></ul>|
|[AutoFormatType Property](devenv-autoformattype-property.md)||<ul><li>Field control</li></ul>|
|[AutoSplitKey Property](devenv-autosplitkey-property.md)||<ul><li>Page object</li></ul>|
|[BlankNumbers Property](devenv-blanknumbers-property.md)||<ul><li>Field control</li></ul>|
|[BlankZero Property](devenv-blankzero-property.md)||<ul><li>Field control</li></ul>|
|[CaptionML Property](devenv-captionml-property.md)|X|<ul><li>Page object</li><li>Container control</li><li>Group control</li><li>Field control</li><li>Part control</li><li>ActionGroup</li><li>Action</li><li>Separator</li></ul>|
|[CaptionClass Property](devenv-captionclass-property.md)|X|<ul><li>Field control</li></ul>|
|[CharAllowed Property](devenv-charallowed-property.md)||<ul><li>Field control</li></ul>|
|[ClosingDates Property](devenv-closingdates-property.md)|X|<ul><li>Field control</li></ul>|
|[ColumnSpan Property](devenv-columnspan-property.md)||<ul><li>Field control</li></ul>|
|[ContextSensitiveHelpPage Property](devenv-contextsensitivehelppage-property.md)|X|<ul><li>Page object</li></ul>|
|[ContainerType Property](devenv-containertype-property.md)|X|<ul><li>Container control</li></ul>|
|[DataCaptionExpression Property](devenv-datacaptionexpr-property.md)|X|<ul><li>Page object</li></ul>|
|[DateFormula Property](devenv-dateformula-property.md)||<ul><li>Field control</li></ul>|
|[DecimalPlaces Property](devenv-decimalplaces-property.md)||<ul><li>Field control</li></ul>|
|[DelayedInsert Property](devenv-delayedinsert-property.md)||<ul><li>Page object</li></ul>|
|[DeleteAllowed Property](devenv-deleteallowed-property.md)||<ul><li>Page object</li></ul>|
|[Description Property](devenv-description-property.md)|X|<ul><li>Page object</li><li>Container control</li><li>Group control</li><li>Field control</li><li>Part control</li><li>ActionGroup</li><li>Action</li></ul>|
|[DrillDown Property](devenv-drilldown-property.md)||<ul><li>Field control</li></ul>|
|[DrillDownPageId Property](devenv-drilldownpageid-property.md)||<ul><li>Field control</li></ul>|
|[Editable Property](devenv-editable-property.md)||<ul><li>Page object</li><li>Group control</li><li>Field control</li><li>Part control</li></ul>|
|[Ellipsis Property](devenv-ellipsis-property.md)||<ul><li>Action</li></ul>|
|[Enabled Property](devenv-enabled-property.md)|X|<ul><li>Group control</li><li>Field control</li><li>Part control</li><li>ActionGroup</li><li>Action</li></ul>|
|[EntityCaption Property](devenv-entitycaption-property.md)||<ul><li>Page object</li></ul>|
|[EntityCaptionML Property](devenv-entitycaptionml-property.md)||<ul><li>Page object</li></ul>|
|[EntityName Property](devenv-entityname-property.md)||<ul><li>Page object</li><li>Part control</li></ul>|
|[EntitySetCaption Property](devenv-entitysetcaption-property.md)||<ul><li>Page object</li></ul>|
|[EntitySetCaptionML Property](devenv-entitysetcaptionml-property.md)||<ul><li>Page object</li></ul>|
|[EntitySetName Property](devenv-entitysetname-property.md)||<ul><li>Page object</li><li>Part control</li></ul>|
|[ExtendedDataType Property](devenv-Extendeddatatype-property.md)||<ul><li>Field control</li></ul>|
|[Extensible Property](devenv-extensible-property.md)||<ul><li>Page object</li></ul>|
|[FreezeColumn Property](devenv-freezecolumnid-property.md)|X|<ul><li>Group control</li></ul>|
|[GridLayout Property](devenv-gridlayout-property.md)||<ul><li>Group control</li></ul>|
|[Gesture Property](devenv-gesture-property.md)||<ul><li>Action</li></ul>|
|[HideValue Property](devenv-hidevalue-property.md)|X|<ul><li>Field control</li></ul>|
|[IndentationControls Property](devenv-indentationcontrols-property.md)||<ul><li>Group control</li></ul>|
|[InFooterBar Property](devenv-infooterbar-property.md)|X|<ul><li>Action</li></ul>|
|[InsertAllowed Property](devenv-insertallowed-property.md)||<ul><li>Page object</li></ul>|
|[InstructionalTextML Property](devenv-instructionaltextml-property.md)|X|<ul><li>Page object</li><li>Group control</li></ul>|
|[Image Property](devenv-image-property.md)||<ul><li>Field control</li><li>ActionGroup</li><li>Action</li></ul>|
|[Importance Property](devenv-importance-property.md)|X|<ul><li>Field control</li></ul>|
|[LinksAllowed Property](devenv-linksallowed-property.md)||<ul><li>Page object</li></ul>|
|[LookupPageId Property](devenv-lookuppageid-property.md)||<ul><li>Field control</li></ul>|
|[Lookup Property](devenv-lookup-property.md)||<ul><li>Field control</li></ul>|
|[ModifyAllowed Property](devenv-modifyallowed-property.md)||<ul><li>Page object</li></ul>|
|[MultipleNewLines Property](devenv-multiplenewlines-property.md)||<ul><li>Page object</li></ul>|
|[Multiplicity Property](devenv-multiplicity-property.md)||<ul><li>Page part</li></ul>|
|[MinValue Property](devenv-minvalue-property.md)||<ul><li>Field control</li></ul>|
|[MaxValue Property](devenv-maxvalue-property.md)||<ul><li>Field control</li></ul>|
|[MultiLine Property](devenv-multiline-property.md)||<ul><li>Field control</li></ul>|
|[NavigationPageId Property](devenv-navigationpagedd-property.md)||<ul><li>Field control</li></ul>|
|[NotBlank Property](devenv-notblank-property.md)||<ul><li>Field control</li></ul>|
|[Numeric Property](devenv-numeric-property.md)||<ul><li>Field control</li></ul>|
|[ObsoleteState Property](devenv-obsoletestate-property.md)||<ul><li>Page object</li><li>Action</li><li>Action area</li><li>Action group</li><li>Action separator</li><li>Area</li><li>Chart part</li><li>Field control</li><li>Group</li><li>Label</li><li>Part</li><li>System part</li><ul>|
|[ObsoleteReason Property](devenv-obsoletereason-property.md)||<ul><li>Page object</li><li>Action</li><li>Action area</li><li>Action group</li><li>Action separator</li><li>Area</li><li>Chart part</li><li>Field control</li><li>Group</li><li>Label</li><li>Part</li><li>System part</li><ul>|
|[ODataEDMType Property](devenv-odataedmtype-property.md)|X|<ul><li>Page object</li><li>Field control</li></ul>|
|[ODataKeyFields Property](devenv-odatakeyfields-property.md)||<ul><li>Page object</li></ul>|
|[OptionCaptionML Property](devenv-optioncaptionml-property.md)||<ul><li>Field control</li></ul>|
|[PageType Property](devenv-pagetype-property.md)||<ul><li>Page object</li></ul>|
|[Permissions Property](devenv-permissions-property.md)||<ul><li>Page object</li></ul>|
|[PopulateAllFields Property](devenv-populateallfields-property.md)||<ul><li>Page object</li></ul>|
|[Promoted Property](devenv-promoted-property.md)|X|<ul><li>Action</li></ul>|
|[PromotedActionCategoriesML Property](devenv-promotedactioncategoriesml-property.md)|X|<ul><li>Page object</li></ul>|
|[PromotedCategory Property](devenv-promotedcategory-property.md)|X|<ul><li>Action</li></ul>|
|[PromotedIsBig Property](devenv-promotedisbig-property.md)|X|<ul><li>Action</li></ul>|
|[PromotedOnly Property](devenv-promotedonly-property.md)|X|<ul><li>Action</li></ul>|
|[Provider Property](devenv-providerid-property.md)||<ul><li>Part control</li></ul>|
|[QuickEntry Property](devenv-quickentry-property.md)|X|<ul><li>Field control</li></ul>|
|[RefreshOnActivate Property](devenv-refreshonactivate-property.md)||<ul><li>Page object</li></ul>|
|[RowSpan property](devenv-rowspan-property.md)||<ul><li>Field control</li></ul>|
|[RunObject Property](devenv-runobject-property.md)||<ul><li>Action</li></ul>|
|[RunPageLink Property](devenv-runpagelink-property.md)||<ul><li>Action</li></ul>|
|[RunPageMode Property](devenv-runpagemode-property.md)||<ul><li>Action</li></ul>|
|[RunPageOnRec Property](devenv-runpageonrec-property.md)||<ul><li>Action</li></ul>|
|[RunPageView Property](devenv-runpageview-property.md)||<ul><li>Action</li></ul>|
|[SaveValues Property](devenv-savevalues-property.md)||<ul><li>Page object</li></ul>|
|[Scope Property](devenv-scope-property.md)||<ul><li>Action</li></ul>|
|[ShortcutKey Property](devenv-shortcutkey-property.md)||<ul><li>Action</li></ul>|
|[ShowAsTree Property](devenv-showastree-property.md)||<ul><li>Group control</li></ul>|
|[ShowCaption Property](devenv-showcaption-property.md)|X|<ul><li>Group control</li><li>Field control</li></ul>|
|[ShowFilter Property](devenv-showfilter-property.md)||<ul><li>Page object</li><li>Part control</li></ul>|
|[ShowMandatory Property](devenv-showmandatory-property.md)||<ul><li>Field control</li></ul>|
|[SignDisplacement Property](devenv-signdisplacement-property.md)||<ul><li>Field control</li></ul>|
|[SourceTable Property](devenv-sourcetable-property.md)||<ul><li>Page object</li></ul>|
|[SourceTableTemporary Property](devenv-sourcetabletemporary-property.md)||<ul><li>Page object</li></ul>|
|[SourceTableView Property](devenv-sourcetableview-property.md)||<ul><li>Page object</li></ul>|
|[Style Property](devenv-style-property.md)|X|<ul><li>Field control</li></ul>|
|[StyleExpr Property](devenv-styleexpr-property.md)|X|<ul><li>Field control</li></ul>|
|[SubPageView Property](devenv-subpageview-property.md)||<ul><li>Part control</li></ul>|
|[SubPageLink Property](devenv-subpagelink-property.md)||<ul><li>Part control</li></ul>|
|[TableRelation Property](devenv-tablerelation-property.md)||<ul><li>Field control</li></ul>|
|[ToolTipML Property](devenv-tooltipml-property.md)|X|<ul><li>Field control</li><li>Part control</li><li>ActionGroup</li><li>Action</li></ul>|
|[UpdatePropagation Property](devenv-updatepropagation-property.md)||<ul><li>Part control</li></ul>|
|[UsageCategory Property](devenv-usagecategory-property.md)||<ul><li>Page object</li></ul>|
|[ValuesAllowed Property](devenv-valuesallowed-property.md)||<ul><li>Field control</li></ul>|
|[Visible Property](devenv-visible-property.md)|X|<ul><li>Group control</li><li>Field control</li><li>Part control</li><li>ActionGroup</li><li>Action</li><li>View</li></ul>|
|[Width Property](devenv-width-property.md)|X|<ul><li>Field control</li></ul>|




## See Also
[Properties](devenv-properties.md)  
[Page Object](../devenv-page-object.md)  
[Page Extension Object](../devenv-page-ext-object.md)  
[Report Object](../devenv-report-object.md)  
[Table and Table Extension Properties](devenv-table-properties.md)

<!--
# Page and Page Extension Properties Overview

This topic lists properties that apply to the [Page Object](../devenv-page-object.md) and [Page Extension Object](../devenv-page-ext-object.md). 

## Page object properties
The following properties apply to the page object.

|Property Name|Page Object|Page Extension Object|
|-------------|-----------|---------------------|
|[CaptionML Property](devenv-captionml-property.md)|X|X|
|[PageType Property](devenv-pagetype-property.md)|X||
|[Editable Property](devenv-editable-property.md)|X||
|[Permissions Property](devenv-permissions-property.md)|X||
|[Description Property](devenv-description-property.md)|X|X|
|[DataCaptionExpression Property](devenv-datacaptionexpr-property.md)|X|X|
|[InstructionalTextML Property](devenv-instructionaltextml-property.md)|X|X|
|[SourceTable Property](devenv-sourcetable-property.md)|X||
|[SourceTableTemporary Property](devenv-sourcetabletemporary-property.md)|X||
|[SourceTableView Property](devenv-sourcetableview-property.md)|X||
|[InsertAllowed Property](devenv-insertallowed-property.md)|X||
|[ModifyAllowed Property](devenv-modifyallowed-property.md)|X||
|[DeleteAllowed Property](devenv-deleteallowed-property.md)|X||
|[AutoSplitKey Property](devenv-autosplitkey-property.md)|X||
|[SaveValues Property](devenv-savevalues-property.md)|X||
|[LinksAllowed Property](devenv-linksallowed-property.md)|X||
|[MultipleNewLines Property](devenv-multiplenewlines-property.md)|X||
|[PopulateAllFields Property](devenv-populateallfields-property.md)|X||
|[ShowFilter Property](devenv-showfilter-property.md)|X||
|[PromotedActionCategoriesML Property](devenv-promotedactioncategoriesml-property.md)|X|X|
|[DelayedInsert Property](devenv-delayedinsert-property.md)|X||
|[RefreshOnActivate Property](devenv-refreshonactivate-property.md)|X||
|[EntityName Property](devenv-entityname-property.md)|X||
|[EntitySetName Property](devenv-entitysetname-property.md)|X||
|[UsageCategory Property](devenv-usagecategory-property.md)|X||
|[ApplicationArea Property](devenv-applicationarea-property.md)|X||
|[AccessByPermission Property](devenv-accessbypermission-property.md)|X||
|[ODataEDMType Property](devenv-odataedmtype-property.md)|X|X|
|[ODataKeyFields Property](devenv-odatakeyfields-property.md)|X||

## Container control properties
The following properties apply to Container controls on a page.

|Property Name|Page Object|Page Extension Object|
|-------------|-----------|---------------------|
|[CaptionML Property](devenv-captionml-property.md)|X|X|
|[ContainerType Property](devenv-containertype-property.md)|X|X|
|[Description Property](devenv-description-property.md)|X|X|

## Group control properties
The following properties apply to Group controls on a page.

|Property Name|Page Object|Page Extension Object|
|-------------|-----------|---------------------|
|[Visible Property](devenv-visible-property.md)|X|X|
|[Editable Property](devenv-editable-property.md)|X||
|[CaptionML Property](devenv-captionml-property.md)|X|X|
|[Enabled Property](devenv-enabled-property.md)|X|X|
|[Description Property](devenv-description-property.md)|X||
|[InstructionalTextML Property](devenv-instructionaltextml-property.md)|X|X|
|[GridLayout Property](devenv-gridlayout-property.md)|X||
|[IndentationColumn Property](devenv-indentationcolumnname-property.md)|X||
|[IndentationControls Property](devenv-indentationcontrols-property.md)|X||
|[FreezeColumn Property](devenv-freezecolumnid-property.md)|X|X|
|[ShowAsTree Property](devenv-showastree-property.md)|X||
|[ShowCaption Property](devenv-showcaption-property.md)|X||

## Field control properties
The following properties apply to Field controls on a page.

|Property Name|Page Object|Page Extension Object|
|-------------|-----------|---------------------|
|[Visible Property](devenv-visible-property.md)|X|X|
|[Description Property](devenv-description-property.md)|X|X|
|[CaptionML Property](devenv-captionml-property.md)|X|X|
|[AutoFormatType Property](devenv-autoformattype-property.md)|X||
|[AutoFormatExpression Property](devenv-autoformatexpression-property.md)|X||
|[BlankNumbers Property](devenv-blanknumbers-property.md)|X||
|[BlankZero Property](devenv-blankzero-property.md)|X||
|[SignDisplacement Property](devenv-signdisplacement-property.md)|X||
|[MinValue Property](devenv-minvalue-property.md)|X||
|[MaxValue Property](devenv-maxvalue-property.md)|X||
|[CaptionClass Property](devenv-captionclass-property.md)|X|X|
|[NotBlank Property](devenv-notblank-property.md)|X||
|[Numeric Property](devenv-numeric-property.md)|X||
|[CharAllowed Property](devenv-charallowed-property.md)|X||
|[DateFormula Property](devenv-dateformula-property.md)|X||
|[ValuesAllowed Property](devenv-valuesallowed-property.md)|X||
|[TableRelation Property](devenv-tablerelation-property.md)|X||
|[OptionCaptionML Property](devenv-optioncaptionml-property.md)|X||
|[ClosingDates Property](devenv-closingdates-property.md)|X|X|
|[DecimalPlaces Property](devenv-decimalplaces-property.md)|X||
|[AccessByPermission Property](devenv-accessbypermission-property.md)|X||
|[ExtendedDataType Property](devenv-Extendeddatatype-property.md)|X||
|[Width Property](devenv-width-property.md)|X|X|
|[Enabled Property](devenv-enabled-property.md)|X|X|
|[Editable Property](devenv-editable-property.md)|X||
|[HideValue Property](devenv-hidevalue-property.md)|X|X|
|[ShowMandatory Property](devenv-showmandatory-property.md)|X||
|[MultiLine Property](devenv-multiline-property.md)|X||
|[ShowCaption Property](devenv-showcaption-property.md)|X|X|
|[ApplicationArea Property](devenv-applicationarea-property.md)|X|X|
|[LookupPageId Property](devenv-lookuppageid-property.md)|X||
|[DrillDownPageId Property](devenv-drilldownpageid-property.md)|X||
|[Importance Property](devenv-importance-property.md)|X|X|
|[ToolTipML Property](devenv-tooltipml-property.md)|X|X|
|[QuickEntry Property](devenv-quickentry-property.md)|X|X|
|[Lookup Property](devenv-lookup-property.md)|X||
|[DrillDown Property](devenv-drilldown-property.md)|X||
|[AssistEdit Property](devenv-assistedit-property.md)|X||
|[RowSpan property](devenv-rowspan-property.md)|X||
|[ColumnSpan Property](devenv-columnspan-property.md)|X||
|[Style Property](devenv-style-property.md)|X|X|
|[StyleExpr Property](devenv-styleexpr-property.md)|X|X|
|[Image Property](devenv-image-property.md)|X||
|[ODataEDMType Property](devenv-odataedmtype-property.md)|X|X|

## Part control properties
The following properties apply to Part controls on a page.

|Property Name|Page Object|Page Extension Object|
|-------------|-----------|---------------------|
|[Visible Property](devenv-visible-property.md)|X|X|
|[Enabled Property](devenv-enabled-property.md)|X|X|
|[Editable Property](devenv-editable-property.md)|X||
|[CaptionML Property](devenv-captionml-property.md)|X|X|
|[ApplicationArea Property](devenv-applicationarea-property.md)|X|X|
|[ToolTipML Property](devenv-tooltipml-property.md)|X|X|
|[SubPageView Property](devenv-subpageview-property.md)|X||
|[SubPageLink Property](devenv-subpagelink-property.md)|X||
|[ShowFilter Property](devenv-showfilter-property.md)|X||
|[UpdatePropagation Property](devenv-updatepropagation-property.md)|X||
|[Provider Property](devenv-providerid-property.md)|X||
|[AccessByPermission Property](devenv-accessbypermission-property.md)|X||
|[Description Property](devenv-description-property.md)|X||
|[EntityName Property](devenv-entityname-property.md)|X||
|[EntitySetName Property](devenv-entitysetname-property.md)|X||


## ActionGroup properties
The following properties apply to ActionGroups.

|Property Name|Page Object|Page Extension Object|
|-------------|-----------|---------------------|
|[CaptionML Property](devenv-captionml-property.md)|X|X|
|[ToolTipML Property](devenv-tooltipml-property.md)|X|X|
|[Description Property](devenv-description-property.md)|X|X|
|[Enabled Property](devenv-enabled-property.md)|X|X|
|[Visible Property](devenv-visible-property.md)|X|X|
|[Image Property](devenv-image-property.md)|X||

## Action properties
The following properties apply to Actions.

|Property Name|Page Object|Page Extension Object|
|-------------|-----------|---------------------|
|[CaptionML Property](devenv-captionml-property.md)|X|X|
|[ToolTipML Property](devenv-tooltipml-property.md)|X|X|
|[Description Property](devenv-description-property.md)|X|X|
|[Visible Property](devenv-visible-property.md)|X|X|
|[Enabled Property](devenv-enabled-property.md)|X|X|
|[Image Property](devenv-image-property.md)|X||
|[RunPageMode Property](devenv-runpagemode-property.md)|X||
|[AccessByPermission Property](devenv-accessbypermission-property.md)|X||
|[ApplicationArea Property](devenv-applicationarea-property.md)|X|X|
|[Promoted Property](devenv-promoted-property.md)|X|X|
|[PromotedIsBig Property](devenv-promotedisbig-property.md)|X|X|
|[PromotedOnly Property](devenv-promotedonly-property.md)|X|X|
|[PromotedCategory Property](devenv-promotedcategory-property.md)|X|X|
|[Scope Property](devenv-scope-property.md)|X||
|[Ellipsis Property](devenv-ellipsis-property.md)|X||
|[ShortcutKey Property](devenv-shortcutkey-property.md)|X||
|[RunObject Property](devenv-runobject-property.md)|X||
|[RunPageView Property](devenv-runpageview-property.md)|X||
|[RunPageLink Property](devenv-runpagelink-property.md)|X||
|[RunPageOnRec Property](devenv-runpageonrec-property.md)|X||
|[InFooterBar Property](devenv-infooterbar-property.md)|X|X|
|[Gesture Property](devenv-gesture-property.md)|X||


## Separator properties
The following properties apply to Separators.

|Property Name|Page Object|Page Extension Object|
|-------------|-----------|---------------------|
|[CaptionML Property](devenv-captionml-property.md)|X|X|

## See Also
[Properties](devenv-properties.md)  
[Page Object](../devenv-page-object.md)  
[Page Extension Object](../devenv-page-ext-object.md)  
[Report Object](../devenv-report-object.md)  
[Table and Table Extension Properties](devenv-table-properties.md)

-->
