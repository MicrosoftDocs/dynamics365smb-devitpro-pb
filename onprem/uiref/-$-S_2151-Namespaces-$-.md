---
title: "Namespaces"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f18c2b4f-cb15-4ca6-b6af-ba91f71fb47a
caps.latest.revision: 6
manager: edupont
---
# Namespaces
Specifies namespaces for the XMLport that imports or exports data as XML.  

 To open this window, open an XMLport in XMLport Designer, and then on the **View** menu, choose **Properties**. Locate the **Namespaces** property, and then choose the **AssistEdit** button in the **Value** field.  

## Fields  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Prefix**|Specifies the namespace prefix.<br /><br /> You apply namespaces to XMLport elements by setting the [NamespacePrefix Property](../NamespacePrefix-Property.md) of the element.|  
|**Namespace**|Specifies the namespace, which is typically in the form of a URL string.|  

 To specify the default namespace, leave the **Prefix** field blank.  

> [!NOTE]  
>  You can only define one default namespace. You can also define a space by specifying the namespace in the [DefaultNamespace Property](../DefaultNamespace-Property.md) and setting the [UseDefaultNamespace Property](../DefaultNamespace-Property.md) to **Yes**. If you want to specify the default namespace in this window, then you must set the **UseDefaultNamespace** Property to **No**.  

 For more information about namespaces with XMLports, see [Using Namespaces with XMLports](../Using-Namespaces-with-XMLports.md).  

## See Also  
 [Designing XMLports](../Designing-XMLports.md)   
 [How to: Create XMLports](../How-to--Create-XMLports.md)
