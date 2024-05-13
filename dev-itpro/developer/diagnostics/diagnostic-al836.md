---
title: "Compiler Warning AL0836"
description: "The {0} '{1}' contains a reference to the field '{2}' which is defined in another object from the same app."
ms.author: solsen
ms.date: 03/11/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning AL0836

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The {0} '{1}' contains a reference to the field '{2}' which is defined in another object from the same app. If you are preparing to move this object to another extension in the future, this reference will be an issue.


## Description
Fields from other object from the same app cannot be referenced as it would cause issues if you are splitting the objects to prepare a future move to another extension.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  