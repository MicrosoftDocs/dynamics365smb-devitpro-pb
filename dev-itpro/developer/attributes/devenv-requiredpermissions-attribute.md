---
title: "RequiredPermissions Attribute"
description: "Specifies the permissions required by the subscriber of an external event."
ms.author: solsen
ms.custom: na
ms.date: 03/20/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# RequiredPermissions Attribute
> **Version**: _Available or changed with runtime version 11.0._

Specifies the permissions required by the subscriber of an external event.


## Applies To

- Method


## Syntax

```AL
[RequiredPermissions(PermissionObjectType: PermissionObjectType, ObjectId: Integer, Permissions: Text)]
```

### Arguments
*PermissionObjectType*  
&emsp;Type: [PermissionObjectType](../methods-auto/permissionobjecttype/permissionobjecttype-option.md)  
Specifies the type of object that the attribute assigns permissions to.  

*ObjectId*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
Specifies the ID of the object that permissions are assigned to. You can specify the object by its ID (integer) or by its name using the syntax `<ObjectType>::<ObjectName>`, such as `Codeunit::MyCodeunit`. It is recommended to specify the object by name for readability.  

*Permissions*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the permission values. You can specify the permissions using the syntax `<permission value>`.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  