---
title: "Obsolete Attribute"
description: "Specifies that the annotated symbol will be deprecated."
ms.author: solsen
ms.custom: na
ms.date: 06/08/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Obsolete Attribute
> **Version**: _Available or changed with runtime version 4.0._

Specifies that the annotated symbol will be deprecated.


## Applies To

- Method
- DeclareMethod
- Variable
- Event



## Syntax
```
[Obsolete([Reason: Text] [, Tag: Text])]
```

### Parameters

*Reason*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the reason for the symbol being deprecated.


*Tag*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies a free-form text to support tracking of where and when the object was marked as obsolete, for example, branch, build, or date of obsoleting the object.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  