---
title: "Troubleshooting: Accessing Camera and Location"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
author: blrobl
---

# Troubleshooting: Camera and Location

You might encounter some issues when trying to access the camera and location information of a device from [!INCLUDE[prodshort](includes/prodshort.md)]. Below you can find several scenarios that might be causing the issues.

### Device must have camera and location capabilities

In order to access the camera or retrieve a user's location from a device, the device must have a physical camera and location capabilities respectively.

If your device has camera and location capabilities but you still encounter problems, it is possible that some drivers need updating or reinstalling. Even if you are unsure, we always recommend you update your device operating system, drivers and browser to the latest version for the best experience.

### Enabling access permission

You must enable access to camera and location from your device's **Privacy Settings** and explicitly give permission to the browser you normally use to open the [!INCLUDE[webclient](includes/webclient.md)] or the [!INCLUDE[nav_uni_app_md](includes/nav_uni_app_md.md)] to access such capabilities.

<!--For example, you could list a few steps to check or grant access to the location for BC (eg. in edge browser this is Settings >> Site Permissions >> Location or Camera and wil llook something like this once you grant acces. Mention that this varies by device and browser.-->


### Accessing the [!INCLUDE[webclient](includes/webclient.md)] from a browser

If you open [!INCLUDE[webclient](includes/webclient.md)] from a web browser, you must also grant the [!INCLUDE[prodshort](includes/prodshort.md)] site permission to access the camera or location. By default, the browser will pop up a request to access these capabilities the first time the user activates such functionalities. 

> [!NOTE]
> Some old browsers do not grant access to camera and location. For example, camera is not available in Internet Explorer or the legacy Edge browser.

In addition, such capabilities are only available when accessing the [!INCLUDE[webclient](includes/webclient.md)] using the `https://` URI scheme. The only exception is when using `http://localhost` for development and test purposes.


### Working with virtual technologies

Accessing the [!INCLUDE[prodshort](includes/prodshort.md)] through remote desktop or another virtualization, access to camera or location might not be available.

### Antivirus sofware
Some antivirus softwares block access to camera and location by default. Remember to check your antivirus software settings.

## See Also
[Implementing the Camera in AL](devenv-implement-camera-al.md)
[Implementing the Location in AL](devenv-implement-location-al.md)