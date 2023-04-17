---
title: "Request Pages"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1b05123e-2ae3-4958-949c-2b7cd7e047d6
caps.latest.revision: 7
---
# Request Pages
A request page is a page that is run before the report starts to execute. Request pages enable end users to specify options and filters for a report.  

 You design the **Options** FastTab of a request page by using Request Options Page Designer in the development environment. To access Request Options Page Designer, open Report Dataset Designer, choose **View**, and then choose **Request Page**.  

 You design the filters on request pages by using the following report properties:  

|Property|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|[ReqFilterHeading Property](ReqFilterHeading-Property.md)|Sets a caption for the request page tab that is related to this data item.|  
|[ReqFilterHeadingML Property](ReqFilterHeadingML-Property.md)|Sets the text used as a ReqFilterHeading Property for a request page tab.|  
|[ReqFilterFields Property](ReqFilterFields-Property.md)|Sets which fields are automatically included on the tab of the request page that is related to this data item. The user can set filters on these fields.|  

 In addition to specifying options and filters, users can choose from the following actions on a request page:  

-   **Print**  

-   **Preview**  

-   **Cancel**  

-   **Help**  

## Filtering on Request Pages  
 The fields that you define as **ReqFilterFields** are shown on the request page. In addition, an end user can add more fields on which to filter to the request page.  

> [!NOTE]  
>  We recommend that you add fields that the end users of the report will frequently set filters on.  

 By default, for every data item in the report, a FastTab for defining filters and sorting is created on the request page. To remove a FastTab from a request page, do not define any **ReqFilterFields** for the data item and set the **DataItemTableView** property to define sorting. The request page is displayed but there is no tab for this data item.  

 If a **DataItemTableView** is not defined, then end users can select a sort field and sort order at runtime.  

 If you set **UseReqPage** to **No**, then the report will start to print as soon as it is run. In this case, end users cannot cancel the report run. It is still possible to cancel the report, but some pages may print.  

 In a complex report that uses data from several tables, the functionality may depend on a specific key and sort order. Design your reports so that end users cannot change the sort order in a way that affects the functionality of the report.  

## See Also  
 [Reports](Reports.md)   
 [Report Design Overview](Report-Design-Overview.md)
