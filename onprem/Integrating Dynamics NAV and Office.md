---
title: "Integrating Dynamics NAV and Office"
author: jswymer
ms.author: edupont
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# Integrating [!INCLUDE[navnow](includes/navnow_md.md)] and Microsoft Office
[!INCLUDE[navnow](includes/navnow_md.md)] includes several features that work with Microsoft Office products, including Excel, Word, OneNote, Outlook, and SharePoint. Some of the features require only that Office is installed on or accessible from the devices that are running the [!INCLUDE[navnow](includes/navnow_md.md)] clients, whereas other features require additional configuration. Depending on the feature, some configuration tasks are performed on the [!INCLUDE[navnow](includes/navnow_md.md)] deployment environment, such as configuring the [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance. These tasks are typically done by the system or IT administrator. Other tasks are performed on the application from the [!INCLUDE[navnow](includes/navnow_md.md)] clients, such as configuring user accounts. These tasks are typically done by the business application administrator.

The following table describes the available features:

|  Office Product  |  Feature  |  Information  |
|------------------|-----------|---------------|
|Excel and Word|Users can send [!INCLUDE[navnow](includes/navnow_md.md)] data on pages to Excel, Word, or in an email.|The basic requirement for this feature is that Office is accessible from the clients. For more information, see:<BR /><BR />[How to: Send Data to Other Programs](https://msdn.microsoft.com/library/hh167276)<BR /><BR />[Default Behavior When Sending Documents to Office](https://msdn.microsoft.com/library/dn789512)|
|<BR /><BR />|If users have exported data from [!INCLUDE[navnow](includes/navnow_md.md)] to Excel, they can refresh Excel to get the latest data from [!INCLUDE[navnow](includes/navnow_md.md)]. If they made changes to the data in Excel, then these changes are overwritten when they refresh the data.|This feature requires that you install the Microsoft Office Excel Add-In on the client by using the [!INCLUDE[navnow](includes/navnow_md.md)] Setup. For more information, see:<BR />[Client Option in Setup](Client-Option.md)<BR /><BR />[How to: Refresh Data from Excel](https://msdn.microsoft.com/library/hh167066)|
|<BR /><BR />|Users can work with data from list pages in Excel. Users can get fresh data from [!INCLUDE[navnow](includes/navnow_md.md)] and update the data in [!INCLUDE[navnow](includes/navnow_md.md)] based on their work in Excel.| [Setting up the Excel Add-In for Editing Data](configuring-dynamics-nav-excel-addin.md)|
|<BR /><BR />|When users export [!INCLUDE[navnow](includes/navnow_md.md)] documents to Excel, Word, or other Microsoft Office products, the data can be stored on SharePoint Online and accessed using Office 365.|[Integrating with Office 365 and SharePoint Online](https://msdn.microsoft.com/library/dn182542)|
|OneNote|Users can synchronize notes from OneNote with [!INCLUDE[navnow](includes/navnow_md.md)], and also use OneNote to share pictures, recordings, and other instructions across a company.| [Integrating with Microsoft OneNote](https://msdn.microsoft.com/library/hh167484)|
|Outlook|Users can synchronize data, such as to-dos, contacts, and tasks, between [!INCLUDE[navnow](includes/navnow_md.md)] and Outlook.| [Microsoft Office Outlook Add-In](Microsoft-Office-Outlook-Add-In.md)|
|<BR /><BR />|Users can complete [!INCLUDE[navnow](includes/navnow_md.md)] business tasks from their Outlook inbox. [!INCLUDE[navnow](includes/navnow_md.md)] customer or vendor information is available in Outlook emails and calendar appointments. Users to create, send, and view [!INCLUDE[navnow](includes/navnow_md.md)] business documents, such a sales quotes and invoices to a contact, directly in emails.| [Setting Up the Office Add-Ins for Outlook Inbox Integration](Setting-up-Office-Add-Ins-Outlook-Inbox.md)|



## See Also
[Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV.md)  
