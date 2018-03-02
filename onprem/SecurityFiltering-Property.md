---
title: "SecurityFiltering Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 65cd2256-1463-4f6d-9ed3-9918336b61d5
caps.latest.revision: 5
manager: edupont
---
# SecurityFiltering Property
Specifies how security filters are applied to the record.  
  
## Applies To  
  
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
 To change the **SecurityFiltering** property on a record variable, either select the value in the **Properties** window of the variable, or specify the value in C/AL code. To change the **SecurityFiltering** property on an implicit record on a page, report, or XMLport, you must specify the value in C/AL code.  
  
 To specify the **SecurityFiltering** property in C/AL code, use the following syntax.  
  
```  
RecordVar.SecurityFiltering := SecurityFilter::<Disallowed|Filtered|Ignored|Validated>  
```  
  
 The value of the **SecurityFiltering** property on a record takes effect immediately and remains in effect through the lifetime of the variable, or until you change the value.  
  
## See Also  
 [Record-Level Security](Record-Level-Security.md)   
 [How to: Set Security Filters](How-to--Set-Security-Filters.md)   
 [Security Filter Modes](Security-Filter-Modes.md)