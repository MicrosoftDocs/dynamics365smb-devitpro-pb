---
title: "System.ClearAll Method"
description: "Clears all internal variables (except REC variables), keys, and filters in the object and in any associated objects, such as reports, pages, codeunits, and so on that contain AL code."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# System.ClearAll Method
> **Version**: _Available or changed with runtime version 1.0._

Clears all internal variables (except REC variables), keys, and filters in the object and in any associated objects, such as reports, pages, codeunits, and so on that contain AL code.


## Syntax
```AL
 System.ClearAll()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

ClearAll works by calling the [Clear Method](../../methods-auto/system/system-clear-joker-method.md) repeatedly on each variable. However, this is not the case with codeunits, where the ClearAll method works by calling ClearAll inside the codeunit. It deletes the contents of the codeunit, whereas Clear only deletes the reference to the codeunit.  
  
ClearAll does not affect or change values for variables in single instance codeunits.  
  
When a method is called repeatedly in the same transaction, the system retains all values for variables and filters in memory between calls. For example, this is used to assign numbers to entry numbers when posting. When you do not want to retain the values in memory, use the ClearAll method to clear them.  
  
For information about the initial values of cleared variables, see the [Clear Method](../../methods-auto/system/system-clear-joker-method.md). Take into consideration that fields in a record will be initialized with the [InitValue Property](../../properties/devenv-initvalue-property.md) of the field.  


## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)