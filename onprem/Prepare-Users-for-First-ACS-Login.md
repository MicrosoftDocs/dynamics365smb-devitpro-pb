---
title: "Prepare Users for First ACS Login"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 1ee054ce-dbd4-4954-8ef0-212bee274dc0
caps.latest.revision: 9
---
# Prepare Users for First ACS Login

[!INCLUDE[ACS_md](includes/ACS_md.md)]

After you have completed all of the steps needed to use Access Control service \(ACS\) to authenticate users, you can set up new users to use ACS, or you can modify existing users to use ACS. You must send the **User Name** and **Authentication Key** values to the users and instruct them to submit these values when they log on to a [!INCLUDE[navnow](includes/navnow_md.md)] client, either [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 For more information, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).  
  
 When users first access the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)], they are asked to log on. When they sign in, they must provide the user name and authentication key that you sent them. The user name and authentication key are validated by the one of the identity providers that you specified in the Microsoft Azure management portal. If the user is already signed in, or if the user has previously chosen the **Keep me signed in** field in the browser, the sign-in page does not appear.  
  
 When a user has been authenticated by the ACS identity provider, the user's ACS identity is tied to the [!INCLUDE[navnow](includes/navnow_md.md)] user. The next time the user logs on, [!INCLUDE[navnow](includes/navnow_md.md)] will not request the authentication key because the user account is recognized as a [!INCLUDE[navnow](includes/navnow_md.md)] user.  
  
 When the Administrator opens the **User** page and edits the **User** card for a user who has successfully logged on using ACS authentication, the **ACS Access Status** value will change to `Enabled`.  
  
## See Also  
 [Authenticating Users with Microsoft Azure Access Control Service](Authenticating-Users-with-Microsoft-Azure-Access-Control-Service.md)   
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)   
 [Configure Microsoft Dynamics NAV Components for ACS](Configure-Microsoft-Dynamics-NAV-Components-for-ACS.md)