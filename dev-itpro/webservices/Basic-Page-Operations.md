---
title: "Basic Page Operations"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---
# Basic Page Operations
When you publish a page as a SOAP web service, it has a set of default operations that are exposed to consumers of the web service.  

 These operations match the actions a user can perform by interacting with a page using the RoleTailored client. The same page- and table-based business logic is executed.  

 The following table lists the operations and provides links to reference pages.  

 Pages that are backed by virtual tables are not editable through web services. When such pages are published as SOAP web services, the only operations that are available are **Read**, **ReadMultiple**, and **IsUpdated**.  

 The term *entity* that is used in the operation signatures describes the data type that is used. The actual entity is defined by the page that is exposed because it contains all controls that are defined on the page. The controls are normally bound to the page's source table. The entity also contains a key that is a special string that uniquely identifies the source table record with a timestamp. This key is used as an argument in many page operations.  

 All basic page operations are atomic, which means that either all relevant records are affected or no records are affected, even if there was a faulty condition in only one record.  

|Operation|Description and signature|  
|---------------|-------------------------------|  
|[Create Operation](Create-Operation.md)|Creates a single record.<br /><br /> `void Create(ref Entity entity)`|  
|[CreateMultiple Operation](CreateMultiple-Operation.md)|Creates a set of records.<br /><br /> `void CreateMultiple(ref Entity[] entity)`|  
|[Delete Operation](Delete-Operation.md)|Deletes a single record.<br /><br /> `bool Delete(string key)`|  
|[Delete\_*part* Operation](Delete_-part--Operation.md)|Deletes a subpage of the current page.<br /><br /> `bool Delete_<part>(string key)`|  
|[GetRecIdFromKey](GetRecIdFromKey-operation.md)|Converts a key, which is always part of the page result, to a record ID.<br /><br /> `string GetRecIdFromKey(string key)`|  
|[IsUpdated Operation](IsUpdated-Operation.md)|Checks if an object has been updated since the key was obtained.<br /><br /> `bool IsUpdated(string key)`|  
|[Read Operation](Read-Operation.md)|Reads a single record.<br /><br /> `Entity Read(string no)`|  
|[ReadByRecId Operation](ReadByRecId-Operation.md)|Reads the record that is identified by RecId. You can use GetRecIdFromKey to obtain a record ID. If the record is not found, then the operation returns null.<br /><br /> `Entity ReadByRecId(string formattedRecId)`|  
|[ReadMultiple Operation](ReadMultiple-Operation.md)|Reads a filtered set of records, paged.<br /><br /> `Entity [] ReadMultiple(Entity_Filter[] filterArray, string bookmarkKey, int setSize)`|  
|[Update Operation](Update-Operation.md)|Updates a single record.<br /><br /> `void Update(ref Entity entity)`|  
|[UpdateMultiple Operation](UpdateMultiple-Operation.md)|Updates a set of records.<br /><br /> `void UpdateMultiple(ref Entity[] entity)`|  

## See Also  
 [SOAP Web Services](soap-web-services.md)  