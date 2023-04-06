---
title: "Designing XMLports"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 21e38dde-b1d4-4759-90cc-31c955e6b197
caps.latest.revision: 32
---
# Designing XMLports
XMLports are used to export data from or import data to a [!INCLUDE[navnow](includes/navnow_md.md)] database. The import or export is between the database and an external file. XMLports enable seamless exchange of data between different computer systems. XMLports are used to import and export data to and from text files, CSV, and XML files. You can use XMLports to export or import data from multiple tables in the database. Although you can design an XMLport for both import and export, XMLports are typically designed for either import or export. To use an XMLport, you first design it in **XMLport Designer** and set properties for the XMLport. For more information about the **XMLport Designer** window, see [XMLport Designer](uiref/-$-S_21001-XMLport-Designer-$-.md). After the XMLport is designed, you create a codeunit to run the XMLport or run it from **Object Designer**.  

## Designing an XMLport  
 To create an XMLport that exports or imports data, you first specify the root of the file that you want to import or export and then specify the data items and the fields. For example, to create an XMLport that exports data from a [!INCLUDE[navnow](includes/navnow_md.md)] database to an XML document, you first specify the root of the XML document by using the `<Root></Root>` element, specify all the XML node names, and then choose the type for each node to indicate whether it represents an element or an attribute. You then map these node names to corresponding data structures, such as tables, text, or fields. For more information, see [How to: Create XMLports](How-to--Create-XMLports.md).  

 At run time, when an XMLport object is called from a codeunit to import or export an XML document, the XMLport first reads the XML document into a data stream before the import or export. For example, when you design an XMLport for export and use codeunit to call the XMLport at run time, the XMLport object reads the specified data from the database, adds the necessary XML nodes to form the XML document, and then writes the document to a data stream. The data stream saves the XML file in to a location that you specify in the codeunit. For more information, see [How to: Create Codeunits to Run XMLports](How-to--Create-Codeunits-to-Run-XMLports.md).  

> [!IMPORTANT]  
>  When you design in the **XMLport Designer** window, child elements must be indented one time to add them under the parent element. Otherwise it causes a compile error.  
>   
>  Spaces are not allowed in the names of the XML nodes that you enter in the **Node Name** column of the XMLport Designer.  
>   
>  You must set the [Direction Property](Direction-Property.md) for the XMLport to indicate whether the XMLport is used to import, export, or both. You must also set the [Format Property \(XMLports\)](Format-Property--XMLports-.md) to indicate the type of file format that you want to work with.  

> [!NOTE]  
>  Although XMLports can be designed for both export and import, we recommend designing for either export or import.  

 XMLports do not handle the following XML documents:  

-   Documents that find and delete data in the database.  

-   Documents that query the database for data, such as item catalog information.  

 If you must work with an incoming document of one of these types, you can use C/AL code to work with the database to achieve the result that you want.  

> [!NOTE]  
>  Do not use a semicolon in a quoted argument as a field value when you import a file through an XMLport. Even in a quoted argument, the semicolon is interpreted as a record separator.  

###  <a name="Namespaces"></a> Namespaces With XMLports  
 The external system that provides or consumes [!INCLUDE[navnow](includes/navnow_md.md)] data as XML might require that the XML documents include namespaces. Namespaces are used to avoid element name conflicts. In these cases, you must add namespaces on the XMLport to make it compatible with the XML schema that is used by the external system. For more information, see [Using Namespaces with XMLports](Using-Namespaces-with-XMLports.md).  

### Request Pages are not Supported by [!INCLUDE[nav_web](includes/nav_web_md.md)]  
 [!INCLUDE[nav_web](includes/nav_web_md.md)] does not support request pages with XMLports. A request page is a dialog box that appears when an XMLport is run that enables the user to set a filter on the transferred data and choose whether the XMLPort imports or exports the data.  

 If the XMLport will be displayed in the [!INCLUDE[nav_web](includes/nav_web_md.md)], you should not set up the XMLport to use a request page because an error will occur when the XMLport is run. By default, XMLports are set up to use a request page. To specify not to use a request page, you can either change the [UseRequestPage Property](UseRequestPage-Property.md) in XMLPort Designer or if the XMLPort is run from C/AL code by calling the [RUN Function \(XMLport\)](RUN-Function--XMLport-.md), you can set the *ReqWindow* parameter of the Run function.  

## Running XMLports  
 After you have designed and saved the XMLport, you can create a code unit that uses the XMLport to perform the import or export. You can run the XMLport from Object Designer. For information about how to run XMLports from Object Designer, see [How to: Run an XMLport from Object Designer](How-to--Run-an-XMLport-from-Object-Designer.md). To create a codeunit to run the XMLport, first you define the location of the document you want to import from or export to. Whether the XMLport is importing or exporting, the data is read into a data stream and the XMLport uses the stream to insert the data into the table or export it into the file. For more information about how to create the condeunit, see [How to: Create Codeunits to Run XMLports](How-to--Create-Codeunits-to-Run-XMLports.md).  

 For information about how to design XMLports, see [How to: Create XMLports](How-to--Create-XMLports.md). For information about how to export data from a [!INCLUDE[navnow](includes/navnow_md.md)] database, see [Walkthrough: Exporting Data from Tables to XML Documents](Walkthrough--Exporting-Data-from-Tables-to-XML-Documents.md).  

## Handling XML Documents That Use Data in Different Scopes  
 XML documents have a tree structure that can include many levels. A database table, however, can only store data in a flat structure, which is the field level. An XML document can contain data in different scopes, although the data belongs in the same scope in the database. For example, the `<BillTo>` node of an XML sales order document could contain a `<PaymentTerms>` child element. The value of the `<PaymentTerms>` node sometimes must be assigned to all sales items, and sometimes to only one of them. If you declare the `<PaymentTerms>` value node as the Element node type and the Text source type, the XMLport can store the value and therefore when it starts to process the sales item information, you can specify which records the value is to be assigned to.  

 To avoid writing data to a table, you can apply a style sheet to the XML document to make sure that the XML node names are transferred in the correct order. Alternatively, you could design an XMLport to write the data to a temporary table. You could then write code that inserts the data into the relevant table using the correct order.  

 The following example shows an XML sales order document that contains two items. One item contains a `<DocumentNo>` node that must be written to the Sales Header table in the database.  

```  
<Items>  
  <Item PartNum="LS-75">  
    <ProductName>Loudspeaker, Cherry, 75W</ProductName>  
      <Quantity>10</Quantity>  
<UnitPrice>79</UnitPrice>  
<Comment>Confirm the voltage is 75W</Comment>  
   </Item>  
   <Item PartNum="1908-8">  
     <ProductName>LONDON Swivel Chair, blue</ProductName>  
       <Quantity>12</Quantity>  
 <UnitPrice>190,926</UnitPrice>  
 <ShipDate>12-05-04</ShipDate>  
 <DocumentNo>9999</DocumentNo>  
   </Item>  
</Items>  
```  

 Before the `<DocumentNo>9999</DocumentNo>` node can be written to the database, the value must be checked to make sure that it is valid. However, the XMLport design will not work because the position of the `<DocumentNo>` node violates the validation order of the Sales Lines table.  

 To prevent this, you could assign the XML node names that were mapped to the Sales Lines table to a temporary table. You could then write code that assigns the value of the `<DocumentNo>` node to the correct table, and in the correct validation order, after the value has been assigned to a temporary table record. This means that the `<DocumentNo>` value must be copied from the temporary record to the real record before any of the other fields are copied to the Sales Lines table. By using temporary tables, you will be able to solve most of the cases where you can see that an incoming XML document contains nodes in a sequence that would violate the database validation order.  

## Assigning a Value from an XML Node to Multiple Records.  
 In a relational database, certain information must be repeated in various tables for data linking purposes. For example, a Sales Order XML document might contain an attribute that specifies Order as the document type as shown in the following code snippet:  

 `<Items Type="Order">`  

 To write the `Type=”Order”` information to the relevant table in the Sales Lines table, you declare the type attribute as text source type to cache the Order value and write code to assign the value to each record in the table. The code is typically written in the `Import::OnAfterInitRecord` trigger for the `<Item>` node. The code that assigns the value resembles the following code snippet:  

 `L.Document Type := Type;`  

## XMLport Functions and Properties  
 XMLport objects include functions and properties that can be used to work with the object. For more information, see [XMLport Data Type](XMLport-Data-Type.md).  

## See Also  
 [XMLport Walkthroughs](XMLport-Walkthroughs.md)   
 [XMLport Designer](uiref/-$-S_21001-XMLport-Designer-$-.md)   
 [XMLports](XMLports.md)
