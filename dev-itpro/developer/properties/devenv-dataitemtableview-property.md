---
title: "DataItemTableView Property"
ms.custom: na
ms.date: 06/01/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e3f54118-d3c7-46af-8e75-aaaed3756b6f
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

 

# DataItemTableView Property
Sets the key on which to sort, the sort order, and the filters for the data item.  
  
## Applies To  
 Data items on reports.  
  
## Remarks  
 Choose the **AssistEdit** button to open the **Table View** window, where you can set the key field or fields on which to sort, the sort order, and the filters that you want to use.  
  
-   If you set a key in the **Table View** window, then the data item does not have a FastTab on the request page and the end users cannot select a key for sorting, sort order, or filters for the data item.  
  
-   If you set a sort order in the **Table View** window, then this sort order is used for the report, regardless of the sort order that the end user selects on the request page.  
  
-   If you set a filter in the **Table View** window, then this filter is not displayed on the request page but it is used along with any filters that the end user specifies on the request page.  
  
-   Setting a sort order, a filter, or both in the **Table View** window does not prevent end users from selecting a sort field on the request page. The default sort field that is displayed in the request page is the primary key. The list of fields on which you can sort includes all keys for the data item. To add fields to the list, you must add keys to the table.  
<!--   
## See Also  
 [Request Pages](Request-Pages.md) -->