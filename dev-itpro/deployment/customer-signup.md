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
ms.date: 01/07/2020
---

# Trials and Sign-ups for Business Central Online

A customer can sign up for any number of Dynamics 365 apps, including [!include[prodshort](../developer/includes/prodshort.md)] online and ISV solutions based on [!INCLUDE [prodshort](../developer/includes/prodshort.md)] using the same Org ID. These apps will run side-by-side with each other, will use different URLs and will be displayed as separate tiles on the *home.dynamics.com* portal.  

## Invite prospects to a trial

You can create a trial environment based on the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] content pack in [cdx.transform.microsoft.com](https://cdx.transform.microsoft.com/).  

For more information, see [Preparing Demonstration Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../administration/demo-environment.md).  

## Sign up for Embed Apps

[!INCLUDE[embedapp](../developer/includes/embedapp.md)] is a term that defines an end-to-end solution meeting the specific needs of a vertical or micro-vertical industry. Partners who support an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] based on p[!INCLUDE [prodshort](../developer/includes/prodshort.md)] online can onboard customers in two ways:

- Using the self-service IW signup – for acquiring a free evaluation version of the app.  
- Through the Microsoft Partner Center Cloud Solution Provider (CSP) program by contacting the partner - for acquiring a paid production version of the [!INCLUDE[embedapp](../developer/includes/embedapp.md)].

Tenant provisioning is happening automatically (just-in-time) on the first attempt to login into the solution.

Navigating to `https://businesscentral.dynamics.com` will trigger provisioning of the Business Central tenant, while navigating to `https://[application name].bc.dynamics.com` will trigger provisioning of the tenant running on the *application name* application.  

### Self Service (IW) sign-up - evaluation

The partner can allow customers to use the self-service sign-up (also known as IW signup and viral signup) for their [!INCLUDE[embedapp](../developer/includes/embedapp.md)]. To give customers self-service signup capability, the partner should prepare a signup URL that will redirect the Office signup flow to their application URL. The signup URL should have the following format:

```
https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2F[application name].bc.dynamics-TIE.com%2F%3FredirectedFromSignup%3D1

```

The partner can then pass the URL to their customers, either from the partner’s own marketing page or in a welcome e-mail.

To work with an [!INCLUDE[embedapp](../developer/includes/embedapp.md)], the customers would use a URL that looks something like this:

-   Client: `https://[application name].bc.dynamics.com` 
-   Web Services: `https://[application name].api.bc.dynamics.com` 

To work with [!include[prodshort](../developer/includes/prodshort.md)], they would use these URLs:

-   Client: `https://businesscentral.dynamics.com` 
-   Web Services: `https://api.businesscentral.dynamics.com`  
 
### Partner initiated (CSP) signup – paid 
 
In CSP, it is the Partner who defines the Partner-to-Customer price. Partners can use several options to charge their customers.

#### Option 1: [!INCLUDE[embedapp](../developer/includes/embedapp.md)] price is added on top of Microsoft-to-Partner price: 

Example (not actual prices): 

|     |Partner-to-Customer price|Price|
|-----|-----|-----|
|CSP |Essential|25+50=75 USD| 
 
#### Option 2: [!INCLUDE[embedapp](../developer/includes/embedapp.md)] price is added as a 3rd party CSP offering (This functionality is still in development by the CSP team; tentative GA of this feature is December 2018): 
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
|External (e.g. www.stripe.com) |Fabrikam Apples (Essential) |50|  


In all three options, the ISV partner will be selling [!include[prodshort](../developer/includes/prodshort.md)] licenses in CSP.  

## See Also

[Get Started as a Reseller of Business Central Online](../administration/get-started-online.md)  
[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)  

