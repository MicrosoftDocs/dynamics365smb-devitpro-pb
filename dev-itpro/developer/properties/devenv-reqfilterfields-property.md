---
title: "ReqFilterFields Property"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c90654ad-da85-496c-900a-1c2fc7dd2f2b
caps.latest.revision: 13
---

 

# ReqFilterFields Property
Sets which fields are automatically included on the tab of the request page that is related to this data item. The user can set filters on these fields.  
  
## Applies To  
  
-   Data items on reports.  
  
-   Table elements on XMLports.  
  
## Property Value  
 A comma-separated list of field names.  
  
## Remarks  
 You can select fields by choosing the **AssistEdit** button in the **Value** field of this property. A user can add other fields to the request page and set filters on these fields. We recommend that you use this property for common filter fields. If the source table of a report has many fields, then it is time-consuming for a user to add fields to the request page.  
  
 If you do not want users to add filters on fields, then use one of the following methods:  
  
-   Do not specify any filters in the **ReqFilterFields** property and specify a key field on which to sort in the [DataItemTableView Property](devenv-dataitemtableview-property.md).  
  
-   Remove the request page by using the [UseRequestPage Property](devenv-userequestpage-property.md) of the report.  
<!--  
## See Also  
 [Request Pages](../Request-Pages.md) -->