---
title: "Page, Page fields, and Page extension properties"
description: "This article lists properties that apply to the [page object](../devenv-page-object.md), page fields, and [page extension object](../devenv-page-ext-object.md)."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Page, Page Fields, and Page extension properties

This article lists properties that apply to the [page object](../devenv-page-object.md), page fields, and [page extension object](../devenv-page-ext-object.md).

## Object properties

The following properties all apply to the Page object, only some of these properties can be set for a Page extension object as specified below. This list is sorted alphabetically by property name. For Page properties sorted by method on a Page, see [Properties](devenv-properties.md).

|**Property name**|**Extensible**|**Applies to**|
|-----------|------------|----------|
|[AboutText property](devenv-abouttext-property.md)| True| -Page Custom Action <br />  -Page File Upload Action <br />  -Query <br />  -Page <br />  -Page Action <br />  -Page Action Group <br />  -Page Field <br />  -Page Part <br />  -Page Group <br />  -Request Page <br /> |
|[AboutTextML property](devenv-abouttextml-property.md)| True| -Page Custom Action <br />  -Page File Upload Action <br />  -Query <br />  -Page <br />  -Page Action <br />  -Page Action Group <br />  -Page Field <br />  -Page Part <br />  -Page Group <br />  -Request Page <br /> |
|[AboutTitle property](devenv-abouttitle-property.md)| True| -Page Custom Action <br />  -Page File Upload Action <br />  -Query <br />  -Page <br />  -Page Action <br />  -Page Action Group <br />  -Page Field <br />  -Page Part <br />  -Page Group <br />  -Request Page <br /> |
|[AboutTitleML property](devenv-abouttitleml-property.md)| True| -Page Custom Action <br />  -Page File Upload Action <br />  -Query <br />  -Page <br />  -Page Action <br />  -Page Action Group <br />  -Page Field <br />  -Page Part <br />  -Page Group <br />  -Request Page <br /> |
|[AccessByPermission property](devenv-accessbypermission-property.md)| | -Table field <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Page <br />  -Report <br /> |
|[AdditionalSearchTerms property](devenv-additionalsearchterms-property.md)| True| -Page <br />  -Report <br /> |
|[AdditionalSearchTermsML property](devenv-additionalsearchtermsml-property.md)| True| -Page <br />  -Report <br /> |
|[AllowedFileExtensions property](devenv-allowedfileextensions-property.md)| True| -Page File Upload Action <br /> |
|[AllowMultipleFiles property](devenv-allowmultiplefiles-property.md)| True| -Page File Upload Action <br /> |
|[AnalysisModeEnabled property](devenv-analysismodeenabled-property.md)| | -Page <br /> |
|[ApplicationArea property](devenv-applicationarea-property.md)| True| -Page Label <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Page User Control <br />  -Page <br />  -Report <br /> |
|[AssistEdit property](devenv-assistedit-property.md)| True| -Page Field <br /> |
|[AutoFormatExpression property](devenv-autoformatexpression-property.md)| | -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[AutoFormatType property](devenv-autoformattype-property.md)| | -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[AutoSplitKey property](devenv-autosplitkey-property.md)| | -Page <br />  -Request Page <br /> |
|[BlankNumbers property](devenv-blanknumbers-property.md)| | -Table field <br />  -Page Field <br /> |
|[BlankZero property](devenv-blankzero-property.md)| True| -Table field <br />  -Page Field <br /> |
|[Caption property](devenv-caption-property.md)| True| -Table <br />  -Table field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[CaptionClass property](devenv-captionclass-property.md)| True| -Table field <br />  -Page Label <br />  -Page Field <br /> |
|[CaptionML property](devenv-captionml-property.md)| True| -Table <br />  -Table field <br />  -Page Field <br />  -Field Group <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Action <br />  -Page Action Separator <br />  -Page Action Group <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report Column <br />  -Enum Value <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Page View <br />  -Report Layout <br />  -Profile <br />  -Enum Type <br />  -Permission Set <br /> |
|[CardPageId property](devenv-cardpageid-property.md)| | -Page <br />  -Request Page <br /> |
|[ChangeTrackingAllowed property](devenv-changetrackingallowed-property.md)| | -Page <br /> |
|[CharAllowed property](devenv-charallowed-property.md)| | -Table field <br />  -Page Field <br /> |
|[ClearActions property](devenv-clearactions-property.md)| | -Page Customization <br /> |
|[ClearLayout property](devenv-clearlayout-property.md)| | -Page Customization <br /> |
|[ClearViews property](devenv-clearviews-property.md)| | -Page Customization <br /> |
|[ClosingDates property](devenv-closingdates-property.md)| True| -Table field <br />  -Page Field <br /> |
|[ColumnSpan property](devenv-columnspan-property.md)| | -Page Label <br />  -Page Field <br /> |
|[ContextSensitiveHelpPage property](devenv-contextsensitivehelppage-property.md)| True| -Page <br />  -Request Page <br />  -Query <br /> |
|[CuegroupLayout property](devenv-cuegrouplayout-property.md)| | -Page Group <br /> |
|[CustomActionType property](devenv-customactiontype-property.md)| | -Page Custom Action <br /> |
|[DataAccessIntent property](devenv-dataaccessintent-property.md)| | -Page <br />  -Report <br />  -Query <br /> |
|[DataCaptionExpression property](devenv-datacaptionexpression-property.md)| True| -Page <br />  -Request Page <br /> |
|[DataCaptionFields property](devenv-datacaptionfields-property.md)| True| -Table <br />  -Page <br />  -Request Page <br /> |
|[DateFormula property](devenv-dateformula-property.md)| | -Table field <br />  -Page Field <br /> |
|[DecimalPlaces property](devenv-decimalplaces-property.md)| | -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[DelayedInsert property](devenv-delayedinsert-property.md)| | -Page <br /> |
|[DeleteAllowed property](devenv-deleteallowed-property.md)| True| -Page <br />  -Request Page <br /> |
|[Description property](devenv-description-property.md)| True| -Codeunit <br />  -Table field <br />  -Table key <br />  -Page <br />  -Page Action <br />  -Page Action Area <br />  -Page Action Group <br />  -Page Area <br />  -Page Field <br />  -Page Group <br />  -Page Label <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Query <br />  -Query Column <br />  -Query Data Item <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Table <br />  -Xml Port <br />  -Xml Port Text Element <br />  -Xml Port Field Element <br />  -Xml Port Table Element <br />  -Xml Port Field Attribute <br />  -Xml Port Text Attribute <br />  -Profile <br /> |
|[DrillDown property](devenv-drilldown-property.md)| | -Page Field <br /> |
|[DrillDownPageId property](devenv-drilldownpageid-property.md)| True| -Table <br />  -Page Field <br /> |
|[Editable property](devenv-editable-property.md)| | -Table field <br />  -Page <br />  -Request Page <br />  -Page Label <br />  -Page Field <br />  -Page Group <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Part <br /> |
|[Ellipsis property](devenv-ellipsis-property.md)| | -Page Action <br />  -Page Custom Action <br /> |
|[Enabled property](devenv-enabled-property.md)| | -Table field <br />  -Table key <br />  -Page Label <br />  -Page Field <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Action Group <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Profile <br /> |
|[EntityCaption property](devenv-entitycaption-property.md)| | -Page <br />  -Query <br /> |
|[EntityCaptionML property](devenv-entitycaptionml-property.md)| | -Page <br />  -Query <br /> |
|[EntityName property](devenv-entityname-property.md)| | -Page <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Query <br /> |
|[EntitySetCaption property](devenv-entitysetcaption-property.md)| | -Page <br />  -Query <br /> |
|[EntitySetCaptionML property](devenv-entitysetcaptionml-property.md)| | -Page <br />  -Query <br /> |
|[EntitySetName property](devenv-entitysetname-property.md)| | -Page <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Query <br /> |
|[ExtendedDatatype property](devenv-extendeddatatype-property.md)| | -Table field <br />  -Page Field <br /> |
|[Extensible property](devenv-extensible-property.md)| | -Report <br />  -Enum Type <br />  -Table <br />  -Page <br /> |
|[FileUploadAction property](devenv-fileuploadaction-property.md)| | -Page Field <br />  -Page Group <br />  -Page Part <br /> |
|[FileUploadRowAction property](devenv-fileuploadrowaction-property.md)| | -Page Group <br /> |
|[Filters property](devenv-filters-property.md)| | -Page View <br /> |
|[FlowCaption property](devenv-flowcaption-property.md)| | -Page Custom Action <br /> |
|[FlowEnvironmentId property](devenv-flowenvironmentid-property.md)| | -Page Custom Action <br /> |
|[FlowId property](devenv-flowid-property.md)| | -Page Custom Action <br /> |
|[FlowTemplateCategoryName property](devenv-flowtemplatecategoryname-property.md)| | -Page Custom Action <br /> |
|[FlowTemplateId property](devenv-flowtemplateid-property.md)| | -Page Custom Action <br /> |
|[FreezeColumn property](devenv-freezecolumn-property.md)| True| -Page Group <br /> |
|[Gesture property](devenv-gesture-property.md)| | -Page Action <br />  -Page File Upload Action <br /> |
|[GridLayout property](devenv-gridlayout-property.md)| | -Page Group <br /> |
|[HelpLink property](devenv-helplink-property.md)| | -Page <br />  -Request Page <br />  -Query <br /> |
|[HideValue property](devenv-hidevalue-property.md)| True| -Page Label <br />  -Page Field <br /> |
|[Image property](devenv-image-property.md)| | -Page Field <br />  -Page Action <br />  -Page Action Group <br />  -Page File Upload Action <br /> |
|[Importance property](devenv-importance-property.md)| True| -Page Label <br />  -Page Field <br /> |
|[IndentationColumn property](devenv-indentationcolumn-property.md)| True| -Page Group <br /> |
|[IndentationControls property](devenv-indentationcontrols-property.md)| True| -Page Group <br /> |
|[InFooterBar property](devenv-infooterbar-property.md)| True| -Page Action <br />  -Page File Upload Action <br /> |
|[InherentEntitlements property](devenv-inherententitlements-property.md)| | -Query <br />  -Report <br />  -Xml Port <br />  -Table <br />  -Codeunit <br />  -Page <br /> |
|[InherentPermissions property](devenv-inherentpermissions-property.md)| | -Query <br />  -Report <br />  -Xml Port <br />  -Table <br />  -Codeunit <br />  -Page <br /> |
|[InsertAllowed property](devenv-insertallowed-property.md)| True| -Page <br />  -Request Page <br /> |
|[InstructionalText property](devenv-instructionaltext-property.md)| True| -Page <br />  -Request Page <br />  -Page Field <br />  -Page Group <br /> |
|[InstructionalTextML property](devenv-instructionaltextml-property.md)| True| -Page <br />  -Request Page <br />  -Page Field <br />  -Page Group <br /> |
|[IsHeader property](devenv-isheader-property.md)| | -Page Action Separator <br /> |
|[IsPreview property](devenv-ispreview-property.md)| | -Page <br /> |
|[LinksAllowed property](devenv-linksallowed-property.md)| | -Page <br />  -Request Page <br /> |
|[Lookup property](devenv-lookup-property.md)| | -Page Field <br /> |
|[LookupPageId property](devenv-lookuppageid-property.md)| True| -Table <br />  -Page Field <br /> |
|[MaxValue property](devenv-maxvalue-property.md)| | -Table field <br />  -Page Field <br /> |
|[MinValue property](devenv-minvalue-property.md)| | -Table field <br />  -Page Field <br /> |
|[ModifyAllowed property](devenv-modifyallowed-property.md)| True| -Page <br />  -Request Page <br /> |
|[MultiLine property](devenv-multiline-property.md)| | -Page Label <br />  -Page Field <br /> |
|[MultipleNewLines property](devenv-multiplenewlines-property.md)| | -Page <br />  -Request Page <br /> |
|[Multiplicity property](devenv-multiplicity-property.md)| | -Page Part <br /> |
|[NavigationPageId property](devenv-navigationpageid-property.md)| | -Page Field <br /> |
|[NotBlank property](devenv-notblank-property.md)| | -Table field <br />  -Page Field <br /> |
|[Numeric property](devenv-numeric-property.md)| | -Table field <br />  -Page Field <br /> |
|[ObsoleteReason property](devenv-obsoletereason-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Table <br />  -Table field <br />  -Table key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page Field <br />  -Page Action Area <br />  -Page Area <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteState property](devenv-obsoletestate-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Table <br />  -Table field <br />  -Table key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page Field <br />  -Page Action Area <br />  -Page Area <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ObsoleteTag property](devenv-obsoletetag-property.md)| | -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Table <br />  -Table field <br />  -Table key <br />  -Codeunit <br />  -Enum Type <br />  -Enum Value <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Separator <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Group <br />  -Page Label <br />  -Query <br />  -Query Column <br />  -Query Filter <br />  -Report <br />  -Report Data Item <br />  -Report Column <br />  -Request Page <br />  -Xml Port <br />  -Page Field <br />  -Page Action Area <br />  -Page Area <br />  -Page <br />  -Page View <br />  -Profile <br />  -Interface <br />  -Control Add In <br />  -Permission Set <br />  -Field Group <br /> |
|[ODataEDMType property](devenv-odataedmtype-property.md)| True| -Page Field <br /> |
|[ODataKeyFields property](devenv-odatakeyfields-property.md)| | -Page <br /> |
|[OptionCaption property](devenv-optioncaption-property.md)| True| -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[OptionCaptionML property](devenv-optioncaptionml-property.md)| True| -Table field <br />  -Page Field <br />  -Report Column <br /> |
|[OrderBy property](devenv-orderby-property.md)| | -Page View <br />  -Query <br /> |
|[PageType property](devenv-pagetype-property.md)| | -Page <br /> |
|[Permissions property](devenv-permissions-property.md)| | -Codeunit <br />  -Table <br />  -Request Page <br />  -Page <br />  -Xml Port <br />  -Report <br />  -Query <br />  -Permission Set <br />  -Permission Set Extension <br /> |
|[PopulateAllFields property](devenv-populateallfields-property.md)| | -Page <br />  -Request Page <br /> |
|[PromotedActionCategories property](devenv-promotedactioncategories-property.md)| True| -Page <br /> |
|[PromotedActionCategoriesML property](devenv-promotedactioncategoriesml-property.md)| True| -Page <br /> |
|[PromotedCategory property](devenv-promotedcategory-property.md)| True| -Page Action <br /> |
|[PromotedIsBig property](devenv-promotedisbig-property.md)| True| -Page Action <br /> |
|[PromotedOnly property](devenv-promotedonly-property.md)| True| -Page Action <br /> |
|[PromptMode property](devenv-promptmode-property.md)| | -Page <br /> |
|[Provider property](devenv-provider-property.md)| | -Page Part <br />  -Page System Part <br />  -Page Chart Part <br /> |
|[QueryCategory property](devenv-querycategory-property.md)| | -Page <br />  -Query <br /> |
|[QuickEntry property](devenv-quickentry-property.md)| True| -Page Field <br /> |
|[RefreshOnActivate property](devenv-refreshonactivate-property.md)| | -Page <br /> |
|[RowSpan property](devenv-rowspan-property.md)| | -Page Label <br />  -Page Field <br /> |
|[RunObject property](devenv-runobject-property.md)| | -Page Action <br /> |
|[RunPageLink property](devenv-runpagelink-property.md)| | -Page Action <br /> |
|[RunPageMode property](devenv-runpagemode-property.md)| | -Page Action <br /> |
|[RunPageOnRec property](devenv-runpageonrec-property.md)| | -Page Action <br /> |
|[RunPageView property](devenv-runpageview-property.md)| | -Page Action <br /> |
|[SaveValues property](devenv-savevalues-property.md)| | -Page <br />  -Request Page <br /> |
|[SharedLayout property](devenv-sharedlayout-property.md)| | -Page View <br /> |
|[ShortcutKey property](devenv-shortcutkey-property.md)| True| -Page Action <br />  -Page Custom Action <br />  -Page File Upload Action <br /> |
|[ShowAs property](devenv-showas-property.md)| True| -Page Action Group <br /> |
|[ShowAsTree property](devenv-showastree-property.md)| | -Page Group <br /> |
|[ShowCaption property](devenv-showcaption-property.md)| True| -Page Label <br />  -Page Field <br />  -Page Group <br /> |
|[ShowFilter property](devenv-showfilter-property.md)| | -Page <br />  -Request Page <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Part <br /> |
|[ShowMandatory property](devenv-showmandatory-property.md)| True| -Page Field <br /> |
|[SignDisplacement property](devenv-signdisplacement-property.md)| | -Table field <br />  -Page Field <br /> |
|[SourceTable property](devenv-sourcetable-property.md)| | -Page <br />  -Request Page <br /> |
|[SourceTableTemporary property](devenv-sourcetabletemporary-property.md)| | -Page <br />  -Request Page <br /> |
|[Style property](devenv-style-property.md)| True| -Page Label <br />  -Page Field <br /> |
|[StyleExpr property](devenv-styleexpr-property.md)| True| -Page Label <br />  -Page Field <br /> |
|[SubPageLink property](devenv-subpagelink-property.md)| | -Page Part <br />  -Page System Part <br />  -Page Chart Part <br /> |
|[SubPageView property](devenv-subpageview-property.md)| | -Page Part <br />  -Page System Part <br />  -Page Chart Part <br /> |
|[TableRelation property](devenv-tablerelation-property.md)| True| -Table field <br />  -Page Field <br /> |
|[Title property](devenv-title-property.md)| | -Page Field <br /> |
|[ToolTip property](devenv-tooltip-property.md)| True| -Page Label <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action Area <br />  -Page Action <br />  -Page Action Group <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Query Column <br />  -Table field <br /> |
|[ToolTipML property](devenv-tooltipml-property.md)| True| -Page Label <br />  -Page Field <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action Area <br />  -Page Action <br />  -Page Action Group <br />  -Page Custom Action <br />  -Page System Action <br />  -Page File Upload Action <br />  -Query Column <br />  -Table field <br /> |
|[TreeInitialState property](devenv-treeinitialstate-property.md)| True| -Page Group <br /> |
|[UpdatePropagation property](devenv-updatepropagation-property.md)| | -Page Part <br />  -Page System Part <br />  -Page Chart Part <br /> |
|[UsageCategory property](devenv-usagecategory-property.md)| | -Query <br />  -Page <br />  -Report <br /> |
|[ValuesAllowed property](devenv-valuesallowed-property.md)| | -Table field <br />  -Page Field <br /> |
|[Visible property](devenv-visible-property.md)| True| -Page Label <br />  -Page Field <br />  -Page Group <br />  -Page Part <br />  -Page System Part <br />  -Page Chart Part <br />  -Page Action <br />  -Page Action Group <br />  -Page Action Ref <br />  -Page Custom Action <br />  -Page File Upload Action <br />  -Page View <br />  -Page User Control <br /> |


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  