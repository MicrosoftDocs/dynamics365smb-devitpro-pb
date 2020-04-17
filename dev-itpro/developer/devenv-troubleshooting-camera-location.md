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

You might encounter some issues when trying to access the camera and location information of a device from [!INCLUDE[prodshort](includes/prodshort.md)]. You can find the possible causes behind these problems and how to workaround them listed below.

## Device must have Camera and Location Capabilities

In order to access the camera or retrieve a user's location from a device, the device must have a physical camera or location capabilities, respectively.

If your device has camera and location capabilities but you still encounter problems, it is possible that some drivers need updating or reinstalling. Even if you are unsure, we always recommend you update your device operating system, drivers, and browser to the latest version for the best experience.

## Access Permissions not Enabled

You must enable general access to camera and location from your device's privacy settings and explicitly give permission to  [!INCLUDE[prodshort](includes/prodshort.md)] to access them. For example, to see or change permissions for a device running on Windows, go to **Settings**, choose **Privacy**, and then **App permissions**. 

<!-- If you are using [!INCLUDE[prodshort](includes/prodshort.md)] in a browser, you must give permission to the browser to access camera and location.  -->

In addition, if you are using [!INCLUDE[prodshort](includes/prodshort.md)] in a browser, you must also grant the [!INCLUDE[prodshort](includes/prodshort.md)] site permission to access the camera or location information. To see or change a site's permissions in the Microsoft Edge browser, go to **Settings**, choose **Site Permissions**, and then **Camera**. Note that this might be different for other browsers.

By default, the device or browser will pop up a request to access these capabilities when the user activates them for the first time.

> [!NOTE]  
> Some old browsers do not grant access to camera and location. For example, camera is not available in Internet Explorer or the legacy Edge browser.

## [!INCLUDE[webclient](includes/webclient.md)] Connection not Secure

The camera and location capabilities are only available when accessing the [!INCLUDE[webclient](includes/webclient.md)] through SSL secured HTTP connections, using the `https://` URI scheme. 

The only exception is connecting to `http://localhost` for development and test purposes.


## Working with Virtual Technologies

When connecting to [!INCLUDE[prodshort](includes/prodshort.md)] through Remote Desktop or another virtualization, the access to camera or location might not be available. If this is the case, use the physical system instead.

<!-- ### Antivirus Sofware
Some antivirus softwares block access to camera and location by default. Remember to check your antivirus software settings. -->

## See Also
[Implementing the Camera in AL](devenv-implement-camera-al.md)  
[Implementing the Location in AL](devenv-implement-location-al.md)
