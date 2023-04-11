---
title: "Report Metadata Virtual Table"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1c6023de-4928-4a6a-9ba1-6f65d95a3c8c
caps.latest.revision: 3
---
# Report Metadata Virtual Table
The **Report Metadata** virtual table \(ID 2000000139\) contains data about the pages in database. The following table describes the fields in the **Report Metadata** virtual table.  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**ID**|The ID for the report object.<br /><br /> Data type: Integer|  
|**Name**|Specifies the name of the report object.<br /><br /> Data type: String|  
|**Caption**|Specifies the caption of the report in the language that has been selected.<br /><br /> Data type: String|  
|**UseRequestPage**|Specifies whether a request page is presented to the user.<br /><br /> Data type: Boolean|  
|**UseSystemPrinter**|Specifies which printer is suggested when the report is run.<br /><br /> Data type: Boolean|  
|**EnableExternalImages**|Specifies whether external images are allowed on a report.<br /><br /> Data type: Boolean|  
|**EnableHyperLinks**|Specifies whether hyperlinks to URLs are allowed on reports.<br /><br /> Data type: Boolean|  
|**EnableExternalAssemblies**|Specifies whether external Microsoft .NET assemblies can be used on a report.<br /><br /> Data type: Boolean|  
|**ProcessingOnly**|Specifies the value that indicates whether a report produces printed output or only processes data.<br /><br /> Data type: Boolean|  
|**ShowPrintStatus**|Sets whether a window that shows the printing status of a report when it is run is displayed.<br /><br /> Data type: Boolean|  
|**TransactionType**|Sets the transaction type as either **UpdateNoLocks**, **Update**, **Snapshot**, **Browse**, or **Report**.<br /><br /> Data type: Option|  
|**PaperSourceFirstPage**|Specifies which paper source to use when printing page one of the report.<br /><br /> Data type: Integer|  
|**PaperSourceDefaultPage**|Specifies whether users can delete records while they are using the page.<br /><br /> Data type: Integer|  
|**PaperSourceLastPage**|Specifies the default paper source to use when printing the report.<br /><br /> Data type: Integer|  
|**PreviewMode**|Specifies how the report opens when you preview it. The options are **Normal** and **PrintLayout**.<br /><br /> Data type: Option|  
|**DefaultLayout**|Specifies whether the report uses the built-in RDLC or Word report layout by default.<br /><br /> Data type: Option|  
|**WordMergeDataItem**|Specifies the name of the root-level **DataItem** that is used for generating separate reports for multiple records.<br /><br /> Data type: String|  
|**FirstDataItemTableId**|Specifies the ID of the table that is associated with the first **DataItem** that is defined for the report in Report Designer. If there is not table, then this field is **0**.<br /><br /> Data type: Integer|  
  
 The fields in the virtual table correspond to C/AL properties on the page objects. For more information, see [Report Properties](Report-Properties.md).  
  
 To access and view the **Report Metadata** virtual table, you must create a tabular-type page. For more information, see [How to: Create a Page to View a Virtual Table](How-to--Create-a-Page-to-View-a-Virtual-Table.md)  
  
## See Also  
 [Virtual Tables](Virtual-Tables.md)
