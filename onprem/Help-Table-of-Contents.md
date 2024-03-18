---
title: "Help Table of Contents"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 6496fba5-dd24-417b-a821-60b41905e277
caps.latest.revision: 7
---
# Help Table of Contents
The [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Help Server includes a navigation pane with links to key topics on the Help Server. The table of contents in the navigation pane is determined by a ToC.xml file. When you add new Help for customized functionality to [!INCLUDE[navnow](includes/navnow_md.md)], you should make this Help discoverable by adding entries in the ToC.xml file. Likewise, if your users do not have access to certain areas of the application, you can remove these entries from the navigation pane.  

 The ToC.xml file can be found in the folders that contain the Help content in each language, such as **C:\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]Help\\help\\en**.  

> [!IMPORTANT]  
>  Make sure to work on a local copy of the ToC.xml file and upload when you are done editing.  

## Linking to Help Topics  
 The ToC.xml file contains a `<node>` element for each link from the navigation pane to a Help topic. The following table describes the attributes of a `<node>` element.  

|Attribute|Description|Example|  
|---------------|-----------------|-------------|  
|*Name*|Specifies a unique name for the entry in the ToC.xml file. This name is not visible on the website, but the Help Server uses the name to generate the navigation pane.|*GettingStarted*|  
|*DisplayName*|Specifies the text that displays in the navigation pane.<br /><br /> It is a best practice that the display name is the same as or very similar to the title of the target topic.|*Getting Started with Microsoft Dynamics NAV*|  
|*Page*|Specifies the target topic that opens when the user chooses the link.|*conGettingStarted.htm*|  

 You can create subentries for an entry in the navigation pane by embedding `<node>` elements within another `<node>` element. However, you should keep the navigation pane limited to key topics only since most users access Help through context-sensitive Help calls and through Search.  

## See Also  
 [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md)   
 [Upgrading Your Existing Help Content](Upgrading-Your-Existing-Help-Content.md)
