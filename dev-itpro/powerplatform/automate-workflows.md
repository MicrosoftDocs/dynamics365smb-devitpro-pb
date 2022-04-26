---
title: Set up automated workflows
description: Learn how to give your customers access to automated workflows, so that they can run Power Automate flows from inside Business Central online.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.date: 04/26/2022
ms.author: edupont
---

# Set Up Automated Workflows

As an admin, you can set up [!INCLUDE[prod_short](../includes/prod_short.md)] online so that users can create and run Power Automate flows from inside [!INCLUDE [prod_short](../includes/prod_short.md)].  

> [!NOTE]  
> Users must have a valid account with [!INCLUDE[prod_short](../includes/prod_short.md)] and with Power Automate.  

With Power Automate, you can create business flows directly in-house and rely on citizen developers​. Use Power Automate to connect to various cloud services, such as the following list:​

- Dataverse  
- Outlook  
- Teams  
- Approvals  
- Excel  
- SharePoint  
- Connectors to third party services  

## Switch on Power Automate flows to be run inside Business Central

Starting in May 2022, an admin can [switch on a feature](../administration/feature-management.md) to make it possible to run a Power Automate flow from most pages. To connect to Power Automate, Azure Active Directory services must access your [!INCLUDE [prod_short](../includes/prod_short.md)]. Once the admin has connected [!INCLUDE [prod_short](../includes/prod_short.md)] with Power Automate, users will see any flows that the organization has added when they choose the **Automate** action in the relevant pages. They can run the flows without leaving [!INCLUDE [prod_short](../includes/prod_short.md)].  

As the admin, you can try out the new feature for yourself before you switch it on for everyone in your organization. For more information, see the tip in the [How to enable an optional feature](../administration/feature-management.md#how-to-enable-an-optional-feature) section. Then, when you switch to the new browser tab, open a page such as the **Customers** list, and then choose the **Automate** action. You'll be prompted to authorize Power Automate for access to your Azure Active Directory. The **Azure Active Directory Service Permissions** page runs automatically, and you must choose the *Authorize Azure Services* hyperlink once you've verified that the Azure AD service that has requested access is `https://service.flow.microsoft.com/`. Then, you can run any of the pre-configured workflows, or start adding your own. For more information, see [Use Business Central in an Automated Workflow](/dynamics365/business-central/across-how-use-financials-data-source-flow).<!--check for renamed article-->  

## Add automated workflows

The [!INCLUDE [prod_short](../includes/prod_short.md)] [connector](/connectors/dynamicssmbsaas/) for Power Platform and Azure Logic Apps becomes generally available in May 2022. As the admin, you can add flows that will run as automated workflows, or as manually triggered instant flows. If you're inside [!INCLUDE [prod_short](../includes/prod_short.md)], then choose the **Automation** action, and then choose the **Create flow** action. That sends you to [powerautomate.microsoft.com](https://powerautomate.microsoft.com) in a new browser tab. Alternatively, go directly to [powerautomate.microsoft.com](https://powerautomate.microsoft.com), and then create your flows.  

Starting in April 2022, the updated Business Central connector for Power Automate​ gives you even more power. A flow can:

- Filter to a specific page or table with the [Find records (V3)](/connectors/dynamicssmbsaas/#find-records-(v3)) action  ​
- Pass context or parameters to Power Automate​  

  - Environment name, such as PRODUCTION​  
  - Company, such as Contoso​  
  - Table ID, such as the table underlying the current page​  
  - System ID, such as a specific record ID​  
  - Page ID, meaning the page that the flow was triggered from  
  - WebClientURL to open a specific page object
- Ask the user for more input  

### To create workflows in Power Automate

1. In your browser, navigate to [powerautomate.microsoft.com](https://powerautomate.microsoft.com), and then sign in.
2. Choose the **Create** menu item in the navigation pane, and off you go.

There are three ways to create a flow:

- **Start from template**  
- **Start from blank**  
- **Start from a connector**  

A template is a predefined flow that has been created for you. To use a template, select it and create a connection for each service the template uses. With the **Start from blank** and **Start from a connector** options, you can create a new flow completely from scratch.  

In all three cases, search for the **Microsoft [!INCLUDE[prod_long](../includes/prod_long.md)]** connector, choose the relevant trigger or template, and off you go. Power Automate will prompt you to select an environment and company within your [!INCLUDE[prod_short](../includes/prod_short.md)] tenant, plus any conditions in your data that you want to listen for.

> [!NOTE]
> The [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Automate supports multiple production and sandbox environments. If you haven't created multiple production or sandbox environments, **Production** is the only available option that you can choose.  

You've successfully connected to your [!INCLUDE[prod_short](../includes/prod_short.md)] data and are ready to begin building your flow. For more information, see [Create your first flow](/power-automate/getting-started) in the Power Automate content.  

> [!TIP]
> Remember to test your flow before you share it with other users. You can test it from inside Power Automate, and the connection to [!INCLUDE [prod_short](../includes/prod_short.md)] runs the various steps automatically. If the flow fails, you can troubleshoot the issue right there as illustrated in the following screenshot.

:::image type="content" source="../media/automate-workflows-test.png" alt-text="A failed step in a flow":::

Once you're ready, share the new flow with the organization. For more information, see [Share a cloud flow](/power-automate/create-team-flows).  

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

Power Automate shows a list of services that are used in the flow template and will attempt to connect automatically to those services. If you haven't previously connected to a service, you'll be prompted to sign in to each of the services you need to connect to. A green checkmark will appear next to each service once a connection has been successfully made. Choose the **Continue** action.

Power Automate will prompt you to select an environment and company within your [!INCLUDE[prod_short](../includes/prod_short.md)] tenant. Because each step in the flow is independent of the next, you may be required to define the environment and company multiple times when using a [!INCLUDE[prod_short](../includes/prod_short.md)] Power Automate template.

For more information, see the [Power Automate Documentation](/power-automate/getting-started).

## Use the connector for other scenarios

The [connector](/connectors/dynamicssmbsaas/) for Power Platform and Azure Logic Apps also supports other scenarios. For example, use the [Find records (V3)](/connectors/dynamicssmbsaas/#find-records-(v3)) action to create or edit table data for document headers or lines. You can also build a Power App that creates and posts times sheets, or a Power Automate flow that posts journal lines.  

The **Find records (V3)** action finds records in the same way as [filter expressions in OData URIs](../webservices/use-filter-expressions-in-odata-uris.md). but it does so behind the scenes, so all you have to do is to add the action as a step in your flow. For more information, see [Find records (V3)](/connectors/dynamicssmbsaas/#find-records-(v3)).  

## Telemetry

We recommend that our partners use the [!INCLUDE [prod_short](../includes/prod_short.md)] telemetry app in Power BI to keep track of workflows. It shows usage of connectors for tenants that you manage or own,​ and it uses any app insights​ telemetry that​ you have set up in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

Get the app at [https://aka.ms/bctelemetryreport](https://aka.ms/bctelemetryreport).  

## See also

[Troubleshoot Your Business Central Automated Workflows](/dynamics365/business-central/across-flow-troubleshoot)  
[Use Business Central in an Automated Workflow](/dynamics365/business-central/across-how-use-financials-data-source-flow)<!--keep an eye out for redirects-->  
