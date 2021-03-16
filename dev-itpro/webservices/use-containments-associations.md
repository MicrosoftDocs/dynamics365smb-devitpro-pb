---
title: "Using Containments and Associations"
description: Learn how to use containments and associations with OData for creating relationships between pages. 
ms.custom: na
ms.date: 01/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---
# Using Containments and Associations
Containments and associations are relationships between pages in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. OData web services support navigation between pages using containments and associations.  
  
-   **Containments**: Some pages in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] contain subpages. When you publish such a page, the subpages are automatically available in the web service as containments.  
  
-   **Associations**: When a field on a page has a **TableRelation** property, the specified table has a **LookupPageId** property that points to a different page. When you publish a page containing such a field as a web service, you must also publish the page that is pointed to by **LookupPageId** property. You can then link from the first page to the second page in a single URI.  
  
## Identifying Containments and Associations in Metadata  
 OData metadata shows containments and associations with the **NavigationProperty** tag. For example, if you published page 42, Sales Order, and page 22, Customer List, and then obtained the service metadata document for the server instance, you would see this tag in the metadata:  
  
```  
<NavigationProperty Name="SalesOrderSalesLines" ToRole="SalesOrderSalesLines" FromRole="SalesOrder" Relationship="NAV.SalesOrder_SalesOrderSalesLines"/>  
```  
  
 This tag is followed by metadata that's specific to the **SalesOrderSalesLines** subpage. This page metadata indicates that this **NavigationProperty** tag is a containment:  
  
```  
<EntityType Name="SalesOrderSalesLines">  
<Key>  
     <PropertyRef Name="Document_No"/>  
     <PropertyRef Name="Document_Type"/>  
     <PropertyRef Name="Line_No"/>  
</Key>  
     <Property Name="Document_Type" Nullable="false" Type="Edm.String"/>  
     <Property Name="Document_No" Nullable="false" Type="Edm.String"/>  
     .......many additional properties........  
     <Property Name="ShortcutDimCode_x005B_7_x005D_" Nullable="true" Type="Edm.String"/>  
     <Property Name="ShortcutDimCode_x005B_8_x005D_" Nullable="true" Type="Edm.String"/>  
</EntityType>  
```  
  
 Elsewhere in the metadata, you would see additional **NavigationProperty** lines and a series of **Association** tags. Two of these tags have a **Multiplicity** parameter with a value of **0..1**:  
  
```  
<Association Name="SalesOrder_Sell_to_Customer_No_Link">  
     <End Type="NAV.SalesOrder" Multiplicity="*" Role="SalesOrder"/>  
     <End Type="NAV.CustomerList" Multiplicity="0..1" Role="Sell_to_Customer_No_Link"/>  
</Association>  
<Association Name="SalesOrder_Bill_to_Customer_No_Link">  
     <End Type="NAV.SalesOrder" Multiplicity="*" Role="SalesOrder"/>  
     <End Type="NAV.CustomerList" Multiplicity="0..1" Role="Bill_to_Customer_No_Link"/>  
</Association>  
```  
  
 These tags describe two associations from the Sales Order page to the Customer List page:  
  
-   The Sell-to Customer No. field.  
  
-   The Bill-to Customer No. field.  
  
## Using Containments  
 When you publish a page that has a subpage, you can identify that subpage in the AtomPub document that is returned for the published page. For example, when you publish page 42, Sales Order, you can access a single record on the page using a URI such as the following:  
  
```  
https://localhost:7048/<server instance>/OData/Company('CRONUS-International-Ltd.')/SalesOrder(Document_Type='Order',No='101005')/  
```  
  
 The following line in the returned AtomPub document for the record provides link information for a containment:  
  
```  
<link rel="https://schemas.microsoft.com/ado/2007/08/dataservices/related/SalesOrderSalesLines"   
             type="application/atom+xml;type=feed" title="SalesOrderSalesLines"   
             href="SalesOrder(Document_Type='Order',No='101005')/SalesOrderSalesLines" />  
  
```  
  
 Notice the `type=feed` in the line above. To access the subpage data feed, use a URI that incorporates the link that was identified in the previous document:  
  
```  
https://localhost:7048/<server instance>/OData/Company('CRONUS-International-Ltd.')/SalesOrder(Document_Type='Order',No='101005')/SalesOrderSalesLines  
```  
  
## Using Associations  
 Associations are possible when two published pages are linked. Here is an example:  
  
-   Page 42,  Sales Order, has its **SourceTable** property set to table 36,  Sales Header. The source expression for the **Sell\_to\_Customer\_No** control on page 42 is field 2,  Sell-to Customer No., in table 36.  
  
-   Field 2,  Sell-to Customer No., in table 36 has a **TableRelation** property set to table 18,  Customer, field No.  
  
-   Table 18,  Customer, has a **LookupPageId** property set to page 22,  Customer List.  
  
 Thus if both page 42,  Sales Order, and page 22,  Customer List, are published as web services, then an OData URI can link from the **Sell\_to\_Customer\_No** control on page 42 to the related entity on page 22.  
  
 Because of this association, you can create OData URIs to access data on the Customer List page as you work with data on the Sales Order page.  
  
 If you publish pages 42 and 22 as web services, then you can return an AtomPub document for the Sales Order page. The following URI returns data for a single record on the page, which is order number 101005:  
  
```  
https://localhost:7048/<server instance>/OData/Company('CRONUS-International-Ltd.')/SalesOrder(Document_Type='Order',No='101005')/  
```  
  
 A set of three tags near the top of the returned document show one containment \(**SalesOrderSalesLines**\) and two associations \(**Sell\_to\_Customer\_No** and **Bill\_to\_Customer\_No**\) on the page. Notice the `type=entry` in the following lines:  
  
```  
<link rel="https://schemas.microsoft.com/ado/2007/08/dataservices/related/SalesOrderSalesLines"   
             type="application/atom+xml;type=feed" title="SalesOrderSalesLines"   
             href="SalesOrder(Document_Type='Order',No='101005')/SalesOrderSalesLines" />   
<link rel="https://schemas.microsoft.com/ado/2007/08/dataservices/related/Sell_to_Customer_No_Link"   
             type="application/atom+xml;type=entry" title="Sell_to_Customer_No_Link"   
             href="SalesOrder(Document_Type='Order',No='101005')/Sell_to_Customer_No_Link" />   
<link rel="https://schemas.microsoft.com/ado/2007/08/dataservices/related/Bill_to_Customer_No_Link"   
              type="application/atom+xml;type=entry" title="Bill_to_Customer_No_Link"   
              href="SalesOrder(Document_Type='Order',No='101005')/Bill_to_Customer_No_Link" />  
  
```  
  
 This information provides the necessary information to create a URI to access a record on the Customer List page by using an association:  
  
```  
https://localhost:7048/<server instance>/OData/Company('CRONUS-International-Ltd.')  
             /SalesOrder(Document_Type='Order',No='101005')/Sell_to_Customer_No_Link  
```  
  
 The following URI returns the same information with direct access to the Customer List page:  
  
```  
https://localhost:7048/<server instance>/OData/CustomerList('30000')  
```  
  
## See Also  
 [OData Web Services](OData-Web-Services.md)