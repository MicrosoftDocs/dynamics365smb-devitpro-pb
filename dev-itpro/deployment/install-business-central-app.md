---
title: Install the Business Central Mobile App
description: Learn about prerequisites for using Business Central on-premises on mobile devices.
ms.custom: na
ms.date: 01/28/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
caps.latest.revision: 24
ms.author: jswymer
author: jswymer
---

# Preparing For and Installing the Microsoft Dynamics 365 Business Central App

This article describes how to prepare for and install the Business Central App when you have on-premises solution. If you have Business Central online, there's no preparation. For more information, see [Getting Business Central on Your Mobile Device](/dynamics365/business-central/install-mobile-app).

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] App is available for download for devices that use following operating systems (OS):

|OS|Description|Download|
|--|-----------|--------|
|iOS |Mobile app for iPad and iPhone|[App Store](https://go.microsoft.com/fwlink/?LinkId=734847)|
|Android|Mobile app for Android phones| [Google Play](https://go.microsoft.com/fwlink/?LinkId=734849)|
|Windows 10 or Xbox One|A desktop app for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 (version 18) and earlier. The app mimics the [!INCLUDE[webclient](../developer/includes/webclient.md)] but has the same look-and-feel as mobile apps.<br /><br />If you're using 2021 release wave 2 (version 19) or later, install the app directly from your browser. For more information, see [Get Business Central Desktop App](/dynamics365/business-central/install-desktop-app).|[Microsoft Store](https://go.microsoft.com/fwlink/?LinkId=734848)|

Like the [!INCLUDE[webclient](../developer/includes/webclient.md)], the app relies on a Business Central web server instance to connect to database. The app uses the same application code as the Web client, except it renders the application in a different format.

## <a name="prereqs"></a>Preparing the environment

To install a working [!INCLUDE[prod_short](../developer/includes/prod_short.md)] App, the following requirements must be met:

- You must have a working [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises solution that includes a web server instance, server, and database (application and business data).

- The [!INCLUDE[webserver](../developer/includes/webserver.md)] instance must be configured for:

  - https (SSL)
  - For the iOS app, the navsettings.json file must include the `"GlobalEndPoints"` parameter with the following endpoints as a minimum: null, ms://businesscentral, and ms://dynamicsnav. For example:

    ```
    "GlobalEndPoints": "null,ms://businesscentral,ms://dynamicsnav"
    ```
    You can set other endpoints, but these endpoints must be included for the app to work.

- You’re set up as a user in Business Central.

    If you installed Business Central, then by default, your Windows account has been added as a user.

- The computer on which you install the app must meet the requirements outlined on the download page for the app.

> [!IMPORTANT]
> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] doesn't support Azure Active Directory Application Proxy, because Application Proxy doesn't fully support web sockets.

## Install the Business Central App

1. Go to the download page from links provided in the preceding table, and select **Get**.

    You can also install the desktop app by running setup.exe from the [!INCLUDE[prod_long](../developer/includes/prod_long.md)] installation media (DVD). Follow Setup until you come to the **[!INCLUDE[prod_long](../developer/includes/prod_long.md)]** page, select  **Get the Business Central app from the Microsoft Store**, and then **Get**.

2. On the **Welcome** page, select **Connect to a local or hosted service**.
3. In the **Service name** box, enter the URL for your [!INCLUDE[webserver](../developer/includes/webserver.md)] instance.

    This URL is the same URL that you use for opening the [!INCLUDE[webclient](../developer/includes/webclient.md)], and has the format: `https://<hostname>:<port>/<web server instance>`, for example, `https://mycomputer:443/BC150`.

    Select the arrow to continue.

4. When prompted, provide a valid user name and password for accessing Business Central.  

    For example, if your deployment is using Windows authentication, you would enter your Windows user name and password.

    Select the arrow to continue.

    When completed, the Business Central App will open.

## See Also

[Troubleshooting the Business Central Mobile App On-Premises](../developer/devenv-troubleshooting-the-mobile-app.md)  
[Installing Business Central Using Setup](install-using-setup.md)  
[Configuring [!INCLUDE[webserver](../developer/includes/webserver.md)] Instances](../administration/configure-web-server.md)  
[Components](product-and-architecture-overview.md)  
[Deployment](deployment.md)  
[Web Client URL](../developer/devenv-web-client-urls.md)  

## Help us understand

We want to learn more about how people use Microsoft's [custom Help toolkit](https://github.com/microsoft/dynamics365smb-custom-help). Take the survey (in English) and help us understand: [https://forms.office.com/r/A4cUJgjkD1](https://forms.office.com/r/A4cUJgjkD1).  
