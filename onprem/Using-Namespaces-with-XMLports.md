---
title: "Using Namespaces with XMLports"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 108a99d5-ecf0-4365-ad61-6da9c28e9138
caps.latest.revision: 4
---
# Using Namespaces with XMLports
When using the XMLport to import or export an XML document, you can set up multiple namespaces on the XMLport to make it compatible with the XML schema that is used system that provides or consumes [!INCLUDE[navnow](includes/navnow_md.md)] data. Namespaces are used to avoid XML element name conflicts. You can define multiple namespaces.  
  
 For example, the following code is a portion of a simple XML document for transferring sales order information. The XML includes namespaces for mapping fields from the Sales Header table.  
  
```  
<?xml version="1.0" encoding="UTF-16"?>  
<Root xmlns="urn:nav:schema:all" xmlns:navField="urn:nav:schema:field" xmlns:navTable="urn:nav:schema:table">  
  <navTable:SalesHeader>  
    <navField:DocType>Order</navField:DocType>  
    <navField:DocNo>101005</navField:DocNo>  
    <navField:SellToCustNo>30000</navField:SellToCustNo>  
    <navField:SellToCustName>John Haddock Insurance Co.</navField:SellToCustName>  
    <navField:BillToCustNo>30000</navField:BillToCustNo>  
    <navField:BillToCustName>John Haddock Insurance Co.</navField:BillToCustName>  
  </navTable:SalesHeader>  
...  
</Root>  
```  
  
 The `<root>` element contains the namespace declarations. Each namespace has the syntax *xmlns:prefix="namespacename"*.  
  
-   The *namespacename* is a string of characters, often referred to as a Uniform Resource Identifier \(URI\), which uniquely identifies an Internet resource. This is typically a Uniform Resource Locator \(URL\) or Universal Resource Name \(URN\).  
  
-   The *prefix* is a short string of characters that acts as an alias for the *namespacename*. The prefix is applied to specific elements in the XML document. The example includes the prefixes `navField` and `navTable`.  
  
-   A namespace that does not include a prefix declares the default namespace. In the example, the default namespace is `urn:nav:schema:all`. The default prefix is applied to all elements that do not include a prefix.  
  
 To set up namespaces on an XMLport, you can use the properties **Namespaces**, **Namespaceprefix**, **DefaultNamespace**, and **UseDefaultNamespace** as described in the following sections.  
  
## Adding Namespaces on an XMLport  
 To set up namespaces on an XMLport, do the following:  
  
1.  Define the namespaces in the **Namespaces** property of the XMLport.  
  
     For each namespace, you specify a prefix and a namespace name. For more information, see [Namespaces Property](Namespaces-Property.md).  
  
2.  Apply the prefixes to the XMLport elements of by setting the **NamespacePrefix** property.  
  
     You can only apply a prefix on **Element** node types, not **Attribute** node types.  
  
     For more information, see [NamespacePrefix Property](NamespacePrefix-Property.md).  
  
 For detailed steps about how to set these properties, see [How to: Create XMLports](How-to--Create-XMLports.md).  
  
## Adding a Default Namespace to an XMLport  
 A default namespace is a namespace that does not include a prefix. When you set up a default namespace, any elements that are note applied a prefix are assumed to belong to the default namespace. You can set up a default namespace one of the following ways:  
  
-   In the **Namespace** property, add a namespace that has no prefix.  
  
-   Specify the namespace in the **DefaultNamespace** property, and set the **UseDefaultNamespace** property to **Yes**.  
  
     For more information, see [DefaultNamespace Property](DefaultNamespace-Property.md) and [UseDefaultNamespace Property](UseDefaultNamespace-Property.md).  
  
> [!NOTE]  
>  There can only be on default namespace. Therefore, if you specify the default namespace in the **Namespace** property, you must set the **UseDefaultNamespace** property to **No**. If you want to use the default namespace that is defined in the **DefaultNamespace** property, you cannot define a default namespace in the **Namespace** property.  
  
## XMLport Example  
 The following example creates an XMLport that supports the XML document example in the introduction of this topic. Copy the code into a text editor, such as Notepad, save the file as .txt type file, and then import the file in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
```  
OBJECT XMLport 90010 Sales Document Sample  
{  
  OBJECT-PROPERTIES  
  {  
    Date=;  
    Time=;  
    Modified=Yes;  
    Version List=;  
  }  
  PROPERTIES  
  {  
    Namespaces=[=urn:nav:schemaall;  
        navTable=urn:nav:schema:table;  
        navField=urn:nav:schema:field];  
  }  
  ELEMENTS  
  {  
    { [{9827B702-7694-48F4-A925-97849E2766B7}];  ;Root                ;Element ;Text     }  
  
    { [{AF69A186-5A31-4A60-B594-5DF633965504}];1 ;SalesHeader         ;Element ;Table   ;  
                                                  SourceTable=Table36;  
                                                  NamespacePrefix=navTable }  
  
    { [{B1DA8310-AAFB-47B9-827B-4936589DAC7C}];2 ;DocType             ;Element ;Field   ;  
                                                  DataType=Option;  
                                                  SourceField=Sales Header::Document Type;  
                                                  NamespacePrefix=navField }  
  
    { [{8715B36A-82B8-40B5-A67E-184F6DDA7998}];2 ;DocNo               ;Element ;Field   ;  
                                                  DataType=Code;  
                                                  SourceField=Sales Header::No.;  
                                                  NamespacePrefix=navField }  
  
    { [{80B0F630-EDDC-4A0F-87CD-4B8739A8AD81}];2 ;SellToCustNo        ;Element ;Field   ;  
                                                  DataType=Code;  
                                                  SourceField=Sales Header::Sell-to Customer No.;  
                                                  NamespacePrefix=navField }  
  
    { [{FCE5D19F-BD09-41FF-9FF1-EDB8A29BCFB8}];2 ;SellToCustName      ;Element ;Field   ;  
                                                  DataType=Text;  
                                                  SourceField=Sales Header::Sell-to Customer Name;  
                                                  NamespacePrefix=navField }  
  
    { [{B3F85EB5-64BB-42B0-A39B-35778443BCFE}];2 ;BillToCustNo        ;Element ;Field   ;  
                                                  DataType=Code;  
                                                  SourceField=Sales Header::Bill-to Customer No.;  
                                                  NamespacePrefix=navField }  
  
    { [{AC807456-23F0-42DB-9628-210196C14AD1}];2 ;BillToCustName      ;Element ;Field   ;  
                                                  DataType=Text;  
                                                  SourceField=Sales Header::Bill-to Name;  
                                                  NamespacePrefix=navField }  
  
  }  
  EVENTS  
  {  
  }  
  REQUESTPAGE  
  {  
    PROPERTIES  
    {  
    }  
    CONTROLS  
    {  
    }  
  }  
  CODE  
  {  
  
    BEGIN  
    END.  
  }  
}  
```  
  
## See Also  
 [Designing XMLports](Designing-XMLports.md)
