---
title: "Compiler Error AL0185"
description: "{0} '{1}' is missing."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0185

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

{0} '{1}' is missing.


## Description
The referenced application object does not exist.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

The referenced application object (such as a table, page, or codeunit) can't be found.

To fix it:

1. Check the spelling and quoting of the object name. Object names with spaces must be quoted, for example `Page "Customer Card"`.
2. If the object belongs to another extension, add that extension to the `dependencies` in **app.json**.
3. Confirm the object still exists and wasn't renamed or removed.
4. Use IntelliSense or **Go to Definition** (F12) to verify the object name.

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  