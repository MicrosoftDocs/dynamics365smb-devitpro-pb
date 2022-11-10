---
title: Set Up Power Automate Integration 
description: Learn how to enable Power Automate for Business Central users.
author: jswymer
ms.author: jswymer 
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: how-to 
ms.date: 10/06/2022
ms.custom: bap-template 
---
# Set Up Power Automate Integration 

[!INCLUDE [online_only](../developer/includes/online_only.md)]

This article describes how to set up Power Automate integration for Business Central users. The instructions explain how you can control access to the Power Automate features that let users run flows from inside the Business Central client. These features are available in the **Automation** item in the action bar on most list, card, and document pages.

:::image type="content" source="../developer/media/power-automate-action-intro.png" alt-text="Shows the Automate action in the action bar with expanded actions.":::

As an administrator, you can hide the **Automation** item and its actions from all users or individual users, as described in this article.

> [!IMPORTANT]
> This article pertains only to the **Automate** action in the Business Central client. The instructions won't affect users ability to create and run flows directly in Power Automate or what they can do on the [Manage Power Automate Flows](manage-power-automate-flows.md) page in Business Central&mdash;even with flows that interact with Business Central data.

## About access to Power Automate features

By default, all users have access to the Power Automate features. The features are available from the **Automation** item on most list, card, and document pages. In some cases, you'll find the Power Automate features by selecting **More options ...** in the action base.

 :::image type="content" source="../developer/media/power-automate-action.png" alt-text="Shows the Automate item in the action bar.":::

But before users can use the features, they'll have to agree to privacy notice. They agree to the terms by selecting the **Automate** > **Get Started with Power Automate** action and running the **Set Up Power Automate** assisted setup. Agreeing to the terms turns on the Power Automate features for the user, activating the **Create Flows** and **Manage Flows** actions.

As an administration, you can change this behavior and control which users have access to the Power BI features. There are two levels of controlling access. The first level done by a system permission that you assign to users. The next level is turning the Power Automate features on or off using on the privacy notice agreement.

## Grant users permission to Power Automate features

To grant individual users or groups access to the Power Automate features, assign them the system permission **Allow Action Automate** (ID 9630) in a permission set used one their account. You can also use the predefined permission set **AUTOMATE - EXEC**, which includes the **Allow Action Automate**. Users who have the permission will see the **Automate** action on various pages in the client. 

To prohibit individual users or groups from accessing to the Power Automate features, remove the system permission **Allow Action Automate** from their assigned permissions sets. In this case, the **Automate** action won't appear on pages in the client.

For more information about assigning permissions and permissions sets, see [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).

## Turn Power Automate features on or off for all users

To turn on Power Automate features as an administrator, you agree to the privacy terms on behalf all users, so they don't have to do it themselves. When you turn on Power Automate for users, the **Automate** item will no longer include the **Get Started with Power Automate** action for user. Instead, the **Automate** item  will include the **Create Flows** and **Manage Flows** actions and links that run exiting flows. 

There are two ways to you can do this task. One way is to use the **Get Started with Power Automate** action to consent on behalf of all users. The other way is to use the **Privacy Notices Status** page.

### Turn on by using the Get Started with Power Automate action

1. In Business Central, open a list, card, or document page.
2. In the action bar, select **More options ...**> **Automate** > **Power Automate** > **Get Started with Power Automate**.
3. Follow the pages on-screen. When you get to the **Privacy Notices Status** page, read the information. If you agree, choose **Agree**.

> [!NOTE]
> If you choose **Disagree**, the setup closes without making any changes. If you want to turn on Power Automate later, just run **Get Started with Power Automate** again.

### Turn on by using the Privacy Notices Status page

1. In Business Central, search for and open the **Privacy Notices Status** page.
2. In the **Microsoft Power Automate** row, select the **Agree for everyone** check box.

### Turn off for all users

Complete these steps to remove the **Automate** action from client pages for all users.

1. In Business Central, search for and open the **Privacy Notices Status** page.
2. In the **Microsoft Power Automate** row, select the **Disagree for Everyone** check box.

## Telemetry

We recommend you use the [!INCLUDE [prod_short](../includes/prod_short.md)] General Data Protection Regulation app in Power BI to keep track of workflows. It shows usage of connectors for tenants you manage or own. The app also uses Application Insights​ telemetry that​ you have set up in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

Get the telemetry app at [https://aka.ms/bctelemetryreport](https://aka.ms/bctelemetryreport).

## Next steps

Set up flows. For more information, see [Set Up Automated Flows](automate-workflows.md) and [Set Up Instant Flows](instant-flows.md).

## See also

[Privacy Notices Status](/dynamics365/business-central/privacy-notices-status).