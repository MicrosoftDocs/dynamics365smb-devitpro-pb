---
title: "FlowFilter Overview"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2e01ac2b-e6e4-4d93-8495-0fc7739d3173
caps.latest.revision: 8
---
# FlowFilter Overview
A user may want to limit calculations to include only those values in a column that have some specific properties. For example, a user may want to sum only the amounts of customer entries that are entered in April. This is possible if the application has been designed using FlowFilter fields in connection with the FlowFields.  

 You use FlowFilter fields to set ranges on the calculations that are shown in FlowFields. For example, if a FlowField contains the total of customer entries, then you can use a FlowFilter to see the total for a single month or range of months. In this example, the FlowFilter field is a date field. You can set up FlowFilter fields to show information that is based on other filters such as business units, departments, or projects.  

 The following illustration shows the relationship between various types of database fields and the calculation formula.  

 ![](media/NAV_ADG_6_Diag_5.png "NAV\_ADG\_6\_Diag\_5")  

 The filters defined in the calculation formula can consist of constants, values from ordinary fields, and filters given as parameters in FlowFilter fields. In FlowFilter fields, a user can enter a filter value via the user interface in an application that will affect the calculation of a FlowField.  

 FlowFilter fields are not saved in the database. Instead, they are stored for each window on an individual computer so users have their own filters.  

 You cannot have a FlowFilter field as the **SourceExpr** value for a control on a page. If you do, then the control on the page is not editable, and you cannot select a value and filter the data that is displayed in the page.  


## See Also  
 [Entering Criteria in Filters](Entering-Criteria-in-Filters.md)  
 [Troubleshooting Long Running SQL Queries Involving FlowFields by Disabling SmartSQL](Troubleshooting-Queries-Involving-FlowFields-By-Disabling-SmartSQL.md)  
