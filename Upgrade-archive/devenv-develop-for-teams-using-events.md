---
title: "Developing Pages and Tables for Microsoft Teams Integration using Events"
description: Explains how to use events to add custom fields to a Business Central card in Teams
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Developing for Microsoft Teams Using Events

[!INCLUDE [team_preview](includes/teams_preview.md)]

This article explains how to use events to customize the fields shown in a Teams card for a record. Business Central offers the following events for Teams integration:

|Event|Description|
|-----|-----------|
|OnAfterGetSummaryFields|Use this event to specify a custom set of fields from the same table as the record. Using this method you can add more fields than are those fields specified by the  `Brick` field group on the source table. For example, you could add fields that are added to the source table by a table extension.|
|OnAfterGetPageSummary |Use this event to modify fields and their values that are already selected for the card by the platform. For example, you could change the captions or value of a field.|

<!--

|OnBeforeGetPageSummary|This is ideal for overriding all data for a Card by specifying a custom set of key-value pairs that will be displayed. The platform will not attempt to select any list of fields or their corresponding values if you subscribe to this event.|-->
The events are part of the [Page Summary Provider](https://github.com/microsoft/ALAppExtensions/blob/master/Modules/System/Page%20Summary%20Provider/README.md) module of the Microsoft System Application.

> [!NOTE]
> In most cases, we recommend you set the `Brick` field group instead of using events to define card content. This ensures a consistent experience across the Business Central Web client, mobile devices, and Teams.

## Event flow

The following figure illustrates the sequence of the events and operations involved in building the card in Teams. The flow has been simplified for illustration purposes.

![Sequence of events and operations for building a card in Teams](media/teams-events-flow-v17.png)

<!--
## OnBeforeGetPageSummary event

The OnBeforeGetPageSummary event gives you the most control over the fields and data that appears in the card. With this event, you specify a complete set of fields as key-value pairs using JSON Array. Only these fields will appear on the card, even if the source table has a `Brick` field group or other extensions include code that modifies the card.

#### Syntax

The OnBeforeGetPageSummary event subscription has the following syntax:

```
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Summary Provider", 'OnBeforeGetPageSummary', '', false, false)]
local procedure OnBeforeGetPageSummary(PageId: Integer; RecId: RecordId; var FieldsJsonArray: JsonArray; Handled: Boolean);
```

#### Parameters

|Parameter|Description|
|---------|-----------|
|`PageId`|The ID of the page for which to retrieve page summary.|
|`RecId`|The underlying record ID of the source table for the page being retrieved, based on the bookmark.|
|`FieldsJsonArray`|A JSON array that includes the fields and values to display on the card, if the event is handled.|
|`Handled`|Specifies whether the event has been handled and no further execution should occur.|

#### Behavior and recommended use

This event is raised before platform tries to get summary fields for the card from the table, for example, from the `Brick` field group. So when you subscribe to this event, the fields in the `Brick` field group aren't used. Subscribing to this event prohibits other extensions from adding, modifying, or removing summary fields on the card.

For these reasons, use this event only if you don't want to use any fields of the source table in the card.

#### Example

The following code example uses the OnBeforeGetPageSummary event to change the fields on a Teams card, as shown in the following table:

|Before|After|
|------|-----|
|![Vendor card before OnBeforeGetPageSummary event](media/teams-card-vendor-before-1.png)|![Vendor card after OnBeforeGetPageSummary event](media/teams-card-vendor-after-1.png)|


```
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Summary Provider", 'OnBeforeGetPageSummary', '', false, false)]
local procedure OnBeforeGetPageSummary(PageId: Integer; RecId: RecordId; FieldsJsonArray: JsonArray; Handled: Boolean)
var
    Vendor: Record Vendor;
begin
    if PageId <> Page::"Vendor Card" then
        exit;

    if not Vendor.Get(RecId) then
        exit;

    AddField(FieldsJsonArray, 'Name', Vendor.Name, 'Text');
    AddField(FieldsJsonArray, 'Note', 'Added by extension', 'Text');
    AddField(FieldsJsonArray, 'Address', Vendor.Address, 'Text');
    AddField(FieldsJsonArray, 'Phone No.', Vendor."Phone No.", 'Text');

    Handled := true;
end;

local procedure AddField(var FieldsJsonArray: JsonArray; Caption: Text; FieldValue: Text; FieldType: Text)
var
    FieldsJsonObject: JsonObject;
begin
    FieldsJsonObject.Add('caption', Caption);
    FieldsJsonObject.Add('fieldValue', FieldValue);
    FieldsJsonObject.Add('fieldType', FieldType);
    FieldsJsonArray.Add(FieldsJsonObject);
end;
```
-->
## OnAfterGetSummaryFields event

The OnAfterGetSummaryFields event lets you add or remove from the set of fields selected by the platform. For example, if the platform automatically selects fields based on its `Brick` field group, use this event to add fields from the same table, which are not part of the `Brick` field group.

#### Syntax

```
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Summary Provider", 'OnAfterGetSummaryFields', '', false, false)]
local procedure OnAfterGetSummaryFields(PageId: Integer; RecId: RecordId; var FieldList: List of [Integer]);
```

#### Parameters

|Parameter|Description|
|---------|-----------|
|`PageId`|The ID of the page object in Business Central that the card is generated for.|
|`RecId`|The underlying record ID in the source table for the page being retrieved, based on the bookmark.|
|`FieldList`|The list of fields that will be returned.|

#### Behavior and recommended use

This event is raised after the platform gets the summary fields from the table. <!--It's not raised if OnBeforeGetPageSummary event has been handled.-->

The event the ideal for specifying a custom set of fields from the same table. It enables the platform to fetch the corresponding values for the current record. If you extended a table with fields, use this event to add the fields to the card.

Here are some considerations, when using this event:

- Use the FieldList to add or remove individual fields you want to show on the card in Teams.
- Fields on the card in Teams are shown in the order specified the `FieldList`.
- Don't remove all fields from the list, because you'll be removing fields that are added by other partner extensions.

#### Example

The following code example uses the OnAfterGetSummaryFields event to change the fields on a Teams card, as shown in the following table:

|Before|After|
|------|-----|
|![Vendor card before OnAfterGetSummaryFields event](media/teams-card-vendor-before-1.png)|![Vendor card after OnAfterGetSummaryFields event](media/teams-card-vendor-after-2.png)|

```
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Summary Provider", 'OnAfterGetSummaryFields', '', false, false)]
local procedure OnAfterGetSummaryFields(PageId: Integer; RecId: RecordId; var FieldList: List of [Integer])
var
    Vendor: Record Vendor;
begin
    if PageId <> Page::"Vendor Card" then
        exit;

    // Remove Balance Due  details 
    FieldList.Remove(Vendor.FieldNo("Balance Due (LCY)"));
    FieldList.Remove(Vendor.FieldNo("Balance (LCY)"));

    // Add contact number
    FieldList.Add(Vendor.FieldNo("Phone No."));

    // Add new field "Vendor Role Name" from extension
    FieldList.Add(Vendor.FieldNo("Vendor Role Name"));
end;
```

In the code, the **Vendor Role Name** field is defined in a table extension object that extends the **Vendor** table.

## OnAfterGetPageSummary event

This event allows you to modify, add, or remove fields included in the card through the direct access to the FieldsJsonArray.

#### Syntax

```
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Summary Provider", 'OnAfterGetPageSummary', '', false, false)]
local procedure OnAfterGetPageSummary(PageId: Integer; RecId: RecordId; var FieldsJsonArray: JsonArray);
```

#### Parameters

|Parameter|Description|
|---------|-----------|
|`PageId`|The ID of the page for which to retrieve page summary.|
|`RecId`|The underlying record ID of the source table for the page being retrieved, based on the bookmark.|
|`FieldsJsonArray`|A Json array that lists the fields to include in the card, overriding the current fields and values set for the card. |

#### Behavior and recommended use

This event is ideal for modifying the list of fields and their values that are selected by the platform.

Use the event to change the value of existing fields or to add fields that don't already exist on the record.

#### Example

The following code example uses the OnAfterGetPageSummary event to change the fields on a Teams card, as shown in the following table:

|Before|After|
|------|-----|
|![Vendor card before OnAfterGetPageSummary event](media/teams-card-vendor-before-1.png)|![Vendor card after OnAfterGetPageSummary event](media/teams-card-vendor-after-3.png)|

```
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Summary Provider", 'OnAfterGetPageSummary', '', false, false)]
local procedure OnAfterGetPageSummary(PageId: Integer; RecId: RecordId; var FieldsJsonArray: JsonArray)
var
    FieldJsonToken: JsonToken;
    CaptionToken: JsonToken;
    fieldNo: Integer;
begin
    if PageId <> Page::"Vendor Card" then
        exit;

    // Change value of field caption
    for fieldNo := 0 to FieldsJsonArray.Count() - 1 do begin
        FieldsJsonArray.Get(fieldNo, FieldJsonToken);
        FieldJsonToken.AsObject().Get('caption', CaptionToken);
        if CaptionToken.AsValue().AsText() = 'Contact' then begin
            // FieldJsonToken.AsObject().Replace('caption', 'Contact Company');
            // FieldJsonToken.AsObject().Replace('fieldValue', 'Microsoft');
            FieldJsonToken.AsObject().Replace('caption', 'Note');
            FieldJsonToken.AsObject().Replace('fieldValue', 'Added by extension');
            FieldsJsonArray.Set(fieldNo, FieldJsonToken);
            exit;
        end;
    end;
end;
```

In the code, the **Vendor Role Name** field is defined in a table extension object that extends the **Vendor** table.

## See Also
[FAQ for Teams Integration](devenv-dev-faq-teams.md)  
[Field Groups](devenv-field-groups.md)  
[Designing List Pages](devenv-designing-list-pages.md)  
[Working With Media on Records](devenv-working-with-media-on-records.md)  
