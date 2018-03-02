---
title: "Temporary Property (Reports)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: badb7598-d6c1-4b16-96bc-170e0ee79382
caps.latest.revision: 7
manager: edupont
---
# Temporary Property (Reports)
Sets whether a temporary table is used to store the data set that is returned for columns of a data item.  
  
## Applies To  
 DataItems of reports  
  
## Property Value  
 **Yes** to use a temporary table; otherwise, **No**. The default value is **No**.  
  
## Remarks  
 A temporary table is used as a buffer or intermediate storage for data. A temporary table is not stored in the database, but is only held in memory until the report is closed. A temporary table is useful when the column data is not mapped directly to a field in the database but is instead the result of a process or operation, such as an aggregation of data from several columns. If a temporary table is not used, the data must be handled by C/AL code.  
  
 For an example of the use of the Temporary property, see report 1306 in the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
## See Also  
 [Temporary Tables](Temporary-Tables.md)   
 [Designing Reports](Designing-Reports.md)