---
title: Add enhancements to Business Central demo environments
description: Enhance your demo environments with Contoso Coffee data, connectivity apps, Dynamics 365 Sales integration, and Field Service capabilities.
author: jswymer
ms.custom: bap-template
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 06/24/2026
ms.author: jswymer
ai-usage: ai-assisted 
---
# Add enhancements to Business Central demo environments

Once you have a demo environment set up, you can enhance it with more data, apps, and integrations to showcase more advanced capabilities.

## Add Contoso Coffee demo data

The Contoso Coffee Demo Data app for [!INCLUDE [prod_short](../includes/prod_short.md)] includes demo data that you can add to a trial company or a sandbox environment to showcase or learn advanced manufacturing capabilities.

**Use this when:** You want to demonstrate supply chain and advanced manufacturing features.

Learn more in the business functionality content for [!INCLUDE [prod_short](../includes/prod_short.md)]:

- [Introduction to Contoso Coffee Demo Data](/dynamics365/business-central/contoso-coffee/contoso-coffee-intro)
- [Scenarios for Contoso Coffee Demo Data](/dynamics365/business-central/contoso-coffee/contoso-coffee-intro)

## Add connectivity apps

Demonstrate integrations and connected scenarios with connectivity apps.

[!INCLUDE [admin-connectapps-demo](../includes/admin-connectapps-demo.md)]

[!INCLUDE [admin-connectapps-isv](../includes/admin-connectapps-isv.md)]

## Add Dynamics 365 Sales Professional and Field Service

After you have a Microsoft 365 demo account, you can sign up for trials of Dynamics 365 Sales Professional and Dynamics 365 Field Service to demonstrate their integration with [!INCLUDE [prod_short](../includes/prod_short.md)]. Business Central integrates with both apps through Dataverse. Field Service integration builds on the Sales connection, so set up Sales integration first, even if your goal is to demo Field Service.

> [!TIP]
> Integration between Business Central and Dynamics 365 Sales happens through Dataverse. Learn more at [Integrating with Dynamics 365 Sales](/dynamics365/business-central/admin-prepare-dynamics-365-for-sales-for-integration) in the business functionality content.

### Step 1: Sign up for the trials

1. In a dedicated browser window, sign in with the admin account for the Microsoft demo account.

   With an MDX tenant, you were given an account when the tenant was created. Learn more in [Set up Microsoft 365 and Business Central demo environments with MDX](demo-environment-mdx.md#create-a-demo-environment).

1. Go to the [Dynamics 365 Sales Professional page](https://dynamics.microsoft.com/sales/professional/), select **Try for free**, and then follow the steps to add the Sales trial to your account.

    This trial creates a Dataverse-enabled **Sales trial** environment in Power Platform.

1. To also demo Dynamics 365 Field Service, go to the [Field Service product page](https://www.microsoft.com/dynamics-365/products/field-service), select the **Try for free** button, and follow the steps to add the Field Service trial to your account.

    This trial creates a separate Dataverse-enabled **FieldService trial** environment in Power Platform. The environment is installed with the **Dynamics 365 Field Service** app.

1. To run Sales and Field Service in the same environment, install the **Dynamics 365 Field Service** app to the Sales trial environment. Follow these steps

   1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
   1. In the navigation pane, select **Manage**.
   1. In the **Manage** pane, select **Environments**.
   1. On the **Environments** page, select the **Sales Trial** environment.
   1. Select **Resources**, and then select **Dynamics 365 apps**.
   1. Select **Open AppSource** to go to Microsoft Marketplace.
   1. Search for **Trial: Dynamics 365 for Field Service**, select **Free trial**, and follow the instructions to install the app. When prompted to select an environment, select **Sales Trial**.

Learn more about managing apps in Power Platform at [Manage Dynamics 365 apps](/power-platform/admin/manage-apps).

### Step 2: Connect Business Central to Dataverse

1. In another browser tab, sign in to [!INCLUDE [prod_short](../includes/prod_short.md)] at [https://businesscentral.dynamics.com](https://businesscentral.dynamics.com/?redirectedFromSignup=1).

1. [!INCLUDE[open-search](../developer/includes/open-search.md)], enter **Assisted Setup**, and then choose the related link.
1. Choose **Set up a connection to Microsoft Dataverse** to start the assisted setup guide.
1. In the assisted setup guide, choose the **Sales trial** environment and install the Business Central virtual table on it when prompted.

    Installing the virtual table can take a while. You can check the status in Power Platform.

### Step 3: Connect Business Central to Dynamics 365 Sales

1. [!INCLUDE[open-search](../developer/includes/open-search.md)], enter **Assisted Setup**, and then choose the related link.
1. Choose **Set up Dynamics 365 Sales Connection** to start the assisted setup guide.
1. Follow the steps in the assisted setup guide to enable the connection to your Sales trial.

    To also integrate Field Service, select **Install Field Service App** in the guide, and then install the Field Service Integration app in Business Central.

Learn about setting up the connection in [Connection settings in the setup guide](/dynamics365/business-central/admin-prepare-dynamics-365-for-sales-for-integration#connection-settings-in-the-setup-guide).

### Step 4: Add Dynamics 365 Field Service integration

Complete the Sales connection before you set up Field Service. The Field Service setup isn't available until the Sales setup is finished.

1. [!INCLUDE[open-search](../developer/includes/open-search.md)], enter **Assisted Setup**, and then choose the related link.
1. Choose **Set up an integration to Dynamics 365 Field Service** to start the assisted setup guide.
1. Follow the steps in the assisted setup guide to complete the Field Service integration.

Learn about setting up the connection in [Integrate with Microsoft Dynamics 365 Field Service](/dynamics365/business-central/admin-integrate-field-service#set-up-the-integration-in-business-central).

After setup, Business Central, Dynamics 365 Sales, and Dynamics 365 Field Service share data through Dataverse. You can demo end-to-end scenarios such as customer management, sales processes, and service operations.

## Use the sandbox environment for demos

Convert Power Platform environments to sandbox environments for demos. In the sandbox environment, you can:

- **Reset without Dynamics 365 apps**: Reset the environment to get an empty Dataverse database. Then use the **Set up Dataverse connection** assisted setup to integrate [!INCLUDE [prod_short](../includes/prod_short.md)] with Dataverse.

Learn more at [Reset environment](/power-platform/admin/reset-environment) and [Integrating with Microsoft Dataverse](/dynamics365/business-central/admin-common-data-service).

- **Reset with specific Dynamics 365 apps**: Reset the environment with specific Dynamics 365 apps, with or without sample data, to demo to different audiences. Learn more at [Reset environment](/power-platform/admin/reset-environment).

For example, when you reset the sandbox environment, you can choose to deploy Sales enterprise and demo integration between [!INCLUDE [prod_short](../includes/prod_short.md)] and the full capabilities of Dynamics 365 Sales. Learn more at [Integrating with Dynamics 365 Sales](/dynamics365/business-central/admin-prepare-dynamics-365-for-sales-for-integration#integrating-through-dataverse).

> [!NOTE]
> Trial environments are sandboxes by default.

### Convert production environment to sandbox


1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/environments) with the same admin credentials.

1. In the list of environments, select the trial environment, and then select the **Convert to production** action.

   > [!NOTE]
   > The trial environment has the **Type** field set to **Trial (29 days)**. Don't convert the default environment.

   After a few minutes, the trial environment is converted to a production environment, and the Type field changes to *Production*.

1. Select the converted environment again, and then select the **Convert to sandbox** action.

## Related information

[Demo environment options overview](demo-environment.md)  
[Set up Microsoft 365 demo environments](demo-environment-mdx.md)  
[Use trial and sandbox demo environments](demo-environment-trial.md)  
[Preparing Test Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](test-environment.md)  
[Administration of Business Central Online](tenant-administration.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
