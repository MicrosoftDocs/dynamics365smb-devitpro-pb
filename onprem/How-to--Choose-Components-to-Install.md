---
title: How to Choose Components to Install
description: Run Dynamics NAV Setup and install a predefined component package known as installation options. These packages are modifiable and can installed from custom components. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c6cc9c70-5a11-4097-8e7b-ae671b349afb
caps.latest.revision: 24
manager: edupont
---
# Choosing Installation Components in Dynamics NAV
When you run [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup, you can install a predefined component package. These packages are called [Installation Options](Installation-Options.md). If you have to modify the set of components that are included in an existing installation option, then you can choose **Customize** under any installation option. If you want to install components that are not all available in a predefined installation option, then you can choose **Custom Components**.  
  
> [!IMPORTANT]  
>  You can customize the component list for the Client, Server, or Developer installation options. However, only with the Developer Option can you choose from the complete set of [!INCLUDE[navnow](includes/navnow_md.md)] components. The range of available components for the other two installation options is limited to components that are relevant for that option.  
  
## Choosing Components to Install  
 In this procedure, you use the **Component Selection** page to select what to install.  
  
#### To identify the components that you want to install  
  
1.  In Setup, on the **Choose an installation option** page, decide which Installation Option you want to customize, and then choose **Customize** below the name of the installation option.  
  
     This opens the **Customize the installation** page with one or more components already selected.  
  
     You can also choose **Custom Components** on the **Choose an installation option** pane. This opens the **Customize the installation** pane without preselected components.  
  
    > [!NOTE]  
    >  To install [!INCLUDE[navnow](includes/navnow_md.md)] to a location other than the default location, on the **Customize the installation** page, choose **Destination folder**.  
  
2.  Select the components that you want to install on the **Customize the installation** page.  
  
     Options are presented in a tree view. The tree has three levels of hierarchy:  
  
    -   The top level shows only a single node, which is **Microsoft Dynamics NAV**.  
  
    -   The second level shows additional nodes that each identify a component such as **Client** and **Server**. Some second-level nodes have a plus sign on the left. You can choose the plus sign to display the third level of the hierarchy.  
  
    -   The third level shows subcomponents for the selected second-level component.  
  
     Each node has one of three statuses as indicated by its appearance.  
  
    |Component node|Description|  
    |--------------------|-----------------|  
    |![White Node.](media/install_WhiteNode.png "install\_WhiteNode")|The component and all its subcomponents are selected for installation.|  
    |![Gray node.](media/install_GrayNode.png "install\_GrayNode")|The component is selected for installation. Some or none but not all of the subcomponents are also selected. Only items on the top or second level can be gray because only these nodes can have subcomponents.|  
    |![Red node.](media/install_RedNode.png "install\_RedNode")|Neither the component nor any of its subcomponents is selected for installation.|  
  
3.  Choose a component to open a menu of options for that component. You must click in the box. The following options are available.  
  
    |Node option|Description|  
    |-----------------|-----------------|  
    |**Run from My Computer**|Select this component for installation.|  
    |**Run all from My Computer**|Select this component and all subcomponents for installation.|  
    |**Not Available**|Cancel installation of this component and all subcomponents.|  
  
     For second-level nodes without subcomponents and third-level nodes, the only options are **Run from My Computer** and **Not Available**.  
  
4.  After you have selected the set of components and subcomponents that you want to install, choose **Next** to continue to the **Specify parameters** page. For more information, see [How to: Preconfigure Components](How-to--Preconfigure-Components.md).  
  
## See Also  
 [How to: Run Setup](How-to--Run-Setup.md)   
 [Custom Option](Custom-Option.md)   
 [Installation and Configuration Walkthroughs](Installation-and-Configuration-Walkthroughs.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md)