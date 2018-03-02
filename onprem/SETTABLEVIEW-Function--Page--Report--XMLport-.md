---
title: "SETTABLEVIEW Function (Page, Report, XMLport)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7519e028-69e2-42fc-96ef-28eabfd185c2
caps.latest.revision: 20
manager: edupont
---
# SETTABLEVIEW Function (Page, Report, XMLport)
Applies the table view on the current record as the table view for the page, report, or XMLport.  
  
## Syntax  
  
```  
  
SETTABLEVIEW(Record)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that has a table view that you want to apply to the page or data item.  
  
## Remarks  
 The table view is the view of the table that you present to the user. You determine what records that the user can see by setting filters, determining the sorting order, and selecting the keys.  
  
 This function only narrows the view of the table that was set through the [SourceTableView Property](SourceTableView-Property.md) of the page or through the [DataItemTableView Property](DataItemTableView-Property.md) of the data item.  
  
> [!IMPORTANT]  
>  SETTABLEVIEW is not supported for setting views on subpages from code on table headers. For example, you cannot set a table view on the SalesOrder subpage from the SalesHeader.  
  
## Example  
 This example is based on the Sales Header table and shows how SETTABLEVIEW is used for a page object. It requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|SalesHeader|Record|Sales Header|  
|SomePage|Page|Sales List|  
  
```  
SalesHeader.SETCURRENTKEY("Document Type");  
SalesHeader.SETRANGE("Document Type",SalesHeader."Document Type"::Order);  
SomePage.SETTABLEVIEW(SalesHeader); // Only view sales orders.  
SomePage.RUN  
```  
  
 The page that is reference by the SomePage variable can be any page object that has Sales Header as the value of the [SourceTable Property](SourceTable-Property.md).  
  
## See Also  
 [Report Data Type](Report-Data-Type.md)   
 [XMLport Data Type](XMLport-Data-Type.md)