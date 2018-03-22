---
title: "Deploying a Tenant Customization"
description: "Overview of the how you deploy an .app package with a tenant customization to Dynamics 365 Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/06/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Deploying a Tenant Customization
When you have you have finished developing and testing your tenant customization, you must deploy the extension (.app file) containing the customization to your customer’s production tenant. 
You must be able to log into the customer’s tenant as a user with permissions to the **Extension Management** page to complete the deployment. 

You will use the **Upload Extension** action to deploy the extension. The extension can be deployed for the current version or for the next version of the service. In most cases you will select the current version, unless you have developed the extension specifically for the next version. 

> [!NOTE]
> When you deploy an .app file for the next version, the extension will be queued up to be deployed as part of the customer’s tenant being upgraded to the next version. You can typically use this in a situation where you have built an upgrade of the extension to work with the next version.  

The extension you are deploying could be the initial release of the customization or an upgrade to a previous version. You must use the same steps for uploading a new extension or an extension upgrade. The service will determine if the extension needs to be upgraded based on the extension’s app ID and version. 

> [!IMPORTANT]
> If you are developing an extension as an update to a previously deployed extension, you must keep the app ID the same and increase the version to successfully upgrade the extension to the new version. 

## Steps for deploying your .app file

1.	Log into your customer’s Dynamics 365 Business Central tenant.
2.	Open the **Extension Management** page.
3.	Choose the **Upload Extension** action.
4.	Select the browse button to select the .app file to upload. Browse to and select the extension’s .app file.
5.	Select if you want to deploy for the current version (most common) or next version. Select the language for the deployment.
6.	Choose the **Deploy** button. 
7.	The extension will be deployed in the background.  
    To check the status of the deployment, choose **Deployment Status** and then view the status of the extension deployment. Select the row to see additional details.  
    In the deployment status details there is a **Refresh** button in the actions you must press to retrieve the most recent status and details.
9.	When the extension has been successfully deployed, choose the **Refresh** button to see the new extension in the list of installed extensions.


## See Also
[Getting Started with AL](devenv-get-started.md)  
[AL Development Environment](devenv-reference-overview.md)  
[FAQ for Developing in AL](devenv-dev-faq.md)  
[Using Designer](devenv-inclient-designer.md)  
