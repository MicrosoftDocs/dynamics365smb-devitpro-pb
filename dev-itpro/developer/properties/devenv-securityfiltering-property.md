---
title: "SecurityFiltering Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 65cd2256-1463-4f6d-9ed3-9918336b61d5
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 

# SecurityFiltering Property
Specifies how security filters are applied to the record.  
  
## Applies to  
  
-   Record variables  
  
-   Records on pages, reports, and XMLports  
  
-   Query variables  
  
## Property Value  
  
|Value|Description|  
|-----------|-----------------|  
|Disallowed|Security filters are not allowed on the record. If any security filters are set, then you receive an error when you run the object that uses this instance of the record.|  
|Filtered|All security filters are applied to this instance of the record.|  
|Ignored|All security filters are ignored for this instance of the record.|  
|Validated|All security filters are applied to this instance of the record and if any code tries to access a record that is outside the range of the security filters, then an error occurs.|  
  
## Remarks  
 To specify the **SecurityFiltering** property in AL code, use the following syntax.  
  
```  
RecordVar.SecurityFiltering := SecurityFilter::<Disallowed|Filtered|Ignored|Validated>  
```  
  
 The value of the **SecurityFiltering** property on a record takes effect immediately and remains in effect through the lifetime of the variable, or until you change the value. 

 For more information, see [Security Filter Modes](../../security/Security-Filters.md). 
  
## See Also  
[Record-Level Security](../../security/data-security.md)   
[Using Security Filters](../../security/security-filters.md)   