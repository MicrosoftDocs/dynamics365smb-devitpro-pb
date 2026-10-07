---
title: "Compiler Error AL0297"
description: "The application object identifier '{0}' is not valid."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0297

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The application object identifier '{0}' is not valid. It must be within the allowed ranges '{1}'.


## Description
An application object's ID must be within the idRange specified in the manifest.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This error means an object's ID falls outside the ranges declared in the `idRanges` setting of your `app.json`. Every object must use an ID within one of the allowed ranges.

To fix it, either change the object ID to fall within an existing range, or extend the range in `app.json`. For per-tenant extensions, use IDs in the `50000`–`99999` range:

```json
"idRanges": [
  {
    "from": 50100,
    "to": 50149
  }
]
```

Then give the object an ID within that range:

```al
table 50100 "Expense Report"
{
    // ...
}
```

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  