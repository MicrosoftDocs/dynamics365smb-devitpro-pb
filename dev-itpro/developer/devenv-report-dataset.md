---
title: "Report Dataset"
description: "The dataset determines the data extracted to print or display the information from the database."
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

# Defining a Report Dataset
You use a report object in the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] to define the data model, or dataset, of a report. The dataset determines the data that is extracted or calculated from the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] database tables that can be used in a report. For more information, see [Report Object](devenv-report-object.md).

You build the report dataset from data items and columns. A data item is a table. A column can be: 

- A field in a table 

- A variable

- An expression 

- A text constant

Typically, data items and columns correspond to fields in a table. When the report is run, each data item is iterated for all records in the underlying table. Filters are applied and the dataset is created. 
When a report is based on more than one table, you must set relations between the data items so that you can retrieve and organize the data. 

## Snippet support

Typing the shortcut `treport` will create the basic layout for a report object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code. 

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

### Example

The following example adds the `Customer` table as the data item and the `CustomerName` and `CompanyName` as fields of a column to the report. For more information on creating a report, see [Creating a Report](devenv-howto-report-layout.md).

```
dataset
{
    dataitem(Customer; Customer)
    {
        column(CustomerName; CustomerName)
        {
        }
        column(CompanyName; CompanyName)
        {
        }
    }
}
```

## See Also
[Report Object](devenv-report-object.md)  
[Reports Overview](devenv-reports.md)  
[Report Design Overview](devenv-report-design-overview.md)  
