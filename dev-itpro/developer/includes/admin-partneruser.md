---
author: edupont04
ms.topic: include
ms.date: 05/09/2022
ms.author: edupont
---
> [!CAUTION]
> In the Microsoft 365 admin center and Microsoft Azure Management portal, both customers and partners can invite external users (guests) into their Active Directory. When a partner user is added as a guest to the customer's Azure AD, they can no longer log in as a delegated admin into the customer's [!INCLUDE [prod_short](prod_short.md)]. In order to log in, the local user (guests or native) must have a valid [!INCLUDE [prod_short](prod_short.md)] license assigned to them. If the partner user also has *granular delegated admin privileges*, they can access the customer's [!INCLUDE [prodadmincenter](prodadmincenter.md)] and manage the environments there. We recommend that customers do not invite partner users to their tenant as guests but ask them to set up granular delegated admin privileges, using the *Dynamics 365 administrator* role. For more information, see [Move to GDAP and remove DAP](/partner-center/gdap-faq#what-is-the-best-way-to-move-to-gdap-and-remove-dap-without-losing-access-to-azure-subscriptions-if-i-have-customers-with-azure) in the Partner Center FAQ.  
