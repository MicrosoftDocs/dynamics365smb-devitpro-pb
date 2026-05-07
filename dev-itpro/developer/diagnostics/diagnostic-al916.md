---
title: "Compiler Warning AL0916"
description: "The call is ambiguous between the built-in methods '{0}' and '{1}'."
ms.author: solsen
ms.date: 04/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning AL0916

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The call is ambiguous between the built-in methods '{0}' and '{1}'. The compiler will implicitly choose the '{0}' overload. Make the call explicit by casting the Variant argument to the desired type.


## Description
The method call is ambiguous between two built-in method overloads because a Variant argument is passed. The compiler implicitly chooses the oldest available overload. Cast the Variant argument to the desired type to make the call explicit.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  