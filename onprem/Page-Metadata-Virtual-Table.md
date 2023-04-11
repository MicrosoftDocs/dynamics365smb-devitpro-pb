---
title: "Page Metadata Virtual Table"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b21e8d51-044b-4018-8a9d-830b851c04ea
caps.latest.revision: 3
---
# Page Metadata Virtual Table
The **Page Metadata** virtual table \(ID 2000000138\) contains data about the pages in database. The following table describes the fields in the **Page Metadata** virtual table.  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**ID**|The ID for the page object.|  
|**Name**|Specifies the name of the page object.|  
|**Caption**|Specifies the caption of the page in the language that has been selected.|  
|**Editable**|Specifies whether the page can be edited through the UI.|  
|**PageType**|Specifies the page type as either **Card**, **List**, **RoleCenter**, **CardPart**, **ListPart**, **Document**, **Worksheet**, **ListPlus**, **ConfirmationDialog**, **NavigatePage**, or **StandardDialog**.|  
|**CardPageID**|Specifies the ID of the **Card** type page that is associated with items in the page. This is typically used when the page is a **List**, **ListPart** or **ListPlus** page type.|  
|**DataCaptionExpr**|Specifies a C/AL expression that is evaluated and displayed to the left of the page caption.|  
|**RefreshOnActivate**|Specifies whether data on the page is automatically refreshed if you leave the page \(without closing it\), and then return.|  
|**SourceTable**|Specifies the ID of the table from which this page will display records.|  
|**SourceTableView**|Specifies the key, sort order, and filter you want to use to determine the view of the source table presented to the user.|  
|**InsertAllowed**|Specifies whether users can add records while they are using a page.|  
|**ModifiedAllowed**|Specifies whether users can modify records while they are using this page.|  
|**DeleteAllowed**|Specifies whether users can delete records while they are using the page.|  
|**DelayedInsert**|Specifies whether a user must leave a record before it is inserted into the database.|  
|**ShowFilter**|Specifies whether the filter pane is shown on a page by default.|  
|**MultipleNewLines**|Specifies whether users can add multiple new lines between records.|  
|**SaveValues**|Specifies whether user-specific control values are saved for this page.|  
|**AutoSplit**|Specifies whether a key is automatically created for a new record positioned between the current record and the previous record.|  
|**DataCaptionFields**|Specifies the fields that appear to the left of the caption on pages.|  
|**SourceTableTemporary**|Specifies whether the source table is a temporary table.|  
|**LinksAllowed**|Specifies whether links or notes are allowed on the page.|  
|**PopulateAllFields**|Specifies whether fields are filled out automatically with a single filter value when a new record is inserted in a table.|  
  
 The fields in the virtual table correspond to C/AL properties on the page objects. For more information, see [Page Properties](Page-Properties.md).  
  
 To access and view the **Page Metadata** virtual table, you must create a tabular-type page. For more information, see [How to: Create a Page to View a Virtual Table](How-to--Create-a-Page-to-View-a-Virtual-Table.md)  
  
## See Also  
 [Virtual Tables](Virtual-Tables.md)
