---
title: "Using About This Page and About This Report"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0b18ff07-ed4d-4924-83a1-6a2f3d74084d
caps.latest.revision: 16
manager: edupont
---
# Using About This Page and About This Report
To see more information about a page, use the About This Page feature to view all the fields that make up the current page. These fields are the fields for the current record in the table on which the page is based. For example, if you open a sales order page, choose the Help button, and then choose **About This Page**, the **About This Page: Sales Order** window opens. The **About This Page** window shows the following FastTabs:  
  
-   Page Information  
  
-   Table Fields, sorted first by key fields, then alphabetically  
  
-   Source Expressions  
  
-   FlowFilter Fields  
  
-   Filters  
  
-   URLs that open the page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the [!INCLUDE[nav_web](includes/nav_web_md.md)], and in SOAP and OData web services.  
  
 The following illustration shows a Sales Order page and the About This Page.  
  
 ![About This Page window that shows all fields.](media/NAV_Zoom_SalesOrderRTC.png "NAV\_Zoom\_SalesOrderRTC")  
  
> [!NOTE]  
>  To see more information about a subpage, such as a Factbox or a Line page, you must use the shortcut for About This Page, CTRL+ALT+F1.  
  
 To see more information about a report, use the About This Report feature to view the dataset on which the report is based. For example, if you view the report preview of the Inventory Cost and Price List report, then the first time that you choose the Help button and then choose **About This Report**, you activate the About This Report feature. After the feature is activated, if you view the report preview, choose the Help button, and then choose **About This Report**, then the **About this Report: Inventory Cost and Price List** page opens. The following illustration shows the Inventory Cost and Price List report and the About This Report page.  
  
 ![About This Report page that shows the dataset.](media/NAV_Zoom_AboutThisReport.png "NAV\_Zoom\_AboutThisReport")  
  
> [!NOTE]  
>  The About This Report feature remains active during the client session. When the feature is active, the size of the data that is sent to the client when you run a report is about twice the size of the data when the feature is not active. To deactivate the feature, restart the client.  
  
## URLs for the Page or Report  
 The About This Page window includes a FastTab where you can see the URLs for opening the page. For example, if you want to save the hyperlink to open a page in the [!INCLUDE[nav_web](includes/nav_web_md.md)], you can copy the URL from the About This Page window. Similarly, you can get the URL for a report from the request page for the report. For more information, see [How to: Copy the URL to Open a Page or Report](How-to--Copy-the-URL-to-Open-a-Page-or-Report.md).  
  
 The URLs are generated based on the current [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration.  
  
## Troubleshooting with About This Page and About This Report  
 You can use the About This Page and About This Report features to help you troubleshoot and debug issues. For example, if you create a new page and need to troubleshoot the data that is displayed on the page, then you can use the About This Page feature to view all the fields for the current record, including filters that were set by the user and FlowFilter fields.  
  
## Exporting About This Page Information  
 You can export the About This Page information to the following formats:  
  
-   HTML attachment in a new e-mail message  
  
-   Microsoft Word document  
  
-   Microsoft Excel spreadsheet  
  
 You can also print the About This Page information directly from the **About This Page** window.  
  
## See Also  
 [How to: View All Table Fields for a Record](How-to--View-All-Table-Fields-for-a-Record.md)   
 [How to: View and Export the Dataset for a Report](How-to--View-and-Export-the-Dataset-for-a-Report.md)   
 [How to: Copy the URL to Open a Page or Report](How-to--Copy-the-URL-to-Open-a-Page-or-Report.md)