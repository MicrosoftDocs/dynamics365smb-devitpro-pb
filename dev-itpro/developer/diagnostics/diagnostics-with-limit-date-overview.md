---
title: "Warnings Turning into Errors Overview"
description: ""
ms.author: solsen
ms.custom: na
ms.date: 07/07/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Warnings Turning into Errors Overview

This topic lists all the warning diagnostics that will turn or have turned into an error in the specified Business Central release.

|Release|Diagnostics|Message|
|---------|-----------|------|
|2023 release wave 2| - [AL0731](diagnostic-al731.md) <br /> | - The name '{0}' does not exist in the current context.<br />|
|2023 release wave 1| - [AL0711](diagnostic-al711.md) <br /> | - A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'. Duplicate member names are not allowed when defining CueActions.<br />|
|2022 release wave 2| - [AL0660](diagnostic-al660.md) <br />  - [AL0677](diagnostic-al677.md) <br />  - [AL0715](diagnostic-al715.md) <br /> | - The property '{0}' cannot be customized.<br /> - The member '{0}' in object '{1}' cannot be declared as protected in object type '{2}'.<br /> - The {0} name '{1}' is reserved for future AL language features.<br />|
|2022 release wave 1| - [AL0692](diagnostic-al692.md) <br />  - [AL0694](diagnostic-al694.md) <br /> | - The primary key '{0}' on table '{1}' cannot be obsolete. All related properties will have no effect.<br /> - The field '{0}' which is part of the primary key of table '{1}' cannot be obsolete. All related properties will have no effect.<br />|
|2021 release wave 2| - [AL0613](diagnostic-al613.md) <br /> | - Wrong signature. Correct signature for '{0}' is '{1}'.<br />|
|2021 release wave 1| - [AL0639](diagnostic-al639.md) <br /> | - 'Variant' is not a valid column type for column '{0}' in report '{1}'.<br />|
|2020 release wave 1| - [AL0559](diagnostic-al559.md) <br /> | - A Part type page cannot contain other parts.<br />|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  