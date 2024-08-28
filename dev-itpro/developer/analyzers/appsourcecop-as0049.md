---
title: "AppSourceCop Error AS0049"
description: "The access modifier of an application object cannot be changed to a value that provides less access because it will break dependent extensions."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0049
The access modifier of an application object cannot be changed to a value that provides less access.

## Description
The access modifier of an application object cannot be changed to a value that provides less access because it will break dependent extensions. You can only change the accessibility to provide more access.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when the access modifier of an application object is changed to a more restrictive value. Changing the access level to provide less access can break dependent extensions that rely on the original access level. Access modifiers define the visibility and accessibility of application objects, such as tables, pages, and codeunits.

## How to fix this diagnostic?

To resolve this error, you need to avoid changing the access modifier to a more restrictive value. Instead, you can only change the access level to provide more access. Here are the steps:

1. Locate the application object in your code where the access modifier has been changed.
2. Restore the access modifier to its original value or change it to a less restrictive value.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  