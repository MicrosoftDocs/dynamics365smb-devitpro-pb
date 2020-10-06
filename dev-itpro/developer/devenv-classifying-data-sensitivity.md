---
title: "Classifying Data Sensitivity"
ms.author: bholtorf
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: bholtorf
---

# Classifying Data Sensitivity
To classify the fields that hold sensitive or personal data, a Microsoft partner can set the ```DataClassification``` property on fields and tables. This requires access to the database tables, either through the development environment or by running a Windows PowerShell script.  

As a customer, you can add a second level of classification by specifying sensitivity levels for the data you store in standard and custom fields. For example, this is particularly useful if you have repurposed a standard field, or added a new field on a page. The following table describes data sensitivity levels you can assign.

|Sensitivity|Description|
|----|----|
|Sensitive | Information about a data subject's racial or ethnic origin, political opinions, religious beliefs, involvement with trade unions, physical or mental health, sexuality, or details about criminal offenses. |
|Personal | Information that can be used to identify a data subject, either directly or in combination with other data or information.|
|Confidential | Business data that you use for accounting or other business purposes, and do not want to expose to other entities. For example, this might include ledger entries.|
|Normal | General data that does not belong to any other categories.|

## How do I classify my data?
Classifying data can be time consuming, especially if you are doing it for the first time. To make things a little easier, we have provided some tools that can help speed up the process. For example, the Data Classification worksheet lets you do things like:  

* Choose a field, and then find fields that are similar, and are likely to contain data that belongs to the same classification as the field you based the search on.  
* Export your data to Excel, where you can add classifications in bulk.  

## See Also
[Classifying Data](devenv-classifying-data.md)
