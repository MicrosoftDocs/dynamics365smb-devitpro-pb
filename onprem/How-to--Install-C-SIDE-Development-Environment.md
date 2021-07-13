---
title: "How to: Install C/SIDE Development Environment"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2e4a3efe-3257-4b57-8e00-c023783749eb
caps.latest.revision: 23
manager: edupont
---
# How to: Install C/SIDE Development Environment
Developers and administrators use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to develop and manage [!INCLUDE[navnow](includes/navnow_md.md)] applications. Developers use [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to create objects, such as pages, reports, and tables, for displaying and handling data in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)]. Administrators can use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] for the administrative tasks, such as managing licenses, and adding and managing databases.  

 The [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] can be included as part of the different installation options.  

|Installation option|Development environment status|  
|-------------------------|------------------------------------|  
|[Demo Option](Demo-Option.md)|Installed automatically|  
|[Client Option](Client-Option.md) installation|Not pre-selected for installation but can be added|  
|[Developer Option](Developer-Option.md) installation|Pre-selected for installation but can be removed|  

 In this procedure, you install the development environment  

### To install the development environment  

1.  Insert the [!INCLUDE[navnow](includes/navnow_md.md)] installation media in the drive of your computer, or navigate to the directory that contains the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup program.  

2.  Double-click the Setup.exe file to start the [!INCLUDE[navnow](includes/navnow_md.md)] Setup wizard.  

     If you have already installed one or more [!INCLUDE[navnow](includes/navnow_md.md)] components on the computer, you will see the **Maintenance** page instead of the **Welcome** page. In this case, choose **Add or remove components**, and then go to step 7.  

3.  Choose **Next**.  

4.  To accept the license terms, choose **I accept**.  

5.  On the **Microsoft Dynamics NAV Setup** page, choose **Choose an installation option**.  

6.  On the **Choose an Installation Option** page, choose **Custom**.  

7.  On the **Customize the Installation** page, choose the plus sign \(+\) to expand the **Client** option.  

8.  Choose **Development Environment \(C/SIDE\)**, and then choose **Run from My Computer**. You must click in the rectangle, and not on the text: ![Click in the box and select Run from My Computer.](media/RunFromMy.JPG "RunFromMy")  

9. Choose **Next** to go to the **Specify Parameters** page.  

10. Specify a name and a port for [!INCLUDE[nav_server](includes/nav_server_md.md)].  

     You must have a valid [!INCLUDE[nav_server](includes/nav_server_md.md)] connection to successfully work with the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

11. Choose **Install**.  

12. When Setup is finished, choose **Close**.  

## See Also  
 [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md)   
 [How to: Upload the License File](How-to--Upload-the-License-File.md)   
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)   
 [Development](Development.md)   
 [Administration in the Development Environment](Administration-in-the-Development-Environment.md)
