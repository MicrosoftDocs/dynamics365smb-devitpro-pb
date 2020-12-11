---
title: "Deploying a Tenant Customization"
description: "Overview of the how you deploy an .app package with a tenant customization to Dynamics 365 Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Deploying a Tenant Customization

When you have finished developing and testing your tenant customization, you must deploy the extension (.app file) containing the customization to your customer’s production tenant. You must be able to log into the customer’s tenant as a user with permissions to the **Extension Management** page to complete the deployment.

Use the **Upload Extension** action to deploy the extension. The extension can be deployed for the current version or for the next version of the service. In most cases it is sufficient to select the current version, unless you have developed the extension specifically for the next version.

> [!NOTE]
> When you deploy an .app file for the next version, the extension will be queued up to be deployed as part of the customer’s tenant being upgraded to the next version. You can typically use this in a situation where you have built an upgrade of the extension to work with the next version.  

The extension you are deploying could be the initial release of the customization or an upgrade to a previous version. You must use the same steps for uploading a new extension or an extension upgrade. The service will determine if the extension needs to be upgraded based on the extension’s app ID and version.

## Steps for deploying your .app file

1. Log into your customer’s Dynamics 365 Business Central tenant.
2. Open the **Extension Management** page.
3. Choose the **Upload Extension** action.
4. Select the browse button to select the .app file to upload. Browse to and select the extension’s .app file.
5. Select if you want to deploy for the current version (most common) or next version. Select the language for the deployment.
6. Choose the **Deploy** button.
7. The extension will be deployed in the background.  
    To check the status of the deployment, choose **Deployment Status** and then view the status of the extension deployment. Select the row to see additional details.  
    In the deployment status details there is a **Refresh** button in the actions you must press to retrieve the most recent status and details.
8. When the extension has been successfully deployed, choose the **Refresh** button to see the new extension in the list of installed extensions.

## Extension uniqueness requirements

If you are developing and deploying an updated version of a previously-deployed extension, you must keep the app ID the same and increase the version number to successfully upgrade the extension. The deployment services require that uploaded extension packages be unique across all tenants based on several sets of keys:

- Package ID
- App ID + Version
- Name + Publisher + Version

> [!NOTE]
> These parameters are defined in the app.json file of the extension. For more information, see [JSON files](devenv-json-files.md#Appjson).

If you have successfully deployed an extension to a tenant, and then recompile the extension’s source code without updating version number, this generates a new extension package file with a new package ID. If you try to upload this new extension package file to a different tenant, the upload will fail with the error similar to `An extension with same App ID and version has already been uploaded. Resolve and deploy again.`. Similarly, if an extension failed to deploy, and you try to upload a new extension package with the same version number, the upload will fail as well.

When developing a per-tenant extension from the same source code as an extension for multiple tenants, we recommend that you adjust the App ID, Name, Publisher, and Version of the extension for each tenant to maintain uniqueness. You may deploy the same extension package to multiple tenants if the package ID, app ID, name, publisher, and version are all the same.

If, when creating a new sandbox environment as a copy of a production environment, you receive a message indicating that the environment creation failed due to an existing development extension, it is related to violation of uniqueness requirements for extension packages.

Typically this situation is the result of the production environment being copied having an extension package installed with the same app ID, name, publisher, and version as a development extension published to another sandbox environment within the same application service. To resolve this situation, remove the development extension by unpublishing it via the Extension Management page of the other sandbox environment once you have made sure you have a backup of the extension development files. After this is completed you can attempt to copy a production environment to a sandbox again. It is recommended that when you create the extension package for distribution, you use a different app ID than that used for your development extension, which will help you avoid this conflict between your development sandbox and your customer’s production and sandbox environments.

## Upgrades and per-tenant extensions

In some cases, a customer's production environment that includes a per-tenant extension cannot be upgraded automatically by Microsoft. In those cases Microsoft contacts the reselling partner and provides guidance for how to update the extension. However, if the extension remains impossible to upgrade, Microsoft will wait for 90 days and then uninstall the extension and force-upgrade the tenant.  

## See Also
[Getting Started with AL](devenv-get-started.md)  
[AL Development Environment](devenv-reference-overview.md)  
[FAQ for Developing in AL](devenv-dev-faq.md)  
[Using Designer](devenv-inclient-designer.md)  
