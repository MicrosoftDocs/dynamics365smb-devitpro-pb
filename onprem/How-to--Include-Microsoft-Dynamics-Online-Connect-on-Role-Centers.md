---
title: "How to: Include Microsoft Dynamics Online Connect on Role Centers"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6be897c2-9f68-4b0d-a40e-f66566c7f267
caps.latest.revision: 15
---
# How to: Include Microsoft Dynamics Online Connect on Role Centers
The RoleTailored client installation includes a control add-in that you can use on Role Centers to connect to and display information from Microsoft Dynamics Online Connect. The information from Connect is based on the Role Center's profile. The Connect control add-in is provided in the Microsoft.Dynamics.NAV.Client.DynamicsOnlineConnect.dll assembly file. By default, the assembly is installed on the computer running the RoleTailored client in the [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\RoleTailored Client\\Add-ins\\Connect folder. Setting up the control add-in for Connect is similar to other control add-ins. For more information, see [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md) and [Including Microsoft Dynamics Online Connect on Role Centers](Including-Microsoft-Dynamics-Online-Connect-on-Role-Centers.md).  

> [!NOTE]  
>  If you make Connect available to users, then they will require Internet access to use the service. If you have not previously offered Internet access to users, then you should consider the security implications before implementing Connect. For more information, see [Microsoft Dynamics Online Connect](Microsoft-Dynamics-Online-Connect.md).  

## Setting up Connect with the Demo Database Installed  
 If you installed the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] demo database, then the Connect control add-in is set up by default on several Role Centers that use the profiles that are supported by Connect. To see a list of the profiles and the associated Role Centers, see [Including Microsoft Dynamics Online Connect on Role Centers](Including-Microsoft-Dynamics-Online-Connect-on-Role-Centers.md).  

 The demo database contains the page **9175 Connect**, which hosts the Connect control add-in. You use this page to set up Connect on your own Role Centers as described in the following procedure.  

#### To set up a Connect on a Role Center with the demo database installed  

1.  Create the Role Center page that has a part that targets the page **9175 Connect**.  

     For more information, see [Walkthrough: Creating a Role Center](Walkthrough--Creating-a-Role-Center.md).  

2.  Assign the Role Center to a profile that is supported by Connect.  

    > [!NOTE]  
    >  You can also use a profile that is not supported by Connect. In this case, when the Role Center opens, the user is prompted to choose a supported profile.  

## Setting up Connect Without the Demo Database Installed  
 Use the procedure in this section to set up Role Centers with Connect if you have not installed the demo database.  

#### To set up Connect on a Role Center without the demo database installed  

1.  Register the Connect control add-in in the Client add-in table of the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] database. You must provide the following information:  

    -   Control add-in name - Microsoft.Dynamics.NAV.MicrosoftDynamicsOnlineConnectControl  

    -   Public token key - 31bf3856ad364e35  

     For more information, see [How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md).  

2.  Use the Connect control add-in on a page.  

     For more information, see [How to: Set Up a Windows Client Control Add-in on a Page](How-to--Set-Up-a-Windows-Client-Control-Add-in-on-a-Page.md).  

3.  Create the Role Center page and include a part that uses the Connect page from step 2.  

     For more information, see [Walkthrough: Creating a Role Center](Walkthrough--Creating-a-Role-Center.md).  

4.  Define the Role Center profile that is supported by Connect and assign it your Role Center.  

     For more information, see [How to: Create a Profile](how-to-create-a-profile.md).  
  
    > [!NOTE]  
    >  You can also use a profile that is not supported by Connect. In this case, when the Role Center opens, the user is prompted to choose a supported profile.  

## See Also  
 [Including Microsoft Dynamics Online Connect on Role Centers](Including-Microsoft-Dynamics-Online-Connect-on-Role-Centers.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)
