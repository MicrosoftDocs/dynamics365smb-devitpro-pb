---
title: "AppSourceCop Info AS0125"
description: "Changes affecting the XLIFF translation ID of an object or object member that has been published are not allowed, because this will break the translations provided by dependent extensions for your extension."
ms.author: solsen
ms.date: 08/25/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Info AS0125
Changes the XLIFF translation ID are not allowed.

## Description
Changes affecting the XLIFF translation ID of an object or object member that has been published are not allowed, because this will break the translations provided by dependent extensions for your extension.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Altering the XLIFF translation ID can break the translations provided by dependent extensions for your extension. XLIFF translation IDs are used to map text strings to their translations, and any changes to these IDs can result in missing or incorrect translations in dependent extensions. This diagnostic is raised if you're trying to move objects to one app to a propagated dependency, for example, when moving a table. Or when renaming something.

AppSourceCop always compares namespace-aware hashed translation keys. As a result, enabling `TranslationsWithNamespaces`, which is available from Business Central 2026 release wave 2, doesn't by itself trigger this diagnostic.

You can also add a namespace to an existing object without triggering this diagnostic. The exception applies only when:

- The baseline object has no namespace.
- The new version adds a namespace.
- Nothing else that affects the translation ID changes.

The diagnostic is still reported if you move an object to a different namespace, remove its namespace, or combine the namespace addition with an object or member rename in the same version. Learn more in [Include namespaces in translation IDs](../devenv-work-with-translation-files.md#include-namespaces-in-translation-ids).

## How to fix this diagnostic?

Revert the rename of the object, field, or action, or revert the move to another app. If you're adopting namespaces, add the namespace in a separate version from other changes that affect translation IDs.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  