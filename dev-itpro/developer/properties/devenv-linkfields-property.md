---
title: "LinkFields Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9171051b-358a-44ce-a8dc-1ebc6f74ef44
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

 
# LinkFields Property

Specifies the fields that are linked between two tables using the [LinkTable Property](devenv-linktable-property.md). This property is only available for XML items that have a table as their data source.  
  
## Applies to  

- XMLports  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**<field>**|A field from the table that is specified as the data source of this XML item|  
|**<reference field>**|A field from the table that is specified in the [LinkTable Property](devenv-linktable-property.md).|  
  
## Syntax

```AL
LinkFields = <field>=FIELD(<reference field>)   
```  

## Remarks  
 
This property works in combination with the [LinkTable Property](devenv-linktable-property.md) and the [LinkTableForceInsert Property](devenv-linktableforceinsert-property.md).  
  
The property sets a filter on the table that is the data source for the XML item. The filter selects only those records that contain the same **<field>** value in source table as the **<reference field>** value from the table specified in [LinkTable Property](devenv-linktable-property.md).  
  
For example, you have defined two XML items—one based on the Customer table that contains a list of customers and one based on the Sales Header table that contains a record of each sales order that has been made.  
  
In the Customer table, the primary key is the customer number and is stored in the No. field. In the Sales Header table that contains the sales data, each record contains this customer number as a foreign key in the field called Sell-to Customer No.  
  
Setting the [LinkTable Property](devenv-linktable-property.md) of the second XML item to point to the Customer table and setting the Linkfields property of the first XML item to point to the Sell-to Customer No. field places a filter on the records in the Customer table. This means that only those records in the Sales Header table that refer to the current customer are selected.  
  
The same result can be obtained by placing this AL statement in the [OnPreXMLItem Trigger](../triggers/devenv-onprexmlitem-trigger.md) of the child data item.  
  
```AL
SetRange("Sell-to Customer No.",Customer."No.");  
```  
  
## See Also

[LinkTable Property](devenv-linktable-property.md)   
[LinkTableForceInsert Property](devenv-linktableforceinsert-property.md)