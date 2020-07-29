---
title: "Placeholders should have a comment explaining their content."
ms.author: solsen
ms.custom: na
ms.date: 07/16/2020
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
# CodeCop Rule AA0470
Placeholders should have a comment explaining their content.  

## Description
Provide an explanation that describes the content of each of the placeholders.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule

Documentation of placeholders is required in order to enable translators to properly know the construct of the label to be translated.

## Bad code example
```
MissingNodeErr: Label 'Cannot find an XML node that matches %1 or %2.'; 
```

## Good code example
```
MissingNodeErr: Label 'Cannot find an XML node that matches %1 or %2.', Comment = '%1 = XML node name ; %2 = Parent XML node name';
```

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  