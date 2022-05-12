---
title: Set up automated workflows
description: Learn how to give your customers access to flows that they can run from inside Business Central online.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.date: 05/12/2022
ms.author: edupont
---

# Switch on Manual Instant Flows

As an admin, you can set up [!INCLUDE[prod_short](../includes/prod_short.md)] online so that users can create and run Power Automate flows from inside [!INCLUDE [prod_short](../includes/prod_short.md)].  

> [!NOTE]  
> The relevant users must have a valid account with [!INCLUDE[prod_short](../includes/prod_short.md)] and with Power Automate.  

## Switch on Power Automate flows to be run inside Business Central

From update 20.1 (May 2022), an admin can [switch on a feature](../administration/feature-management.md) to make it possible to run a Power Automate flow from most pages. To connect to Power Automate, Azure Active Directory services must access your [!INCLUDE [prod_short](../includes/prod_short.md)]. Once the admin has connected [!INCLUDE [prod_short](../includes/prod_short.md)] with Power Automate, users will see any flows that the organization has added when they choose the **Automate** action in the relevant pages. They can run the flows without leaving [!INCLUDE [prod_short](../includes/prod_short.md)]. This way, the users remain within their original work process and are not interrupted by having to switch context.  

As the admin, you can try out the new feature for yourself before you switch it on for everyone in your organization. For more information, see the tip in the [How to enable an optional feature](../administration/feature-management.md#how-to-enable-an-optional-feature) section. Then, when you switch to the new browser tab, open a page such as the **Customers** list, and then choose the **Automate** action. You'll be prompted to authorize Power Automate for access to your Azure Active Directory. The **Azure Active Directory Service Permissions** page runs automatically, and you must choose the *Authorize Azure Services* hyperlink once you've verified that the Azure AD service that has requested access is `https://service.flow.microsoft.com/`. Then, you can run any of the pre-configured workflows, or start adding your own. For more information, see [Use Business Central in Power Automate Flows](/dynamics365/business-central/across-how-use-financials-data-source-flow).<!--check for renamed article-->  

Once the admin has set up the connection as we just described, the relevant users can start using Power Automate flows.  

## See also

[Troubleshoot Your Business Central Automated Workflows](/dynamics365/business-central/across-flow-troubleshoot)  
[Use Business Central in an Automated Workflow](/dynamics365/business-central/across-how-use-financials-data-source-flow)<!--keep an eye out for redirects-->  
