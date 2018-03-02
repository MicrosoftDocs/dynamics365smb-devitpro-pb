---
title: "Field Virtual Table"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c3cf5527-dec2-4c12-9f6f-a2a5f349bf0c
caps.latest.revision: 11
manager: edupont
---
# Field Virtual Table
The **Field** virtual table contains information about fields in database tables. The **Field** virtual table contains the following fields.  
  
|Field|Description|  
|-----------|-----------------|  
|**TableNo**|The ID number for the table.|  
|**No.**|The number assigned to the field.|  
|**Table Name**|The name of the table.|  
|**FieldName**|The name of the field.|  
|**Type**|The data type assigned to the field, for example, decimal.|  
|**Len**|The length of the field entry in bytes.|  
|**Class**|The class of the field, for example, FlowField.|  
|**Enabled**|Whether the field is enabled.|  
|**Type Name**|The data type assigned to the field. The length of the field entry in bytes is included for Code and Text data types.|  
|**Field Caption**|The caption of the field in the language that has been selected.|  
|**RelationTableNo**|The ID number for the table that the field is related to.| |**RelationFieldNo**|The number of the field in another table that the field is related to.|  
|**SQLDataType**|The data type assigned to code fields.|  
|**ObsoleteState** |Whether the table is or will become obsolete (deprecated).   |  
|**ObsoleteReason**|Why a table has been marked as **Pending** or **Obsolete** in the **ObsoleteState** property. |
|**DataClassification**|The classification of data in the field.|
  
 You must create a tabular-type page to access the **Field** table. For more information, see [How to: Create a Page to View a Virtual Table](How-to--Create-a-Page-to-View-a-Virtual-Table.md).  
  
> [!NOTE]  
>  For performance reasons, in pages that use the **Field** virtual table, the **RelationFieldNo** field is blank for fields with complex table relations. To parse all fields that have any table relationships is time consuming. Accordingly, data such as complex table relations is not available in windows such as the [!INCLUDE[rim](includes/rim_md.md)] configuration worksheet.  
  
## See Also  
 [Virtual Tables](Virtual-Tables.md)