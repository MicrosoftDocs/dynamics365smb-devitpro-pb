---
title: Troubleshooting Icon Font Not Loaded
description: Learn how to fix missing icon fonts in the Business Central web, tablet, and phone clients by adding the site to your trusted sites in Windows.
ms.date: 04/01/2021
ms.topic: troubleshooting
ms.reviewer: solsen
ms.author: solsen
author: SusanneWindfeldPedersen
---

# Troubleshooting icon font not loaded

The Icon font is missing on the [!INCLUDE[nav_web](includes/nav_web_md.md)], [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)], or [!INCLUDE[nav_phone](includes/nav_phone_md.md)] preventing you from seeing, for example, the plus sign in front of the **New** action.  
  
## Resolution

The reason is that the **Font download** option is disabled in your browser. To fix it, add the [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] website to your trusted sites in Windows.

1. Open **Control Panel** on your device.

2. Go to **Network and Internet** > **Internet Options**. A dialog box opens.

3. Choose the **Security** tab, and then choose **Trusted sites**.

4. Choose the **Sites** button, and then add the [!INCLUDE[prod_short](includes/prod_short.md)] website.

5. Choose the **Close** button, and then choose the **OK** button.

## Related information

[Troubleshooting the Business Central Mobile App](devenv-Troubleshooting-the-Mobile-App.md)  