---
title: "ObsoleteReason Property"
description: "Specifies why the object has been marked as Pending in the ObsoleteState property."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ObsoleteReason Property
> **Version**: _Available or changed with runtime version 10.0._

Specifies why the object has been marked as Pending in the ObsoleteState property.

## Applies to
-   Page Action Ref
-   Table Field
-   Table
-   Table Key
-   Codeunit
-   Enum Type
-   Enum Value
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
-   Page
-   Page View
-   Profile
-   Interface
-   Control Add In
-   Permission Set
-   Field Group

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
ObsoleteReason = 'Not Needed';
```

## Remarks 

Use this property to inform developers about an object or element that will become obsolete in time or is already obsolete. Use the [ObsoleteTag Property](devenv-obsoletetag-property.md) to specify additional information which can be valuable to other developers.

## See Also

[ObsoleteState](devenv-obsoletestate-property.md)  
[ObsoleteTag](devenv-obsoletetag-property.md)  
[Properties](devenv-properties.md)  
[MethodType Property (Upgrade Codeunits)](../devenv-methodtype-property-upgrade-codeunits.md)  
[Obsolete Attribute](../attributes/devenv-obsolete-attribute.md)  