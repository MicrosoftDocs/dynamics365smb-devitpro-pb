---
title: "Compiler Warning (Future Error) AL0758"
description: "The name of {0} '{1}' conflicts with {0} '{2}' defined in {3} '{4}' by the extension '{5}'."
ms.author: solsen
ms.custom: na
ms.date: 08/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning (Future Error) AL0758

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The name of {0} '{1}' conflicts with {0} '{2}' defined in {3} '{4}' by the extension '{5}'. Please choose another name for one of them. Otherwise, this might cause runtime issues.


> [!IMPORTANT]
> This warning will become an error with Business Central 2024 release wave 1.  

## Description
 Whitespaces in names are internally replaced with an underscore during compilation, such that two different names can collide.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  