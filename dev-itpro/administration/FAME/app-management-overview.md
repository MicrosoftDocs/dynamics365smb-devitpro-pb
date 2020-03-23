---
title: "FAME Overview"
author: jswymer
ms.custom: na
ms.date: 10/03/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# App Management

Each [!INCLUDE[prodshort](../../developer/includes/prodshort.md)] environment is built as a collection of apps. These apps include Microsoft apps and apps from AppSource that reselling partners have installed for customers. The apps are working together to provide customers with a broad set of features to address their various business, market, and industry needs.

There are three types of apps available for the customers: Add-on, Connect, and Embed. You can find more details about each type [Getting You Started with Building Apps](../../developer/readiness/readiness-add-on-apps-getting-you-started.md).
 
Fixed App Management Endpoint (FAME) is a REST-based API that enables ISVs to manage their apps that are running in customer Business Central environments. Authorized ISVs access FAME globally by using this endpoint: [https://apps.businesscentral.dynamics.com](https://apps.businesscentral.dynamics.com).
 
Once their app has been registered by Microsoft, embed app ISVs can access the API directly and do the following main operations:  

- Publish major, minor, and hotfix updates of their apps available in the Business Central Admin Center for their customers.

      on the **Manage Apps** page, by uploading the new app versions to the FAME App Repository  
- Retrieve the list of customers' environments that have their app installed.
- Schedule the automatic deployment of the app hotfixes for their customers' environments.  
 
The API lets the Embed app ISVs apply modern CI/CD and DevOps practices to their work by automating the processes mentioned earlier using Microsoft Azure DevOps Services or other available process automation tools. It allows these ISVs to organize role-based access control, manage their apps at scale, in multiple geo locations, with advanced and well controlled build, test and release flows. 
 
You can find the full API description here: [LINK] 
 
Add-on and Connect apps at this point do not have direct access to the FAME API. Initial, major, minor and hotfix versions of these apps are uploaded using the Business Central offers, which the ISVs create and manage in the Partner Center, these apps then undergo technical and marketing validation and become available via AppSource. 
 
The uploaded apps, which passed the validation, also become available for the customers in the Business Central Admin Center on the Manage Apps page.  
 
## Legal 
 
The apps stored in the FAME App Repository are governed by the Microsoft Publisher Agreement. 
https://partner.microsoft.com/en-us/solutions/business-applications/isv-publish  
 
FAME API is governed by Microsoft APIs Terms of Use: 
https://docs.microsoft.com/en-us/legal/microsoft-apis/terms-of-use  
