---
title: "Obsolete Tag format."
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0076
Obsolete Tag format.  

## Description
Obsolete Tag must have a specific format.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

### Setting up AppSourceCop to validate the Obsolete Tag

TODO(qutreson)

In order to set up AppSourceCop to detect breaking changes, the version of the extension used as a baseline must be specified in the AppSourceCop.json file using the `version` property. The version specified is the exact version against which the breaking changes are validated. It is also possible to specify the `name` and the `publisher` of the extension in the AppSourceCop.json file.

For example:
```json
{
    "name": "ExtensionName",
    "publisher": "ExtensionPublisher",
    "version": "1.1.0.0"
}
```

The previous version of the extension must be added to the package cache where the symbols for your extension's dependencies are located. The `al.packageCachePath` setting allows you to specify the path to a folder that will act as the cache for the symbol files used by your project. 

## How to fix this diagnostic?

## TODO(qutreson) - mention AS0072 and AS0076.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  