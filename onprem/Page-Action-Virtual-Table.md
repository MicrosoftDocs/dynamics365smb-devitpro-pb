---
title: "Page Action Virtual Table"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---

# Page Action Virtual Table
The **Page Action** virtual table contains data about actions on pages. The **Page Action** virtual table contains the following fields.   
 
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Page ID**|The ID for the page object.|  
|**Action Index**|The actions index in the page. |  
|**Action ID**|The ID of the action.|  
|**Indentation**|The indentation level of the action.|  
|**Parent Action ID**|The ID of the parent action.|  
|**Action Type**|The type of the action, such as **ActionContainer** or **Action**.|  
|**Action Subtype**|The **ActionContainer** type.|  
|**Name**|The name of the action.|  
|**Caption**|The caption of the action.|  
|**ToolTip1**|The first 250 characters if the action's tooltip. A tooltip can be 1000 characters long.| 
|**ToolTip2**|Characters 251-500 of the action's tooltip. |  
|**ToolTip3**|Characters 501-750 of the action's tooltip. |  
|**ToolTip4**|Characters 751-1000 of the action's tooltip. |   
|**Promoted**|The promoted state of the action.|  
|**RunObjectType**|The type of object that the action runs, such as a **Page**, **Report**, or **Codeunit**.|  
|**RunObjectID**|The ID of the object that the page runs.|  
|**RunPageMode**|The mode in which the page is run, such as **View**, **Edit**, or **Create**.|  
|**RunSourceTable**|The source table of the page or report that the action runs.|  
|**ApplicationArea**|The **ApplicationArea** that the action is assigned to.|  

Many of the fields in the virtual table correspond to C/AL properties on the page actions. For more information, see [Page Properties](Page-Properties.md).  
  
To access and view the **Page Action** virtual table, create a tabular-type page. For more information, see [How to: Create a Page to View a Virtual Table](How-to--Create-a-Page-to-View-a-Virtual-Table.md). 
  
## See Also  
 [Virtual Tables](Virtual-Tables.md)