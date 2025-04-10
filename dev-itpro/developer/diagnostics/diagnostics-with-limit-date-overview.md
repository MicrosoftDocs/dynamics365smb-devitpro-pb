---
title: "Warnings turning into errors overview"
description: ""
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Warnings turning into errors overview

This article lists all the warning diagnostics that will turn or have turned into an error in the specified Business Central release.

|Release|Diagnostics|Message|
|---------|-----------|------|
|2025 release wave 2| - [AL0864](diagnostic-al864.md) <br /> | - The control type 'ChartPart' is not supported.<br />|
|2025 release wave 1| - [AL0755](diagnostic-al755.md) <br />  - [AL0803](diagnostic-al803.md) <br />  - [AL0816](diagnostic-al816.md) <br />  - [AL0818](diagnostic-al818.md) <br />  - [AL0826](diagnostic-al826.md) <br />  - [AL0837](diagnostic-al837.md) <br />  - [AL0845](diagnostic-al845.md) <br /> | - The '{0}' already defines a built-in member called '{1}'. Choose another name for {2} '{1}', or it might cause runtime issues.<br /> - The name of {0} '{1}' conflicts with {0} '{2}' defined in {3} '{4}' by the extension '{5}'. Choose another name for one of them. Otherwise, this might cause runtime issues.<br /> - The property '{0}' cannot be set if the property '{1}' is set to '{2}'.<br /> - The {0} '{1}' already defines an event called '{2}' with the same parameter types in '{3}'.<br /> - The type '{0}' cannot be used as a type argument in this context.<br /> - The symbol '{0}' results in the same translation ID as one or more other symbols. Rename symbol to resolve the problem.<br /> - The {0} '{1}' is already being used. The EntityName and EntityNames property values must be unique.<br />|
|2024 release wave 2| - [AL0545](diagnostic-al545.md) <br />  - [AL0775](diagnostic-al775.md) <br />  - [AL0778](diagnostic-al778.md) <br />  - [AL0780](diagnostic-al780.md) <br />  - [AL0788](diagnostic-al788.md) <br />  - [AL0804](diagnostic-al804.md) <br />  - [AL0805](diagnostic-al805.md) <br />  - [AL0814](diagnostic-al814.md) <br />  - [AL0830](diagnostic-al830.md) <br /> | - An area of type '{0}' is not valid on pages of type '{1}'.<br /> - Try methods should not specify an explicit return value, because the value will be discarded. The actual return value depends on whether the method returns an error or not.<br /> - The implicit conversion will overflow when converting from a 'Guid' to a '{0}' which is shorter than the converted textual representation of a 'Guid'.<br /> - It is not allowed to call `ModifyAll` on a field of FieldClass='{0}'.<br /> - An area of type '{0}' is only valid on pages of type(s) '{1}'.<br /> - You cannot reference the {0} '{1}' because it is defined in the page customization '{2}'.<br /> - The object ID '{0}' should not be surrounded with quotes.<br /> - The source of a column cannot be a flow filter.<br /> - The method '{0}' is not supported as the implementation for the interface method because it is a try function.<br />|
|2024 release wave 1| - [AL0700](diagnostic-al700.md) <br />  - [AL0702](diagnostic-al702.md) <br />  - [AL0751](diagnostic-al751.md) <br />  - [AL0753](diagnostic-al753.md) <br />  - [AL0758](diagnostic-al758.md) <br />  - [AL0782](diagnostic-al782.md) <br /> | - Dependency '{0}' must be referenced in the property '{1}' rather than as an explicit dependency.<br /> - Dependency '{0}' is referenced in the property '{1}' and as an explicit dependency. Remove the explicit dependency.<br /> - Enum values can't be nested. Use '{0}' instead.<br /> - The name of a dataitem cannot be empty because it can cause runtime errors.<br /> - The name of {0} '{1}' conflicts with {0} '{2}' defined in {3} '{4}' by the extension '{5}'. Choose another name for one of them. Otherwise, this might cause runtime issues.<br /> - A page extension is only allowed to access control add-ins defined within its own extension scope.<br />|
|2023 release wave 2| - [AL0731](diagnostic-al731.md) <br />  - [AL0733](diagnostic-al733.md) <br />  - [AL0743](diagnostic-al743.md) <br />  - [AL0745](diagnostic-al745.md) <br />  - [AL1078](diagnostic-al1078.md) <br /> | - The name '{0}' does not exist in the current context.<br /> - Access modifier '{0}' is not allowed for member '{1}' in the context of object type '{2}'.<br /> - The property '{0}' is not valid for action '{1}' defined in control '{2}' of type '{3}'.<br /> - The property '{0}' is not valid for action '{1}' defined in a report request page.<br /> - Key vault URL is not a valid Azure key vault URL. A valid key vault URL must use HTTPS and point to the Azure key vault domain.<br />|
|2023 release wave 1| - [AL0711](diagnostic-al711.md) <br /> | - A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'. Duplicate member names are not allowed when defining CueActions.<br />|
|2022 release wave 2| - [AL0660](diagnostic-al660.md) <br />  - [AL0677](diagnostic-al677.md) <br />  - [AL0715](diagnostic-al715.md) <br /> | - The property '{0}' cannot be customized.<br /> - The member '{0}' in object '{1}' cannot be declared as protected in object type '{2}'.<br /> - The {0} name '{1}' is reserved for future AL language features.<br />|
|2022 release wave 1| - [AL0692](diagnostic-al692.md) <br />  - [AL0694](diagnostic-al694.md) <br /> | - The primary key '{0}' on table '{1}' cannot be obsolete. All related properties will have no effect.<br /> - The field '{0}' which is part of the primary key of table '{1}' cannot be obsolete. All related properties will have no effect.<br />|
|2021 release wave 2| - [AL0613](diagnostic-al613.md) <br /> | - Wrong signature. Correct signature for '{0}' is '{1}'.<br />|
|2021 release wave 1| - [AL0639](diagnostic-al639.md) <br /> | - 'Variant' is not a valid column type for column '{0}' in report '{1}'.<br />|
|2020 release wave 1| - [AL0559](diagnostic-al559.md) <br /> | - A Part type page cannot contain other parts.<br />|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  