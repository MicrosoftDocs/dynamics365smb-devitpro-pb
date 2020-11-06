---
title: "Add-on Apps"
description: "An Add-on app extends the over-all experience and the existing functionality of Dynamics 365 Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Add-On Apps

## What is an Add-on app? 

An Add-on app extends the experience and the existing functionality of [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)]. Add-on apps can be used in multiple scenarios, whether it is to integrate to online services, making custom web services, adding business functionality, or extending the user interface. 

Add-on apps are developed using extensions and the modern development tools based on Visual Studio Code. Add-on apps can be published through Microsoft AppSource, as configurable pre-built apps that can be applied on individual customer environments in [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)]. 

<!-- INSERT VIDEO: 
Objective: Introducing add on apps (modern tools, integration points, rich base, "easy to publish") 
New video that needs to be created -->

### Examples of some of the current Add-on apps on AppSource are:  

- [Shopify Connector from Scapta](https://appsource.microsoft.com/product/dynamics-365-for-finance-and-operations-business-edition/PUBID.scapta%7CAID.50395b48-f7b6-4445-96df-6faaa8c96deb%7CPAPPID.96da1317-c2e8-42ec-aa19-216e33d0da19?tab=Overview)  
    - This Add-on app adds [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] to webshops, generally useful for companies selling items or services.
    - Shopify is a complete e-commerce solution that allows companies to set up an online store to sell their goods combined with the business process flows of the cutting edge ERP-system Microsoft [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)].
 
- [LS Express from LS Retail](https://appsource.microsoft.com/product/dynamics-365-for-finance-and-operations-business-edition/PUBID.ls_retail%7CAID.a45ac602-7269-4b3a-bff0-2dce0b3d0b16%7CPAPPID.2d47a6c4-91c0-4593-be25-858c0b36c599?tab=Overview)  
    - This Add-on app adds a point of sales cashier, useful for front office sales. 
    - LS Express is designed for small retail companies that need to maintain accurate financial accounts, manage large inventories and live up to the expectations of today's customers. LS Express is a complete online POS system, natively integrated with Microsoft [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)].   

## How do I develop an Add-on app?
<!-- To develop an Add-on app, we advise you to create a development environment for Dynamics 365 Business Central. Follow the process described in this video to set up your environment:

INSERT VIDEO:  
Objective: Setting up a Dynamics 365 Business Central Development Environment 
New video that needs to be created -->
 
Add-on apps are created using the AL language in Visual Studio Code, which needs to be installed locally or on a Virtual Machine. The source code for your Add-on app is file-based, and we recommend that you set up a repository in a source code management system like GitHub. For more information on getting started with AL, see [Getting Started with AL](../devenv-get-started.md).

To ease the development phase of Add-on aps we have created a video series to help you each step of the way. Learn more by consuming the content in the below video series: 

<!-- INSERT VIDEOS:  
HDI - V4: Build my first extension 
HDI - V1: Add a field in an extension DONE
HDI - V3: Create a table and a page 
HDI - V2: Add a relation to a foreign table in an extension DONE
HDI - V5: Add AL Code to an extension DONE
HDI - V7: Build a custom control 
HDI - V8: How do I create custom web services for integration scenarios? 
HDI - V9: Connect to webservices in an extension DONE -->

- [How do I add a field in an extension?](https://youtu.be/q00zPWT7e34)
- [How do I add a relation to a foreign table?](https://youtu.be/f0no_38NggI)
- [How do I connect to web services in an extension?](https://youtu.be/hNuC8V9T1tU)
- [How do I add AL code to an extension?](https://youtu.be/R9o2t3whmB4)
- [How do I upgrade logic to an extension?](https://youtu.be/hm7mCGp7qug)

## How do I get my Add-on app published in Microsoft AppSource?

To ease your journey, from the initial idea submission to the final publication, we have created a page that you can lean on throughout the process of bringing your app to AppSource. For more information, see [Get Started with Building Apps](readiness-get-started.md).  

## See Also

[Build Your Business on Dynamics 365 Business Central](readiness-welcome.md)  
[Get Started with Building Apps](readiness-get-started.md)  
[Business Central Learning Catalog](https://go.microsoft.com/fwlink/?linkid=2002101)  
[Integrate a 3rd Party Solution](readiness-thirdparty-solution.md)  
[Development of a Vertical Solution](readiness-develop-vertical.md)  
[Development of a Horizontal Solution](readiness-develop-horizontal.md)  
[Development of a Localization Solution](readiness-develop-localization.md)  
[Resell Different Solutions](readiness-reseller.md)  
