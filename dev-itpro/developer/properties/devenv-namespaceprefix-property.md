---
title: "NamespacePrefix property"
description: "Specifies the namespace prefix on an XmlPort element."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NamespacePrefix Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the namespace prefix on an XmlPort element.

## Applies to
-   Xml Port Text Element
-   Xml Port Field Element
-   Xml Port Table Element
-   Xml Port Field Attribute
-   Xml Port Text Attribute

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
NamespacePrefix = 'bc';
```
 
## Remarks

You can only set the property to a prefix that is declared in the [Namespaces property](devenv-namespaces-property.md) of the XMLport.  

This property only applies to element node types and will be ignored if it is set in `textattribute` and `fieldattribute` nodes.

Learn more about using namespaces with XMLports in  [Using namespaces with XMLports](../devenv-using-namespaces-with-xmlports.md).  

## Related information  

[Get started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  