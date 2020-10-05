---
title: automationCompany resource type | Microsoft Docs
description: A automationCompany in Dynamics 365 Business Central.
documentationcenter: ''
author: henrikwh

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/01/2020
ms.author: solsen
---

# automationCompany Resource Type
Represents an automationCompany resource type in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)]. 

## Methods

| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET automationCompanies](dynamics-microsoft-automation-automationcompanies-get.md)|automationCompany|Gets all automationCompanies.|
|[POST automationCompanies](dynamics-microsoft-automation-automationcompanies-post.md)|automationCompany|Creates a company, automationCompanies.|
|[DELETE automationCompanies](dynamics-microsoft-automation-automationcompanies-delete.md)|none|Deletes a company, automationCompanies.|
|[PATCH automationCompanies](dynamics-microsoft-automation-automationcompanies-patch.md)|automationCompany|Updates a company, automationCompanies.|


## Properties

| Property	      | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|id               |GUID  |The unique ID of the company. Read-Only.|
|name             |string|Specifies the Company.                  |
|evaluationCompany|string|Specifies the Company is an evaluation company.                  |
|displayName      |string|Specifies the company display name.     |
|businessProfileId|string|Specifies the Business Profile ID linked to the company.|


## Relationships

None

## JSON representation

Here is a JSON representation of the automationCompany.

```json
{
  "id": "GUID",
  "name": "string",
  "evaluationCompany": "boolean",
  "displayName": "string",
  "businessProfileId": "string",
}

```

## See Also 
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[Create Company](dynamics-microsoft-automation-automationCompanies-post.md)  
[Update Company](dynamics-microsoft-automation-automationCompanies-patch.md)  
[Delete Company](dynamics-microsoft-automation-automationCompanies-delete.md)  
[Get automationCompany](dynamics-microsoft-automation-automationCompanies-get.md)