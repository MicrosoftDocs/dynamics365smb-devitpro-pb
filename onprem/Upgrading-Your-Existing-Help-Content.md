---
title: Upgrade Help Content
description: Reuse the earlier version of Help created using the Dynamics NAV Help Toolkit which is supported by using the HTML files.
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 8dc757ad-ad73-43e6-b314-0d22e75f7602
caps.latest.revision: 7
---
# Upgrading Your Existing Help Content
It is possible to reuse Help that you created using the [!INCLUDE[nav7long](includes/nav7long_md.md)] Help Toolkit for an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)]. The difference is that you must now use the HTML files instead of the CHM files, and that you have to update the links in the HTML files to reflect this change.  
  
 On the Help Server, all Help is in HTML files, and all HTML files for a specific language are located in the same folder on the web server. As a result, there is a significant difference in the formatting of the hyperlinks between the topics. In earlier versions, the hyperlinks must include information about the CHM file that the target topic was in. On the Help Server, all Help topics are in the same folder, so the navigation element is no longer needed.  
  
## Updates to Existing Help Content  
 In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], if your Help was contained in addin\_a.chm, and you wanted to link to the topic **How to: Enter Company Information** in gl\_m.chm, the hyperlink was formatted as shown in the following example:  
  
```  
<a href=”ms-its:gl_m.chm::/html/tskEnterCompanyInformation.htm>How to: Enter Company Information</a>  
```  
  
 In the example, the following content describes the location of the target topic: `ms-its:gl_m.chm::/html/`. However, since all topics are now in the same location, this content is no longer needed. The following example illustrates the same link in a topic on the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Help Server:  
  
```  
<a HREF="tskEnterCompanyInformation.htm>How to: Enter Company Information</a>  
```  
  
 To convert all of the hyperlinks in your existing Help, you can use a search-and-replace tool to find and replace the navigation content, create a script with a regular expression that handles the conversion, or rebuild your Help project with the [!INCLUDE[nav7long](includes/nav7long_md.md)] Help Toolkit.  
  
 If you choose to rebuild your Help project with the [!INCLUDE[nav7long](includes/nav7long_md.md)] Help Toolkit, you must modify the configuration file for the [!INCLUDE[nav7long](includes/nav7long_md.md)] Help Builder tool to remove the navigation content from the links that are injected by the tool. These links are specified in the `<hyperlinks>` element in the config.default.xml file. You can modify those boilerplate links to exclude the navigation content, and you can also update the build number to the following value:  
  
```  
<buildNumber>8.0.Customized</buildNumber>  
```  
  
 You can verify that your Help topics work with the classic.css stylesheet by adding the topics to a local Help Server on your own computer. Then, you can add the relevant topics to the navigation pane by modifying the ToC.xml file. For more information, see [Help Table of Contents](Help-Table-of-Contents.md).  
  
## See Also  
 [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md)