---
title: Create FlowFields and FlowFilters
description: FlowFields and FlowFilters are used to display the result of the calculation described in the CalcFormula property. 
author: SusanneWindfeldPedersen
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Create FlowFields and FlowFilters
This topic describes the procedure and the properties used to create FlowFields and FlowFilters. 

A FlowField performs a set of calculations and displays the results immediately. A FlowFilter displays the results based on the user input to calculate the filtered values that will affect the calculation of a FlowField. The FlowFields and FlowFilters are not physical fields; these fields act as a virtual field which does not actually exist in the database. They are a description of a calculation and a location for the result to be displayed which is typically derived in the [CalcFormula Property](properties/devenv-calcformula-property.md). 

For more information about the FlowField type, see [FlowFields](devenv-flowfields.md), and for more information about the FlowFilter type, see [FlowFilter Overview](devenv-flowfilter-overview.md).

<!--
### Example scenarios
A typical scenario for using a FlowField could be the Account Balance field in the General Ledger Account table that shows the balance of the account and calculates as the sum of the NetAmount fields for all General Journal entries in the account . A typical scenario for using a FlowFilter could be a date filter. 
-->

## Classifying the field type
In order to create FlowFields and FlowFilters, you must first classify the field type by using the FieldClass Property. For more information, see [FieldClass Property](properties/devenv-fieldclass-property.md). By classifying the field as a FlowField or a FlowFilter type, you enable the fields to act as a virtual field whose value can be dynamically derived based on the calculation formula. 

## Calculation formula
A FlowField type is always associated with a calculation formula that determines how the FlowField is calculated. Likewise, the FlowFilter type is associated with the calculation formula. To perform the calculations by using the FlowField and FlowFilter type, you must derive those fields in the calculation formula which you classify in the table. You can choose from several methods of calculations including sum (total), average, maximum value, minimum value, record count, lookup, and more, by using the CalcFormula Property. For more information about the syntax and formulas, see [Calculation Formulas and the CalcFormula Property](Properties/devenv-calculation-formulas-and-the-calcformula-property.md). 
 
### Example
In the following example, `MyTable` sets the `Global Dimension 1 Filter` and `Global Dimension 2 Filter` fields whose values are based only on the dimension values included in the filter. Also, some of the following fields formulate the currency filter to one single currency because you do not store the filter value on the entries, hence you define the `Currency Filter` as a FlowFilter type.
`Total Amount`, `Amount upper bound`, `Amount lower bound`, `First Entry`, and `Customer Balance` are classified as a FlowField type and here you specify the calculations. These fields display the results immediately based on the filters that you apply in the user interface. 


```
table 50123 MyTable
{
    fields
    {
        field(1;MyField; Decimal)
        {
            Description='New field';
        }

        field(2;"No."; Code[20])
        {
            Description='Serial number of the service';
        }

        field(3;"Global Dimension 1 Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }

        field(4;"Global Dimension 2 Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }

        field(5;"Currency Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }

        field(6; "Total Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)"
            WHERE ("Customer No."=FIELD("No."),
            "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
            "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
            "Currency Code"=FIELD("Currency Filter")
            ) );
        }

        field(7; "Amount upper bound"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = max ("Detailed Cust. Ledg. Entry"."Amount (LCY)"
            WHERE ("Customer No." = FIELD ("No."),
            "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
            "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
            "Currency Code" = FIELD ("Currency Filter")
            ));
        }

        field(8; "Amount lower bound"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = min ("Detailed Cust. Ledg. Entry"."Amount (LCY)"
            WHERE ("Customer No." = FIELD ("No."),
            "Initial Entry Global Dim. 1" = FIELD ("Global Dimension 1 Filter"),
            "Initial Entry Global Dim. 2" = FIELD ("Global Dimension 2 Filter"),
            "Currency Code" = FIELD ("Currency Filter")
            ));
        }

        field(9; "First entry"; Boolean)
        {
            CalcFormula = exist (Customer where (Payments = const (0),
                                                 "No." = field ("No.")));
            FieldClass = FlowField;
            Caption = 'Specifies whether it is the customer''s first entry';
        }

        field(10; "Customer Balance"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup (Customer.Balance where ("No." = field ("No.")));
        }
    }
}

```

## See Also  
[FlowFields](devenv-flowfields.md)  
[FlowFilter Overview](devenv-flowfilter-overview.md)  
[Calculation Formulas and the CalcFormula Property](Properties/devenv-calculation-formulas-and-the-calcformula-property.md)
