---
title: "Embed App Licensing"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
[!INCLUDE[embedapp_preview](../developer/includes/embedapp_preview.md)]

# [!INCLUDE[embedapp](../developer/includes/embedapp.md)] Licensing 
[!INCLUDE[embedapp](../developer/includes/embedapp.md)]s licenses can only be purchased through CSP.Microsoft offers several types of paid licenses (users): 
-   Essential 
-   Premium 
-   Team Member 
-   External Accountant  
 
Customers can also subscribe for an evaluation version of an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] by using self-service signup (also known as IW or viral signup). This subscription comes with 10000 licenses and allows customers to evaluate the functionality of the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] using non-production companies.  
 
In the [!include[prodshort](../developer/includes/prodshort.md)] service, the license files (*.flf) are not used, and a completely new way of defining the licensing permissions is implemented. 
 
We define license permissions (per object) in the Entitlements table of the application database, Entitlements are grouped in the Entitlement Set table, then each Entitlement Set is linked to one of the Azure Active Directory (Azure AD) Service Plans that we offer: 
-   Team Member 
-   Essential 
-   Premium 
-   External Accountant 
 
Therefore, when a user purchases, for example, an Essential license and tries to sign in to Business Central, we retrieve the user’s Service Plan (in this case Essential) from Azure AD and then load its associated Entitlements as license permissions. 

 
## See Also  
[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)   
[Microsoft Responsibilities](embed-app-microsoft-responsibilities.md)   
[Qualification and Onboarding](embed-app-qualifications-onboarding.md)  
[Qualification and Onboarding](embed-app-qualifications-onboarding.md)  
[Managing in Microsoft Lifecycle Services](embed-app-lifecycle-services.md)  
[[!include[prodshort](../developer/includes/prodshort.md)] Component](embed-app-components.md)   
[[!include[prodshort](../developer/includes/prodshort.md)] Platform](embed-app-platform.md)  
[[!include[prodshort](../developer/includes/prodshort.md)] Licensing](embed-app-licensing.md)  
[Customer Signup](embed-app-customer-signup.md)  
[Appsource](embed-app-appsource.md)  
[Sandbox](embed-app-sandbox.md)  
[Ecosystem Features](embed-app-ecosystem.md)  
