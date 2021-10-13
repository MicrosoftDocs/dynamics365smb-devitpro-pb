---
title: "Designing MenuSuites"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d447aa5e-e9a3-40d2-9880-e0353debde31
caps.latest.revision: 24
manager: edupont
---
# Designing MenuSuites
In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can create MenuSuites that contain menu content that is displayed in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The MenuSuite that is provided in [!INCLUDE[navnow](includes/navnow_md.md)] is a generic MenuSuite that you can modify. You can also create a new MenuSuite from the basic MenuSuite. Each menu in the basic MenuSuite represents a department such as Financial Management, Human Resources, and Manufacturing. Each department contains menu items that are specific for that department area. A department menu contains menu items that can link to the following objects:  

-   Codeunits  

-   Pages  

-   Queries  

-   Reports  

-   Tables  

-   XMLports  

 The links to these objects are displayed on the department page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. When the link is selected in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the object that it links to is run. MenuSuites are designed in Navigation Pane Designer but they are run in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

> [!NOTE]  
>  MenuSuites cannot be run directly from Object Designer in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  

 A menu links to a department and a menu item links to a specific object in the department. You can create a group that contains related menu items. When you design menu items and groups in Navigation Pane Designer, you can organize them to display on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] by department or by category. Menu items are displayed as links that users can use to open objects such as reports and pages.  

## Design Permissions Levels  
 For each MenuSuite that you create, you choose a design level. Design levels are permissions that allow different roles to create MenuSuites for specific functions. The design level that you are allowed to work in depends on your active license. In other words, you can only access or create MenuSuites as allowed by your active license and permissions. For example, if your active license allows you to localize and you design an application that will be localized, your design level will be at the Country or Region level. These levels enable localization for specific countries or regions. If you are a developer working at a Microsoft Certified Partner organization, you might design a MenuSuite at the Partner level. The following table describes the design levels.  

|MenuSuite Design Level|Description|  
|----------------------------|-----------------|  
|Dept - MBS|The base design level that is provided in [!INCLUDE[navnow](includes/navnow_md.md)]. Any MenuSuite you create inherits from this base design level or a design level that inherited from this base design level.|  
|Dept - Region|The design level that is used for region specific MenuSuites. This level is typically used for localization. Only one region specific design level MenuSuite can be created in a given application.|  
|Dept - Country|The design level that is used for country specific MenuSuite. This level is typically used for localization and other items such as taxes that are country specific. Only one country specific design level MenuSuite can be created in a given application.|  
|Dept - Add-on|The design level that a developer or [!INCLUDE[navnow](includes/navnow_md.md)] partner can use for customization. Up to ten Add-on design level MenuSuites can be created in a given application.|  
|Dept - Partner|The design level that [!INCLUDE[navnow](includes/navnow_md.md)] partners use to customize MenuSuites. Only one partner design level MenuSuite can be created in a given application.|  
|Dept - Company|The design level that is used to design for a specific company. Only one company specific design level MenuSuite can be created in a given application.|  

 The following illustration shows the design permission levels that are available in [!INCLUDE[navnow](includes/navnow_md.md)].  

 ![Microsoft Dynamics NAV MenuSuite Design Level.](media/MicrosoftDynamicsNAVMenuSuiteDesignLevel.png "MicrosoftDynamicsNAVMenuSuiteDesignLevel")  

 When you create a MenuSuite, it inherits from the design level that is above the level you selected. The most basic design level is the Dept - MBS level and the highest design level is the Dept - Company level. Only one MenuSuite can be created for each level in an application except the Add-on level, which can have a maximum of ten instances of MenuSuites.  

 At design time, the header area of Navigation Pane Designer displays the design level of the MenuSuite you are working with.  

## Creating a New MenuSuite  
 You create new MenuSuites in Object Designer and modify them in Navigation Pane Designer. When you create a new MenusSuite, [!INCLUDE[navnow](includes/navnow_md.md)] gives the MenuSuite a unique name and ID in Object Designer. The ID identifies the design level that the MenuSuite was designed at. The following table lists the IDs and the MenuSuites that is associated with the ID.  

|MenuSuite ID|MenuSuite name|  
|------------------|--------------------|  
|1010|Dept - MBS|  
|1020|Dept - Region|  
|1030|Dept - Country|  
|1051...1070|Dept.- Add-on 1….Dept. - Add-on 20|  
|1080|Dept - Partner|  
|1090|Dept - Company|  

 Every new MenuSuite that you create is designed at one of the design levels and run on the Department page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. As such, the full names of the menus are prefixed with “Dept.”, followed by the design level, and then followed by the name of the menu. For example, if you create a new MenuSuite at the Partner level and you create a menu for a department that is named **My New Department**, the full name of the menu will be **Dept-Partner: My New Department**. This name is displayed in the header of the Navigation Pane Designer. The following screenshot shows the Navigation Pane Designer header section and group of menu items.  

 ![Navigation Pane Designer Header.](media/MicrosoftDynamicsNAVMenuSuiteNavDesignerHeader.jpg "MicrosoftDynamicsNAVMenuSuiteNavDesignerHeader")  

 After creating a new MenuSuite, you can do the following:  

-   Create new menus  

-   Delete menus  

-   Rename menus  

-   Change the location of menus  

-   Hide or show menus  

-   Disable menus  

-   Modify menu items  

 For information about how to create a MenuSuite, see [Walkthrough: Creating MenuSuites for the Microsoft Dynamics NAV Windows Client](Walkthrough--Creating-MenuSuites-for-the-Microsoft-Dynamics-NAV-Windows-Client.md). For information about how to modify a MenuSuite, see [How to: Modify Menu Items in a MenuSuite](How-to--Modify-Menu-Items-in-a-MenuSuite.md).  

## Inheriting MenuSuite Content  
 When you create a new MenuSuite, it inherits all its content from the 1010 Dept – MBS, the base MenuSuite that is provided in [!INCLUDE[navnow](includes/navnow_md.md)]. For example, when you create a MenuSuite and you select the Region design permission level, the MenuSuite that you created at the Region level inherits from 1010 Dept - MBS. The 1020 Dept – Region MenuSuite then becomes the highest design level MenuSuite in Object Designer. If you create another MenuSuite, it inherits from the 1020 Dept – Region MenuSuite and so on.  

 A MenuSuite cannot inherit from a MenuSuite that is created at a lower design level. For example, if you create a MenuSuite at the Dept - Partner level and then you create a second MenuSuite at the Dept – Country level, although the Partner level MenuSuite was created first, the Dept - Country level MenuSuite cannot inherit from the Partner level MenuSuite because the Dept – Partner is at a higher level than the Dept - Country level MenuSuite. Instead, the Dept - Country level object will inherit from the Dept - Region level. If a MenuSuite has not been created at the Region level, it will inherit from the Dept - MBS level MenuSuite.  

 Changes that you make in the new MenuSuite are merged into the inherited MenuSuite and saved as the difference between the new and the original MenuSuites. For example, if you make a change in the Dept – MBS MenuSuite, the change is also made in the Dept – Region MenuSuite. If you import the inherited MenuSuite to a text file, the file will contain only the difference between the two MenuSuites.  

 Menus in a MenuSuite that are inherited are identified by the symbol **>>** on the menu button. This symbol precedes the name of the menu. The following screenshot shows the departments menus in the Navigation Pane Designer.  

 ![Navigation Pane Designer Departments.](media/MicrosoftDynamicsNAVMenuSuiteDepartments.jpg "MicrosoftDynamicsNAVMenuSuiteDepartments")  

 These menus, except the **My New Department** menu, were inherited; therefore, **My New Department** does not have the symbol **>>** on the menu button.  

## Modifying a MenuSuite  
 To modify a MenuSuite in the Navigation Pane Designer, select the MenuSuite in Object Designer, apply the changes you want, compile, and save the MenuSuite. You can change the properties of menu items and departments in the **Properties** windows. For information about how to modify MenuSuites, see [How to: Modify a Department Menu in a MenuSuite](How-to--Modify-a-Department-Menu-in-a-MenuSuite.md).  

 In addition to all the actions you can perform after you modify a MenuSuite, you can modify menu items and group folders as follows:  

-   Add departments, items, and groups folders  

-   Delete departments, items, and group folders  

-   Rename departments’ items, and groups folders  

-   Change bitmaps that are associated with departments  

-   Hide departments  

 The menu items can be added directly on the department page or can be added to a submenu on the department page. You can change the bitmap images that are associated with the departments in the **Menu Properties** window. Valid bitmap numbers are from 0 to 15, inclusive. The menu items that you create in the Navigation Pane Designer are run in [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For more information about how to create MenuSuites, see [Walkthrough: Creating MenuSuites for the Microsoft Dynamics NAV Windows Client](Walkthrough--Creating-MenuSuites-for-the-Microsoft-Dynamics-NAV-Windows-Client.md).  

## Designing for Multiple Languages  
 By default, [!INCLUDE[navnow](includes/navnow_md.md)] display menus in the language that is set on your computer. The language code is shown in the CaptionML field in the **Menu Properties** window. If you create a menu that will be used in multiple languages, you must give the menu a name in each language in the [Multilanguage Editor](uiref/-$-S_2141-Multilanguage-Editor-$-.md) window. To open the Multilanguage Editor window, choose the **EditAssist** button in the [CaptionML Property](CaptionML-Property.md) field. For more information, see [How to: Enter Text in the Multilanguage Editor](How-to--Enter-Text-in-the-Multilanguage-Editor.md).  

## See Also  
 [MenuSuites](MenuSuites.md)   
 [Walkthrough: Creating MenuSuites for the Microsoft Dynamics NAV Windows Client](Walkthrough--Creating-MenuSuites-for-the-Microsoft-Dynamics-NAV-Windows-Client.md)   
 [How to: Create a Menu for a Department in a MenuSuite](How-to--Create-a-Menu-for-a-Department-in-a-MenuSuite.md)   
 [How to: Modify Menu Items in a MenuSuite](How-to--Modify-Menu-Items-in-a-MenuSuite.md)
