---
title: "[!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)] Licensing"
ms.custom: na
ms.date: 28/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Customer Signup to [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)]
A customer can sign up for any number of [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)]s and for [!INCLUDE[d365_bus_cent_short_md](includes/d365_bus_cent_short_md.md)] application using the same Org ID. These apps will run side-by-side with each other, will use different URLs and will be displayed as separate tiles on the home.dynamics.com portal. 
There are two ways for a customer (tenant, organization) to subscribe to an [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)]: 
-   Using the self-service IW signup – for acquiring a free evaluation version of the app.  
-   Through the Microsoft Partner Center Cloud Solution Provider (CSP) program by contacting the partner - for acquiring a paid production version of the [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)].

Tenant provisioning is happening automatically (just-in-time) on the first attempt to login into the solution.

Navigating to https://businesscentral.dynamics.com will trigger provisioning of the Business Central tenant, while navigating to  https://[application name].bc.dynamics.com will trigger provisioning of the tenant running on the “[application name]” application.  
 
## Self Service (IW) signup - evaluation 
 
The partner can allow customers to use the self-service signup (also known as IW signup and viral signup) for their [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)]. To give customers self-service signup capability, the partner should prepare a signup URL that will redirect the Office signup flow to their application URL. The signup URL should have the following format:

``` 
https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2F[application name].bc.dynamics-TIE.com%2F%3FredirectedFromSignup%3D1

``` 

The partner can then pass the URL to their customers, either from the partner’s own marketing page or in a welcome e-mail.

To work with an [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)], the customers would use a URL that looks something like this:

-   Client: `https://[application name].bc.dynamics.com` 
-   Web Services: `https://[application name].api.bc.dynamics.com` 

To work with [!INCLUDE[d365_bus_cent_short_md](includes/d365_bus_cent_short_md.md)], they would use these URLs:

-   Client: `https://businesscentral.dynamics.com` 
-   Web Services: `https://api.businesscentral.dynamics.com`  
 
## Partner initiated (CSP) signup – paid 
 
In CSP, it is the Partner who defines the Partner-to-Customer price. Partners can use several options to charge their customers.

### Option 1: [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)] price is added on top of Microsoft-to-Partner price: 

Example (not actual prices): 

|     |Partner-to-Customer price|Price|
|-----|-----|-----|
|CSP |Essential|25+50=75 USD| 
 
### Option 2: [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)] price is added as a 3rd party CSP offering (This functionality is still in development by the CSP team; tentative GA of this feature is December 2018): 
Example (not actual prices): 

|     |Partner-to-Customer price|Price|
|-----|-----|-----|
|CSP |Essential|25|
|CSP |Fabrikam Apples (Essential)|50| 
 
### Option 3: [!INCLUDE[d365_bus_cent_short_md](includes/d365_bus_cent_short_md.md)] license + [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)] self-monetization  
Example (not actual prices): 

|     |Partner-to-Customer price|Price|
|-----|-----|-----|
|CSP |Essential|25|
|External (e.g. www.stripe.com) |Fabrikam Apples (Essential) |50|  

 
In all three options, the ISV partner will be selling [!INCLUDE[d365_bus_cent_short_md](includes/d365_bus_cent_short_md.md)] licenses in CSP.  

 
## See Also  
[[!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)] Overview](embed-app-overview.md)  
[Microsoft Responsibilities](embed-app-microsoft-responsibilities.md)   
[Qualification and Onboarding](embed-app-qualifications-onboarding.md)  
[Qualification and Onboarding](embed-app-qualifications-onboarding.md)  
[Managing in Microsoft Lifecycle Services](embed-app-lifecycle-services.md)  
[[!INCLUDE[d365_bus_cent_short_md](includes/d365_bus_cent_short_md.md)] Component](embed-app-components.md)   
[[!INCLUDE[d365_bus_cent_short_md](includes/d365_bus_cent_short_md.md)] Platform](embed-app-platform.md)  
[[!INCLUDE[d365_bus_cent_short_md](includes/d365_bus_cent_short_md.md)] Licensing](embed-app-licensing.md)  
[Appsource](embed-app-appsource.md)  
[Sandbox](embed-app-sandbox.md)  
[Ecosystem Features](embed-app-ecosystem.md) 

