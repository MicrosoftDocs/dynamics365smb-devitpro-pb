---
title: "The previous version of the extension could not be found."
ms.author: solsen
ms.custom: na
ms.date: 08/25/2020
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
# AppSourceCop Rule AS0003
The previous version of the extension could not be found.  

## Description
The previous version of the extension, used as a baseline for detecting breaking changes, could not be found in the package cache folder.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule validates that the version of the extension specified as a baseline for detecting breaking changes can be found in the package cache folder.

### Setting up AppSourceCop to detect breaking changes

In order to set up AppSourceCop to detect breaking changes, the version of the extension used as a baseline must be specified in the AppSourceCop.json file using the `version` property. The version specified is the exact version against which the breaking changes are validated. It is also possible to specify the `name` and the `publisher` of the extension in the AppSourceCop.json file.

For example:
```
{
    "name": "ExtensionName",
    "publisher": "ExtensionPublisher",
    "version": "1.1.0.0"
}
```

The previous version of the extension must be added to the package cache where the symbols for your extension's dependencies are located. The `al.packageCachePath` setting allows you to specify the path to a folder that will act as the cache for the symbol files used by your project. 

## How to fix this diagnostic?

If you do not want to detect breaking changes in your extension, remove the property `version` in the AppSourceCop.json file.

If you want to detect breaking changes, verify that the version specified in the AppSourceCop.json file is correct and that the extension can be found in the package cache.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
