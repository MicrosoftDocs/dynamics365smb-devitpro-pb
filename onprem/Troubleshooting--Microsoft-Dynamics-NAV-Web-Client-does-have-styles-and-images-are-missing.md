---
title: "Troubleshooting: Microsoft Dynamics NAV Web Client does have styles and images are missing"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: aeda9f0d-9530-4444-b781-a5f3a7a696ac
caps.latest.revision: 4
---
# Troubleshooting: Microsoft Dynamics NAV Web Client does have styles and images are missing
The [!INCLUDE[nav_web](includes/nav_web_md.md)] does not render properly. Text displays with no style or formatting, and images are missing.  
  
## Resolution  
 This error can occur if Internet Information Services \(IIS\) is not configured for static content. To resolve this issue, configure the static content feature in IIS. For information about configuring IIS, see [How to: Install and Configure Internet Information Services for Microsoft Dynamics NAV Web Client](How-to--Install-and-Configure-Internet-Information-Services-for-Microsoft-Dynamics-NAV-Web-Client.md).
