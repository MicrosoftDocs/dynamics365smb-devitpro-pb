---
title: "Compiler Warning (future error) AL0758"
description: "The name of {0} '{1}' conflicts with {0} '{2}' defined in {3} '{4}' by the extension '{5}'."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning (future error) AL0758

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The name of {0} '{1}' conflicts with {0} '{2}' defined in {3} '{4}' by the extension '{5}'. Choose another name for one of them. Otherwise, this might cause runtime issues.


> [!IMPORTANT]
> This warning will become an error with Business Central 2024 release wave 1.  

## Description
White spaces in names are internally replaced with an underscore during compilation, so that two different names can collide.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  