---
title: "OnBeforeOpen Trigger"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ea037a45-e5f6-4f6c-a4ed-31d0a85c1e56
author: SusanneWindfeldPedersen
manager: edupont
---



# OnBeforeOpen Trigger
Executed before a query is run and the dataset is generated.  

## Syntax  

```
OnBeforeOpen()  
```  

## Remarks  
 The AL code of a query object includes the OnBeforeOpen trigger that you can use to change the data that will be included in the resulting dataset. For example, you can use the OnBeforeOpen trigger to apply filters to a column.  

 The OnBeforeOpen trigger only supports local variables; global variables are not supported.  

> [!NOTE]  
>  A query cannot be run from the OnBeforeOpen trigger. You cannot call methods from the triggers that run the query, such as OPEN, SAVEASXML, READ, or CLOSE methods.  

## Example  
 The following code applies a filter on the Quantity column of the query by calling the SETFILTER  on the OnBeforeOpen trigger of the query object.  

```  
currQuery.SETFILTER(Quantity, '>50');  
```  

## See Also  
[Triggers](devenv-triggers.md)  
<!--
 [Queries](../queries.md)   
 [Working with Queries in AL](../devenv-working-with-queries-in-AL.md)   -->

