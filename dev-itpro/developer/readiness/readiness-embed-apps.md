---
title: "Embed Apps"
description: ""
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/28/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: solsen
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---

# Embed Apps
An Embed app defines a customer scenario. Specifically, the scenario of a customer wishing to acquire an end-to-end solution meeting the specific needs of an industry vertical or a micro-vertical. Examples of Embed apps are a dentist solution or a real estate agent solution.
 
An Embed app is the term for what is being provided to a given customer segment, unrelated to how the solution is being implemented or architected. 
  
Dynamics 365 Business Central plays a central role in the Embed app, when Dynamics 365 Business Central is embedded as an integral part of the overall solution. 
 
<!-- 
INSERT VIDEO: 
 Objective: Introducing Embed apps  
New video that needs to be created -->

## How do I create an Embed app? 
Technically and architecturally an Embed app can be constructed and composed by combining a number of approached such as: 
- Leveraging other services components from Microsoft – i.e. PowerBI, Flow, PowerApp, Office 365, Azure services etc.  
- Leveraging the integration to services from other ISV’s – i.e. Payroll services, Bank integration etc.   
- Including Add-on apps provided by other ISV’s and created specifically to enhance and extend the capabilities of Dynamics 365 Business Central – for example payment and shipping functionality. 
- Creating your own extensions and customizations to Dynamics 365 Business Central. 
 
Being able to customize the Dynamics 365 Business Central experience is one of the unique properties of Dynamics 365 Business Central. To customize and extend Dynamics 365 Business Central you can use Extensions v2.0 and the modern development tools with Visual Studio Code. For more information, see [Add-on Apps](readiness-add-on-apps.md). 

## What if I already have a vertical solution created for Microsoft Dynamics NAV?
Dynamics 365 Business Central represent the next exciting chapter of Dynamics NAV. To bring your existing Dynamics NAV vertical solution into the cloud and onto Dynamics 365 Business Central you have two overall options. 

- Refactor your existing solution to use Extensions v2.0 and the AL language using the modern development tools and Visual Studio Code. 
 
- Lift your existing C/SIDE-based solution onto Dynamics 365 Business Central and then over time shift (aka refactor) the solution to AL and Extensions v2.0 to align you solution with the investments being made for Dynamics 365 Business Central and reap the benefits of a modern development approach.  
 
The refactor approach identical to what was outlined in the previous section. The *lift, then shift* scenario is currently in limited preview. We expect to open for more broad access sometime during late fall 2018. In any case this option will only be available for ISV’s that have a vertical solution that qualifies for the ISV Embed program <!-- [insert link when available]-->, as this approach requires a commitment to a minimum user base. The size of the minimum user base is yet to be defined. 

## Can I test my Embed app somewhere? 
You must test your embed app locally before submitting the app to AppSource. <!-- To do so see here… [insert link to description of how to use Docker images to create an environment for testing and developing etc. Also a description of how to validate that the solution is ready to be transferred from Docker to Sandbox and/or production] -->

## How do I get my Embed app published in AppSource?  
To ease your journey, from the initial idea submission to the final publication, we have created a guide that you can lean on throughout the process of bringing your app to AppSource. The guide consists of a set of documents that outlines all the steps that must be taken to get your app to go live on the platform. You need to complete the steps in the given order to pass the different validation stages and getting your app published on AppSource. Learn more about each step here: 
- [Get the prerequisites in place & Develop the technical aspects of your Embed app]()  
- [Develop the marketing aspects of your app]() 
- [Publish your app]() 
 
Learn more about each step here [http://aka.ms/BusinessCentralApps](http://aka.ms/BusinessCentralApps).

## Where do I learn more? 
To learn more about how to develop Embed apps, select the following links:  
- [Getting Started with AL](https://docs.microsoft.com/en-us/dynamics-nav/developer/devenv-get-started)  
- [Development in AL](https://docs.microsoft.com/en-us/dynamics-nav/developer/devenv-dev-overview)  
- [Dynamics NAV Team Blog](https://blogs.msdn.microsoft.com/nav/)  
- [Converting Extensions V1 to Extensions V2](https://docs.microsoft.com/en-us/dynamics-nav/developer/devenv-upgrade-v1-to-v2-overview)  
- Contact your local Microsoft representative to learn more about ISV Embed solutions.  


<!--  
To learn more about embed apps in general, select the following links:  
A document describing Dynamics 365 Business Central ISV Embed solutions – needs to be built 
FAQ on Embed apps – needs to be built -->

