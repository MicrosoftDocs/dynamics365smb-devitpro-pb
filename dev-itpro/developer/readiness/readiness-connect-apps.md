---
title: "Connect Apps"
description: ""
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/13/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: solsen
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---

# Connect Apps 

## What is a Connect app?
A Connect app describes the scenario of establishing a point-to-point connection between [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] and a 3rd party solution or service.   

## How do I create a Connect app?
A Connect app is typically created using standard REST API to interchange data. Any coding language capable of calling REST APIs can be used to develop your Connect app.  

[!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] exposes 44 standard APIs at the time of writing. More will be added over time. We strongly encourage using the standard APIs when possible. 

<!-- INSERT VIDEO:  
Objective: Introducing Connect Apps + Business value 
New video that needs to be created -->

## How can I benefit from offering a Connect app? 
Online service offerings like payroll, expense management, web-shops, project planning etc. typically have many connection points. Connect apps allow you to make connections between those online service offerings and your business solution. This connection can be achieved on a data level without needing to do development. Therefore, reusing those connection points provides you with an opportunity to reuse your investments from REST integrations with other Cloud Services. 

Optionally, you can add a custom interface in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], which determines how your data needs to flow between [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] and your online service offering. In this case we advise you to follow the guidance specified in the [Add-on Apps](readiness-add-on-apps.md).

## Examples of Connect apps 
Below you can find some examples of online services, which could benefit from being integrated to [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] using Connect apps: 

- Payroll - Read chart of accounts, synchronizing employee information and push payroll transactions to the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] ledger.
- Expenses - Collect and reconcile transactions in well-adopted expense apps. 
- Web-shops - Synchronize items, customers, and other entities to create sales orders and invoices. 
- Financial Services - Read financial data and provide value added services such as funding and loans. 

## How do I develop a Connect app?
[!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] offers many APIs that you can call from within your preferred coding language.
To explore and develop against these APIs, you must sign up for a trial tenant. See the documentation for how you sign up and get started with a simple call to retrieve the list of customers in your trial tenant. COMING SOON.


<!-- INSERT VIDEO: 
HDI – V6 – Use APIs from a Connect App -->
 
<!--
## How do I get my Connect app published in AppSource?  
To ease your journey, from the initial idea submission to the final publication, we have created a guide that you can lean on throughout the process of bringing your Connect app to Microsoft AppSource. The guide consists of 3 documents that outline all the steps that must be taken to get your app go live on the platform. You need to complete the steps in the given order to pass the different validation stages and getting your app published on AppSource: 

- [How do I develop and publish a Connect app]().-->

 
## Where do I learn more about Connect apps? 
To learn more about how to develop Connect apps, select the following links:  
1. COMING SOON - Documentation on REST APIs <!--(https://docs.microsoft.com/en-us/rest/api/) -->
2. COMING SOON - Getting started with Connect apps <!--(https://docs.microsoft.com/en-us/dynamics-nav/developer/devenv-develop-connect-apps-for-fin) -->
3. COMING SOON - Overview of connection endpoints and authentication options <!--(https://docs.microsoft.com/en-us/dynamics-nav/endpoints-apis-for-dynamics) -->
4. If your Connect app requires a specific setup in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], then you have the opportunity to add objects. In this case, you will have to follow the guide on Add-on apps in combination with using the Connect API. Find the guide on how to develop Add-on apps [here](readiness-add-on-apps.md).  


