---
title: "Editing a Setup Configuration File"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4e583092-9d42-459f-b18f-bb80d4754e21
caps.latest.revision: 13
---
# Editing a Setup Configuration File
You create or load Setup configuration files using [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup. You can directly edit these XML files.  
  
 Setup configuration files contain two types of settings.  
  
|Setting type|Purpose|  
|------------------|-------------|  
|Component|For each component, there are three separate values, all displayed on a single line:<br /><br /> -   **ShowOptionNode**<br />     Specifies whether the component should be displayed in Setup. For silent installs, this parameter is not relevant.<br />-   **State**<br />     There are two possible values: **Local**, indicates that the component is included in the install, and **Absent** indicates that the component is not included.<br />-   **Id**<br />     Identifies the component<br /><br /> You can change value for **State** or **ShowOptionNode**, but not for **Id**. Also, you cannot add or remove a component.|  
|Parameter|These settings contain configuration information for components. As with Components, you can modify a parameter’s **Value**, but not its **Id**.<br /><br /> For information about values for pre-configuring [!INCLUDE[navnow](includes/navnow_md.md)] components using a Setup configuration file, see [Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md).|  
  
> [!TIP]  
>  [!INCLUDE[navnow](includes/navnow_md.md)] Setup is primarily a tool for installing software, but you can also use it as an editor for creating and modifying Setup configuration files. When you want to edit a Setup configuration file, you have the following options:  
>   
>  -   You can edit the file using an XML editor.  
> -   You can load it into Setup, make the desired modifications, and then save it. You do not need to install any software during this process.  
  
## See Also  
 [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md)   
 [How to: Preconfigure Components](How-to--Preconfigure-Components.md)   
 [How to: Create or Load a Setup Configuration File](How-to--Create-or-Load-a-Setup-Configuration-File.md)
