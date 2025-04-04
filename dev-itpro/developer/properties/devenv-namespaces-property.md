---
title: "Namespaces property"
description: "Specifies namespaces on the XmlPort."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Namespaces Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies namespaces on the XmlPort.

## Applies to
-   Xml Port

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
Namespaces = bc = 'urn:microsoft-dynamics-bc/xmlports/x100';
```

## Remarks

You can use this property to declare one or more namespaces on the XMLport.  
  
A namespace declaration consists of prefix and the namespace name, which has the format *prefix*=*namespace*. Separate multiple namespaces with a comma.  
  
In the XML documents exported or imported by the XMLport, the namespaces declarations are only supported in the `<root>` element. For example, if an XMLport has the namespace **mybcprefix=mybcnamepace** and the default namespace **urn:bc:schema:all**, then the root element will be as follows:  
  
`<Root xmlns:mybcprefix="mybcnamespace" xmlns="urn:bc:schema:all">`  
  
To specify a default namespace, set the prefix to `""`. You can also specify a default namespace using the [DefaultNamespace property](devenv-defaultnamespace-property.md) and setting the [UseDefaultNamespace property](devenv-usedefaultnamespace-property.md) to **true**. 

> [!NOTE]
> There can only be one default namespace. So if you specify a default namespace in the **Namespaces Property**, you must set the [UseDefaultNamespace property](devenv-usedefaultnamespace-property.md) to **false**.  

Learn more about using namespaces with XMLports in [Using namespaces with XMLports](../devenv-using-namespaces-with-xmlports.md).  

## Related information

[Properties](devenv-properties.md)  
[NamespacePrefix property](devenv-namespaceprefix-property.md)  
[DefaultNamespace property](devenv-defaultnamespace-property.md)  
[UseDefaultNamespace property](devenv-usedefaultnamespace-property.md)  