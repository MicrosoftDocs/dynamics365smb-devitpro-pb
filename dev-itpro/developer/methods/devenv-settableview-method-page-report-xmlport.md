---
title: "SETTABLEVIEW Method (Page, Report, XMLport)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 7519e028-69e2-42fc-96ef-28eabfd185c2
caps.latest.revision: 20
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETTABLEVIEW Method (Page, Report, XMLport)
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
  
 This method only narrows the view of the table that was set through the [SourceTableView Property](../properties/devenv-SourceTableView-Property.md) of the page or through the [DataItemTableView Property](../properties/devenv-DataItemTableView-Property.md) of the data item.  
  
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
  
 The page that is reference by the SomePage variable can be any page object that has Sales Header as the value of the [SourceTable Property](../properties/devenv-SourceTable-Property.md).  
  
## See Also  
 [Report Data Type](../datatypes/devenv-Report-Data-Type.md)   
 [XMLport Data Type](../datatypes/devenv-XMLport-Data-Type.md)