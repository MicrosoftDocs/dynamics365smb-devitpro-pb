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
# [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)] Licensing 
[!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)]s licenses can only be purchased through CSP.Microsoft offers several types of paid licenses (users): 
-   Essential 
-   Premium 
-   Team Member 
-   External Accountant  
 
Customers can also subscribe for an evaluation version of an [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)] by using self-service signup (also known as IW or viral signup). This subscription comes with 10000 licenses and allows customers to evaluate the functionality of the [!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)] using non-production companies.  
 
In the [!include[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)] service, the license files (*.flf) are not used, and a completely new way of defining the licensing permissions is implemented. 
 
We define license permissions (per object) in the Entitlements table of the application database, Entitlements are grouped in the Entitlement Set table, then each Entitlement Set is linked to one of the Azure Active Directory (Azure AD) Service Plans that we offer: 
-   Team Member 
-   Essential 
-   Premium 
-   External Accountant 
 
Therefore, when a user purchases, for example, an Essential license and tries to sign in to Business Central, we retrieve the user’s Service Plan (in this case Essential) from Azure AD and then load its associated Entitlements as license permissions. 

 
## See Also  
[[!INCLUDE[d365_bus_central_embed_app_md](../developer/includes/d365_bus_central_embed_app_md.md)] Overview](embed-app-overview.md)   
[Microsoft Responsibilities](embed-app-microsoft-responsibilities.md)   
[Qualification and Onboarding](embed-app-qualifications-onboarding.md)  
[Qualification and Onboarding](embed-app-qualifications-onboarding.md)  
[Managing in Microsoft Lifecycle Services](embed-app-lifecycle-services.md)  
[[!include[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)] Component](embed-app-components.md)   
[[!include[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)] Platform](embed-app-platform.md)  
[[!include[d365_bus_cent_short_md](../developer/includes/d365_bus_cent_short_md.md)] Licensing](embed-app-licensing.md)  
[Customer Signup](embed-app-customer-signup.md)  
[Appsource](embed-app-appsource.md)  
[Sandbox](embed-app-sandbox.md)  
[Ecosystem Features](embed-app-ecosystem.md)  
