---
title: "AboutText Property"
description: "Sets the text of the entity used in the About box for teaching tips in the UI"
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AboutText Property
> **Version**: _Available or changed with runtime version 7.0._

Sets the text of the entity used in the About box for teaching tips in the UI

## Applies to
-   Page
-   Page Action
-   Page Action Group
-   Page Field
-   Page Part
-   Page Group
-   Request Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

Accepts a plain text value. Markdown or any similar formatting are treated as literals.

## Remarks

- When setting this property, you must also set the [AboutTitle property](devenv-abouttitle-property.md). Both About properties must be specified for the teaching tip to appear.
- The property is ignored at runtime if the current client is not the Web client.
- When setting this property on page objects:  
  - The page teaching tip is not displayed if the page has `PageType` set to `RoleCenter`, `NavigatePage`, `ConfirmationDialog`, `StandardDialog`, `CardPart`, `ListPart`, or `HeadlinePart`. Enable UICop rule [AW0012](../analyzers/uicop-aw0012.md) to prevent this at compile-time. 
  - The page teaching tip is not displayed automatically if the page is run in lookup mode, but it can still be reached from the page caption. Examples include pages run as an advanced lookup, and pages run with `LookupMode` set to `true`.  

- When setting this property on page controls:  
  - The control teaching tip is not shown if the control has a `Visible` property that evaluates to `false`. 
  - The control teaching tip is displayed for field controls only if they represent repeater fields or fields in the content area of the page. It is not displayed for other uses of field controls, such as cues. 
  - The control teaching tip is displayed for actions and action groups on the primary page. It is not displayed for other uses of actions, such as actions on page parts, action tiles, actions displayed in the footer of a `NavigatePage`, RoleCenter navigation menus, or actions displayed in the menu for a record in a list.
  - If the page object is a part that is embedded on the hosting page, the control teaching tip becomes part of the tour on the hosting page. If the part is hosted as a factbox or on a Role Center, then the teaching tip is not displayed. 

> [!NOTE]  
> This property is ignored on Request pages, as reports are not yet supported.

For more information about designing teaching tips and tours, see [Teaching tips and in-app tours for onboarding users](../../administration/onboarding-teaching-tips-tours.md). 

## Example

```al
AboutText = 'Sales invoices appear in this list until they are finalized and posted. After an invoice is posted, find it again in the Posted Sales Invoices list.';

```

## Extending page objects

[Page Extension objects](../devenv-page-ext-object.md) and [Page Customization objects](../devenv-page-customization-object.md) can modify teaching tips defined by the source object:  

- To add a teaching tip to a page or control that does not currently have a teaching tip, set the `AboutText` and `AboutTitle` properties. 
- To change the `AboutText` for a page or control that already has a teaching tip defined in the source object, set the `AboutText` property. 
- To hide a teaching tip for a page or control in the source object, set the About properties to an empty string. 

## See Also

[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[AboutTitle property](devenv-abouttitle-property.md)  
[AboutTextMl property](devenv-abouttextml-property.md)