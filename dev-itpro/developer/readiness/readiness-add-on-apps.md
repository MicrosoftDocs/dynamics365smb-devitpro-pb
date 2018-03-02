---
title: "Add-On Apps"
description: ""
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/20/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: solsen
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---

# Add-On Apps (Enriches User Experience and Functionality)

## What is an Add-on app? 
An Add-on app extends the experience and the existing functionality of Dynamics 365 Business Central. Add-on apps can be used in multiple scenarios, whether the purpose is  to integrate to online services, add business functionality, or extend the user interface.  

Add-on apps are developed using Extensions v2.0
> [!NOTE]  
> Extensions v1.0 are not supported for use with Dynamics 365 Business Central and the modern development tools based on Visual Studio Code. Add-on apps can be published through Microsoft AppSource, as configurable pre-built apps that can be applied on individual customer environments in Dynamics 365 Business Central.  

<!-- INSERT VIDEO: 
Objective: Introducing add on apps (modern tools, integration points, rich base, “easy to publish”) 
New video that needs to be created -->

### Examples of some of the current Add-on apps on AppSource are:  
- [Shopify Connector from Scapta]()  
    - This Add-on app adds Dynamics 365 Business Central to webshops, generally useful for companies selling items or services. 
    - Shopify is a complete e-commerce solution that allows companies to set up an online store to sell their goods combined with the business process flows of the cutting edge ERP-system Microsoft Dynamics 365 Business Central. 
 
- [LS Express from LS Retail]()  
    - This Add-on app adds a point of sales cashier, useful for front office sales. 
    - LS Express is designed for small retail companies that need to maintain accurate financial accounts, manage large inventories and live up to the expectations of today's customers. LS Express is a complete online POS system, natively integrated with Microsoft Dynamics 365 Business Central.  
 
- [Accountant Portal from Microsoft]() <!--   [Symbol] Note: Waiting on input from Christian Baek -->  
    - This Add-on app adds a dashboard where accountants can manage their clients, useful for accountant firms. 

## How do I develop an Add-on app?
To develop an Add-on app, we advise you to create a development environment for Dynamics 365 Business Central. Follow the process described in this video to set up your environment:
<!--  
INSERT VIDEO:  
Objective: Setting up a Dynamics 365 Business Central Development Environment 
New video that needs to be created -->
 
Add-on apps are created using the AL Language extension in Visual Studio Code, which must be installed locally or on a Virtual Machine. The source code for your Add-on app is file-based, and we recommend that you set up a repository in a source code management system like GitHub. 

<!-- 
To ease the development phase of Add-on aps we have created a video series to help you each step of the way. Learn more by consuming the content in the below video series: 
INSERT VIDEOS:  
HDI - V4: Build my first extension 
HDI - V1: Add a field in an extension 
HDI - V3: Create a table and a page 
HDI - V2: Add a relation to a foreign table in an extension 
HDI - V5: Add AL Code to an extension 
HDI - V7: Build a custom control 
HDI - V8: How do I create custom web services for integration scenarios? 
HDI - V9: Connect to webservices in an extension -->

<!-- This para does not make sense
## Can I test my Add-on app? 
Yes you can. Prior to publishing your Add-on app you can test it in our sandbox environment. In order to use our sandbox, you need to take the following steps: 
Sign up for a Dynamics 365 Business Central Sandbox (link to Financials BE sandbox). Read more about how to create a Sandbox environment here. 
Download Visual Studio Code to the sandbox tenant  
Download the AL Language extension  
Pres ALT+A, ALT +L to trigger the GO! Command, and then choose Cloud 
Enter the credentials you provided for the sign up and then download symbols  
Press F5 to deploy and run the extension on your online sandbox tenant 
 -->

## How do I get my Add-on app published in Microsoft AppSource?  
To ease your journey, from the initial idea submission to the final publication, we have created a guide that you can lean on throughout the process of bringing your app to AppSource. The guide consists of a set of documents that outlines all the steps that must be taken to get your app to go live on the platform. You need to complete the steps in the given order to pass the different validation stages and getting your app published on AppSource. Learn more about each step here: 

- [Getting the prerequisites in place]()  
- [Listing your app on AppSource]()
- [Developing your app & passing validations]() 
- [Publishing your app]() 
 
Learn more about each step here: [aka.ms/BusinessCentralApps]() or [aka.ms/BusinessCentralAddOnApps](). 

## What if another ISV want to use my App-on app in their solution? 
Anyone can discover your Add-on app on AppSource. For other ISV’s to use your Add-on app as an integral part of their solution we suggest that you advertise ways for them to contact you and that you provide your own ways of sharing documentation and everything else necessary for the ISV to test and integrate your Add-on app into their solution. 

## Where do I learn more about Add-on apps? 
Learn more about how to develop Add-on apps here:  
- [Getting Started with AL](https://docs.microsoft.com/en-us/dynamics-nav/developer/devenv-get-started)  
- [Development in AL](https://docs.microsoft.com/en-us/dynamics-nav/developer/devenv-dev-overview)  
- [Dynamics NAV Team Blog](https://blogs.msdn.microsoft.com/nav/)  
- [Converting Extensions V1 to Extensions V2](https://docs.microsoft.com/en-us/dynamics-nav/developer/devenv-upgrade-v1-to-v2-overview)  

<!-- 
To learn more about Add-on apps in general, select the following links:  
FAQ on add-on apps – needs to be build 
Best Practices (Add-on apps) – needs to be build -->