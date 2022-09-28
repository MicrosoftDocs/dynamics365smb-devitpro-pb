---
title: "AppSourceCop Warning AS0081"
description: "The InternalsVisibleTo setting will expose your internal objects to any extension with the given name, publisher, and ID."
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
# AppSourceCop Warning AS0081
InternalsVisibleTo should not be used as a security feature.

## Description
The InternalsVisibleTo setting will expose your internal objects to any extension with the given name, publisher, and ID. Access modifiers are not designed to be used as a security boundary, but for API development.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

For more information, see [JSON Files](../devenv-json-files.md).

## See Also

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
