---
title: Manually Switch on Instant Flows
description: Learn how users can run instant flows from inside Business Central online due to the integration with Power Automate.
author: jswymer
ms.author: jswymer
ms.reviewer: na
ms.service: dynamics365-business-central
ms.topic: how-to 
ms.date: 09/04/2022
ms.custom: bap-template 
---

# Set Up Instant Flows

Unlike automated flows that run automatically when an event occurs, instant flows are run manually by users from inside [!INCLUDE[prod_short](../includes/prod_short.md)] or Power Automate. 

> [!NOTE]  
> To use Power Automate with [!INCLUDE[prod_short](../includes/prod_short.md)], you must have a valid account.  

## About instant flows

There are two approaches to creating instant flows, as described in this section.

### Instant flows that use the "For a selected record" trigger 

You create these flows by using the "For a selected record (V3)" trigger of the [!INCLUDE[prod_short](../includes/prod_short.md)] connector. They're designed to run on records in a page, although they don't have to. For users, these flows are available from the **Automate** action on most list, card, document pages. They allow users to run the flow in the context of a specific [!INCLUDE[prod_short](../includes/prod_short.md)] record&mdash;without leaving the page. This approach is the recommended approach for flows that relate to [!INCLUDE[prod_short](../includes/prod_short.md)] data.

:::image type="content" source="../developer/media/power-automate-action-intro.png" alt-text="Shows the Automate action in the action bar with expanded actions.":::

You can make the flow available from all pages that include the **Automate** action. Or, you can make the flow available in the **Automate** action only for a specific environment, company, or pages. 

 When run, the trigger will return information about the selected record. The connection between [!INCLUDE [prod_short](../includes/prod_short.md)] and Power Automate allows instant flows to:

- Pass context or parameters to Power Automate​  
  - Environment name, such as *PRODUCTION​*  
  - Company, such as *Contoso​*  
  - Table ID, such as the table underlying the current page​  
  - System ID, such as a specific record ID​  
  - Page ID, meaning the page that the flow was triggered from  
  - WebClientURL to open a specific page object
- Specify the type of input to add from the options given by the flow.

To learn more about this trigger, see [Manual trigger "For a selected record (V3)"](/connectors/dynamicssmbsaas/#manual-trigger-for-a-selected-record-v3).

As an AL developer, you can also add or promote these instant flows to other places in the action bar. Learn more at [Run Power Automate flows from page actions](../developer/devenv-actions-overview.md#run-power-automate-flows-from-page-actions).

> [!NOTE]
> These flows can't be run manually from the **Manage Power Automate Flows** page or from Power Automate.

### Instant flows that use other manual triggers

You create these flows by using an instant trigger from a connector other than the [!INCLUDE[prod_short](../includes/prod_short.md)] connection. These flows can use actions of the [!INCLUDE[prod_short](../includes/prod_short.md)] connector but you don't have access to [!INCLUDE[prod_short](../includes/prod_short.md)] data like the System ID and Page ID, because these parameters are only available via the **For a selected record (V3)** trigger. These flows aren't included in the **Automate** action, but they can be run from the **Manage Power Automate Flows** page or from Power Automate.



## Create a flow using the "For a selected record (V3)"

This procedure outlines that steps required to create an instant flow that will appear in the **Automate** action by using the **For a selected record (V3)** trigger of the [!INCLUDE[prod_short](../includes/prod_short.md)] connector. To illustrate the process, it uses a basic example for sending an email reminder about a sales invoice. The flow will be available from all pages that use table 26 **Sales Header**, which includes, for example,  the **Sales Invoices** list and **Sales Invoice** card.

The flow in Power Automate will look something like this:

:::image type="content" source="../developer/media/power-automate-instant-flow-example.png" alt-text="Shows an instant flow example in Power Automate.":::

Complete the following steps:

1. Add a new flow from [!INCLUDE[prod_short](../includes/prod_short.md)] or Power Automate:

   # [From Business Central](#tab/bc)

   1. Sign in to [Business Central](https://businesscentral.onmicrosoft.com).
   2. Open the list, card, or document page.
   3. In the action bar, select **Automate** > **Power Automate** > **Create a Flow**.

   You're automatically signed in to Power Automate, but from the **Manage Power Automate Flows** page, you'll work in the page itself.

   # [From Power Automate](#tab/pa)

   1. Sign in to [Power Automate](https://powerautomate.com).
   2. Select **Create** from the left side.
   3. Select **Instant cloud flow**.
   4. Give your flow a name in the **Flow name** field.
   5. Under **Choose how to trigger this flow**, find and select the [!INCLUDE[prod_short](../includes/prod_short.md)] trigger **For a selected record (V3)**.
   6. Select **Create**.
  
   ---

2. The [!INCLUDE [prod_short](../includes/prod_short.md)] [connector](/connectors/dynamicssmbsaas/) shows the **For a selected record (V3)** trigger.

    :::image type="content" source="../developer/media/power-automate-for-selected-record-trigger.png" alt-text="Shows for selected record trigger for [!INCLUDE[prod_short](../includes/prod_short.md)] in Power Automate.":::

3. Set the filter fields on the connector to limit the flow to a specific environment, company, and tables or pages. If you fill in any of the filter fields, the flow will only be shown on environments/companies/pages that match the filter and have the **Automate** action. If you leave all fields, the flow will be shown on all pages that have the **Automate** action.

    |Field|Description|
    |-----|-----------|
    |**Environment name**|The name of the [!INCLUDE[prod_short](../includes/prod_short.md)] environment where this flow can be run. The [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Automate supports multiple production and sandbox environments. If you haven't created multiple production or sandbox environments, **Production** is the only available option you can choose.|
    |**Company name**|The name of the [!INCLUDE[prod_short](../includes/prod_short.md)] company where this flow can be run.|
    |**Page or table** |The [!INCLUDE[prod_short](../includes/prod_short.md)] page or table that this flow will run on. Specify a table using the format *tableID*, like *table18* for the **Customer** table. Specify a page using the format *pageID*, like *page21*. You can specify more than one table or page, just separate each entry with a comma, for example, *page21,page22*. This field determines which page the flow will appear on under the **Automate** action. If you specify a table, then the flow will appear on all pages the use the table as its source. For example, page 21 and 22 use table 18, so you could specify only *table18* to show the flow on both page.<br><br> For this example, set **Page or table** to *table36*, so the flow can only be run on pages that use the **Sales Header** table as the source. If you're in doubt which ID a specific page or table is using, you can use the [inspect pages and data](../developer/devenv-inspecting-pages.md) feature in the [!INCLUDE[prod_short](../includes/prod_short.md)] web client.|

4. Select the **+ New step** to add actions and other triggers to design the flow. A flow must contain least one action. For this example, will add the  **Get record (V3)** for [!INCLUDE[prod_short](../includes/prod_short.md)] to get information about the record.

    1. In the **Choose an operation** step, select **Actions**.
    2. Search for and select the **Get record (V3)** action for [!INCLUDE[prod_short](../includes/prod_short.md)].

     :::image type="content" source="../developer/media/power-automate-get-record-action.png" alt-text="Shows the get record action in flow in Power Automate.":::
5. On the **Get record (V3)** to fill in the information you want from the record. For this example, you use static value and dynamic content. 

    1. For example, select the **Environment name** field, then select **Add custom value** > **Add dynamics content**.
    2. In the **Dynamic content** pane, select *EnvironmentName*. For **Company name**, do the same but select *CompanyId*. For **Row ID**, select *SystemId*.
    3. Set **API category** to *v2.0*.
    4. Set **Table name** to *salesinvoices*.
  
     The **Get record (V3)** will look similar to the following figure:

     :::image type="content" source="../developer/media/power-automate-get-record-action-instant-example.png" alt-text="Shows an example of the get record action in an instant flow in Power Automate.":::

6. Add an action to send an email.

    1. Select **+ New step**.
    2. In the **Choose an operation** step, select **Office 365 Outlook**.
    3. In the **Office 365 Outlook** step, select *Send email (v2)* action.
    4. In the **Send email (v2)** action, add the email address of a recipient, subject, and body.

       In the body, for example, add some text and then the dynamic content *WebClientUrl* to include a link to the invoice in [!INCLUDE[prod_short](../includes/prod_short.md)]. 

       :::image type="content" source="../developer/media/power-automate-instant-flow-send-email.png" alt-text="Shows the send email action in flow in Power Automate.":::

7. Select **Save**.

## Create a flow using other manual triggers

Creating an instant flow for general use is similar to how you create a flow for a selected record. The difference is that you'll have to choose manual trigger. 

1. Sign in to [Power Automate](https://powerautomate.com).
2. Select **Create** from the left side.
3. Select **Instant cloud flow**.
4. Give your flow a name in the **Flow name** field.
5. Under **Choose how to trigger this flow**, select **Manually trigger a flow**.
6. Select **Create**.
7. Select the **+ New step** to add actions and other triggers for the flow.
8. To add [!INCLUDE[prod_short](../includes/prod_short.md)] actions and triggers, search for the **Dynamics 365 Business Central** connector, then select the action or trigger you want to use.

## Next steps

- Use the **Flow checker** action to verify that there are no errors.
- Run the flow from [!INCLUDE[prod_short](../includes/prod_short.md)]. For more information, see [Run Instant Flows](/dynamics365/business-central/across-how-use-financials-data-source-flow#run-instant-flows).
- Promote the flow action to more prominent locations on page. Learn more at [Run Power Automate flows from page actions](../developer/devenv-actions-overview.md#run-power-automate-flows-from-page-actions).

## See also

[Manage Power Automate Flows](manage-power-automate-flows.md)  
[Troubleshoot Your Business Central Automated Workflows](/dynamics365/business-central/across-flow-troubleshoot)   
[Use Business Central in an Automated Workflow](/dynamics365/business-central/across-how-use-financials-data-source-flow)<!--keep an eye out for redirects-->  
