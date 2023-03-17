---
title: Virtual tables
description: Virtual tables are system tables in AL for Dynamics 365 Business Central
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 03/17/2023
ms.custom: bap-template
---

# Virtual tables

A virtual table contains system information. You can't change the data in virtual tables. You can only read the information. Virtual tables aren't stored in the database, but are computed by [!INCLUDE [prod_short](includes/prod_short.md)] at runtime.

## Using virtual tables

You can use the same methods to access information in virtual tables as you use when you are working with ordinary tables. For example, you can use filters to get subsets or ranges of integers or dates from the `Integer` virtual table or the `Date` virtual table.

A system administrator usually uses these virtual tables. These tables give the system administrator information about the users who are currently connected to the database and the current state of the system.

The virtual tables provide such information as:

- Integers in the range –1,000,000,000 to 1,000,000,000
- Dates in a given period
- Overview of the operating system files
- Overview of the logical disk drives
- Overview of the operating system files that store the database

Because virtual tables aren't stored in the database, you can't view them directly. To view a virtual table, you must create a list page based on the virtual table.


## See also

[Date virtual table](devenv-date-virtual-table.md)