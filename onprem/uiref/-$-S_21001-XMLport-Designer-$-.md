---
title: "XMLport Designer"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 20e88fa4-d0a7-4bf7-9949-034e1d18b0b2
caps.latest.revision: 7
manager: edupont
---
# XMLport Designer
Provides functionality for designing XMLports.  

 XMLport Designer contains the following column fields:  

-   **Node Name**  

-   **Node Type**  

-   **Source Type**  

-   **Data Source**  

 To open this window, on the **Tools** menu, choose **Object Designer**, choose **XMLport**, and then choose the **Design** button. You can choose the **New** button instead of the **Design** button to design a new XMLport.  

## Fields  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Node Name**|Specifies the XML node name of the XML element or attribute. You must enter node names in the order in which they appear in the XML document. Parent elements must precede their child elements. You indent the node names of child elements under their parent elements by using one indentation per level. You list attributes under the elements that they define and you indent them to the child level.|  
|**Node Type**|Specifies whether the name in the **Node Name** field represents data of the type element or attribute. The drop-down list in a **Node Type** field contains two options: **Element** and **Attribute**. The default setting is **Element**.|  
|**Source Type**|Specifies the data structure that the node name corresponds to in the [!INCLUDE[navnow](../includes/navnow_md.md)] database. The **Source Type** field contains a drop-down list that has the following options:<br /><br /> -   **Text**<br />     This is the default setting. Specifies that the XML data cannot be mapped to the database or when the database does not need the information. The value of the **Text** field will be put into a text variable with the name that you have specified in the **VariableName** property. By default, the node name is used if you do not specify a value. The text variable behaves like a typical global C/AL text variable. You can also turn the text source type into a big text variable by setting the **TextType** property to **BigText**.<br />-   **Table**<br />     Specifies that the node name is equivalent to a table or that a table record must be initialized. Like the **Text** option, you can specify a variable name for the table, which also behaves like a global record variable. By default, the variable name is the name of the table.<br />-   **Field**<br />     Specifies that the node name is equivalent to a field in the database. However, for this selection to be valid, you must first declare a table as the parent of the field. If you do not declare a table as the parent of the field, then an error occurs when you try to compile the XMLport object.|  
|**Data Source**|A **Data Source** field has the following interactions with the **Source Type** field:<br /><br /> -   If **Source Type** is set to **Table** and you have defined a variable name for the table, the format of the value shown in the **DataSource** field will be **tablevariablename\(tablename\)**. If you have not defined a variable name, then the format of the value will be shown as **\<tablename>\(tablename\)**.<br />-   If **Source Type** is set to **Field**, then select a field from a table that you have specified in the XMLport. The format of the value is shown as **tablevariablename::fieldname**.|  

> [!NOTE]  
>  If an XMLport is designed to import or export XML documents, the **Node Name** for the first element in XMLport designer window must be set to **Root**, the **Node Type** must be set to **Element** and the **Source Type** must be set to **Text**. This represents the root of the XML document.  

## XMLport Properties, Functions, and Triggers  
 There are properties, functions, and triggers that you can use to work with an XMLport. There are properties, functions, and triggers for the object level and for the element level, which consists of **Field**, **Table**, and **Text**. The properties that are available at the element level depend on the selections you make in the **Node Type** and **Source Type** fields in XMLport Designer. For more information, see [C/SIDE Reference Guide](../C-SIDE-Reference-Guide.md).  

 When you design XMLports, you must set the value of the [Format Property \(XMLports\)](../Format-Property--XMLports-.md) and the [Direction Property](../Direction-Property.md). The [Format Property \(XMLports\)](../Format-Property--XMLports-.md) indicates the type of file that you want to import or export and the direction property value indicates whether the XMLport will be used for import or export.  

## See Also  
 [XMLports](../XMLports.md)
