---
title: Set up automated workflows
description: Learn how to give your customers access to automated workflows, so they can run Power Automate flows from inside Business Central online.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: how-to
ms.date: 04/21/2023
ms.custom: bap-template 
ms.search.keywords: workflow, OData, Power Automate, Get adaptive card (v3), Get url (v3)

---
# Create automated flows

[!INCLUDE [online_only](../developer/includes/online_only.md)]

This article explains how you can set up [!INCLUDE[prod_short](../includes/prod_short.md)] online to run Power Automate flows when an event happens in [!INCLUDE [prod_short](../includes/prod_short.md)].  

> [!NOTE]  
> To use Power Automate with [!INCLUDE[prod_short](../includes/prod_short.md)], you must have a valid Power Automate account.

## About automated flows

Automated flows are designed to run automatically when an event occurs in [!INCLUDE[prod_short](../includes/prod_short.md)]. Unlike instant flows, which require a user to manually run the flow, automated flows run as the user works in [!INCLUDE[prod_short](../includes/prod_short.md)], requiring no extra action on their part.

An automated flow consists of at least one trigger (the event that starts the flow) and one action (does an operation). To support creating flows, the [!INCLUDE[prod_short](../includes/prod_short.md)] connector includes several [triggers](/connectors/dynamicssmbsaas/#triggers) and [actions](/connectors/dynamicssmbsaas/#actions) that you can use.

The connector​ seamlessly connects data and gives you the option to include **Dynamic content** when you create automated flows. The [!INCLUDE[prod_short](../includes/prod_short.md)] triggers return data, like the ID of a record, which actions later in the flow can consume. [!INCLUDE[prod_short](../includes/prod_short.md)] actions also return data that can be passed to other actions. 

> [!NOTE]
> The [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Automate supports multiple production and sandbox environments. If you haven't created multiple production or sandbox environments, **Production** is the only available option you can choose.  

## Prerequisites

- Power Automate premium license or a license that includes premium connectors. For more information, see [Power Automate licenses](/power-platform/admin/power-automate-licensing/types).

## Create an automated flow from scratch

This procedure outlines the steps required to create an automated flow using the [!INCLUDE[prod_short](../includes/prod_short.md)] connector. To illustrate the process, it walks you through a basic example of a flow that sends a message to a Teams group chat when a new customer is created or modified in [!INCLUDE[prod_short](../includes/prod_short.md)]. The message contains a card that shows some information about the customer and a **Details** button that opens even more information about the customer. The card is the same as the one displayed in Teams when you manually [share a record to Teams](/dynamics365/business-central/across-working-with-teams) from inside Business Central.

The following figure illustrates the flow that you create.

:::image type="content" source="../developer/media/power-automate-automated-flow-v2.png" alt-text="Shows the structure of the flow that includes the record is created (V3) trigger, get record trigger, and the post message to teams chat trigger.":::

Complete the following steps:

1. Sign in to [Power Automate](https://powerautomate.com) or, from a page in [!INCLUDE[prod_short](../includes/prod_short.md)], select **Automate**> **Power Automate** > **Create automated flow** or **Manage Flows**.
2. On the left side, select **Create**, then choose to create by starting from blank or starting from connector:

   # [Starting from blank](#tab/blank)
   1. Under **Starting from blank**, select **Automated cloud flow**.
   2. On the **Build an automated cloud flow** page, give your flow a name in the **Flow name** field.
   3. Under **Choose how to trigger this flow**, search for the [!INCLUDE[prod_short](../includes/prod_short.md)] trigger for starting the flow.

     For this example, type *business central* in the search box, then find and select [When a record is created (V3)](/connectors/dynamicssmbsaas#when-a-record-is-created-(v3)). 

   # [Starting from a connector](#tab/connector)
   1. Under **Starting from a connector**, select **All connectors**.
   2. In the search, type *business central*, then select **Dynamics 365 Business Central** in the results.
   3. The **Dynamics 365 Business Central** page opens and shows all available triggers. For the example, select **When a record is created (V3)** to open the new flow.
   4. In the upper-left corner, replace the text **Untitled** with the name of your flow.

   ---

   Your flow looks similar to the following figure:

   :::image type="content" source="../developer/media/power-automate-when-record-is created-trigger.png" alt-text="Shows the trigger called when a record is created (V3) in Power Automate.":::

3. Fill in the parameters to specify what the flow relates to. The parameters and whether they're required depend on the trigger.

    :::image type="content" source="../developer/media/power-automate-when-record-is created-trigger-example.png" alt-text="Shows the filled-in trigger called when a record is created (V3) in Power Automate.":::

    |Parameter|Description|
    |---------|-----------|
    |Environment name|Name of the [!INCLUDE[prod_short](../includes/prod_short.md)] environment that the flow runs on. The [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Automate supports multiple production and sandbox environments. If you haven't created multiple production or sandbox environments, **Production** is the only available option you can choose.|
    |Company name|Name of [!INCLUDE[prod_short](../includes/prod_short.md)] company that the flow runs on|
    |API category|Name of the [!INCLUDE[prod_short](../includes/prod_short.md)] API category that runs the flow (also called API route)|
    |Table name|Name of the [!INCLUDE[prod_short](../includes/prod_short.md)] table that the flow runs on.|

4. Begin designing the flow by adding actions and more triggers. Start by selecting **+ New step**.

   > [!NOTE]
   > Because each step in the flow is independent of the next, you may be required to define the environment and company multiple times. 
5. Complete the following steps to add the action called **Get url (V3)**. This action gets the web client page URL for the specified [!INCLUDE[prod_short](../includes/prod_short.md)] record, in this case, the customer card page 21.

    1. In the **Choose an operation** step, select the **Actions** tab, then search for and select *get url (v3)* for the Dynamics 365 Business Central connector.
    2. On the **Get url (v3)** step, set the **Environment name** and **Company name** to the same values as the **When a record is created (V3)** the trigger.
    3. Set the **Page** to the ID of the page, in this case, *21*.
    4. Select the **Row ID** field to open the **Dynamic content** pane, then select **RowID**.

    The flow looks like this:

    :::image type="content" source="../developer/media/power-automate-get-url-action-example.png" alt-text="Shows the action called Get record (V3) in Power Automate.":::

    > [!IMPORTANT]
    >  The **Get url (v3)** action only works for [!INCLUDE[prod_short](../includes/prod_short.md)] version 22.0 and later.

6. Repeat the previous step, except this time, add the action called **Get adaptive card (v3)**. This action generates an adaptive card for the specified record that acts as a payload for input to Team.

    1. Select **+ New step**.
    2. In the **Choose an operation** step, select the **Actions** tab, then search for and select *get adaptive card (v3)* for the Dynamics 365 Business Central connector.
    3. On the **Get adaptive card (v3)** action, select the **Url** field to open the **Dynamic content** pane. Then, under **Get url (V3)**, select **Web Client URL**.
    4. On the **Get adaptive card (v3)** action, set the **Target** field to **Teams**.

    The flow looks like this:

    :::image type="content" source="../developer/media/power-automate-get-adaptive-card-action-example.png" alt-text="Shows the action called Post card to a chat or channel in Power Automate.":::

7. Add the final action that posts the card to a Teams channel. 

   1. Select **+ New step**.
   2. In the **Choose an operation** step, select the **Actions** tab, then search for and select *post a card in a chat or channel* for the Microsoft Teams connector.
   3. On the **Post a card in a chat or channel** action, set the following fields:

      |Field|Value|
      |-|-|
      |Post as|**User**|
      |Post in|**Channel**|
      |Team|The team in Teams where you want to post the card|
      |Channel|The team channel in Teams where you want to post the card|
      |Adaptive card|Use dynamic content to set to **Adaptive Card** from the **Get adaptive card (V3)** action.|
      |Subject|Optional text that appears above the card in Teams|

    The flow looks like this:

    :::image type="content" source="../developer/media/power-automate-post-card-action-example.png" alt-text="Shows the action called Post a message to a chat or channel in Power Automate.":::

8. Select **Save**.

## Create a flow from a template

Microsoft also provides automated flow templates that you can use to build your own templates. The templates provide as fast way to create flows, but they're also a good way to learn how to build your own flows. Here's a list of some of the templates:

- *When a vendor approval is requested*  
- *When a general journal line approval is requested*  
- *When a record is deleted*
- *When a record is changed*
- *When a record is created*
- *When a record is modified*
- *When a general journal batch approval is requested*  
- *When a customer approval is requested*
- *When an item approval is requested*
- *When a purchase document approval is requested*
- *When a sales document approval is requested*

### Get started

1. Add a new flow from [!INCLUDE[prod_short](../includes/prod_short.md)] or Power Automate:

   # [From Business Central](#tab/bc)

   In this way, you work only in Business Central, but you have the option during the setup to open the flow in Power Automate.

   1. Sign in to [Business Central](https://businesscentral.microsoft.com).
   2. Open the list, card, or document page.
   3. In the action bar, select **Automate** > **Power Automate** > **Create automated flow**.
   4. The **Create a flow** page opens and lists all the available Business Central templates related to the page. Select the template you want.

      > [!TIP]
      > When you select a template, an introductory page explaining the template appears, letting you continue or go back.
      >
      > By default, the **Create a flow** page is filtered to list only those templates that create automated flows. If you want a template that's not shown or want to find out what other templates are available, select **Filtered templates** > **All templates** to clear the filter or use the **Search templates...** box.

   # [From Power Automate](#tab/pa)

   1. Sign in to [Power Automate](https://powerautomate.com).
   2. Select **Create** from the left side.
   3. Under **Starting from a template**, select **All templates**.
   4. In the search, type *business central* to get a list of all the available automated flow templates in the results.
   5. Select template to open the flow.

   ---
1. Make changes to the flow, for example, by adding or changing steps. There are typically a few parameters that you need to fill in before saving the flow as one of your own.

   > [!NOTE]
   > Because each step in the flow is independent of the next, you may have to define the environment and company multiple times
1. Select **Save** when done.


<!--
## Predefined triggers and templates from Microsoft

Microsoft provides predefined triggers, including the following list:  

- *When a vendor approval is requested*  
- *When a general journal line approval is requested*  
- *When a record is deleted*
- *When a record is changed*
- *When a record is created*
- *When a record is modified*
- *When a general journal batch approval is requested*  
- *When a customer approval is requested*
- *When an item approval is requested*
- *When a purchase document approval is requested*
- *When a sales document approval is requested*

Microsoft also provides predefined templates, including the following list:

- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] sales order*
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] sales quote*
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] sales invoice*
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] sales credit memo*
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] customer*
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] purchase order*
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] purchase invoice*
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] purchase credit memo*  
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] item*
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] vendor*
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] general journal batch*  
- *Request approval for Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)] general journal lines*

Power Automate shows a list of services that are used in the flow template. You are signed in to those services automatically. If Power Automate can't connect to a service, you're prompted to sign in to each of the relevant services. A green checkmark will appear next to each service once a connection has been successfully made. Then choose the **Continue** action.

Next Power Automate prompts you to select an environment and company within your [!INCLUDE[prod_short](../includes/prod_short.md)] tenant. Because each step in the flow is independent of the next, you may be required to define the environment and company multiple times when using a [!INCLUDE[prod_short](../includes/prod_short.md)] Power Automate template.
-->


## Use the connector for other scenarios

The [connectors](/connectors/dynamicssmbsaas/) for Power Platform and Azure Logic Apps also support other scenarios. For example, use the [Find records (V3)](/connectors/dynamicssmbsaas/#find-records-(v3)) action to create or edit table data for document headers or lines. You can also build a Power App that creates and posts time sheets, or a Power Automate flow that posts journal lines.  

The **Find records (V3)** action finds records in the same way as [filter expressions in OData URIs](../webservices/use-filter-expressions-in-odata-uris.md). But it does so behind the scenes, so all you have to do is add the action as a step in your flow. Learn more at [Find records (V3)](/connectors/dynamicssmbsaas/#find-records-(v3)).  

   > [!NOTE]
   > All the actions and triggers in the connector (except the ones related to approvals) support Business Central APIs coming from AppSource extensions or from other extensions installed in your Business Central environment, provided that they follow the API best practices. Learn more at [Developing a Custom API](/dynamics365/business-central/dev-itpro/developer/devenv-develop-custom-api).

## See also

[Manage Power Automate Flows](manage-power-automate-flows.md)  
[Set Up Instant Flows](instant-flows.md)  
[Troubleshoot Your Business Central Automated Workflows](/dynamics365/business-central/across-flow-troubleshoot)  
[Use Business Central in an Automated Workflow](/dynamics365/business-central/across-how-use-financials-data-source-flow)<!--keep an eye out for redirects-->  
