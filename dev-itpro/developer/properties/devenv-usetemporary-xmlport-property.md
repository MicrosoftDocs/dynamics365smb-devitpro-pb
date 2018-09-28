---
title: "UseTemporary Property (XMLPort)"
author: solsen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 729f3649-f7c8-498d-8c16-961771f192a0
ms.author: jswymer
---
 
# UseTemporary Property (XMLPort)
Sets whether a temporary table is created to store the records imported using the XmlPort.

## Applies To  

- XMLport table elements

## See Also  
[Properties](devenv-properties.md)   
[XMLPort Object](../devenv-xmlport-object.md)   
[UseTemporary Property (Report)](devenv-usetemporary-report-property.md)

<!--
Notes:
- reports using records
- some of these reports can calculate data and if you do not want to have this stored in the database you can use a temporary table use temporary?? which is a property that you set on a table that will let you parse in - say this is temporary, it will not be stored in the database, it is only in memory. ???????
- so you can use it in that session, but not later on  so you can use it only if you want to .... an XMLport import something and you get the data set in that record and you can manipulate and do your calculations and store somewhere else. Or else you will have to have a record in your database. most cases you do not want to store data types if you have to process it first?? and the same for reports 

For user: you use it for data that you want to post process and not store directly in the database. 
-->