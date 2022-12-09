---
title: "InherentEntitlements Property"
description: "Specifies the entitlement permissions that are inherently assigned to the given object."
ms.author: solsen
ms.custom: na
ms.date: 09/27/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# InherentEntitlements Property
> **Version**: _Available or changed with runtime version 10.0._

Specifies the entitlement permissions that are inherently assigned to the given object.

## Applies to
-   Table
-   Report
-   Codeunit
-   Xml Port
-   Page
-   Query

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks

The inherent entitlements permission values that are *Read*, *Insert*, *Modify*, *Delete*, and *Execute* are set according to the object type. For example, a Report object can have an execute 'X' permission, but the same permission is not valid for data in a Table object.

## Syntax 

```AL

InherentEntitlements = Permissions;

```

## Example 

```AL

table 50145 NewItem
{
    DataClassification = ToBeClassified;
    InherentEntitlements = RI;
   
    fields
    {
        
        field(2, ItemName; Text)    
        {
            DataClassification = ToBeClassified;
        
        }  

    }
}
```

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Inherent Permissions](../devenv-inherent-permissions.md)  

