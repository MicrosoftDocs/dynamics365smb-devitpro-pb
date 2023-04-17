---
title: "Including Microsoft Dynamics Online Connect on Role Centers"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c681174e-8cf3-49f1-8ac5-cc4b37322bf4
caps.latest.revision: 20
---
# Including Microsoft Dynamics Online Connect on Role Centers
[!INCLUDE[navnowlong](includes/navnowlong_md.md)] includes a control add-in that you can use on Role Centers to display role-based content from Microsoft Dynamics Online Connect. Connect is a Web service that distributes Microsoft Dynamics product and business information from sources such as [CustomerSource](https://go.microsoft.com/fwlink/?LinkID=153696) and the Microsoft Dynamics community. The information that Connect provides on a Role Center is based on the Role Center's profile or a profile that the Role Center user chooses. If the content is available in different languages, then content is displayed in the language that matches language that is defined for the Role Center user.  
  
 To set up a Role Center with Connect, you create a card part page that contains the Connect control add-in and then use the card part page on the Role Center. For more information, [How to: Include Microsoft Dynamics Online Connect on Role Centers](How-to--Include-Microsoft-Dynamics-Online-Connect-on-Role-Centers.md).  
  
 If you have installed the [!INCLUDE[navnow](includes/navnow_md.md)] demo database, then Connect is already added by default on several Role Centers.  
  
## Supported Profiles and Default Role Centers  
 The following table lists the Role Center profiles that are supported by Connect and the Role Centers that use the profiles by default when you install the [!INCLUDE[navnow](includes/navnow_md.md)] demo database.  
  
> [!NOTE]  
>  Whether the Connect part is visible on a Role Center is specified by the [Visible Property](Visible-Property.md) of the Role Center page.  
  
|Role Center ID|Profile ID|Visible by default|  
|--------------------|----------------|------------------------|  
|9000|Shipping and Receiving - WMS|no|  
|9001|Accounting Manager|yes|  
|9002|Accounts Payable Coordinator|no|  
|9003|Accounts Receivable Administrator|no|  
|9004|Bookkeeper|no|  
|9005|Sales Manager|yes|  
|9006|Order Processor|no|  
|9007|Purchasing Agent|no|  
|9008|Shipping and Receiving|no|  
|9010|Production Planner|yes|  
|9011|Shop Supervisor - Foundation|no|  
|9012|Shop Supervisor|no|  
|9014|Resource Manager|yes|  
|9015|Project Planner|yes|  
|9016|Dispatcher|no|  
|9018|IT Manager|yes|  
|9019|President|yes|  
|9020|President - Small Business|yes|  
  
## User Personalization of Connect  
 If a Role Center is set up with Connect, then a user has the following options to personalize the Role Center:  
  
-   Show or hide the page part that contains Connect.  
  
     The user can do this by choosing the **Customize** button in the Role Center. For more information, see the [!INCLUDE[navnow](includes/navnow_md.md)] Help from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
-   Change the profile that is used by Connect.  
  
     The user changes the profile from within the Connect content. The profile that the use selects overrides the profile that is assigned to the Role Center.  
  
-   Sign in to [Windows Live™](https://go.microsoft.com/fwlink/?LinkID=159772).  
  
     When a user signs in to Windows Live, additional content is available that is based on the user's CustomerSource account.  
  
## Information Sent from the Role Center to Connect  
 When a Role Center opens, the Connect control add-in sends the following information about the [!INCLUDE[navnow](includes/navnow_md.md)] software over the Internet to Microsoft:  
  
-   Product name  
  
-   Product version  
  
-   Some license information, but not the license number  
  
-   Country/region version  
  
-   Language  
  
-   Profile, which is based on the Role Center ID  
  
## Internet Access and Security  
 If you make Connect available to users, then they will require Internet access to use the service. If you have not previously offered Internet access to users, then you should consider the security implications before implementing Connect. For more information, see [Microsoft Dynamics Online Connect](Microsoft-Dynamics-Online-Connect.md).  
  
## See Also  
 [How to: Include Microsoft Dynamics Online Connect on Role Centers](How-to--Include-Microsoft-Dynamics-Online-Connect-on-Role-Centers.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)
