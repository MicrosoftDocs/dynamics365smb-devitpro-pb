---
title: "ObsoleteTag Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# ObsoleteTag Property
> **Version**: _Available from runtime version 4.3._

Specifies a free-form text to support tracking of where and when the object was marked as obsolete, for example, branch, build, or date of obsoleting the object.

## Applies to
-   Table Field
-   Table
-   Table Key
-   Codeunit
-   Enum Type
-   Enum Value
-   Page
-   Page Action
-   Page Action Area
-   Page Action Group
-   Page Action Separator
-   Page Area
-   Page Part
-   Page System Part
-   Page Chart Part
-   Page Field
-   Page Group
-   Page Label
-   Query
-   Query Column
-   Query Filter
-   Report
-   Report Data Item
-   Report Column
-   Request Page
-   Xml Port
-   Page View
-   Profile
-   Interface
-   Control Add In


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
ObsoleteTag = 'This field is being deprecated with the newest build of the product.';
```

## Remarks

Use this property to add valuable information to developers about a table, field, or key that will become obsolete in time or is already obsolete. For procedures and variables, the obsolete tag can be specified as an optional parameter in the `Obsolete` attribute: `[Obsolete(<Reason>,<tag>)]`. For more information, see [Obsolete Attribute](../methods/devenv-obsolete-attribute.md).

## See Also  

[ObsoleteReason](devenv-obsoletereason-property.md)  
[ObsoleteState](devenv-obsoletestate-property.md)  
[Properties](devenv-properties.md)  
[MethodType Property (Upgrade Codeunits)](../devenv-methodtype-property-upgrade-codeunits.md)  