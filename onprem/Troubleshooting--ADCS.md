---
title: "Troubleshooting: ADCS"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: dc6088e7-ffa6-4564-8a8e-095166598e7f
caps.latest.revision: 7
---
# Troubleshooting: ADCS
This topic lists some common problems that can occur when you use Automated Data Capture Systems for [!INCLUDE[navnow](includes/navnow_md.md)].  
  
## HyperTerminal or other Telnet application does not work  
 You have installed all ADCS components correctly, but when you start HyperTerminal or another Telnet application, nothing happens. You also get a warning in the Event Viewer stating that the TCP/IP address has not been identified. This problem may occur when you have not logged onto the correct domain server.  
  
 To resolve this error, make sure that you have logged onto the domain server. Also, review the information provided in the Windows Event Viewer.  
  
## Resolving a web service exception about callback functions  
 When using [!INCLUDE[navnow](includes/navnow_md.md)] web services, the web service call may return a fault with the following message:  
  
 **Callback functions are not allowed.**  
  
 The error generally occurs because the web service has accessed other application code that requires interaction with a client. For example, you may be using ADCS with warehouse functionality, such as bin capacity policy. The warehouse logic may include confirmation dialog boxes that users interact with as they register warehouse picks and put-aways. If a user encounters the error, the pick or put-away is not registered.  
  
 To resolve this error, make sure that the web service call does not call code that requires interaction with a client, or modify your [!INCLUDE[navnow](includes/navnow_md.md)] solution to allow data to be inserted or modified without such interactions.  
  
 For more information, see [Handling UI Interaction When Working with Web Services](Handling-UI-Interaction-When-Working-with-Web-Services.md).  
  
## National character sets  
 Your national characters do not display correctly. In order for the national characters to display correctly, the terminal software should support the code page that you are interested in using. For example, code page 1251 refers to ANSI Cyrillic, which is supported by Hyper Terminal on a Russian environment \(including the special Cyrillic font\).  
  
 To resolve this error, check that you have specified the correct code page in your configuration file. You may want to update the **codePage** attribute.  
  
 For more information, see [How to: Configure ADCS Options](How-to--Configure-ADCS-Options.md). For a list of code pages, see [Code Page Identifiers](https://go.microsoft.com/fwlink/?LinkId=262203).  
  
## Performance considerations  
 Depending on the load on your system, you may encounter performance issues.  
  
 To resolve this problem, you can configure multiple endpoints, instead of just one, for your plug-in. It is possible for one plug-in to connect to several servers on one or more distributed computers. The plug-in and servers, a pool of endpoints, can be on the same computer or divided among any number of computers, as long as they are all available via TCP. This can improve performance in busy scenarios, as calculations can be performed on different processes at the same time.  
  
 For more information, see [How to: Configure ADCS Options](How-to--Configure-ADCS-Options.md).  
  
## See Also  
 [Handling UI Interaction When Working with Web Services](Handling-UI-Interaction-When-Working-with-Web-Services.md)
