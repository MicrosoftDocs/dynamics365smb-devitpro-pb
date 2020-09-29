---
title: "Embed Apps"
description: ""
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Embed Apps
## What is an Embed app?

An Embed app defines a customer scenario. Specifically, the scenario of a customer wishing to acquire an end-to-end solution meeting the specific needs of an industry vertical or a micro-vertical.

An Embed App is therefore the term for what is being provided to a given customer segment, unrelated to how the solution is being implemented or architected. 
 
[!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] plays a fundamental role in the Embed App when [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] is embedded as an integral part of the overall solution. 
  
Examples of Embed apps are a dentist solution and a real estate agent solution. 

<!-- 
INSERT VIDEO: 
 Objective: Introducing Embed apps  
New video that needs to be created -->

## How do I create an Embed app? 

Technically and architecturally an Embed app can be constructed and composed by combining a few approaches such as: 
- Creating your own extensions and customizations to [!INCLUDE[d365fin_long](../includes/d365_bus_central_md.md)].
- Leveraging other services components from Microsoft; for example, PowerBI, Power Automate, Power Apps, Microsoft 365, Azure services, and more.   
- Leveraging the integration to services from other ISV’s; for example, Payroll services, Bank integration, and more.   
- Including Add-on apps provided by other ISV’s that are specifically created to enhance and extend the capabilities of [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)]; for example, payment and shipping functionality, and more. 

Being able to customize the [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] experience is one of the unique properties of [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)]. To customize and extend [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] you can use Extensions version 2.0 and the modern development tools with Visual Studio Code. Find more information, see [Add-on Apps](readiness-add-on-apps.md).


## What if I already have a vertical solution created for Dynamics NAV? 

[!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] represent the next exciting chapter of Dynamics NAV. To bring you existing Dynamics NAV vertical solution into the cloud and onto [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] you have two overall options:

- *Refactor* your existing solution to use Extensions version 2.0 and the AL program language using the modern development tools and Visual Studio Code. 
 
- *Lift* your existing C/SIDE based solution onto Dynamics 365 Business Central and then over time *shift* (aka. refactor) the solution to AL and Extensions version 2.0 to align your solution with the investments being made for Dynamics 365 Business Central and reap the benefits of a modern development approach. 
 
The *lift* and *shift* approach currently offers a limited preview for few selected partners. We expect to open for more broad access. Also, expect to see both business and technical requirements in order for you to step into this approach. More details will be shared later.

<!--  
To learn more about embed apps in general, select the following links:  
A document describing Dynamics 365 Business Central ISV Embed solutions – needs to be built 
FAQ on Embed apps – needs to be built -->

