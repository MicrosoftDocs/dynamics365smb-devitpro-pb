---
title: "How to: Open Microsoft Dynamics NAV Clients that Connect to Microsoft Dynamics NAV on Microsoft Azure"
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 284c9944-769d-4a56-8e0a-d86068f30d1e
ms.author: jswymer
---
# How to: Open Microsoft Dynamics NAV Clients that Connect to Microsoft Dynamics NAV on Microsoft Azure
This topic describes how to open the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)] for a [!INCLUDE[navnow](includes/navnow_md.md)] deployment on Microsoft Azure. When you complete the [!INCLUDE[navnow](includes/navnow_md.md)] deployment by using one of the example scripts that are available with the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)], you receive a message in Windows PowerShell ISE that resembles the following:  

```  
The NAV Server machine is: MyNavVm.cloudapp.net  
The NAV Server machine administrator password: 123NavVm!a  
The NAV Server Instance is: DynamicsNAV90_Ins1  
The NAV Server account credentials: NSTService/P@ssword312  
The Windows Client can be downloaded via ClickOnce at: https://MyNavVm.cloudapp.net:9004  
The Web Client can be accessed at: https://MyNavVm.cloudapp.net/DynamicsNAV90_Ins1  
A user has been added to the database with the following credentials:  
  user=navuser  
  password=N@Vpw312  
```  

 The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is available from a ClickOnce web site, which lets you install the client from a web page. The [!INCLUDE[nav_web](includes/nav_web_md.md)] is available from any supported browser.  

### To open the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  

1.  Open an Internet browser.  

2.  In the address, type the following address:  

     **https://virtualmachine.cloudapp.net: port**  

     Substitute *virtualmachine* with the name of the virtual machine that in running the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

     Substitute *port* with the TCP port on which ClickOnce website is running. In the Set-PartnerSettings.ps1 file, this is defined by the $NAV\_ClickOnceWebSitePort parameter. The default port is 9004  

3.  Follow the instructions on the webpage to install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

### To open the [!INCLUDE[nav_web](includes/nav_web_md.md)]  

1.  Open an Internet browser.  

2.  In the address, type the following address:  

     **https://virtualmachine.cloudapp.net/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\_Instance1**  

     Substitute *virtualmachine* with the name of the virtual machine that in running the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

## See Also  
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying Microsoft Dynamics NAV on Two Virtual Machines Using Example-2VM Script](Deploying-Microsoft-Dynamics-NAV-on-Two-Virtual-Machines-Using-Example-2VM-Script.md)   
 [Deploying Microsoft Dynamics NAV on One Virtual Machine Using Example-1VM Script](Deploying-Microsoft-Dynamics-NAV-on-One-Virtual-Machine-Using-Example-1VM-Script.md)   
 [Scaling the Microsoft Dynamics NAV Network Topology](Scaling-the-Microsoft-Dynamics-NAV-Network-Topology.md)
