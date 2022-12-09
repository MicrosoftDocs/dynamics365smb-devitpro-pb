---
title: "AppSourceCop Error AS0097"
description: "The publisher name of an extension cannot be changed for extensions targeting a runtime version lower than '8.0' in their app.json file."
ms.author: solsen
ms.custom: na
ms.date: 12/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0097
The publisher name of an extension cannot be changed.

## Description
The publisher name of an extension cannot be changed for extensions targeting a runtime version lower than '8.0' in their app.json file. This will break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Changing the identity of extensions is only supported in Business Central starting from version 2021 release wave 2 which corresponds to the AL runtime version 8.0, see [JSON Files](../devenv-json-files.md#Appjson). For more information about what makes up the identity of an app, see [App Identity](../devenv-app-identity.md).

## How to fix this diagnostic?

In order to fix this diagnostic, you must either:

- change the publisher of the extension in the app.json to match the publisher name used in the baseline,
- update the runtime version in the app.json to be 8.0 or higher.

## Code example triggering the rule

Version 1.0 of the extension:

```JSON
{
    "name": "Extension Name",
    "publisher": "Publisher Name",
    "version": "1.0.0.0",
    "runtime": "7.2",
    // other properties 
}
```

Version 2.0 of the extension:

```JSON
{
    "name": "Extension Name",
    "publisher": "New Publisher Name",
    "version": "2.0.0.0",
    "runtime": "7.2",
    // other properties 
}
```

In version 2.0, the publisher has been renamed from `Publisher Name` to `New Publisher Name` while still targeting runtime 7.2. The rename is not allowed.

## Code example not triggering the rule

Version 1.0 of the extension:

```JSON
{
    "name": "Extension Name",
    "publisher": "Publisher Name",
    "version": "1.0.0.0",
    "runtime": "7.2",
    // other properties 
}
```

Version 2.0 of the extension:

```JSON
{
    "name": "Extension Name",
    "publisher": "New Publisher Name",
    "version": "2.0.0.0",
    "runtime": "8.0",
    // other properties 
}
```

In version 2.0, the publisher has been renamed from `Publisher Name` to `New Publisher Name` and the runtime version has been changed to 8.0. The rename is allowed.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[App Identity](../devenv-app-identity.md)  
