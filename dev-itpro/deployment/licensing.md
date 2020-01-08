---
title: "Licensing in Business Central"
author: jswymer
ms.reviewer: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 01/08/2020
---

# Licensing in Dynamics 365 Business Central

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] licenses can only be purchased through CSP. Microsoft offers several types of paid licenses (users):

- Essential  
- Premium  
- Team Member  
- External Accountant  

Customers can also subscribe for an evaluation version by using self-service sign-up (also known as IW or viral sign-up). This subscription comes with 10000 licenses and allows customers to evaluate the functionality of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] using non-production companies.  

[!include[prodshort](../developer/includes/prodshort.md)] does not use the classic [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] license files (*.flf). Instead, permissions are generated based on entitlements.  

We define license permissions (per object) in the **Entitlements** table. Entitlements are grouped in the **Entitlement Set** table, and then each entitlement set is associated with one of the four Azure Active Directory (Azure AD) service plans.  

This means that when a user purchases, for example, an Essential license and tries to sign in to Business Central, we retrieve the user’s service plan (in this case Essential) from Azure AD and then load the corresponding entitlements as license permissions.  

## See Also  

[Get Started as a Reseller of Business Central Online](../administration/get-started-online.md)  
[Deployment of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](Deployment.md)  
[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)  
