---
title: "DefaultNamespace Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# DefaultNamespace Property
Specifies the default namespace for both the [IMPORT Method (XMLport)](../methods-auto/xmlport/xmlport-IMPORT-Method.md) and [EXPORT Method (XMLport)](../methods-auto/xmlport/xmlport-EXPORT-Method.md) methods.  
  
## Applies to  
  
- XMLports  

## Syntax

```
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