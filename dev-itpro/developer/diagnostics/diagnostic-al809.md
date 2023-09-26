---
title: "Compiler Error AL0809"
description: "The variable '{0}' is not allowed to be of type 'SecretText' because it is declared as protected."
ms.author: solsen
ms.custom: na
ms.date: 09/06/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0809

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The variable '{0}' is not allowed to be of type 'SecretText' because it is declared as protected.


## Description
Protected variables cannot be of type 'SecretText' as that could lead to the accidental exposure of the secret value to an extension.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  