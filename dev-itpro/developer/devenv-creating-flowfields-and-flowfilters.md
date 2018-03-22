---
title: Create FlowFields and FlowFilters
description: FlowFields and FlowFilters are used to display the result of the calculation described in the CalcFormula property. 
ms.date: 03/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 2f6560a1-33a5-4fee-beac-fa6a3100c85a
caps.latest.revision: 11
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Create FlowFields and FlowFilters
This topic describes the procedure and the properties used to create FlowFields and FlowFilters. 

A FlowField performs a set of calculations and displays the results immediately. And, a FlowFilter displays the results based on the user input to calculate the filtered values that will affect the calculation of a FlowField. The FlowFields and FlowFilters are not physical fields; these fields act as a virtual field which does not actually exist in the database. They are a description of a calculation and a location for the result to be displayed which is typically derived in the [CalcFormula Property](properties/devenv-calcformula-property.md). 

For more information about the FlowField type, see [FlowFields](devenv-flowfields.md), and for more information about the FlowFilter type, see [FlowFilter Overview](devenv-flowfilter-overview.md).

<!--
### Example scenarios
A typical scenario for using a FlowField could be the Account Balance field in the General Ledger Account table that shows the balance of the account and calculates as the sum of the NetAmount fields for all General Journal entries in the account . A typical scenario for using a FlowFilter could be a date filter. 
-->

## Classifying the field type
In order to create FlowFields and FlowFilters, you must first classify the field type by using the FieldClass Property. For more information, see [FieldClass Property](properties/devenv-fieldclass-property.md). By classifying the field as a FlowField or a FlowFilter type, you enable the fields to act a virtual field whose value can be dynamically derived based on the calculation formula. 

## Calculation formula
A FlowField type is always associated with a calculation formula that determines how the FlowField is calculated. Likewise, the FlowFilter type is associated with the calculation formula too. To perform the calculations by using the FlowField and FlowFilter type, you must derive those fields in the calculation formula which you classify in the table. You can choose from several methods of calculations including sum (total), average, maximum value, minimum value, record count, lookup, and more, by using the CalcFormula Property. For more information about the syntax and formulas, see [Calculation Formulas and the CalcFormula Property](Properties/devenv-calculation-formulas-and-the-calcformula-property.md). 
 
### Example
In the following example, `MyTable` sets the `Global Dimension 1 Filter` and `Global Dimension 2 Filter` fields whose values are based only on the dimension values included in the filter. `Total Amount` is classified as a FlowField type and here you specify the calculations. Also, this field formulates the currency filter to one single currency because you do not store the filter value on the entries, hence you define the `Currency Filter` as a FlowFilter type. Lastly, the `Total Amount` displays the results immediately based on the filters you apply in the user interface. 


```
table 50123 MyTable
{
    fields
    {
        field(1;MyField; Decimal)
        {
            Description='New field';
        }
        field(3;"no."; Text[20])
        {
            Description='Serial number of the service';
        }
        field(4;"Global Dimension 1 Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(5;"Global Dimension 2 Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(6;"Currency Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(2; "Total Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)"
            WHERE ("Customer No."=FIELD("No."),
            "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
            "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
            "Currency Code"=FIELD("Currency Filter")
            ) );
        }
    }
}
```

## See Also  
[FlowFields](devenv-flowfields.md)  
[FlowFilter Overview](devenv-flowfilter-overview.md)  
[Calculation Formulas and the CalcFormula Property](Properties/devenv-calculation-formulas-and-the-calcformula-property.md)
