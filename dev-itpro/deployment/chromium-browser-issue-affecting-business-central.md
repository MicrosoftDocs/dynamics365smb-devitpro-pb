---
title: Chromium browser issue affecting Business Central
description: Learn how to workaround the Chromium browser issues that are causing problems for Business Central users.
ms.topic: article
ms.service: dynamics365-business-central
author: edupont04
ms.author: mikebc
ms.date: 06/30/2022

---

# Chromium browser issue affecting Business Central

After the June 2022 wave of browser updates to Chromium-based browsers such as Google Chrome and Microsoft Edge, customers have experienced glitches in the Business Central user interface. While the teams behind the Chromium-based browsers work to address the root cause, Microsoft has prepared a fix to supported versions of Business Central. For Business Central online customers, the fix is already rolling out, starting June 29. This article describes how on-premises customers can identify the issue and plan their approach to fixing or working around the problem.

## How this issue affects your organization

Users impacted by this issue will experience misplaced UI elements in the Business Central user interface, such as the on/off switch control (for Boolean fields) or assist-edit control (on any field) being relocated to the upper corners of a page as illustrated in the following image. The misplaced controls may overlap each other, creating difficulties in identifying and activating the right one.

:::image type="content" source="../media/browserissues.png" alt-text="Table of Business Central versions with problems":::

## Which customers are impacted

Users accessing Business Central in any of the following ways may experience this issue:

|Method of access | **Business Central 2021 wave 2 (version 18) or newer** | **Business Central 2019 (version 14)** | **Dynamics NAV 2018 (version 11) and earlier** |
|--|--|--|--|
| Microsoft Edge or Google Chrome browser | **Impacted** | Not impacted | Not impacted |
| Desktop app based on PWA technology, including the new Business Central app on the Microsoft Store | **Impacted** | Not impacted | Not impacted |
| Business Central embedded in other applications | **Impacted** | Not impacted | Not impacted |
| Mobile app for Android | **Impacted** | **Impacted** | **Impacted** |

> [!NOTE]
> The issue has been confirmed on supported version of Business Central, but most likely applies to other versions

## How to fix the issue for Business Central on-premises

The fix to the web server will be included in the July or August cumulative updates that administrators can deploy to Business Central on-premises solutions. This section will be updated with a specific list of cumulative updates that contain the fix, as soon as those are made generally available.

## What administrators can do to work around the issue

The following steps help all users in your organization work around the issue and vary depending on the version of Business Central you have deployed.

### Business Central version 13 and later

1. On your Web server, open the desktopPreview.css file in a text editor such as Notepad. The file is in your Web server instance folder, such as `C:\inetpub\wwwroot\InstanceName\wwwroot\Resources` where `InstanceName` is the identifier for your web server instance. The actual path depends on how you have configured IIS and the Business Central Web server.

2. Paste the following lines at the very end of the file, and then save your changes:

    ```css
    .ms-nav-edit-control-container,
    
    .booleancontrol-toggle-switch-container .edit-container .input-wrapper {
    
    transform: translateZ(0);
    
    }
    ```

3. Repeat steps 1 and 2 for the tablet.css and phone.css files that are in the same folder.

4. If your deployment has multiple Web server instances, repeat steps for 1 to 3 for each instance.

> [!NOTE]
> The changes come into effect immediately. No need to restart the service.

### Business Central versions 11 and 12

1. On your Web server, open the desktop.css file in a text editor such as Notepad. The file is in your Web server instance folder, such as `C:\inetpub\wwwroot\InstanceName\wwwroot\Resources` where `InstanceName` is the identifier for your web server instance. The actual path depends on how you have configured IIS and the Business Central Web server.

2. Paste the following lines at the very end of the file, and then save your changes:

    ```css
    .ms-nav-edit-control-container {
    
    transform: translateZ(0);
    
    }
    ```

3. Repeat steps 1 and 2 for the tablet.css and phone.css files that are in the same folder.

4. If your deployment has multiple Web server instances, repeat steps for 1 to 3 for each instance.

> [!NOTE]
> The changes come into effect immediately and no service restart is required.

## What business users can do to work around the issue

If you access Business Central in your browser, consider temporarily switching to another supported browser that is unaffected by this issue, such as Mozilla FireFox. See [the list of supported Web clients here](system-requirements-business-central-v20.md#WebClient)

## See also

[System Requirements for [!INCLUDE[prod_long](../developer/includes/prod_long.md)] 2022 Release Wave 1](system-requirements-business-central-v20.md)  
[Supported Upgrade Paths to [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Releases](../upgrade/upgrade-paths.md)  
