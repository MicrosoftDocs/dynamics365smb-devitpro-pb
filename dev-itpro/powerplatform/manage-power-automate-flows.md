---
title: Manage Power Automate Flows
description: Learn to manage Power Automate flows from inside Business Central online.
author: jswymer
ms.custom: na
ms.reviewer: na
ms.topic: 
ms.date: 10/01/2022
ms.author: jswymer
---

# Manage Power Automate Flows 

You can either create new flows or manage the existing Power Automate flows from [!INCLUDE[prod_short](../includes/prod_short.md)] from the **Manage Power Automate Flows** page. To check out that page, go to the *search* icon in the top right and enter *manage power automate flows.* The resulting page presents various ways to look for details and manage your created flows. In addition, you can create a new flow, edit it, share it, make a copy, delete, or run other commands on your flows by selecting them from the list. These are the categories of flows you'll find on the main page: 

| Flows | Description |
| ----------- | ----------- |
| Cloud flows | Cloud flows present the list of flows you've created using Power Automate. They can be either flow type [Instant](/powerplatform/instant-flows.md) or [Automated](/powerplatform/automate-workflows.md).  |
| Desktop flows | This shows a list of flows you've created for your desktop environment using Power Automate. If you haven't created any, you can create one by choosing **+ New desktop flow**. Learn more at [Desktop Flows](/power-automate/desktop-flows/create-flow). |
| Shared with me | This is a list of flows shared with you by other users in your organization. |

You can also create flows by choosing **+ New flow** on the **Manage Power Automate Flows** page. Then choose the flow type you want to create from among those on the dropdown list: 

* Template 
* Automated cloud flow
* Instant cloud flow 
* Scheduled cloud flow
* Desktop flow 
* Business process flow 

## Edit the flows 

When you choose a flow from the list, a new window with additional information opens inside the **Manage Power Automate** page. At the top of the new window, you'll find many options to manage your flow, for example, edit, share, save as, submit as template, process insights, and others. You'll also find content in these panes: 

| Name | Description |
| ----------- | ----------- |
| Details | Shows details about the flow such as when was it created, modified, what the current status is, flow type, and the owner of the flow. |
| Connections | Shows connections being used by the flow, such as data sources and applications. |
| Owners | Shows who owns the flow. You can add more owners by choosing this option. Learn more at [Share a cloud flow](/power-automate/create-team-flows) |
| Process insights (preview) | Shows the average time it takes your flow to complete. Also identifies possible bottlenecks, which if you fix could streamline your flow. |
| 28-day run history | Shows the run history of your flow for past 28 days including start date, duration of the flow, and the current status.  |
| Run-only users | Shows the users with whom you've shared your flow and have permission to run it.  |

> [!TIP]
> Because *run-only* includes limited access, you can add other users or groups as owners so they can edit and update the flow. Just choose **Edit** in the *Connections* pane.

> [!NOTE]
> Choosing **Edit** enables you to edit the components of your flow like you do in Power Automate, but without leaving the [!INCLUDE[prod_short](../includes/prod_short.md)] context.

## Other settings

You'll see two more menu items on the **Manage Power Automate** flows page: **Process** and **Configuration**. Choose **Process** to open *Power Automate* or  find *flow entries*. Choose **Configuration** to select the environment in which you want to create or see the flows. You can also find the connection information for the [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Automate under **Configuration**.

> [!NOTE]
> **Flow entries** shows the list of records upon which the flow is acting. Such as a record of a user to whom the flow sent an approval request, indicating the request status and other details of the record. 

## See also

[Set up Automated Flows](automate-workflows.md)  
[Set up Instant Flows](instant-flows.md)  
[Troubleshoot Your Business Central Automated Workflows](/dynamics365/business-central/across-flow-troubleshoot)  