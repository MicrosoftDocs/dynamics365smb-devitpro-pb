---
title: "COM Overview"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cb9728db-e129-4df6-a175-4339f25b09a9
caps.latest.revision: 23
---
# COM Overview
This topic describes how you can use Component Object Model \(COM\) technologies in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to extend the functionality of [!INCLUDE[navnow](includes/navnow_md.md)]. In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], you can use two types of COM technologies: *Automation* and *custom controls*.  
  
 Only non-visual controls are supported. A control cannot be used to add graphical or user-interface elements to a [!INCLUDE[navnow](includes/navnow_md.md)] object. For example, you cannot add a third-party control to a page. However, the control can display information and interact with the user in a window of its own.  
  
> [!IMPORTANT]  
>  COM technologies are not supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
## Automation  
 Automation is a client-server infrastructure that enables one application to access and communicate with another application. By using Automation, an application, such as Microsoft Office Word, exposes its internal functions and routines as Automation objects that [!INCLUDE[navnow](includes/navnow_md.md)] can access through an Automation controller that is run on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The application that exposes the Automation object, such as Word, acts as the Automation server, and the Automation controller acts as the client.  
  
 Automation enables tasks that are typically run manually to be run automatically instead. For example, you can write a script to extract data from a database, put the data into a Microsoft Office Excel workbook, and then display the data graphically.  
  
 For examples of Automation in [!INCLUDE[navnowlong](includes/navnowlong_md.md)], see [Walkthrough: Using Automation to Write a Letter in Microsoft Office Word](Walkthrough--Using-Automation-to-Write-a-Letter-in-Microsoft-Office-Word.md) and [Walkthrough: Using Automation to Create a Graph in Microsoft Excel](Walkthrough--Using-Automation-to-Create-a-Graph-in-Microsoft-Excel.md).  
  
## Custom Controls  
 Custom controls are OLE Control Extensions \(OCX\) or ActiveX controls, which are specific types of Automation objects. OCX and ActiveX controls are generally small programs or application objects that you can start from your [!INCLUDE[navnow](includes/navnow_md.md)] application to perform a specific function or task. You can use custom controls for various types of tasks. By default, there are several custom controls available in [!INCLUDE[navnow](includes/navnow_md.md)] from the **Tools** menu in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. To develop custom controls, you can use tools such as Microsoft Visual C++ or Microsoft Visual Basic. Both products use wizards to make it easy to develop COM objects. You can also develop functional controls without understanding the complex details of COM.  
  
 If you will use existing custom controls from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], then you do not have to know anything about COM. Using the functionality provided by a COM object is no different from using any C/AL function.  
  
## See Also  
 [Extending Microsoft Dynamics NAV Using COM](Extending-Microsoft-Dynamics-NAV-Using-COM.md)   
 [Using COM Technologies in Microsoft Dynamics NAV](Using-COM-Technologies-in-Microsoft-Dynamics-NAV.md)   
 [Best Practices for Using Automation with the Microsoft Dynamics NAV Windows Client](Best-Practices-for-Using-Automation-with-the-Microsoft-Dynamics-NAV-Windows-Client.md)
