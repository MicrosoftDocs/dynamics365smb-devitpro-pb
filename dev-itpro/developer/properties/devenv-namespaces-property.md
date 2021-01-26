---
title: "Namespaces Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
  
To specify a default namespace, set the prefix to `""`. You can also specify a default namespace using the [DefaultNamespace Property](devenv-defaultnamespace-property.md) and setting the [UseDefaultNamespace Property](devenv-usedefaultnamespace-property.md) to **true**. 

> [!NOTE]
> There can only be one default namespace. So if you specify a default namespace in the **Namespaces Property**, you must set the [UseDefaultNamespace Property](devenv-usedefaultnamespace-property.md) to **false**.  

For more information about using namespaces with XMLports, see  [Using Namespaces with XMLports](../devenv-using-namespaces-with-xmlports.md).  

## See Also

[Properties](devenv-properties.md)  
[NamespacePrefix Property](devenv-namespaceprefix-property.md)  
[DefaultNamespace Property](devenv-defaultnamespace-property.md)  
[UseDefaultNamespace Property](devenv-usedefaultnamespace-property.md)  