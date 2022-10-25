---
title: Set up automated workflows
description: Learn how to give your customers access to automated workflows, so they can run Power Automate flows from inside Business Central online.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: how-to
ms.date: 10/14/2022
ms.custom: bap-template 
---
# Set Up Automated Flows

[!INCLUDE [online_only](../developer/includes/online_only.md)]

This article explains how you set up [!INCLUDE[prod_short](../includes/prod_short.md)] online to run Power Automate flows when an event happens in [!INCLUDE [prod_short](../includes/prod_short.md)].  

> [!NOTE]  
> To use Power Automate with [!INCLUDE[prod_short](../includes/prod_short.md)], you must have a valid Power Automate account.

## About automated flows

Automated flows are designed to run automatically when an event occurs in [!INCLUDE[prod_short](../includes/prod_short.md)]. Unlike instant flows, which require a user to manually run the flow, automated flows run as the user works in [!INCLUDE[prod_short](../includes/prod_short.md)], requiring no extra action on their part.

An automated flow consists of at least one trigger (the event that starts the flow) and one action (does an operation). To support creating flows, the [!INCLUDE[prod_short](../includes/prod_short.md)] connector includes several [triggers](/connectors/dynamicssmbsaas/#triggers) and [actions](/connectors/dynamicssmbsaas/#actions) that you can use.

The connector​ seamlessly connects data and gives you the option to include **Dynamic content** when you create automated flows. The [!INCLUDE[prod_short](../includes/prod_short.md)] triggers return data, like the ID of a record, which can be consumed by actions later in the flow. [!INCLUDE[prod_short](../includes/prod_short.md)] actions also return data that can be passed to other actions. 

> [!NOTE]
> The [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Automate supports multiple production and sandbox environments. If you haven't created multiple production or sandbox environments, **Production** is the only available option you can choose.  

## Create an automated flow from scratch

This procedure outlines that steps required to create an automated flow using the [!INCLUDE[prod_short](../includes/prod_short.md)] connector. To illustrate the process, it walks you through a basic example of a flow that sends a message to a Teams group chat when a new customer is created in [!INCLUDE[prod_short](../includes/prod_short.md)]. The following figure illustrates the flow. 

:::image type="content" source="../developer/media/power-automate-automated-flow.png" alt-text="Shows the structure of the flow that includes the record is created (V3) trigger, get record trigger, and the post message to teams chat trigger.":::

Complete the following steps:

1. Sign in to [Power Automate](https://powerautomate.com) or from a page in [!INCLUDE[prod_short](../includes/prod_short.md)], select the actions **Automate**> **Power Automate** > **Manage Flows**.

2. Select **Create** from the left side, then choose to create by starting from blank or starting from connector:

   # [Starting from blank](#tab/blank)
   1. Under **Starting from blank**, select **Automated cloud flow**.
   2. On the **Build an automated cloud flow** page, give your flow a name in the **Flow name** field.
   3. Under **Choose how to trigger this flow**, search for the [!INCLUDE[prod_short](../includes/prod_short.md)] trigger for starting the flow.

     For this example, type *business central* in the search box, then find and select [When a record is created (V3)](/connectors/dynamicssmbsaas#when-a-record-is-created-(v3)). 

   # [Starting from a connector](#tab/connector)
   1. Under **Starting from a connector**, select **All connectors**.
   2. In the search, type *business central*, then select **Dynamics 365 Business Central** in the results.
   3. The **Dynamics 365 Business Central** page opens and shows all available triggers. For the example, select **When a record is created (V3)** to open the new flow.
   4. In the upper left corner, replace the text **Untitled** with the name of your flow.

   ---

   Your flow will look similar to the following figure:

   :::image type="content" source="../developer/media/power-automate-when-record-is created-trigger.png" alt-text="Shows the trigger called when a record is created (V3) in Power Automate.":::

3. Fill in the parameters to specify what the flow pertains to. The parameters and whether they're required depends on the trigger.

    :::image type="content" source="../developer/media/power-automate-when-record-is created-trigger-example.png" alt-text="Shows the filled-in trigger called when a record is created (V3) in Power Automate.":::

    |Parameter|Description|
    |---------|-----------|
    |Environment name|Name of the [!INCLUDE[prod_short](../includes/prod_short.md)] environment that the flow will run on. The [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Automate supports multiple production and sandbox environments. If you haven't created multiple production or sandbox environments, **Production** is the only available option you can choose.|
    |Company name|Name of [!INCLUDE[prod_short](../includes/prod_short.md)] company that the flow will run on|
    |API category|Name of the [!INCLUDE[prod_short](../includes/prod_short.md)] API category that will run the flow (also called API route)|
    |Table name|Name of the [!INCLUDE[prod_short](../includes/prod_short.md)] table that the flow will run on.|

4. Now begin designing the flow by adding actions and more triggers. Start by selecting **+ New step**.

   > [!NOTE]
   > Because each step in the flow is independent of the next, you may be required to define the environment and company multiple times. 
5. Add an action to get information about the new record from the table you specified in the previous step:

    1. In the search box on the **Choose an operation**, select the **Actions** tab, then search for and select *Get record (V3)* for the Dynamics 365 Business Central connector.
    2. On the **Get record (V3)** step, set the **Environment name**, **Company name**, **API category**, and **Table name** to the same values as the **When a record is created (V3)** the trigger.
    3. For the **Row ID**, use dynamic content. Select the field to open the **Dynamic content** pane, then select **RowID**.

    The flow will look something like this:

    :::image type="content" source="../developer/media/power-automate-get-record-action-example.png" alt-text="Shows the action called Get record (V3) in Power Automate.":::

6. Selecting **+ New step** to add a new step for posting a message to a Teams chat.
   1. Select **Microsoft Teams** > **Post a message in a chat or channel**.
   2. Set **Post as** to **User** and **Post in** to **Group chat**.
   3. Set **Group ID** to the name of the chat group in Teams where you want to post the message. 
   4. Add content to the **Message**. Apart from text, you can use dynamic content to add information about the customer record, like **number** and **name**.

    The flow will look something like this:

    :::image type="content" source="../developer/media/power-automate-post-teams-action-example.png" alt-text="Shows the action called Post a message to a chat or channel in Power Automate.":::

7. Select **Save**.

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

1. Sign in to [Power Automate](https://powerautomate.com) or from a page in [!INCLUDE[prod_short](../includes/prod_short.md)], select the actions **Automate**> **Power Automate** > **Manage Flows**.
2. Select **Create** from the left side.
3. Under **Starting from a template**, select **All templates**.
4. In the search, type *business central* and you'll see all the available automated flow templates in the results.
5. Select template to open the flow.
6. Make changes to the flow, for example, by adding or changing steps. There are typically a few parameters that you'll need to fill in before saving the flow as one of your own.

   > [!NOTE]
   > Because each step in the flow is independent of the next, you may be required to define the environment and company multiple times
7. Select **Save** when done.



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

## See also

[Manage Power Automate Flows](manage-power-automate-flows.md)  
[Set Up Instant Flows](instant-flows.md)  
[Troubleshoot Your Business Central Automated Workflows](/dynamics365/business-central/across-flow-troubleshoot)  
[Use Business Central in an Automated Workflow](/dynamics365/business-central/across-how-use-financials-data-source-flow)<!--keep an eye out for redirects-->  
