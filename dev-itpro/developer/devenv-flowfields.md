---
title: FlowFields overview
description: Learn how FlowFields in Business Central enhance performance by dynamically calculating data at runtime. Discover types, examples, and optimization tips.
ms.author: solsen
ms.date: 02/14/2025
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# FlowFields overview

FlowFields display the result of the calculation described in the [CalcFormula property](properties/devenv-calcformula-property.md). For example, the **Account Balance** field in the General Ledger Account table shows the balance of the account and is calculated as the sum of the NetAmount fields for all General Journal entries in the account.  
  
FlowFields increase performance in activities such as calculating the balance of your customers. In traditional database systems, this operation involves a series of accesses and calculations before a result is available. By using FlowFields, the result is immediately available. You can further optimize the performance of FlowFields by enabling or disabling SIFT. Learn more in [SumIndexField Technology (SIFT)](devenv-sift-technology.md).
  
FlowFields aren't physical fields that are stored in the database. They're a description of a calculation and a location for the result to be displayed. Because the information in FlowFields exists only at run time, values in FlowFields are automatically initialized to 0 (zero).

## When are FlowFields calculated

FlowFields in Business Central are calculated dynamically at runtime in these situations:

- The FlowField is included in the page or extension object definition.

  If a FlowField is the direct source expression of a control on a page, it's automatically calculated when the page is displayed.

  By default, the calculation happens even if the FlowField isn't visible on the page, such as when the [Visible property](../developer/properties/devenv-visible-property.md) is set to `false`. This behavior can lead to unnecessary computations and performance issues. Starting in version 26.0, you can change this behavior by enabling the **Calculate only visible FlowFields** feature in **Feature Management**. When enabled, the AL runtime calculates values only for FlowFields that are visible on pages. Learn more about enabling features in [Enabling upcoming features ahead of time](../administration/feature-management.md).

- The CalcFields method is used.

  You can explicitly calculate a FlowField by using [CalcFields method](../developer/methods-auto/record/record-calcfields-method.md) in AL code. This method updates the FlowField with the current value based on its calculation formula.

- A FlowFilter is applied on the FlowField.

  FlowFields are recalculated when filters are applied. For example, if you apply a filter to a FlowField, the calculation is based on the filtered data.

Learn more in [Creating FlowFields and FlowFilters](devenv-creating-flowfields-and-flowfilters.md).

## FlowField types

There are seven types of FlowFields. Each is described in the following table.  
  
|FlowField type|Field type|Description|  
|--------------|----------------|-----------------|  
|`Sum`|Decimal, Integer, BigInteger, or Duration|The sum of a specified set in a column in a table.|  
|`Average`|Decimal, Integer, BigInteger, or Duration|The average value of a specified set in a column in a table.|  
|`Exist`|Boolean|Indicates whether any records exist in a specified set in a table.|  
|`Count`|Integer|The number of records in a specified set in a table.|  
|`Min`|Any|The minimum value in a column in a specified set in a table.|  
|`Max`|Any|The maximum value in a column in a specified set in a table.|  
|`Lookup`|Any|Looks up a value in a column in another table.|  

### Example

Consider the Customer table in the following illustration. This table contains two FlowFields. The field named `Any Entries` is a FlowField of the Exist type, and the `Balance` field is a FlowField of the Sum type.  

:::image type="content" source="media/NAV_ADG_Diag_3.png" alt-text="Table that has two FlowFields":::
  
The figure shows that the value in the Balance FlowField for customer number 10000 (Windy City Solutions) is retrieved from the Amount column in the Customer Entry table. The value is the sum of the amount fields for the entries that have the customer number 10000.  
  
```AL
Sum = 10 + 20 + 30 = 60.  
```  
  
The values shown in the `Balance` column in the Customer table for customers 10010, 10020, and 10040 are found in the same way. For customer number 10030 the value is 0 (zero), as there are no entries in the Customer Entry table that have a Customer No. that equals 10030.  
  
In this example, the Balance FlowField in the Customer table reflects the sum of a specific subset of the Amount fields in the Customer Entry table. How the calculation of a FlowField is to be made, is defined in a calculation formula. The calculation formula for the `Balance` field is:  
  
```AL
Sum("Customer Entries".Amount where(CustNo=field(CustNo)))  
```  
  
Correspondingly, the `Any Entries` field, which indicates whether any entries exist, has the following definition:  
  
```AL
Exist("Customer Entries" where(CustNo=field(CustNo)))  
```
  
## Related information

[CalcFields method (Record)](methods-auto/record/record-calcfields-method.md)  
[FlowFilters overview](devenv-flowfilter-overview.md)  
[Creating FlowFields and FlowFilters](devenv-creating-flowfields-and-flowfilters.md)  
