---
title: "Customizing Tenants"
description: "Read about how to to build fully custom functionality or adapt what is already available out-of-the box."
author: SusanneWindfeldPedersen
ms.date: 04/01/2021
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Customize Business Central

Every business is unique. Dynamics 365 Business Central is ready to adapt to how customers work: their streamlined processes, their terminology, and how their employees or departments connect and collaborate.  

Whilst there may already be add-on apps available on AppSource that cover a customer’s need, we also have the tools for you to build fully custom functionality or adapt what is already available out-of-the box. 
 
## Examples of custom changes to [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] 

- Capture industry-specific information about products and services.
- Connect to other in-house data repositories or legacy systems to reduce duplicate data entry. 
- Hide data fields that are rarely or never used. 
- Add a printable report covering legally required declarations for a specific industry. 
- Create a role-specific dashboard and set of tasks for a unique organizational role, such as mobile purchasing managers, or recruiting specialists. 
 
## How do I customize? 

For most simple changes to the user interface, the browser-based Designer allows you to rapidly adjust the UI for all users within the organization, without needing to write any code. Similar tools are available to customize the UI for an individual user, or users of a specific role. Hide columns that aren't needed, drag-and-drop to reposition FactBoxes, bookmark links to commonly used lists, or show data fields that were previously hidden: these are all examples of simple changes that can be rolled out to an entire organization Use Designer. For more information, see [Use Designer](../devenv-inclient-designer.md)

With Visual Studio Code and the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)], you’re able to customize existing pages and tables by creating page and table extensions, or you can add new tables and pages to implement entirely new functionality. You can even write business logic in AL. For more information, see [Get Started with AL](../devenv-get-started.md).

You can start customizing in either Designer or in Visual Studio Code. If you start in Designer, the AL source code generated by the Designer is downloadable, so you can continue developing in Visual Studio Code if needed. If you start developing in Visual Studio Code, you'll initiate Designer directly from Visual Studio Code, to continue customizing the UI with a more visual and real-time overview of your changes. When done Use Designer you synchronize changes back to Visual Studio code keeping all changes reflected in the AL source code.  

The resulting AL code is compiled into an .app file, which can be deployed to production environments or other sandbox environments for testing. 

## How do I test my custom changes? 

To ensure business continuity and protect the integrity of live customer data, you can't customize [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] for an organization running in production. Instead, test your custom changes on hosted sandbox environments or in Docker containers. Changes can be tested thoroughly in the browser by developers or even end-users until they're deemed fit to deploy into production where they're applied as an app and can immediately be enjoyed by everyone in the organization. 

## Where do I learn more? 

To learn more about customization, select the following links:  

- [Use Designer](../devenv-inclient-designer.md)  
- [Get Started with AL](../devenv-get-started.md)  
- [AL Development Environment](../devenv-reference-overview.md)  
- [Update Lifecycle for Customizations of Business Central Online](../devenv-customization-update-lifecycle.md)
- [Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](../app-maintain.md) 
- [Business Central on Microsoft training](/learn/dynamics365/business-central?WT.mc_id=dyn365bc_landingpage-docs)
