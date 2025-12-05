---
title: Create a Sales Validation Agent
description: Learn how to create and use a Sales Validation Agent in the Agent playground to automate sales order validation tasks in Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 12/05/2025
ms.update-cycle: 180-days
---

# Create a Sales Validation Agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

The Sales Validation Agent is a preconfigured playground agent designed to help you automate the validation of sales orders in [!INCLUDE [prod_short](../includes/prod_short.md)]. This agent can check sales orders for inventory availability and ensure that orders meet specific criteria before processing.

## Steps to create and use the Sales Validation Agent

Follow these steps to create and use the Sales Validation Agent in the Agent playground.

### Create the Sales Validation Agent

First, create the Sales Validation Agent in the Agent playground.

1. In the navigation bar at the upper right of the role center, select :::image type="content" source="../media/ai-playground-icon-new.png" alt-text="Playground agent create new"::: **Agent** > **Create**.
  The agent pane opens.
1. Choose **Create**.
1. In the **Create agent** wizard, choose **Sales Validation**, and then choose the **Create agent** button.
1. In the **Configure agent** dialog, activate the agent.
1. Choose **Update** to save and close the agent setup dialog.

Now, the agent has been created and activated.

### Add an item with inventory to be used in sales orders

Next, add an item with inventory that the Sales Validation Agent can use to validate sales orders.

1. Select **Search** (<kbd>Alt</kbd>+<kbd>Q</kbd>) :::image type="icon" source="../media/search_small.png"::: in the upper-right corner, enter **Items**, and then choose the related link.
1. Open the **Item Card** for the item you'll add to the sales order, which you will create in the next section.
1. In the **Inventory** section, press the ... on the **Inventory** field.
1. On the **Adjust Inventory** page, add quantity to the **New Inventory** field for a location that isn't Unspecified.
1. Press **OK**.

### Create and process a sales order using the Sales Validation Agent

1. Select **Search** (<kbd>Alt</kbd>+<kbd>Q</kbd>) :::image type="icon" source="../media/search_small.png"::: in the upper-right corner, enter **Sales Orders**, and then choose the related link.
1. On the **Sales Orders** list page, create a new sales order.
1. Choose any customer.
1. Add one or more new sales lines, with the item from the previous step.
1. Add quantity to one or more lines.
  Ensure that the **Location** is the same location you added quantity for.
1. For that sales line, under **Line** > **Functions**, choose **Reserve**.
1. There should be quantity available for reservation from **Item Ledger Entry**, select it, and choose **Reserve from Current Line**. Then, choose **OK**.
1. Back in the **Sales Order** card, under **Shipping and Billing**, optionally change the **Shipping Date**, otherwise just remember it. Note that if there are others with the same date, the agent tries to process it 
1. Depending on the quantity reserved:
  - **Shipping Advice** determines if the sales order should be released.
      - **Partial** - As long as some quantity has been reserved, it can be released
      - **Complete** - All sales lines and quantities must be reserved for it to be released.

### Run the Sales Validation Agent to process sales orders

Add a new task to the agent Open the Agents (Preview)

1. Select **Search** (<kbd>Alt</kbd>+<kbd>Q</kbd>) :::image type="icon" source="../media/search_small.png"::: in the upper-right corner, enter **Agent Tasks (preview)**, and then choose the related link.
1. Under **Playground** actions, choose **Create task**.
1. Add a title.

  Example: Validate and process sales orders
1. Add the following message: `Run and process shipment date <date>   <- That will be sufficient. <date> corresponds to the shipping date you chose for the sales order.`
1. Choose **OK**.

The agent will go through and process all sales orders that have a shipping date according to what you specified in the task.

## Related information

[Overview (preview)](ai-agent-playground-landing-page.yml)  
[Create and activate (preview)](ai-agent-playground-create.md)  
[Write effective instructions (preview)](ai-agent-playground-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-playground-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md)  
[Set up permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Run a playground agent (preview)](ai-agent-playground-run-agent.md)  
[Iterate and manage (preview)](ai-agent-playground-iterate.md)  
[Best practices (preview)](ai-agent-playground-best-practices.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)