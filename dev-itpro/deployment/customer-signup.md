---
title: "Trials and Sign-ups for Business Central online"
author: edupont04

ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 04/22/2020
---

# Trials and Sign-ups for Business Central Online

You can invite customers and prospects to sign up for any number of Dynamics 365 apps, including [!include[prodshort](../developer/includes/prodshort.md)] online and partner solutions based on [!INCLUDE [prodshort](../developer/includes/prodshort.md)], using the same account ID. These apps will run side-by-side with each other, will use different URLs, and will be displayed as separate tiles on the *home.dynamics.com* portal.  

This means that you can show prospects a preview of what you are offering based on trials of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] and other Dynamics 365 apps.  

## Prospects and trials

Prospects can contact you if they have signed up for the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] [free trial](/dynamics365/business-central/across-preview). This means that you can become their CSP partner. For more information, see [Connect with customers](../administration/get-started-online.md#connect-with-customers).  

Alternatively, you can create a more tailored trial environment based on the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] content pack on the [cdx.transform.microsoft.com](https://cdx.transform.microsoft.com/) site. For more information, see [Preparing Demonstration Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../administration/demo-environment.md).  

Some types of trials can be extended beyond 30 days, and not all types can be used for production data. The following table outlines the types of trials that you can offer prospects:

|Scenario |Trial period  |Can be extended  | Can be used for production|
|---------|--------------|-----------------|---------------------------|
|Prospect signs up for free trial with their work or school email account, and then switches to My Company for a 30 day trial|30 days         | Yes </br>Once through the in-product notification + once by the partner |  Yes       |
|Prospect signs up for free trial with an Microsoft 365 Business trial, and then switches to My Company for a 30 day trial|29 days         | Yes </br>They must extend their Microsoft 365 Business trial first, and then they can use the in-product notification to extend the trial one time |  No       |
|Partner assigns the **Dynamics 365 Business Central Premium Trial** license to an existing client in Partner Center so that they can try out the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] full experience in My Company|30 days         | No </br>The partner can assign a new **Dynamics 365 Business Central Premium Trial** license for a second 30 days trial |  Yes       |
|Partner creates a test customer and assigns the **Dynamics 365 Business Central Premium Trial** license to that in Partner Center. Then they invite a client or prospect to that trial. |30 days         | No </br>The partner can assign a new **Dynamics 365 Business Central Premium Trial** license for a second 30 days trial  |  Yes       |

At any point during their trial experience, when they are ready, you can convert their trial to a paid subscription using the Partner Center dashboard. For more information, see [Converting trials to paid subscriptions](/partner-center/offer-your-customers-trials-of-microsoft-products#converting-trials-to-paid-subscriptions).  

### <a name="premiumtrial"></a>The Dynamics 365 Business Central Premium Trial

[!INCLUDE [admin-premiumtrial](../developer/includes/admin-premiumtrial.md)]

## <a name="extendtrial"></a>Extending trials

[!INCLUDE [admin-extendtrials](../developer/includes/admin-extendtrials.md)]

## Embed Apps and signing customers up

[!INCLUDE[embedapp](../developer/includes/embedapp.md)] is a term that defines an end-to-end solution meeting the specific needs of a vertical or micro-vertical industry. Partners who support an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] based on [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online can onboard customers in two ways:

- Using the self-service IW sign-up – for acquiring a free evaluation version of the app.  
- Through the Microsoft Partner Center Cloud Solution Provider (CSP) program by contacting the partner - for acquiring a paid production version of the [!INCLUDE[embedapp](../developer/includes/embedapp.md)].

Tenant provisioning is happening automatically (just-in-time) on the first attempt to login into the solution.

Navigating to `https://businesscentral.dynamics.com` will trigger provisioning of the Business Central tenant, while navigating to `https://[application name].bc.dynamics.com` will trigger provisioning of the tenant running on the *application name* application.  

### Self Service (IW) sign-up - evaluation

The Embed App partner can choose to allow customers to use a self-service sign-up (also known as IW sign-up and viral sign-up) for their [!INCLUDE[embedapp](../developer/includes/embedapp.md)]. In that case, the partner must prepare a sign-up URL that will redirect the Office 365 sign-up flow to their application URL. The sign-up URL must have the following format:

`https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2F[application name].bc.dynamics.com%2F%3FredirectedFromSignup%3D1`

The partner can then pass the URL to their customers, either from the partner’s own marketing page or in a welcome e-mail, for example.

To work with an [!INCLUDE[embedapp](../developer/includes/embedapp.md)], the customers would use a URL that looks something like this:

- Client: `https://[application name].bc.dynamics.com`
- Web Services: `https://[application name].api.bc.dynamics.com`

In contrast, to work with [!include[prodshort](../developer/includes/prodshort.md)], they would use these URLs:

- Client: `https://businesscentral.dynamics.com` 
- Web Services: `https://api.businesscentral.dynamics.com`  

### Partner initiated (CSP) sign-up – paid

In CSP, it is the partner who defines the Partner-to-Customer price. Partners can use several options to charge their customers.

#### Option 1: [!INCLUDE[embedapp](../developer/includes/embedapp.md)] price is added on top of Microsoft-to-Partner price:

Example (not actual prices):

|     |Partner-to-Customer price|Price|
|-----|-----|-----|
|CSP |Essential|25+50=75 USD|

#### Option 2: [!INCLUDE[embedapp](../developer/includes/embedapp.md)] price is added as a 3rd party CSP offering

<!--This functionality is still in development by the CSP team; tentative GA of this feature is December 2018-->
Example (not actual prices):

|     |Partner-to-Customer price|Price|
|-----|-----|-----|
|CSP |Essential|25|
|CSP |Fabrikam Apples (Essential)|50|

#### Option 3: [!include[prodshort](../developer/includes/prodshort.md)] license + [!INCLUDE[embedapp](../developer/includes/embedapp.md)] self-monetization

Example (not actual prices):

|     |Partner-to-Customer price|Price|
|-----|-----|-----|
|CSP |Essential|25|
|External (such as www.stripe.com) |Fabrikam Apples (Essential) |50|  

In all three options, the partner will be selling [!include[prodshort](../developer/includes/prodshort.md)] licenses in CSP.  

## See Also

[Get Started as a Reseller of Business Central Online](../administration/get-started-online.md)  
[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)  
