---
title: "Connect Apps"
description: ""
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

# Connect Apps

## What is a Connect app?

A Connect app can be used in the scenario where there must be established a point-to-point connection between [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] and a 3rd party solution or service.

Online service offerings like payroll, expense management, web-shops, project planning etc. typically have many connection points. Connect apps allow you to make connections between these online service offerings and your business solution. This connection can be achieved on a data level without needing to do development. Therefore, by reusing these connection points Connect apps provides you with the opportunity to reuse your investments from REST integrations with other Cloud Services.  

Optionally, you can add a custom interface in [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)], which determines how your data needs to flow between [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] and your online service offering. In this case we advise you to follow the guidance specified in the designated [Add-on apps page](readiness-add-on-apps.md).

## Examples of some of the current Connect apps on AppSource

- [Shopify Connector from Scapta](https://appsource.microsoft.com/product/dynamics-365-for-finance-and-operations-business-edition/PUBID.scapta%7CAID.50395b48-f7b6-4445-96df-6faaa8c96deb%7CPAPPID.96da1317-c2e8-42ec-aa19-216e33d0da19?tab=Overview)
    - This Connect app integrates [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] to web shops, which is generally useful for companies selling items or services.
    - Shopify is a complete e-commerce solution that allows companies to set up an online store to sell their goods combined with the business process flows of the cutting edge ERP-system [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)].
- [Expensify from Stoneridge Software LLC](https://appsource.microsoft.com/da/product/dynamics-365-business-central/PUBID.stoneridge-software%7CAID.aaa85e5d-7f2d-473b-9e9e-d924795fcef1%7CPAPPID.99c36e84-67a4-422a-b8d9-5297c6ebfca5)
    - This Connect app integrates [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] to an accounting solution, which is generally useful for companies of all shapes that wants to save time with automated expense management.
    - Expensify is a complete accounting solution that allows companies to automate every step of the expense reporting process, from receipt scanning to flagging the receipts that need human attention and automatically submitting and approving everything else. With multi-level approval workflows, Expensify gives you complete control and visibility over company finances.
- [ADP Workforce Now Outbound Integration](https://appsource.microsoft.com/product/dynamics-365-business-central/TYPE.connect%7CPUBID.adp%7CAID.msd_365_financial_erp_outbound_integration_app%7CPAPPID.00000000-0000-0000-0000-000000000000?tab=Overview)

    - This Connect app integrates [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] to an HCM system, which allows for handling people data with business management processes real-time.
    - ADP Workforce Now helps eliminate tedious administrative tasks and inefficiencies by incorporating people data and leveraging real time information that can help you manage finance issues.  Simplify and streamline the way you do business. Features include: General Ledger Data Integration, Employee Data Integration and more!

## How do I develop a Connect app?

Connect apps are typically created using standard REST API to interchange data. Any coding language capable of calling REST APIs can be used to develop your Connect app. Therefore, you can use your favorite REST API client to start exploring the APIs.

As of now [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] offers 44 standard APIs that you can call from within your preferred coding language and can start using immediately. More will be added over time. 

By using the standard APIs you can easily exchange data with other services, providing an efficient way to integrate multiple services. We therefore strongly encourage you to use the standard APIs whenever possible. Note, to explore and develop against these APIs, you must sign up for a trial tenant. For more information on how to sign up and get started with developing Connect apps and interacting with APIs, see the guide on [Getting started Developing Connect Apps](../devenv-develop-connect-apps.md).

To ease the development phase of Connect apps we have created a video series to help you each step of the way. Learn more by consuming the content in the below video series:

- [How do I use APIs from a Connect app](https://www.youtube.com/watch?reload=9&v=_Z5w7STWi4U&list=PLcakwueIHoT-wVFPKUtmxlqcG1kJ0oqq4&t=41s&index=17) 
- [How do I create custom web services](https://www.youtube.com/watch?v=Sm_K6ToxYGc&list=PLcakwueIHoT-wVFPKUtmxlqcG1kJ0oqq4&t=71s&index=18)
- [How do I connect to web services in an extension](https://www.youtube.com/watch?v=hNuC8V9T1tU&list=PLcakwueIHoT-wVFPKUtmxlqcG1kJ0oqq4&t=0s&index=31)

## Publishing your Connect app to Microsoft AppSource

To ease your journey, from the initial listing to the final publication of your Connect app on AppSource, we have created two white papers that outline a step-by-step guideline that you need to follow to bring your [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] offers to AppSource smoothly. We recommend that you check off each of the 4 consecutive steps in the two white papers as you progress. We highly recommend that you lean on the guidelines in these white papers to support you throughout the process of publishing your app to AppSource:

- [Getting you started with Microsoft Dynamics 365 Business Central Connect Apps](https://go.microsoft.com/fwlink/?linkid=2005501)
- [Developing and publishing your Microsoft Dynamics 365 Business Central Connect App to AppSource](https://go.microsoft.com/fwlink/?linkid=2005402)

## Where do I learn more about Connect apps? 

To learn more about how to develop Connect apps, select the following links:  

1. [Documentation on REST APIs](/dynamics-nav/api-reference/v1.0/)  
2. [Getting started with Connect apps](../devenv-develop-connect-apps.md)  
3. [Overview of connection endpoints and authentication options](/dynamics-nav/endpoints-apis-for-dynamics)
4. If your Connect app requires a specific setup in [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)], then you have the opportunity to add objects. In this case, you will have to follow the guide on Add-on apps in combination with using the Connect API. Find the guide on how to develop Add-on apps [here](readiness-add-on-apps.md).