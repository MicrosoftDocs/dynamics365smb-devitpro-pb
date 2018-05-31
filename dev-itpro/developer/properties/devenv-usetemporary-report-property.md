---
title: "UseTemporary Property (Report)"
author: solsen
ms.custom: na
ms.date: 05/31/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 729f3649-f7c8-498d-8c16-961771f192a0
ms.author: jswymer
---
 
# UseTemporary Property (Report)
Sets whether a temporary table is used to store the data set that is returned for columns of a data item.

## Applies To  

- Report data items

## See Also  
[Properties](devenv-properties.md)   
[Report Object](../devenv-report-object.md)   
[UseTemporary Property (XMLPort)](devenv-usetemporary-xmlport-property.md)  

Notes:
- reports using records
- some of these reports can calculate data and if you do not want to have this stored in the database you can use a temporary table use temporary?? which is a property that you set on a table that will let you parse in - say this is temporary, it will not be stored in the database, it is only in memory. ???????
- so you can use it in that session, but not later on  so you can use it only if you want to .... an XMLport import something and you get the table set of that record and you can do your calculations and store somewhere else. Or else you will have to have a record in your database. most cases you do not want to store data types if you have to process it first?? and the same for reports 