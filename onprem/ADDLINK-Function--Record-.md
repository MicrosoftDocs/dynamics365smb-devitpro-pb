---
title: "ADDLINK Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4b49e92d-b390-45cc-9fd2-4ae8e0d9758a
caps.latest.revision: 13
manager: edupont
---
# ADDLINK Function (Record)
Adds a link to a record.  
  
## Syntax  
  
```  
  
[ID := ] Record.ADDLINK(URL[, Description])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that you want to add a link to.  
  
 *URL*, *Description*  
 Type: String  
  
 The link that you want to add to the record and an optional description of that link.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The ID of the URL that you want to add to the record.  
  
## Remarks  
 When you add a link to a page or a table, an entry is created in the **Record Link** system table. Each entry is given an ID.  
  
 The URL can be a link to a website, a file stored on the local computer or on a remote computer, or a link to a [!INCLUDE[navnow](includes/navnow_md.md)] page.  
  
## Example  
 In this example, you get the customer record that has a primary key number of 15000 and then add the specified URL to the **Record Link** table for that customer. You can then view the link in the **Links** FactBox on the Customer list or Customer card pages. This example requires that you create the following variables.  
  
|Name|DataType|Subtype|  
|----------|--------------|-------------|  
|Customer|Record|Customer|  
|ID|Integer|Not applicable|  
  
```  
Customer.GET('15000');  
ID := Customer.ADDLINK('www.northwindtraders.com','Northwind Traders');  
```  
  
## See Also  
 [Record Data Type](Record-Data-Type.md)