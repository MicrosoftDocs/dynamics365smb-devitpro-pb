---
title: "DataAccessIntent Property"
ms.custom: na
ms.date: 01/02/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
author: jswymer
---

# DataAccessIntent Property

Business Central artifacts (Reports, Pages, SOAP, and OData) now can get access to a read-only replica of the database. Sets whether the page is ReadWrite or ReadOnly.

## Applies To  

- Pages of the type API.

    The [Editable property](devenv-editable-property.md) must be set to **false**.

- Query
- Reports 

## Property Value

The following table describes the property values.  

|  Value  |  Description  |
|---------|---------------|  
|**ReadOnly**||  
|**ReadWrite**| |  
  


## Syntax
```
DataAccessIntent = ReadOnly|ReadWrite;
```

## Remarks  

This property works as a hint for the server, which will connect to the secondary replica if possible. When a workload is executed against the replica, insert/delete/modify operations are not possible, so a new validation is introduced for ReadOnly objects – any of these operations will throw an exception at runtime (new compile-time validation will be added in the future). 

## See Also  

[Properties](devenv-properties.md)   
[Page Properties](devenv-page-properties.md)  
[InDataSet Property](devenv-indataset-property.md)
