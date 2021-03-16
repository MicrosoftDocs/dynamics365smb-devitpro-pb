---
title: "Lifecycle Services for Embed App"
author: jswymer
description: Provides an overview of Lifecycle Services for Embed App in Business Central
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 10/01/2020
---

# Managing an [!INCLUDE [prod_short](../developer/includes/prod_short.md)] [!INCLUDE[embed app](../developer/includes/embedapp.md)] in Microsoft Lifecycle Services

Microsoft provides essential functionality within [Microsoft Lifecycle Services](https://lcs.dynamics.com/v2) collaboration portal (LCS) to support qualified ISVs in managing the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] based on [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online.  

## Creating LCS project

In LCS, you should create a project for each [!INCLUDE[embedapp](../developer/includes/embedapp.md)] and each country you would like to deploy to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] service. You provide the list of countries where you want to run your Embed app during onboarding. You can only deploy your solution to the country that is already supported in the Business Central online service. Find the list of supported countries here: https://aka.ms/bccountries. 

Before you can create a project, you need to unlock a corresponding Private Preview feature. Once you sign in to LCS, select the **Preview feature management** action. Then on the Preview feature management page, select the "+" action to add a new preview feature using a preview code. In the **Preview code** field, enter the code you received from Microsoft during onboarding. You should now see the "Microsoft Dynamics 365 Business Central (SaaS)" feature on the list of the private preview features on this page.     

> [!IMPORTANT]  
> Even though the project will be created by one user, every user you are planning to add to your LCS project will have to activate the "Microsoft Dynamics 365 Business Central (SaaS)" feature using the same preview code you received from Microsoft. Without this activation, the users you add to your LCS project will run into permissions issues when trying to open the LCS project that you created. 

Navigate back to the main page and start creating a new project by selecting the "+" action. Choose **Migrate, create solutions, and learn** category as the purpose of the project. On the next page, provide the project name. 

> [!NOTE]
> You will have to create a separate project for each country, even if your Embed app is going to be exactly the same. Therefore we recommend that you use the name of your Embed app appended by the country code as the name of your project, for example "Fabrikam Rentals, DK", "Fabrikam Rentals, US" and so on.

Next, provide a short description for your project (optional), select **Microsoft Dynamics NAV** as the product name and **Microsoft Dynamics 365 Business Central (SaaS)** as the product version. Select the **Create** button to complete creation of the project. 

After you create the project, send its ID to the e-mail alias specified on the main project page for safe listing purposes. You can find the project ID in the URL displayed in your browser, such as `https://lcs.dynamics.com/V2/NavProjectDashboard/[projectID]`

Once your LCS project ID has been safe listed by Microsoft, you can start performing deployments of your solution to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] service.

## Deploying the [!INCLUDE[embedapp](../developer/includes/embedapp.md)]

### Prerequisites

Before deploying the [!INCLUDE[embedapp](../developer/includes/embedapp.md)], complete the following tasks:

1. Create the deployment package for the Embed App.

    The deployment package is a .zip file that contains components required for any Embed app. For more information, see [Creating Deployment Packages for Embed Apps](../embedapps/embed-app-deployment-package.md). 

2. Upload your apps into the App Repository

    Upload new versions of your own apps into the App Repository using the App Management API. Don't upload Microsoft apps or apps from other ISVs. The Microsoft team regularly uploads Microsoft apps and AppSource apps to this repository, so you don't have to. For more information, see [App Management API](../administration/appmanagement/app-management-api.md#upload-version).

### Upload the deployment package

Once you have the deployment package and uploaded the apps, you can upload the Embed App deployment package into the **Asset library** within your LCS project.

1. In your LCS project, select the **Asset library** action to navigate to the Asset library page.
2. Select the **+** action to open the **Upload Software deployable package file** wizard.
3. Provide the **Name** and **Description** (optional) for your package.

    The asset name you provide will be displayed on the Application Version list inside your project.
4. Select the **Add the file** action to select and upload the deployment package.

5. Wait for the package to get uploaded, then select the **Confirm** button to close the upload wizard.  

### Start the Embed App deployment

Now, start deploying the package you uploaded in the **Asset library** by doing the following steps:

1. Go to the **Rings** section of your project.
2. Select **Maintain** menu, then select **Deploy** action to open the **Deploy package** wizard.
3. Select the package you want to deploy in the **Package name** field.
4. Select the **Target platform**, then select **Deploy** button to start the deployment. 

The deployment routine will pull the apps that are listed in the `[apps]` section of the `manifest.json` file in your deployment package from the App Repository. It will then publish and install the apps based on the instructions you provided in the `manifest.json` file.

After the environment is successfully provisioned, its status on the list of application versions will be set to **Deployed**. To allow sign-ups to be directed to this application version, you select the **Use for new tenants** check box. You can only have one application version marked this way at a time. 

> [!IMPORTANT]
> The [!INCLUDE [prod_short](../developer/includes/prod_short.md)] platform is updated monthly. You are responsible for updating the Embed App to operate with the updated version of Business Central. The Embed App must run on a supported build of Business Central, for example, the current version of Business Central or one of the two immediately preceding versions. The immediately preceding versions can be both minor and major versions of Business Central. The list of supported versions is displayed in the LCS portal on the **Deploy package wizard** in the **Target platform** field. The versions, which aren't displayed on that list are out of support. You customers running on these versions can't be serviced at the service levels set forth in the published [Service Level Agreement](https://www.microsoft.com/licensing/product-licensing/products).


## Onboarding customers and creating environments

Partners who support an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] based on [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online can onboard customers in two ways:

- Using the self-service IW sign-up – for acquiring a free evaluation version of the app.  
- Through the Microsoft Partner Center Cloud Solution Provider (CSP) program by contacting the partner - for acquiring a paid production version of the [!INCLUDE[embedapp](../developer/includes/embedapp.md)].

Tenant provisioning is happening automatically (just-in-time) on the first attempt to sign in to the solution.

Navigating to `https://businesscentral.dynamics.com` will trigger provisioning of the Business Central tenant, while navigating to `https://[application name].bc.dynamics.com` will trigger provisioning of the tenant running on the *application name* application.  

### Self-Service (IW) sign-up - evaluation

The Embed App partner can choose to allow customers to use a self-service sign-up (also known as IW sign-up and viral sign-up) for their [!INCLUDE[embedapp](../developer/includes/embedapp.md)]. In that case, the partner must prepare a sign-up URL that will redirect the Microsoft 365 sign-up flow to their application URL. The sign-up URL must have the following format:

`https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2F[application name].bc.dynamics.com%2F%3FredirectedFromSignup%3D1`

The partner can then pass the URL to their customers, either from the partner's own marketing page or in a welcome e-mail, for example.

To work with an [!INCLUDE[embedapp](../developer/includes/embedapp.md)], the customers would use a URL that looks something like this:

- Client: `https://[application name].bc.dynamics.com`
- Web Services: `https://[application name].api.bc.dynamics.com`

In contrast, to work with [!include[prod_short](../developer/includes/prod_short.md)], they would use these URLs:

- Client: `https://businesscentral.dynamics.com` 
- Web Services: `https://api.businesscentral.dynamics.com`  

Once you've established the reseller relationship with the customer and added [!INCLUDE [prod_short](../developer/includes/prod_short.md)] subscriptions with required number of licenses for them, you must use your own branded Embed app URL to sign in their environment and [!INCLUDE [prod_short](../developer/includes/prod_short.md)] Administration center.

To create a new production environment for your customers, go to this URL:

```http
https://[your application family].bc.dynamics.com/[Customer's Azure AD Tenant ID]/Production
```

To open your customer's [!INCLUDE [prod_short](../developer/includes/prod_short.md)] Administration center, go to this URL:

```http
https://[your application family].bc.dynamics.com/[Customer's Azure AD Tenant ID]/admin
```

Each environment that you signed up for the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] is then displayed on the Tenant list part in your LCS project. On this part, you can find more details about the environment, including the name and the URL to sign in to each one. You can see which environments are running on which application version by selecting application version on the list.  

## Monitoring the Embed app

In the LCS portal, you get access to various logs for the activities that you do in the portal:

- Deployment: logs of deployment of the application versions  
- Tenant provisioning: logs of creation of the new customer environments  
- Tenant upgrades: logs of customer environments upgrades  
- Application errors: errors that are displayed to the customers when they work with the Embed app functionality

To get to these logs, in the Rings section of your project, select **Maintain** menu and then select **Monitor** action.  

On the **Ring monitoring** page, first select the **Category**, depending on the operation for which you want to retrieve the logs. Then set the **Period (min)** field to the number of minutes back in time, for which you want to see the logs. Don't use the **All** category.

> [!NOTE]
> The logs typically appear in LCS with a delay of 15 minutes. 

For easier troubleshooting, we recommend exporting the logs to a CSV file, using **Export to CSV** action, and then analyzing them in Microsoft Excel instead.  

It's important to always review the logs before submitting any issues to Microsoft. When reporting issues, attach the relevant logs in TXT or CSV format, don't use screenshots. 
 

## See Also

[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)  
[Licensing in Dynamics 365 Business Central](licensing.md)  
[Components and Capabilities](app-components.md)  
[Microsoft Responsibilities for Apps on Business Central online](microsoft-responsibilities.md)  
[Preparing Demonstration Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](../administration/demo-environment.md)  
[Preparing Test Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](../administration/test-environment.md)  
