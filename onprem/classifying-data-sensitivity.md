---
title: "Classifying Data Sensitivity"
ms.author: bholtorf
ms.custom: na
ms.date: 02/12/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: bholtorf
---

# Classifying Data Sensitivity
To classify the fields that hold sensitive or personal data, a Microsoft partner can set the ```DataClassification``` property on fields. This requires access to the database tables, either through the development environment or by running a Windows PowerShell script. For more information, see [Classifying Data](classifying-data.md).  

As a customer, you can add a second level of classification by specifying sensitivity levels for the data you store in standard and custom fields. Classifying data sensitivity helps ensure that you know where you keep personal data in your system, and makes it easier to respond to requests from data subjects. For example, if a contact or customer asks you to export their personal data.

The following table describes data sensitivity levels you can assign.

|Sensitivity|Description|
|----|----|
|Sensitive | Information about a data subject's racial or ethnic origin, political opinions, religious beliefs, involvement with trade unions, physical or mental health, sexuality, or details about criminal offenses. |
|Personal | Information that can be used to identify a data subject, either directly or in combination with other data or information.|
|Confidential | Business data that you use for accounting or other business purposes, and do not want to expose to other entities. For example, this might include ledger entries.|
|Normal | General data that does not belong to any other categories.|

## How Do I Classify My Data?
Classifying the sensitivity of a large number of fields one-by-one would take a long time. To help speed up the process, we provide tools that you can use to bulk classify the sensitivity of fields, and then fine-tune classifications for specific fields. You can find tools on the Data Classification worksheet, which is available on the Administration of users, user groups, and permissions Role Center. You must be a system administrator to use the worksheet.

> [!Important]
> When you open the Data Classification worksheet for the first time, it will be empty. You must run the Data Classification guide to generate the list of fields. To start the guide, choose the **Set Up Data Classifications** action. 

For example, the Data Classification worksheet lets you do things like:  

* Use the Data Classification guide to export your fields to an Excel worksheet where you can bulk classify them. Using the Excel worksheet is particularly useful if you are collaborating with a Microsoft partner. After you update the worksheet, you can use the guide to import and apply the classifications. You can also use the guide to classify fields manually.  
* Choose a field and then filter the list to find similar fields that are likely to belong to the same classification as the field you based the search on.  
* Investigate a field by viewing its contents.  

> [!Tip]
> We have defined sample sensitivity classifications for the tables and fields in the Cronus demonstration company. You can use those classifications as inspiration when you classify your own tables and fields.

## See Also
[Classifying Data](classifying-data.md)
