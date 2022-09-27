---
title: Manually Switch on Instant Flows
description: Learn how users can run instant flows from inside Business Central online due to the integration with Power Automate.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.date: 09/04/2022
ms.author: edupont
---

# Manually Switch on Instant Flows

Unlike the *automated workflows* that have automatic triggers, you trigger the *instant flows* manually on the relevant page inside [!INCLUDE[prod_short](../includes/prod_short.md)].

> [!NOTE]  
> To use Power Automate with [!INCLUDE[prod_short](../includes/prod_short.md)], you must have a valid account.  

Once you've connected [!INCLUDE [prod_short](../includes/prod_short.md)] with Power Automate, you can see all instant flows that you or other users in the organization (if they have shared their flows with you) have created as action buttons when you choose the **Automate** action on the relevant pages. You can run the flows without leaving [!INCLUDE [prod_short](../includes/prod_short.md)]. This way, you remain within your original work process and aren't interrupted by having to switch the context.  

> [!NOTE]
> You can try out the new feature for yourself before you switch it on for everyone in your organization. Learn more from the tip in the [How to enable an optional feature](../administration/feature-management.md#how-to-enable-an-optional-feature) section. 

On some pages, the **Automate** action is hidden in *more options* **...** icon on navigation pane. To run the manual flow, choose the **Automate** action and you'll see the instant flow you created in the menu as an action button below the *Power Automate* menu item. Then choose the relevant flow link to trigger the workflow. The connection to Power Automate is already set up for you.
To complete an instant flow, you must perform the following tasks:

- Pass context or parameters to Power Automate​  
  - Environment name, such as *PRODUCTION​*  
  - Company, such as *Contoso​*  
  - Table ID, such as the table underlying the current page​  
  - System ID, such as a specific record ID​  
  - Page ID, meaning the page that the flow was triggered from  
  - WebClientURL to open a specific page object
- Specify the type of input to add from the options given by the flow.

Most flows require you to fill in a field or two before you choose the **Run flow** action.

## See also

[Manage Power Automate Flows](manage-power-automate-flows.md)  
[Troubleshoot Your Business Central Automated Workflows](/dynamics365/business-central/across-flow-troubleshoot)   
[Use Business Central in an Automated Workflow](/dynamics365/business-central/across-how-use-financials-data-source-flow)<!--keep an eye out for redirects-->  
