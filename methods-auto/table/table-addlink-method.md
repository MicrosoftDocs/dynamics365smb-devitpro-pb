---
title: "AddLink Method"
ms.author: solsen
ms.custom: na
ms.date: 09/28/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# AddLink Method
Adds a link to a record.

## Syntax
```
[ID := ]  Table.AddLink(URL: String, [Description: String])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*URL*  
&emsp;Type: [String](string-data-type.md)  
  
*Description*  
&emsp;Type: [String](string-data-type.md)  
  


## Return Value
*ID*  
&emsp;Type: [Integer](integer-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 When you add a link to a page or a table, an entry is created in the **Record Link** system table. Each entry is given an ID.  

 The URL can be a link to a website, a file stored on the local computer or on a remote computer, or a link to a [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] page.  

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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)