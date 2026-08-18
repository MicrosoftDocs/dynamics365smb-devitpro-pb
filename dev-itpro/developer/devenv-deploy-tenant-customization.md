---
title: Deploying a tenant customization
description: Overview of how you deploy an .app package with a tenant customization to Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.date: 01/08/2025
ms.topic: how-to
ms.author: solsen
ms.reviewer: solsen
---

# Deploy a per-tenant extension

When you finish developing and testing your per-tenant extension (PTE), deploy the extension (.app file) containing the customization to your customer’s production tenant. You can upload and deploy PTEs to an environment by using [App Management in the Admin Center](../administration/tenant-admin-center-manage-apps.md) or by using the **Extension Management** page in the environment.

[!INCLUDE[admin-install-pte-note](../includes/admin-install-pte-note.md)]

> [!NOTE]
> You can only view scheduled installation details in the interface you use (Admin Center or Extension Management) to upload the PTE. To avoid confusion, use a single method consistently when deploying and installing PTEs for a given environment.

When you deploy an .app file for the next version, the extension is queued to be deployed as part of the customer’s tenant update to the next version. Typically, use this feature when you build an update of the extension to work with the next version.

## Extension uniqueness requirements

If you're developing and deploying an updated version of a previously deployed extension, you must keep the app ID the same and increase the version number to successfully upgrade the extension. The deployment services require that uploaded extension packages be unique per tenant based on several sets of keys:

- Package ID
- App ID + Version
- Name + Publisher + Version

> [!NOTE]
> These parameters are defined in the app.json file of the extension. Learn more in [JSON files](devenv-json-files.md#appjson-file).

If you successfully deployed an extension to a tenant, and then recompile the extension’s source code without updating version number, this action generates a new extension package file with a new package ID. If you try to upload this new extension package file to a different tenant, the upload fails with the error similar to `An extension with same App ID and version has already been uploaded. Resolve and deploy again.`. Similarly, if an extension failed to deploy, and you try to upload a new extension package with the same version number, the upload fails as well.

<!-- 
When developing a per-tenant extension from the same source code as an extension for multiple tenants, we recommend that you adjust the App ID, Name, Publisher, and Version of the extension for each tenant to maintain uniqueness. You may deploy the same extension package to multiple tenants if the package ID, app ID, name, publisher, and version are all the same.

If, when creating a new sandbox environment as a copy of a production environment, you receive a message indicating that the environment creation failed due to an existing development extension, it is related to violation of uniqueness requirements for extension packages.

Typically this situation is the result of the production environment being copied having an extension package installed with the same app ID, name, publisher, and version as a development extension published to another sandbox environment within the same application service. To resolve this situation, remove the development extension by unpublishing it via the Extension Management page of the other sandbox environment once you have made sure you have a backup of the extension development files. After this is completed you can attempt to copy a production environment to a sandbox again. It is recommended that when you create the extension package for distribution, you use a different app ID than that used for your development extension, which will help you avoid this conflict between your development sandbox and your customer’s production and sandbox environments. -->

## Upload and schedule installation from the Admin Center

Administrators and applications can upload and schedule installation of PTEs from the **Manage Apps** page in the Admin Center or using its API. To upload a new PTE or an update to an existing PTE, choose **Install Extension** on the **Manage Apps** or **App Details** page. Uploading and deploying PTEs through the Admin Center requires internal, delegated, or application administrator permissions to access the Admin Center (API), but no more permissions are needed within the target environment itself.

For more information on required permissions, see [The Business Central Admin Center](../administration/tenant-admin-center.md).
For more information on managing apps in the Admin Center, see [App Management in the Admin Center](../administration/tenant-admin-center-manage-apps.md).

## Upload and schedule installation from the Extension Management page

Users and applications can upload and schedule installation of PTEs from the **Extension Management** page in the environment or by using the Automation API. You must be able to sign in to the customer’s tenant as a user with permissions to the **Extension Management** page to complete the deployment.

Under **Manage**, use the **Upload Extension** action to deploy the extension. You can deploy the extension for the current version or for the next version of the service. In most cases, select the current version, unless you developed the extension specifically for the next version.

The extension you're deploying might be the initial release of the customization or an upgrade to a previous version. Use the same steps for uploading a new extension or an extension upgrade. The service determines if the extension needs to be upgraded based on the extension’s app ID and version.

### Steps for deploying your .app file

1. Sign in to your customer’s Dynamics 365 Business Central tenant.
1. Open the **Extension Management** page.
1. Under **Manage**, choose the **Upload Extension** action.
1. Select the browse button to select the .app file to upload. Browse to and select the extension’s .app file.
1. Select if you want to deploy for the current version (most common) or next minor or major version. Select the language for the deployment.
1. Choose the **Schema Sync Mode** and select whether to add schema changes or to force the schema changes.
1. Select the option switch to on to accept the disclaimer.
1. Choose the **Deploy** button.
1. The extension is deployed in the background.  
    To check the status of the deployment, choose **Deployment Status** and then view the status of the extension deployment. Select the row to see other details.  
    In the deployment status details, there's a **Refresh** button in the actions you must select to retrieve the most recent status and details.
1. When the extension is successfully deployed, choose the **Refresh** button to see the new extension in the list of installed extensions.

## Upgrades and per-tenant extensions

In some cases, Microsoft can't automatically upgrade a customer's production environment that includes a per-tenant extension. In those cases, Microsoft contacts the reselling partner and provides guidance for how to update the extension. However, if the extension remains impossible to update when the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version the environment is on reaches its Enforced Update Period, the extension is uninstalled automatically to succeed the update. For more information, see [Update Cycles](../administration/update-rollout-timeline.md).

## Related information

[Get started with AL](devenv-get-started.md)  
[AL development environment](devenv-reference-overview.md)  
[FAQ for developing in AL](devenv-dev-faq.md)  
[Use Designer](devenv-inclient-designer.md)  
