---
title: "OnBeforeOpen Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ea037a45-e5f6-4f6c-a4ed-31d0a85c1e56
caps.latest.revision: 7
manager: edupont
---
# OnBeforeOpen Trigger
Executed before a query is run and the dataset is generated.  

## Syntax  

```vb  
OnBeforeOpen()  
```  

## Remarks  
 The C/AL code of a query object includes the OnBeforeOpen trigger that you can use to change the data that will be included in the resulting dataset. For example, you can use the OnBeforeOpen trigger to apply filters to a column.  

 The OnBeforeOpen trigger only supports local variables; global variables are not supported.  

> [!NOTE]  
>  A query cannot be run from the OnBeforeOpen trigger. You cannot call functions from the triggers that run the query, such as OPEN, SAVEASXML, READ, or CLOSE functions.  

## Example  
 The following code applies a filter on the Quantity column of the query by calling the SETFILTER function on the OnBeforeOpen trigger of the query object.  

```  
currQuery.SETFILTER(Quantity, '>50');  
```  

## See Also  
 [Queries](Queries.md)   
 [Working with Queries in C/AL](Working-with-Queries-in-C-AL.md)   
 [Queries](Queries.md)
