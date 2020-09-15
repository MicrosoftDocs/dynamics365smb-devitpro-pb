---
title: "System.ClearAll Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# System.ClearAll Method
Clears all internal variables (except REC variables), keys, and filters in the object and in any associated objects, such as reports, pages, codeunits, and so on that contain AL code.


## Syntax
```
 System.ClearAll()
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 CLEARALL works by calling the [CLEAR Method](../../methods-auto/system/system-clear-joker-method.md) repeatedly on each variable. However, this is not the case with codeunits, where the CLEARALL method works by calling CLEARALL inside the codeunit. It deletes the contents of the codeunit, whereas CLEAR only deletes the reference to the codeunit.  
  
 CLEARALL does not affect or change values for variables in single instance codeunits.  
  
 When a method is called repeatedly in the same transaction, the system retains all values for variables and filters in memory between calls. For example, this is used to assign numbers to entry numbers when posting. When you do not want to retain the values in memory, use the CLEARALL method to clear them.  
  
 For information about the initial values of cleared variables, see the [CLEAR Method](../../methods-auto/system/system-clear-joker-method.md). Take into consideration that fields in a record will be initialized with the [InitValue Property](../../properties/devenv-initvalue-property.md) of the field.  

 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)