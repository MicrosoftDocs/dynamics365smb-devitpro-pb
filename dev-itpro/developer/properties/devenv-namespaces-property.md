---
title: "Namespaces Property"
ms.custom: na
ms.date: 06/16/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: cd6bcd37-7b5d-4d06-a551-5569555160dc
caps.latest.revision: 7
author: SusanneWindfeldPedersen
---

 

# Namespaces Property
Specifies namespaces on the XMLport.  
  
## Applies To  
  
-   XMLports that have the [Format Property (XMLports)](devenv-format-xmlports-property.md) set to **Xml**.  
  
## Remarks  
 You can use this property to declare one or more namespaces on the XMLport. To add a namespace, you can choose the **AssistEdit** button or enter the namespaces directly in the field.  
  
 A namespace declaration consists of prefix and the namespace name, which has the format *prefix*=*namespace*. Separate multiple namespaces with a comma.  
  
 In the XML documents exported or imported by the XMLport, the namespaces declarations are only supported in the `<root>` element. For example, if an XMLport has the namespace **mynavprefix=mynavnamepace** and the default namespace **urn:nav:schema:all**, then the root element will be as follows:  
  
 `<Root xmlns:mynavprefix="mynavnamespace" xmlns="urn:nav:schema:all">`  
  
 To specify a default namespace, leave the **Prefix** field blank. You can also specify the default namespace by specifying the namespace in the [DefaultNamespace Property](devenv-defaultnamespace-property.md) and setting the [UseDefaultNamespace Property](devenv-usedefaultnamespace-property.md) to **true**. However, there can only be one default namespace. So if you want to specify a default namespace in the **Namespace** property, you must set the **UseDefaultNamespace** Property to **false**.  
<!--
 For more information about namespaces with XMLports, see see [Using Namespaces with XMLports](Using-Namespaces-with-XMLports.md).  
  
## See Also  
 [Designing XMLports](Designing-XMLports.md)   
 [How to: Create XMLports](How-to--Create-XMLports.md) -->