---
title: "LinkTable Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 4a0ae945-1a46-46b3-b025-8bd3707128fd
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

 

# LinkTable Property
Sets the table that this XML item should be linked to. This property is only available for XML items that have a table as their data source.  
  
## Applies To  
 XMLports  

## Syntax
```
LinkTable = <field>;
```
 
## Remarks  
 This property works in combination with the [LinkFields Property](devenv-linkfields-property.md) and the [LinkTableForceInsert Property](devenv-linktableforceinsert-property.md).  
  
## Exporting  
 In this example, you are exporting data about specific customers and the orders that they placed. You create an XMLport based on the following database tables:  
  
-   A Customer table that contains general information about the customer, such as address, telephone number, and so on.  
  
-   A Sales Header table that contains information about the orders placed by these customers.  
  
 In the Customer table, the primary key is the customer number and is stored in the No. field. In the Sales Header table, each record contains this customer number as a foreign key in the Sell-to Customer No field.  
  
 Set the **LinkTable** property of the Sales Header XML item to point to the Customer table and set the [LinkFields Property](devenv-linkfields-property.md) of the Sales Header XML item so that the Sell-to Customer No. field is equal to the No. field in the Customer table. This places a filter on the records in the Customer table and ensures that only those records in the Sales Header table that refer to the customers you specified are selected and exported by the XMLport.  
  
 This corresponds to placing the following AL code in the [OnPreXMLItem Trigger](../triggers/devenv-onprexmlitem-trigger.md) of the indented data item.  
  
```  
SETRANGE("Sell-to Customer No.",Customer."No.");  
```  
  
## Importing  
 In this example, you are importing XML data that contains information about new customers as well as details about their first orders. You create an XMLport based on the following database tables:  
  
-   A Customer table that contains general information about the customer, such as address, telephone and so on.  
  
-   A Sales Header table that contains information about the orders placed by these customers.  
  
 In the Customer table, the primary key is the customer number and is stored in the No. field. In the Sales Header table, each record contains this customer number as a foreign key in the field called Sell-to Customer No.  
  
 You must set the **LinkTable** property of the Sales Header XML item to point to the Customer table and set the [LinkFields Property](devenv-linkfields-property.md) of the Sales Header XML item so that the Sell-to Customer No. field points to the No. field in the Customer table. This ensures that the customer numbers in the incoming data stream are inserted into both the Customer table and the Sales Header table. The incoming data stream must conform to the XML schema that you have defined for your XMLport.  
  
 In this example, the information you are importing has a header/line relationship—each customer can place many orders. The customer information is the parent of the sales header information. In this kind of relationship the parent information generally methods as a kind of wrapper that encapsulates the information about the children.  
  
 The schema typically starts by supplying some of the parent information, followed by the information about the children, and it finishes by supplying the last of the parent information.  
  
 When the XML stream is processed, it begins with the parent information, for example, the customer number is inserted into the No. field in the Customer table. Next comes the sales header information and the customer number is inserted into the Sell-to Customer No. field in the Sales Header table. The rest of the sales header information is then inserted into that table.  
  
 In this case, you must use the [LinkTableForceInsert Property](devenv-linktableforceinsert-property.md) to ensure that the parent information is inserted before the child information. The customer information is inserted into the Customer table before you start processing the sales header information. This makes it possible to validate the sales header information against the customer information as it is inserted.  
  
 After the sales header information has been processed, the last of the customer information is inserted into the Customer table.  
  
 If the customer number already exists, you will receive an error. This means that you will probably have to insert the data into a temporary table, modify it, and then insert it into the correct tables.  
  
## See Also  
 [Properties](devenv-properties.md)