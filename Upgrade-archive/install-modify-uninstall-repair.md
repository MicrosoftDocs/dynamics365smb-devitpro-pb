---
title: "Modifying, Uninstalling, or Repairing Microsoft Dynamics NAV"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c36a66ec-4edb-4dea-a95a-7246ef0d9a3c
caps.latest.revision: 25
manager: edupont
---
# Modifying, Uninstalling, or Repairing Microsoft Dynamics NAV
If you run [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup on a computer where any [!INCLUDE[navnowlong](includes/navnowlong_md.md)] components are already installed, you see the following options:  
  
-   **Add or Remove Components**  
  
     Select this option to navigate directly to the **Customize the installation** pane in Setup, where you can specify additional components to install on the local computer, or to remove from the local computer.  
  
     On the **Customize the installation** page, click within the box of a component to open a menu of options for that component. The following options are available.  
  
    |Node option|Behavior|  
    |-----------------|--------------|  
    |Run from My Computer|Adds this component to the current installation.|  
    |Run all from My Computer|Adds this component and all subcomponents to the current installation.|  
    |Not Available|Removes this component and all subcomponents from the current installation.|  
  
     After you finish selecting components, choose **Next** to proceed to the **Specify parameters** pane. See [How to: Preconfigure Components](How-to--Preconfigure-Components.md) for details.  
  
-   **Repair**  
  
     Select this option to repair any [!INCLUDE[navnow](includes/navnow_md.md)] components on the local computer that have become corrupted.  
  
    > [!IMPORTANT]  
    >  If the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] are installed, see [Repairing Microsoft Dynamics NAV Web Server Components](Modifying--Uninstalling--or-Repairing-Microsoft-Dynamics-NAV.md#RepairWebServer) before running **Repair**.  
  
-   **Uninstall**  
  
     Select this option to remove [!INCLUDE[navnowlong](includes/navnowlong_md.md)] components from the local computer.  
  
    > [!NOTE]  
    >  After you choose **Repair** or **Uninstall**, Setup runs to completion with no further interaction. Your next option is to close [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup.  
  
## Removing the Demo Database  
 Setup does not remove the [!INCLUDE[navnow](includes/navnow_md.md)] Demo database. After you use Setup to remove [!INCLUDE[navnow](includes/navnow_md.md)] software from your computer, you must manually remove the demo database.  
  
### With SQL Server  
 Use SQL Server Management Studio to remove the [!INCLUDE[navnow](includes/navnow_md.md)] demo database, which is called **Demo Database \(7-1\)**. By default, the database is installed to the **NAVDEMO** SQL Server instance.  
  
 If you have installed SQL Server with the guidelines in [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md), then SQL Server Management Studio is already installed on your computer. Otherwise, update your SQL Server installation to include the **Management Tools - Complete** option for SQL Server.  
  
### With SQL Server Express  
 If you did not have SQL Server on your computer when you installed the demo database, then [!INCLUDE[navnow](includes/navnow_md.md)] Setup installed SQL Server 2016 Express Edition to host the database. To remove the demo database, follow these steps:  
  
1.  Download and install [Microsoft SQL Server Management Studio](/sql/ssms/download-sql-server-management-studio-ssms).  
  
2.  Use SQL Server Management Studio Express to remove the [!INCLUDE[navnow](includes/navnow_md.md)] demo database, which is called **Demo Database \(7-1\)**. By default, the database is installed to the **NAVDEMO** SQL Server instance.  
  
##  <a name="RepairWebServer"></a> Repairing Microsoft Dynamics NAV Web Server Components  
 You can use [!INCLUDE[navnow](includes/navnow_md.md)] Setup to install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. Setup installs a default web server instance on IIS for the [!INCLUDE[nav_web](includes/nav_web_md.md)]. After the initial installation, you can add and configure additional web server instances by using the cmdlets that are provided in the [!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell. If you run the **Repair** option in [!INCLUDE[navnow](includes/navnow_md.md)] Setup, then Setup re-creates the initial default environment, which includes a default web server instance, and removes any web server instances that have been added.  
  
 To ensure that you can easily re-create the web server instances after you run the **Repair** option, we recommend that you create Windows PowerShell scripts that add and configure the web server instances.  
  
## See Also  
 [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md)   
 [Working with Microsoft Dynamics NAV Setup](Working-with-Microsoft-Dynamics-NAV-Setup.md)   
 [How to: Run Setup](How-to--Run-Setup.md)