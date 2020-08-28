---
title: "Install Business Central Using Setup"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e4bd0a48-9e21-44e3-8a5d-858f02af5206
caps.latest.revision: 24
ms.author: jswymer
author: jswymer
---

# Preparing For and Installing the Microsoft Dynamics 365 Business Central App

This article describes how to prepare for and install the Business Central App when you have on-premises solution. If you have a Business Central Online, there is no preparation (see [Getting Business Central on Your Mobile Device](/dynamics365/business-central/install-mobile-app).

The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] App is available in for the following devices with the following operating systems (OS):

|OS|Description|Download|
|--|-----------|--------|
|iOS |Mobile app for iPad and iPhone|[[App Store]](https://go.microsoft.com/fwlink/?LinkId=734847)|
|Android|Mobile app for Android phones| [Google Play](https://go.microsoft.com/fwlink/?LinkId=734849)|
|Windows 10 or Xbox|a companion desktop app for Windows 10 or Xbox One that mimics that [!INCLUDE[webclient](../developer/includes/webclient.md)] but has the same look-and-feel as mobile apps. It can be used with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online or on-premises|[Windows Store](https://go.microsoft.com/fwlink/?LinkId=734848)|

Like the [!INCLUDE[webclient](../developer/includes/webclient.md)], the Business Central App relies on a Business Central web server instance that connects to Business Central Server and database. The Business Central App uses the same application code as the Web client, except it renders the application in a different format.

## <a name="prereqs"></a>Preparing the environment

To install a working [!INCLUDE[prodshort](../developer/includes/prodshort.md)] App, the following requirements must be met:

- You must have a working [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises solution that includes a web server instance, server, and database (application and business data).

- The [!INCLUDE[webserver](../developer/includes/webserver.md)] instance must be configured for:

  - https (SSL)
  - For the iOS app, the [navsettings.json]() file must include the `"GlobalEndPoints"` with the endpoints: null, ms-businesscentral, and ms-dynamicsnav. For example:

    ```
    "GlobalEndPoints": "null,ms-businesscentral,ms-dynamicsnav"
    ```
    You can set other endpoint, but these endpoints must be included for the app to work.

- You are set up as a user in Business Central.

    If you installed Business Central, then by default, your Windows account has been added as a user.

- Computer on which you install the app must meet the [minimum requirements](https://www.microsoft.com/p/microsoft-dynamics-365-business-central/9nblggh4ql79?rtc=1&activetab=pivot:regionofsystemrequirementstab) for installing the Business Central App.

## Install the Business Central App

1. Go to the download page from links provided in the preceding table, and select **Get**.

    You can also install the desktop app by running setup.exe from the [prodlong](../developer/includes/prodlong.md)] installation media (DVD). Follow Setup until you come to the **[!INCLUDE[prodlong](../developer/includes/prodlong.md)]** page, select  **Get the Business Central app from the Microsoft Store**, and then **Get**.

2. On the **Welcome** page, select **Connect to a local or hosted service**.
3. In the **Service name** box, enter the URL for your [!INCLUDE[webserver](../developer/includes/webserver.md)] instance.

    This is the same URL that you use for opening the [!INCLUDE[webclient](../developer/includes/webclient.md)], and has the format: `https://<hostname>:<port>/<web server instance>`, for example, `https://mycomputer:443/BC150`.

    Select the arrow to continue.

4. When prompted, provide a valid user name and password for accessing Business Central. 

    For example, if your deployment is using Windows authentication, this would be your Windows user name and password.

    Select the arrow to continue.

    When completed, the Business Central App will open.

## See Also

[Installing Business Central Using Setup](install-using-setup.md)  
[Configuring [!INCLUDE[webserver](../developer/includes/webserver.md)] Instances](../administration/configure-web-server.md)
[Components](product-and-architecture-overview.md)  
[Deployment](deployment.md)  
[Web Client URL](../developer/devenv-web-client-urls.md)  
