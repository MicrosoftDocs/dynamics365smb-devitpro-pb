---
title: "License Types"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3da24be8-f749-4b79-a41a-0fb83a599701
caps.latest.revision: 16
---
# License Types
When you create a user in [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you must specify a license type. This topic provides an overview of the license types.  
  
> [!NOTE]  
>  Licenses are specific to the [!INCLUDE[navnow](includes/navnow_md.md)] version and are not forward or backward compatible. This means that a license from an earlier [!INCLUDE[navnow](includes/navnow_md.md)] version will not work with [!INCLUDE[navnowlong](includes/navnowlong_md.md)], and vice versa.  
  
 For additional information about the types of user licenses and the license restrictions regarding user licenses, see the [!INCLUDE[navcrete](includes/navcrete_md.md)] Licensing Guide located at [https://go.microsoft.com/fwlink/?LinkId=518623](https://go.microsoft.com/fwlink/?LinkId=518623) \(requires PartnerSource login\).  
  
-   **Full User**  
  
     Full User licenses provide users full read and full write capabilities to all of the licensed solution functionality through any and all modes of access, including the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the [!INCLUDE[nav_web](includes/nav_web_md.md)], or any other mode of access including web services. Full User licenses are for users requiring unlimited read and write access. As long as the number of users needing simultaneous access to the solution does not exceed the number of Full User licenses you have acquired, these users are properly licensed for full read and write access to the complete solution functionality.  
  
-   **Limited User**  
  
     Limited User licenses provide users full read, but limited write, capabilities to all of the licensed solution functionality through any and all modes of access including the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The Limited User license is designed to give customers a lower-cost alternative for extending ERP to users who only require limited access to the [!INCLUDE[navnow](includes/navnow_md.md)] application:  
  
    -   Read access to data contained in the solution through any client accessing the application, including but not limited to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the [!INCLUDE[nav_web](includes/nav_web_md.md)], and web services.  
  
    -   Write access to a maximum of three application tables in the object range 0 – 99,999,999 other than the General Ledger Entry table, through any client accessing the application. Access to the General Ledger Entry Table requires a Full User license.  
  
     For more information, see the [!INCLUDE[navcrete](includes/navcrete_md.md)] Licensing Guide.  
  
-   **Device Only User**  
  
     Device-only licenses enable a user to connect, provided there is an enabled device available to use. Devices can be full or limited. Device users have either full or limited access, as determined by the device.  
  
-   **Windows Group**  
  
     Use this license type to create a [!INCLUDE[navnow](includes/navnow_md.md)] user account that is based on a Windows group and has explicit permissions in [!INCLUDE[navnow](includes/navnow_md.md)]. Individual members of the Windows group will then inherit the permissions for this user.  
  
    > [!IMPORTANT]  
    >  For each member of the Windows group, you create a [!INCLUDE[navnow](includes/navnow_md.md)] user account, which does not explicitly have any permissions. Users then log on by using their [!INCLUDE[navnow](includes/navnow_md.md)] user account credentials.  
  
     Windows Group licensing is a form of license multiplexing. Multiplexing does not reduce the number of user licenses required to access a [!INCLUDE[navnow](includes/navnow_md.md)] solution.  
  
-   **External User**  
  
     As described in the Microsoft Software License Terms that apply to [!INCLUDE[navnowlong](includes/navnowlong_md.md)], external users are the customers of customers. This license type is specific to individual users of [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. External user licenses must not be shared with other individual users. You do not need concurrent user CALs for external users. External users must not use any clients provided by the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Application Programming Interface \(API\), such as the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](includes/nav_web_md.md)]. External user licenses must not be used for business process outsourcing purposes.  
  
## See Also  
 [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md)   
 [Properties of the Demo License](Properties-of-the-Demo-License.md)   
 [How to: Upload the License File](How-to--Upload-the-License-File.md)   
 [Microsoft Dynamics NAV 2015 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=518623)