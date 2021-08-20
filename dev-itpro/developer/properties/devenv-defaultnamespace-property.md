---
title: "DefaultNamespace Property"
description: "Specifies the default namespace for both the IMPORT function (XmlPort) and EXPORT function (XmlPort) functions."
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
# DefaultNamespace Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the default namespace for both the IMPORT function (XmlPort) and EXPORT function (XmlPort) functions.

## Applies to
-   Xml Port

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
DefaultNamespace = 'urn:microsoft-dynamics-nav/xmlports/x100';
```
  
## Remarks

This property specifies the default namespace for both import and export. A default namespace is a namespace that does not include a prefix. The default prefix is applied to all the elements that do not include a prefix and is unique for different XMLports. For example, the following string specifies a namespace: `urn:microsoft-dynamics-nav/xmlports/x100`, where 100 is the ID of the XMLport.  

> [!NOTE]  
> There can only be one default namespace. So if you specify a default namespace in the [Namespaces Property](devenv-namespaces-property.md), you must set the [UseDefaultNamespace Property](devenv-usedefaultnamespace-property.md) to **false**. 
  
For more information about using namespaces with XMLports, see  [Using Namespaces with XMLports](../devenv-using-namespaces-with-xmlports.md).  

## See Also

[Properties](devenv-properties.md)   
[Namespaces Property](devenv-namespaces-property.md)   
[NamespacePrefix Property](devenv-namespaceprefix-property.md)  
[UseDefaultNamespace Property](devenv-usedefaultnamespace-property.md) 