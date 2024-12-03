---
title: "InherentEntitlements property"
description: "Specifies the entitlement permissions that are inherently assigned to the given object."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# InherentEntitlements Property
> **Version**: _Available or changed with runtime version 10.0._

Specifies the entitlement permissions that are inherently assigned to the given object.

## Applies to
-   Query
-   Report
-   Xml Port
-   Table
-   Codeunit
-   Page

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

## Related information  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Inherent Permissions](../devenv-inherent-permissions.md)  

