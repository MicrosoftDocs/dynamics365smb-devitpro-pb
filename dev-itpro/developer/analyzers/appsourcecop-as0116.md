---
title: "AppSourceCop Error AS0116"
description: "The source application for this moved symbol cannot be found."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0116
Source application for the moved symbol cannot be found.

## Description
The source application for this moved symbol cannot be found.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The source application for a moved symbol can't be found. This is important because when a symbol is moved from one application to another, it is crucial to maintain a reference to the source application to ensure that dependent extensions can locate and use the symbol correctly. If the source application can't be found, it might be considered an unwanted take over of a symbol that is not being released for moving.

## How to fix this diagnostic?

Ensure that the source application for the moved symbol is correctly referenced and available. Here are the steps to fix this diagnostic:

1. Identify the symbol that has been moved and is causing the AS0116 warning.
2. Verify that the source application containing the original symbol is correctly referenced in your extension.
3. Ensure that the source application is available and accessible.
4. Update the `MovedFrom` property in the destination application to correctly reference the source application.

### Setting up AppSourceCop to validate moved symbols

In order to set up AppSourceCop to validate moved symbols, the property `sourceMovedObjectsPackagesCachePath` must be set in the AppSourceCop.json file to point to a directory which will contain baseline packages for all the applications from which symbols are moved. If this is not set, validation is disabled. AppSourceCop will try to find the source applications from the dependencies of the current application first and then from all the packages which are placed in that directory. Thus, if a symbol is being moved from a dependency of the application, setting the property and leaving the directory empty will be enough. Otherwise, the source application needs to be compiled and copied or moved into the directory.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  