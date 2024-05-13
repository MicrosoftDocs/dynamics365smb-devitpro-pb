---
title: Integrating with Office apps and Microsoft 365 
description: Learn how to integrate Business Central with Office apps and Microsoft 365.
author: kennienp
ms.reviewer: solsen
ms.topic: overview
ms.author: kepontop
ms.date: 04/08/2024
---

# Integrating with Office apps and Microsoft 365

[!INCLUDE[prod_short](../includes/prod_short.md)] supports multiple integrations to [!INCLUDE[m365](includes/m365-name.md)]. Enabling integrations to [!INCLUDE[m365](includes/m365-name.md)] augments the functionality in [!INCLUDE [prod_short](../includes/prod_short.md)] with extra features. It also augments [!INCLUDE[m365](includes/m365-name.md)] apps with new features so that users can stay in the flow of work and get access to the right data at the right time from the app they prefer working with. Along with built-in integration, [!INCLUDE [prod_short](../includes/prod_short.md)] offers more ways for you to integrate with [!INCLUDE[m365](includes/m365-name.md)] apps using API apps.

:::image type="content" source="media/m365-integrations-detail.svg" alt-text="Shows how Business Central integrates to Microsoft 365" lightbox="media/m365-integrations-detail.svg":::

In this article, we introduce some of these features.

## Using [!INCLUDE[m365_excel](includes/m365-excel-name.md)] with [!INCLUDE [prod_short](../includes/prod_short.md)]

[!INCLUDE[m365_excel](includes/m365-excel-name.md)] is used in [!INCLUDE [prod_short](../includes/prod_short.md)] in the following scenarios:

- View or edit [!INCLUDE [prod_short](../includes/prod_short.md)] data in Excel.
- Support analytical reporting.
- Write AL code and use the System app module to create or read Excel files as a developer.

:::image type="content" source="media/connect-to-excel.svg" alt-text="Shows how Business Central integrates to Excel" lightbox="media/connect-to-excel.svg":::

With pages that display a list of records in rows and columns, like a list of customers, sale orders, or invoices, users can export the list to [!INCLUDE[m365_excel](includes/m365-excel-name.md)] and view it there. Depending on the page, two options exists: 
- *Open in Excel*, where the [!INCLUDE [prod_short](../includes/prod_short.md)] platform produces an Excel workbook with the data as read-only.
- *Edit in Excel*, which uses the [!INCLUDE [prod_short](../includes/prod_short.md)] add-in for Excel. The Excel add-in reads data from [!INCLUDE [prod_short](../includes/prod_short.md)] using the page exposed as an OData web service endpoint. Any writes back to [!INCLUDE [prod_short](../includes/prod_short.md)] are also done through this web service endpoint.

For more information, see [Viewing and Editing in Excel From Business Central](/dynamics365/business-central/across-work-with-excel).

Power users can use Excel as the design tool for the layout of analytical reports and then upload the Excel layout workbook to [!INCLUDE [prod_short](../includes/prod_short.md)]. Any user who has access to these reports can run them. When the [!INCLUDE [prod_short](../includes/prod_short.md)] server generates the Excel report, it merges the Excel layout workbook with data and sends the resulting Excel workbook to the user as a downloaded file. For more information, see [Working with Microsoft Excel Layouts](/dynamics365/business-central/ui-excel-report-layouts?tabs=any-report).


> [!TIP]
> If you also enable integration to [!INCLUDE[m365_onedrive_for_business](includes/m365-onedrive-for-business-name.md)], Excel workbooks from [!INCLUDE [prod_short](../includes/prod_short.md)] are opened in your browser by using Excel for the web. 


## Integrating to [!INCLUDE[m365_graph](includes/m365-graph-name.md)] (from AL code)

You can connect to and work with [!INCLUDE[m365_graph](includes/m365-graph-name.md)] with just a few lines of AL code. The module works as a wrapper of the [!INCLUDE[m365_graph](includes/m365-graph-name.md)] REST API. 

:::image type="content" source="media/connect-to-m365-services.svg" alt-text="Shows how Business Central integrates to Microsoft graph" lightbox="media/connect-to-m365-services.svg":::

As an AL developer, you can use the module to do the following tasks:
- Create a [!INCLUDE[m365_graph](includes/m365-graph-name.md)] authorization.
- Initialize the [!INCLUDE[m365_graph](includes/m365-graph-name.md)] Client.
- Process GET, PATCH, POST, DELETE requests with [!INCLUDE[m365_graph](includes/m365-graph-name.md)].

For more information, see [Microsoft Graph (System Application reference)](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/MicrosoftGraph).  


## Integrating to OneDrive

[!INCLUDE[m365_onedrive_for_business](includes/m365-onedrive-for-business-name.md)] is a cloud storage service that is included in Microsoft 365. [!INCLUDE[prod_short](../includes/prod_short.md)] makes it easy to store, manage, and share files with other people through OneDrive. 

When [!INCLUDE[m365_onedrive_for_business](includes/m365-onedrive-for-business-name.md)] is enabled in [!INCLUDE[prod_short](../includes/prod_short.md)] by an administrator, extra functionality becomes available. For example:

- New *Open in OneDrive* and *Share* actions are now available on most pages where files are available, such as the Report Inbox or where files are attached to records. 
- *Open in Excel* and *Edit in Excel* actions on list pages automatically copy the Excel file to OneDrive, then open it in Excel Online.
- *Send to Microsoft Excel document* and *Send to Microsoft Word document* actions automatically copy the file to OneDrive, then open it in Excel or Word online.

:::image type="content" source="media/connect-to-onedrive.svg" alt-text="Shows how Business Central integrates to OneDrive" lightbox="media/connect-to-onedrive.svg":::

Developers can also write AL code to integrate with OneDrive and add actions such as Open, Share, or Edit to their own pages whenever files are used. For more information, see [Extending Document Sharing and OneDriveIntegration](devenv-extending-document-sharing-onedrive.md).

> [!NOTE]
> With [!INCLUDE[prod_short](../includes/prod_short.md)] online, the connection between [!INCLUDE[prod_short](../includes/prod_short.md)] and OneDrive is automatically configured, and the OneDrive features are readily available to users by default. With [!INCLUDE[prod_short](../includes/prod_short.md)] on-premises, it requires more setup. For more information, see [Managing OneDrive Integration with Business Central](/dynamics365/business-central/admin-onedrive-integration).

For more information, see [Business Central and OneDrive Integration](/dynamics365/business-central/across-onedrive-overview).


## Using [!INCLUDE[m365_outlook](includes/m365-outlook-name.md)] with [!INCLUDE [prod_short](../includes/prod_short.md)]

With [!INCLUDE [prod_short](../includes/prod_short.md)], you can manage business interactions with your customers and vendors directly in [!INCLUDE[m365_outlook](includes/m365-outlook-name.md)]. By installing the [!INCLUDE [prod_short](../includes/prod_short.md)] add-in for [!INCLUDE[m365_outlook](includes/m365-outlook-name.md)], you get the following capabilities:

- **Contact insights**: This add-in lets you look up [!INCLUDE [prod_short](../includes/prod_short.md)] customer or vendor information in [!INCLUDE[m365_outlook](includes/m365-outlook-name.md)] emails and calendar appointments. It also lets you create and send emails including [!INCLUDE [prod_short](../includes/prod_short.md)] business documents, such as a sales quote or invoice to a contact.
- **Document view**: When a business document is sent in an email, the add-in provides a direct link from the email to the actual business document in [!INCLUDE [prod_short](../includes/prod_short.md)].

:::image type="content" source="media/connect-to-outlook.svg" alt-text="Shows how Business Central integrates to Outlook" lightbox="media/connect-to-outlook.svg":::


For more information, see [Get the Business Central Add-in for Outlook](/dynamics365/business-central/admin-outlook).



## Integrating to [!INCLUDE[m365_sharepoint](includes/m365-sharepoint-name.md)] (from AL code)

Connect to and work with storage accounts, containers, and blobs from SharePoint in your AL code. The module works as a wrapper of the [!INCLUDE[m365_sharepoint](includes/m365-sharepoint-name.md)] REST API. 

:::image type="content" source="media/connect-to-m365-services.svg" alt-text="Shows how Business Central integrates to Microsoft SharePoint" lightbox="media/connect-to-m365-services.svg":::

As an AL developer, you can use the module to do the following tasks:
- Connect to and authenticate a session in SharePoint.
- Perform basic operations with SharePoint files, folders, lists, list items, and list attachments.

For more information, see [SharePoint (System Application reference)](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/SharePoint).  


## Integrating to [!INCLUDE[m365_teams](includes/m365-teams-name.md)]

You can integrate [!INCLUDE[prod_short](../includes/prod_short.md)] apps and extensions with [!INCLUDE[m365_teams](includes/m365-teams-name.md)]. [!INCLUDE [prod_short](../includes/prod_short.md)] offers an app that connects [!INCLUDE[m365_teams](includes/m365-teams-name.md)] to the data in [!INCLUDE [prod_short](../includes/prod_short.md)] so that users can quickly share details across team members and respond faster to inquiries. 

[![Teams integration with Business Central](media/teams-intro-v3.png)](media/teams-intro-v3.png#lightbox)

For more information, see [Developing for Microsoft Teams Integration](../developer/devenv-develop-for-teams.md).


## Using [!INCLUDE[m365_word](includes/m365-word-name.md)] with [!INCLUDE [prod_short](../includes/prod_short.md)]

Power users in [!INCLUDE [prod_short](../includes/prod_short.md)] can use [!INCLUDE[m365_word](includes/m365-word-name.md)] for the following scenarios:

- To change the layout of their outgoing documents.
- To make it easy to mass communicate in print or email.

:::image type="content" source="media/connect-to-word.svg" alt-text="Shows how Business Central integrates to Word" lightbox="media/connect-to-word.svg":::

If an organization wants to change the layout of its outgoing documents such as quotes, sales orders, or sales invoices, a power user can use Word as the design tool to change the layout. When the [!INCLUDE [prod_short](../includes/prod_short.md)] server generates the document report, it merges the Word layout with data and sends the resulting PDF document to the user as a downloaded file (or to a printer). For more information, see [Work with Word Layouts](/dynamics365/business-central/ui-how-add-fields-word-report-layout).

To make it easy to mass communicate in print or email, power users can use mail merge commands in Word to use Word as the design tool to create the layout of the message. They can then upload the Word document to [!INCLUDE [prod_short](../includes/prod_short.md)]. When you run the campaign, the [!INCLUDE [prod_short](../includes/prod_short.md)] platform merges data from entities such as contacts, customers, and vendors with the template to produce the final documents to send to clients. For more information, see [Using Word Templates for Bulk Communication](/dynamics365/business-central/ui-mail-merge).




## See also

[Viewing and Editing in Excel From Business Central](/dynamics365/business-central/across-work-with-excel)  
[Working with Microsoft Excel Layouts](/dynamics365/business-central/ui-excel-report-layouts?tabs=any-report)  
[Integrating with Microsoft Graph (System Application reference)](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/MicrosoftGraph)  
[Business Central and OneDrive Integration](/dynamics365/business-central/across-onedrive-overview)  
[Extending Document Sharing and OneDrive Integration (for developers)](devenv-extending-document-sharing-onedrive.md)  
[Using Outlook with Business Central](/dynamics365/business-central/admin-outlook)  
[Integrating with SharePoint (System Application reference)](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/SharePoint)  
[Developing for Microsoft Teams Integration](../developer/devenv-develop-for-teams.md)   
[Work with Word Layouts](/dynamics365/business-central/ui-how-add-fields-word-report-layout)  
[Use Word Templates for Bulk Communication](/dynamics365/business-central/ui-mail-merge)  
