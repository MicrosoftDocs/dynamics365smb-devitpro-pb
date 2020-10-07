---
title: "Using Namespaces with XMLports"
description: "Namespaces are used to avoid element name conflicts."
author: blrobl
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
---

# Using Namespaces with XMLports
The external system that provides or consumes [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] data as XML might require that the XML documents include namespaces. Namespaces are used to avoid element name conflicts. In these cases, you must add namespaces on the XMLport to make it compatible with the XML schema that is used by the external system.

> [!NOTE]  
> Namespace-related properties are only available when the [Format Property](properties/devenv-format-xmlports-property.md) is set to **Xml**.

For example, the following code is a portion of a simple XML document for transferring sales order information. The XML includes namespaces for mapping fields from the `Sales Header` table.

```xml
<?xml version="1.0" encoding="UTF-16"?>  
<Root xmlns="urn:bc:schema:all" xmlns:bcField="urn:bc:schema:field" xmlns:bcTable="urn:bc:schema:table">  
  <bcTable:SalesHeader>  
    <bcField:DocType>Order</bcField:DocType>  
    <bcField:DocNo>101005</bcField:DocNo>  
    <bcField:SellToCustNo>30000</bcField:SellToCustNo>  
    <bcField:SellToCustName>John Haddock Insurance Co.</bcField:SellToCustName>  
    <bcField:BillToCustNo>30000</bcField:BillToCustNo>  
    <bcField:BillToCustName>John Haddock Insurance Co.</bcField:BillToCustName>  
  </bcTable:SalesHeader>  
...  
</Root>
```
Each namespace has the syntax *xmlns:prefix="namespacename"*.

- The *namespacename* is a string of characters, often referred to as a Uniform Resource Identifier (URI), which uniquely identifies an Internet resource. This is typically a Uniform Resource Locator (URL) or Universal Resource Name (URN).

- The *prefix* is a short string of characters that acts as an alias for the namespace name. The prefix is applied to specific elements in the XML document. The example includes the prefixes `bcField` and `bcTable`.

- A namespace that does not include a prefix declares the default namespace. In the example, the default namespace is urn:bc:schema:all. The default prefix is applied to all the elements that do not include a prefix.

You declare the namespaces used in the XMLport using the [Namespaces Property](properties/devenv-namespaces-property.md). For each namespace, you specify a prefix and a namespace name. You can declare a default namespace by defining an empty prefix `""`. In the XML documents exported or imported by the XMLport, the namespaces declarations are only supported in the `<root>` element. 
 
You then apply the namespaces to XMLport elements by setting the [NamespacePrefix Property](properties/devenv-namespaceprefix-property.md) of the element to one of the namespace prefixes declared in the [Namespaces Property](properties/devenv-namespaces-property.md). This property only applies to `textelement`, `tableelement` and `fieldelement` nodes, otherwise it will be ignored.

You can also specify a default namespace using the [DefaultNamespace Property](properties/devenv-defaultnamespace-property.md) and setting the [UseDefaultNamespace Property](properties/devenv-usedefaultnamespace-property.md) to **true**. Note that there can only be one default namespace, so if you specify the default namespace in the [Namespaces Property](properties/devenv-namespaces-property.md), you must set the [DefaultNamespace Property](properties/devenv-defaultnamespace-property.md) to **false**. 


## See Also
[XMLport Object](devenv-xmlport-object.md)  
[Namespaces Property](properties/devenv-namespaces-property.md)   
[NamespacePrefix Property](properties/devenv-namespaceprefix-property.md)  
[DefaultNamespace Property](properties/devenv-defaultnamespace-property.md)  
[UseDefaultNamespace Property](properties/devenv-usedefaultnamespace-property.md)
