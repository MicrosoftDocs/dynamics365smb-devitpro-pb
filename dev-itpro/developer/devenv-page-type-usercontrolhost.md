---
title: The UserControlHost page type
description: Learn how to use the UserControlHost page type in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.date: 03/05/2025
ms.reviewer: solsen
---

# The UserControlHost page type

With [!INCLUDE [prod_short](includes/prod_short.md)] runtime 15.0, you can add the `UserControlHost` page type. The `UserControlHost` is used to render a single user control in the client. The layout is optimized by the client to maximize the available space for the user control.

The `UserControlHost` page type can **only** have a single control of type `usercontrol` within the layout `Content` area. Furthermore, you can't specify actions on this page type. Likewise, only a limited number of properties and triggers are available for it and the page type isn't extensible.

## Example

```al
```

## Related information

[Page types and layouts](devenv-page-types-and-layouts.md)  
[Prompt dialog page type](devenv-page-type-promptdialog.md)
