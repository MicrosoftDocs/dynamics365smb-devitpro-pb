---
title: Using namespaces with XMLports
description: Learn how to use namespaces with XMLports in Dynamics 365 Business Central.
author: blrobl
ms.date: 01/30/2025
ms.topic: concept-article
ms.author: brobledodiaz
ms.reviewer: solsen
---

# Using namespaces with XMLports

The external system that provides or consumes [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] data as XML might require that the XML documents include namespaces. Namespaces are used to avoid element name conflicts. In these cases, you must add namespaces on the XMLport to make it compatible with the XML schema that is used by the external system.

> [!NOTE]  
> Namespace-related properties are only available when the [Format property](properties/devenv-format-property.md) is set to **Xml**.

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
- A namespace that doesn't include a prefix declares the default namespace. In the example, the default namespace is urn:bc:schema:all. The default prefix is applied to all the elements that don't include a prefix.

You declare the namespaces used in the XMLport using the [Namespaces property](properties/devenv-namespaces-property.md). For each namespace, you specify a prefix and a namespace name. You can declare a default namespace by defining an empty prefix `""`. In the XML documents exported or imported by the XMLport, the namespaces declarations are only supported in the `<root>` element. 

You then apply the namespaces to XMLport elements by setting the [NamespacePrefix property](properties/devenv-namespaceprefix-property.md) of the element to one of the namespace prefixes declared in the [Namespaces property](properties/devenv-namespaces-property.md). This property only applies to `textelement`, `tableelement` and `fieldelement` nodes, otherwise it's ignored.

You can also specify a default namespace using the [DefaultNamespace property](properties/devenv-defaultnamespace-property.md) and setting the [UseDefaultNamespace property](properties/devenv-usedefaultnamespace-property.md) to **true**. There can only be one default namespace, so if you specify the default namespace in the [Namespaces property](properties/devenv-namespaces-property.md), you must set the [DefaultNamespace property](properties/devenv-defaultnamespace-property.md) to **false**. 


## Related information

[XMLport object](devenv-xmlport-object.md)  
[Namespaces property](properties/devenv-namespaces-property.md)  
[NamespacePrefix property](properties/devenv-namespaceprefix-property.md)  
[DefaultNamespace property](properties/devenv-defaultnamespace-property.md)  
[UseDefaultNamespace property](properties/devenv-usedefaultnamespace-property.md)
