---
title: "Deploying an Embed app"
description: Get an overview of the tasks required to deploy a Business Central Embed app to the Online service
author: jswymer
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 10/01/2020
---

# Embed Apps Deployment

This article provides an overview of the process for deploying an Embed App to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Online service. The deployment involves the following tasks:

|Task|Description|See...|
|----|-----------|------|
|Create a deployment package|The deployment package is a .zip file that contains components required for any Embed app, including:<ul><li>ISV branding elements, like images, icons, names, and so on</li><li>An application database and tenant template databases</li><li>A manifest-json file that provides additional metadata and deployment instructions.|[Creating Deployment Packages for Embed Apps](../embedapps/embed-app-deployment-package.md)|
|Upload your apps to the App Repository|The apps are the individual extensions that make up your application. Apps are delivered as .app files. You upload your apps into the App Repository by using the App Management API.|[App Management API](../administration/appmanagement/app-management-overview.md)|
|Upload the deployment package to Microsoft Lifecycle Services (LCS)|Once you have the deployment package, and your apps have been uploaded, you can deploy your package to an LCS project.|[Managing Embed Apps in Microsoft Lifecycle Services](../deployment/embed-app-lifecycle-services.md)|

## See Also

[Embed App Overview](../deployment/embed-app-overview.md)  
[Qualification and Onboarding](../deployment/embed-app-qualifications-onboarding.md)  
[Managing Embed Apps in Microsoft Lifecycle Services](../deployment/embed-app-lifecycle-services.md)  
