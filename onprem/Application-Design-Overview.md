---
title: "Application Design Overview"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5c51174e-fbbb-4a24-bf9a-2fe6ee7c3b1e
caps.latest.revision: 10
---
# Application Design Overview
Carefully planning the details of your database application will help to ensure that your database has the best possible design. An application that has been correctly designed is easier to build and maintain. This section contains guidelines for creating applications by using the methods of analysis, design, and implementation.  

## Steps in Designing a [!INCLUDE[navnow](includes/navnow_md.md)] Application  
 Designing a [!INCLUDE[navnow](includes/navnow_md.md)] application usually includes the following steps:  

1.  Understanding the problem.  

2.  Designing the data model \(tables, fields, relationships, and constraints\).  

3.  Designing the application.  

### Understanding the Problem  
 First, you must understand the business problem that you want your application to solve. You may want to know who will be using the application and what they will be trying to accomplish. For more information about gathering information and using that information to plan your design, see [Developing a Database Plan \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkId=240052).  

### Designing the Data Model  
 After you understand the problem that you want your application to solve, you must design the structure of the database for your application. For more information about how to design the data model, see the following topics:  

-   [Designing Databases \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkId=240055)  

-   [Database Basics \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkId=240053)  

 One consideration when you design your data model is data integrity. Enforcing data integrity guarantees the quality of the data in the database. You must consider how to define and enforce the following:  

-   Unique values in identifier columns of a table.  

-   Valid data types in each field of a table.  

-   Consistency across tables.  

-   Other constraints that are specific to your application.  

For more information about data integrity, see the following topics:  

-   [Data Integrity \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkId=240057)  

-   [Table Keys](Table-Keys.md)  

-   [Field Data Types](Field-Data-Types.md)  

-   [Triggers Overview](Triggers-Overview.md)  

### Designing the Application  
 After you have a design for your database, you can begin to design the application itself. Designing the application involves:  

-   Creating table objects in [!INCLUDE[navnow](includes/navnow_md.md)] to implement the design of your database.  

-   Designing pages for entering and retrieving data, and reports for viewing and presenting data.  

-   Creating C/AL code to connect the application objects.  

-   Designing objects or writing code to extend functionality or to integrate your application together with other systems.  

 For more information about how to design your application, see the following topics:  

-   [Designing Application Objects](Designing-Application-Objects.md)  

-   [Programming in C/AL](Programming-in-C-AL.md)  

-   [Objects](Objects.md)  

-   [Web Services](Web-Services.md)  

-   [Extending Microsoft Dynamics NAV](Extending-Microsoft-Dynamics-NAV.md)  

## See Also  
 [Development](Development.md)
