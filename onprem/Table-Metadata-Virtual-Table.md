---
title: "Table Metadata Virtual Table"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 40de1a1b-a7cd-4cd6-8de4-7d14b87f6876
caps.latest.revision: 9
manager: edupont
---
# Table Metadata Virtual Table
The **Table Metadata** virtual table \(ID 2000000136\) contains data about the tables in database. The following table describes the fields in the **Table Metadata** virtual table.  

|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|[ID](ID-Property.md)|The ID for the table object.|  
| [Name](Name-Property.md) |Specifies the name of the table object.|  
|[Caption](Caption-Property.md)|Specifies the caption of the table in the language that has been selected.|  
|[DataPerCompany](DataPerCompany-Property.md)|Sets whether the table data applies to only the current company \(**No**\) or all companies \(**Yes**\) in the database.|  
|[LookupPageID](LookupPageID-Property.md)|Specifies the ID of the page that is used for lookup.|  
|[DrillDownPageID](DrillDownPageID-Property.md) |Specifies the ID of the page that is used for drill down.| |**DataCaption Fields**|Specifies one or more fields that will be used as captions when a record from this table is displayed in a page.|  
|[PasteIsValid](PasteIsValid-Property.md) |Specifies whether inserting records into this table using the paste command is enabled.|  
|[LinkedObject](LinkedObject-Property.md)  |Specifies whether to link to SQL Server objects.|  
|**DataIsExternal**|Specifies whether the data is from an external table which means that the data is not managed by [!INCLUDE[navnow](includes/navnow_md.md)].<br /><br /> **DataIsExternal** is set if the [LinkedObject Property](LinkedObject-Property.md) is set to **Yes** or the [TableType Property](TableType-Property.md) is set to **365 for Sales** or **ExternalSQL** .|  
|[TableType](TableType-Property.md)|Specifies whether the table type is **Normal**, **365 for Sales**, or **ExternalSQL**.|  
|[ExternalName](externalname-property.md)|Specifies the name of the original table in the external database. |  
|[ObsoleteState](obsoletestate-property.md) |Marks whether the table is or will become obsolete (deprecated).   |  
|[ObsoleteReason](obsoletereason-property.md)|Specifies why a table has been marked as **Pending** or **Obsolete** in the **ObsoleteState** property. |
|[DataClassification](dataclassification-Property.md)|Specifies the classification of data in the table.|  


Except for the **DataIsExternal** field, the fields in the virtual table correspond directly to C/AL properties on the table objects. For more information, see [Table Properties](Table-Properties.md).  

 To access and view the **Table Metadata** virtual table, you must create a tabular-type page. For more information, see [How to: Create a Page to View a Virtual Table](How-to--Create-a-Page-to-View-a-Virtual-Table.md)  

## See Also  
 [Virtual Tables](Virtual-Tables.md)
