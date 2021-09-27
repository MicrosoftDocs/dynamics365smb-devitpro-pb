---
title: "FlowFilter Overview"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# FlowFilter Overview
A user may want to limit calculations to include only those values in a column that have some specific properties. For example, a user may want to sum only the amounts of customer entries that are entered in April. This is possible if the application has been designed using FlowFilter fields in connection with the FlowFields.

 You use FlowFilter fields to set ranges on the calculations that are shown in FlowFields. For example, if a FlowField contains the total of customer entries, then you can use a FlowFilter to see the total for a single month or range of months. In this example, the FlowFilter field is a date field. You can set up FlowFilter fields to show information that is based on other filters such as business units, departments, or projects.  

 The following illustration shows the relationship between various types of database fields and the calculation formula.  

 ![Explains database fields and calculation formula.](media/NAV_ADG_6_Diag_5.png "Database fields and calculation formula")  

 The filters defined in the calculation formula can consist of constants, values from ordinary fields, and filters given as parameters in FlowFilter fields. In FlowFilter fields, a user can enter a filter value via the user interface in the application that will affect the calculation of a FlowField.  

 FlowFilter fields are not saved in the database. Instead, they are stored for each window on an individual computer so users have their own filters.  

 You cannot have a FlowFilter field as the **SourceExpression** value for a control on a page. If you do, then the control on the page is not editable, and you cannot select a value and filter the data that is displayed in the page.  

## See Also
[Create FlowFields and FlowFilters](devenv-creating-flowfields-and-flowfilters.md)  
[Flowfields](devenv-flowfields.md)  
