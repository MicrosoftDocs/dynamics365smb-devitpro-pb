---
title: "FAME Overview"
author: jswymer
ms.custom: na
ms.date: 03/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# App Management for ISVs

Each [!INCLUDE[prodshort](../../developer/includes/prodshort.md)] environment is built as a collection of apps. These apps include Microsoft apps and apps from AppSource that reselling partners have installed for customers. The apps are working together to provide customers with a broad set of features to address their various business, market, and industry needs.

As an authorized ISV, there are three types of apps that you can make available to customers: Add-on, Connect, and Embed. You can find more details about each type [Getting You Started with Building Apps](../../developer/readiness/readiness-add-on-apps-getting-you-started.md). To enable you to manage your apps running in different customer Business Central environments, The [!INCLUDE[prodshort](../../developer/includes/prodshort.md)] provides the Fixed App Management Endpoint (FAME) API.

## About FAME API

The FAME API is a REST-based that is accessible directly from Embed apps. It requires that you're an authorized ISV and your apps have been registered by Microsoft. Once registered, you access the FAME API by using this global endpoint: [https://apps.businesscentral.dynamics.com](https://apps.businesscentral.dynamics.com), and do the following main operations:  

- Make  major, minor, and hotfix app updates available to customers for installation from the Business Central administration center.

    You make the updates available by uploading the new app versions to the FAME App Repository. The new app versions will then be available on **Manage Apps** page of the customer's Business Central administration.
- Retrieve the list of the customers' environments that have your app installed.
- Schedule the automatic deployment of the app hotfixes for their customers' environments.  

With FAME API, you can apply modern continuous integration (CI), continuous deployment (CD), and DevOps practices to your work. For example, FAME lets you:

- Automate operations by using Microsoft Azure DevOps Services or other available process automation tools.
- Organize role-based access control.
- Manage your apps at scale, in multiple geo locations, supported by advanced and well-controlled build, test, and release flows.

For more information about the API, see [Fixed App Management Endpoint API](fame-api.md).

### Add-on and Connect Apps 

At this point, Add-on and Connect apps don't have direct access to the FAME API. Initial, major, minor, and hotfix versions of these apps are uploaded using the Business Central offers, which you create and manage in Partner Center. These apps then undergo technical and marketing validation and become available via AppSource.

The uploaded apps, which passed the validation, also become available for the customers in the Business Central Admin Center on the **Manage Apps** page.  
 
## Legal

The apps stored in the FAME App Repository are governed by the Microsoft Publisher Agreement.
https://partner.microsoft.com/en-us/solutions/business-applications/isv-publish  
 
FAME API is governed by Microsoft APIs Terms of Use: 
https://docs.microsoft.com/en-us/legal/microsoft-apis/terms-of-use  
