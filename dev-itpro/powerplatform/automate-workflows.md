---
title: Set up automated workflows
description: Learn how to give your customers access to automated workflows, so they can run Power Automate flows from inside Business Central online.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.date: 09/04/2022
ms.author: edupont
---

# Set Up Automated Workflows

You can set up [!INCLUDE[prod_short](../includes/prod_short.md)] online to create and run Power Automate flows from inside [!INCLUDE [prod_short](../includes/prod_short.md)].  

> [!NOTE]  
> To use Power Automate with [!INCLUDE[prod_short](../includes/prod_short.md)], you must have a valid Power Automate account.

Power Automate is a no code/low code solution for creating business flows directly in the context of [!INCLUDE[prod_short](../includes/prod_short.md)]. Using it, you can connect to various cloud services, such as the ones listed below, and create flows that use multiple data sources.

- Dataverse  
- Outlook  
- Teams  
- Approvals  
- Excel  
- SharePoint  
- Connectors to partner services  


## Add automated workflows

With the [!INCLUDE [prod_short](../includes/prod_short.md)] connector for Power Automate, you can add automated and manually triggered instant flows. Or you can directly go to [powerautomate.microsoft.com](https://powerautomate.microsoft.com) and create flows.

The connector​ seamlessly connects data and gives you the option to include **Dynamic content** when you create any type of flow. To complete an instant flow with the [!INCLUDE [prod_short](../includes/prod_short.md)] connector, you must perform the following tasks:

<!--- Filter to a specific page or table with the [Find records (V3)](/connectors/dynamicssmbsaas/#find-records-(v3)) action COPIED FROM RELEASE PLAN BUT PM SAYS IT'S NOT TRUE---> ​
- Pass context or parameters to Power Automate​  
  - Environment name, such as *PRODUCTION​*  
  - Company, such as *Contoso​*  
  - Table ID, such as the table underlying the current page​  
  - System ID, such as a specific record ID​  
  - Page ID, meaning the page that the flow was triggered from  
  - WebClientURL to open a specific page object
- Specify the type of input to add from the options given by the flow.

> [!TIP]
> Learn about [!INCLUDE [prod_short](../includes/prod_short.md)] connectors [here](/connectors/dynamicssmbsaas/).

### To create workflows in Power Automate

1. From inside [!INCLUDE [prod_short](../includes/prod_short.md)], find the **Automate** action hidden in the *more options* **...** icon on the navigation bar. Choose that action, then choose the **Create a flow** action. That opens [powerautomate.microsoft.com](https://powerautomate.microsoft.com) in a new browser tab. 

    You're automatically signed into Power Automate, and the [[!INCLUDE [prod_short](../includes/prod_short.md)] [connector](/connectors/dynamicssmbsaas/) shows as the *For a selected record (V3)* trigger.

    :::image type="content" source="../media/powerautomate-connector.png" alt-text="The connector inside Power Automate":::

    You can limit the flow to a specific environment or company, but leave the **Environment name** and **Company name** fields blank to make the flow available in all environments or companies. The **Page or table** field specifies where you want to make the flow available from inside [!INCLUDE [prod_short](../includes/prod_short.md)]. For example, to add the new flow to the **Automate** menu on the **Item Card** page, set the **Page or table** field to either *PAGE30* or *ITEM27*.  

> [!TIP]
> To add the desired page or table name in the **Page or table** field, either press **Ctrl+Alt+F1** or go to the question mark icon in the top right corner of the page, choose **Help and Support**, then choose **Inspect pages and data**. In the resulting page inspection tab, you can see the name of the current page, its related table, and other details.
   
2. Add the relevant steps to create a flow for your task. Learn more in the [Create your first flow](/power-automate/getting-started) topic in the Power Automate content.  

3. You can test the flow from inside Power Automate, and the connection to [!INCLUDE [prod_short](../includes/prod_short.md)] runs the various steps automatically. If the flow fails, you can troubleshoot the issue right there as shown in the following screenshot. You can open the step that failed and resolve the *error*. Or you can run [Flow Checker](/power-automate/error-checker) from inside Power Automate to find any error or warning.

:::image type="content" source="../media/automate-workflows-test.png" alt-text="A failed step in a flow":::

> [!TIP]
> Remember to test your flow before sharing it with other users to check that it's working as intended or to resolve any errors. Learn more about different issues, errors, and troubleshooting at [Power Automate troubleshooting](/troubleshoot/power-platform/power-automate/welcome-power-automate).

Once you're ready, share the new flow with the organization. Learn more at [Share a cloud flow](/power-automate/create-team-flows).  

### Create workflows from the Power Automate home page

You don't have to start in [!INCLUDE [prod_short](../includes/prod_short.md)] to create workflows. Rather, in your browser, navigate to [powerautomate.microsoft.com](https://powerautomate.microsoft.com), and sign in. In this case, you must choose the **Create** menu item in the navigation pane. From there, you can create a flow choosing one of three methods:

- **Start from blank** 
- **Start from a template**   
- **Start from a connector**  

A template is a predefined flow. To use a template, you'll select that option and create a connection for each service the template uses. With the **Start from blank** and **Start from a connector** options, you can create a new flow completely from scratch.  

In all three cases, search for the **Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)]** connector, choose the relevant trigger or template, and off you go. Power Automate prompts you to select an environment and company within your [!INCLUDE[prod_short](../includes/prod_short.md)] tenant, plus any conditions in your data that you want to watch for.

> [!NOTE]
> The [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Automate supports multiple production and sandbox environments. If you haven't created multiple production or sandbox environments, **Production** is the only available option you can choose.  

When you've successfully connected to your [!INCLUDE[prod_short](../includes/prod_short.md)] data, you're ready to begin building your flow. Learn more at [Create your first flow](/power-automate/getting-started#create-your-first-flow) in the Power Automate content.  

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

Learn more in the [Power Automate Documentation](/power-automate/getting-started).

## Use the connector for other scenarios

The [connectors](/connectors/dynamicssmbsaas/) for Power Platform and Azure Logic Apps also support other scenarios. For example, use the [Find records (V3)] (/connectors/dynamicssmbsaas/#find-records-(v3)) action to create or edit table data for document headers or lines. You can also build a Power App that creates and posts time sheets, or a Power Automate flow that posts journal lines.  

The **Find records (V3)** action finds records in the same way as [filter expressions in OData URIs](../webservices/use-filter-expressions-in-odata-uris.md). But it does so behind the scenes, so all you have to do is add the action as a step in your flow. Learn more at [Find records (V3)](/connectors/dynamicssmbsaas/#find-records-(v3)).  

## Telemetry

We recommend you use the [!INCLUDE [prod_short](../includes/prod_short.md)] General Data Protection Regulation app in Power BI to keep track of workflows. It shows usage of connectors for tenants you manage or own. The app also uses Application Insights​ telemetry that​ you have set up in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

Get the telemetry app at [https://aka.ms/bctelemetryreport](https://aka.ms/bctelemetryreport).  

## See also

[Manage Power Automate Flows](manage-power-automate-flows.md)  
[Switch on Manual Instant Flows](instant-flows.md)  
[Troubleshoot Your Business Central Automated Workflows](/dynamics365/business-central/across-flow-troubleshoot)  
[Use Business Central in an Automated Workflow](/dynamics365/business-central/across-how-use-financials-data-source-flow)<!--keep an eye out for redirects-->  
