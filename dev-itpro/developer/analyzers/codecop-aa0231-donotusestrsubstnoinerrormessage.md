---
title: "StrSubstNo or string concatenation must not be used as a parameter in the Error method."
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 01/21/2020
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
# CodeCop Rule AA0231
StrSubstNo or string concatenation must not be used as a parameter in the Error method.  

## Description
The data classification context will be lost when using the StrSubstNo method or string concatenation as a parameter in the Error method. Instead use the ability of the Error method to insert values into the string with placeholders.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  