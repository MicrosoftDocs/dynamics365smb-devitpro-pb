---
title: "AppSourceCop Warning AS0139"
description: "New table fields must use the AllowInCustomizations property and its value must be different from ToBeClassified and Always."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0139
New table fields must use the AllowInCustomizations property

## Description
New table fields must use the AllowInCustomizations property and its value must be different from ToBeClassified and Always. From runtime 16.0, you can specify on the application object level the AllowInCustomizations to use as default for all its fields.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule analyzes only fields that are newly added in the current version, that is, fields that don’t exist in the baseline. It helps you prioritize classification of new fields and tables without requiring you to classify all existing fields.

Learn more about how to fix this diagnostic in [AppSourceCop Rule AS0138](appsourcecop-as0138.md).

## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  