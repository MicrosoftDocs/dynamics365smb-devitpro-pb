---
author: edupont04
ms.topic: include
ms.date: 09/15/2022
ms.author: edupont
---
Quite often, partner users are registered as business-to-business (B2B) guest users in their customer's Azure Active Directory (Azure AD), such as to collaborate through Teams. However, when a partner user is added as a guest to their customer's Azure AD, they can no longer log in as a delegated admin into the customer's [!INCLUDE [prod_short](prod_short.md)]. These guest users do not have a valid [!INCLUDE [prod_short](prod_short.md)] license assigned to them. But if the partner user has *granular delegated admin privileges*, they can access the customer's [!INCLUDE [prodadmincenter](prodadmincenter.md)] and manage the environments there. Starting in 2022 release wave 2, partner users that are guest users and have granular delegated admin privileges are no longer blocked from accessing [!INCLUDE [prod_short](prod_short.md)]. But we continue to consider it a best practice that customers do not invite partner users to their tenant as guests but ask them to set up granular delegated admin privileges, using the *Dynamics 365 administrator* role. For more information, see [Move to GDAP and remove DAP](/partner-center/gdap-faq#what-is-the-best-way-to-move-to-gdap-and-remove-dap-without-losing-access-to-azure-subscriptions-if-i-have-customers-with-azure) in the Partner Center FAQ.  
