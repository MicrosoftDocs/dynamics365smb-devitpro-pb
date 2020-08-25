---
title: "Key Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 8e1fffd3-9a04-4062-aa9e-2655326db9c5
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# Key Property
Use this property to identify the field or fields that make up this key.  
  
## Applies To  
 Keys  
  
## Remarks  
 You can select up to 20 fields for each key and you can have up to 40 keys for each table. The combination of the data in the fields that you select for the key must be unique. The first key that you create is the primary key for the table. If the key consists of more than one field, separate the fields with commas. For more information, see [Table Keys](../devenv-table-keys.md).

> [!NOTE]  
> In the development environment, it is technically possible to create a primary key based on up to 20 fields. However, because of SQL Server limitations, only the first 16 are used.

  
 Searching for specific data is usually easier if several keys are defined and maintained for the table. The indexes for each of the keys provide specific views that let the system quickly perform flexible searches. There are advantages and disadvantages to creating a large number of keys. For examples, see the following table.  
  
|**Value**|**Performance increases**|**Performance slows**|  
|---------------|-------------------------------|---------------------------|  
|Increase the number of secondary keys marked as active|When you retrieve data in several different sorting sequences, because the data is already sorted.|When you enter data because indexes need to be maintained for each secondary key.|  
|Decrease the number of secondary keys marked as active|When you enter data because there are fewer indexes to maintain.|When you retrieve data. You may have to define or reactivate the secondary keys to get the appropriate sorting. Depending on the size of the database, this can take some time, because the index must be rebuilt.|  
  
## See Also  
 [Table Keys](../devenv-table-keys.md)