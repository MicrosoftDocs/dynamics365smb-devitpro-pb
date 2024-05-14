---
title: Manage Dynamics NAV on Azure
description: Dynamics NAV includes Provisioning Tools for Microsoft Azure that enables you to deploy a Dynamics NAV environment on Microsoft Azure virtual machines.
author: jswymer
ms.date: 10/01/2018
ms.topic: article
ms.assetid: d1f1d74a-b8f1-4fa4-a4e9-5038a6f1d229
ms.author: jswymer
---
# Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure
[!INCLUDE[navnowlong](includes/navnowlong_md.md)] includes the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] that enable you to deploy a [!INCLUDE[navnow](includes/navnow_md.md)] environment on Microsoft Azure virtual machines. You can also use the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] to deploy [!INCLUDE[navnow](includes/navnow_md.md)] on other cloud services and on-premise installations.  

## About Cloud Services  
 *Cloud service* refers to a service that is provided over a network, such as the Internet. The service hosts the relevant software applications and databases, in this case [!INCLUDE[navnow](includes/navnow_md.md)], to which users are given access. The cloud provider manages the infrastructure that runs the software applications.  

## About the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)]  
 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] automate the deployment of [!INCLUDE[navnow](includes/navnow_md.md)] on virtual machines. They are designed to fully automate the deployment on Azure. However, with slight modifications, you can use the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] for deploying on any virtual machine that is on premise or on the cloud. The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] include a set of Windows PowerShell cmdlets and scripts that install and configure [!INCLUDE[navnow](includes/navnow_md.md)] components, including [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], [!INCLUDE[nav_server](includes/nav_server_md.md)], and SQL database components.  

 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] include two end-to-end example scripts, Example-1VM.ps1 and Example-2VM.ps1, which deploy a fully functional [!INCLUDE[navnow](includes/navnow_md.md)] environment on different network topologies. Example-1VM deploys the [!INCLUDE[navnow](includes/navnow_md.md)] components on a single virtual machine. Example-2VM deploys [!INCLUDE[navnow](includes/navnow_md.md)] on two virtual machines, where [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] are installed on one machine and SQL Server is on the other machine. The scripts illustrate the operations that are required for full deployment of [!INCLUDE[navnow](includes/navnow_md.md)] and can be modified to match the specific requirements for your installation.  

## [!INCLUDE[navnow](includes/navnow_md.md)] Clients  
 After the deployment using the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] is completed, users can access [!INCLUDE[navnow](includes/navnow_md.md)] from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](includes/nav_web_md.md)] from a computer that has a network connection.  

## See Also  
[Planning and Preparing](Planning-and-Preparing.md)   
[Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md)  
