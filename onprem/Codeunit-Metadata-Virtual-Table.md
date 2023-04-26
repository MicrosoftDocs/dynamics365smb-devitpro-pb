---
title: "Codeunit Metadata Virtual Table"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6474c6f9-115a-42e3-944c-153b14d32e67
caps.latest.revision: 4
---
# Codeunit Metadata Virtual Table
The **Codeunit Metadata** virtual table \(ID 2000000137\) contains information about codeunits in the database. The following table describes the fields in the **Codeunit Metadata** virtual table.  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**ID**|The ID of the codeunit object.|  
|**Name**|Specifies the name of the codeunit object.|  
|**TableNo**|Specifies the ID of the source table object, if any.|  
|**SingleInstance**|Specifies whether a single instance of the codeunit and codeunit variables are instantiated.|  
|**SubType**|Specifies whether the codeunit acts as a normal, test, test runner, or upgrade codeunit.|  
  
 The fields in the virtual table correspond to properties on the codeunit objects. For more information, see [Codeunit Properties](Codeunit-Properties.md).  
  
 To access and view the **Codeunit Metadata** virtual table, you must create a tabular-type page. For more information, see [How to: Create a Page to View a Virtual Table](How-to--Create-a-Page-to-View-a-Virtual-Table.md)  
  
## See Also  
 [Virtual Tables](Virtual-Tables.md)
