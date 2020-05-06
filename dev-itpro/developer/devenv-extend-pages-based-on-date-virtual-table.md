---
title: "Extending pages previously based on the Date virtual table"
description: ""
author: blrobl
ms.custom: na
ms.date: 04/01/2020
ms.suite: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Extending pages previously based on the Date virtual table

[!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)]

 Pages that previously had the `Date` virtual table (virtual tables are not extensible) as its source table have been redesigned to be based on buffer tables instead. This way, base application pages such as **Item** and **Resource Availability** can now be extended.

To perform the page extension, one must first create a [Table Extension object](devenv-table-ext-object.md) and make the desired changes to the underlying buffer table. To calculate the extended values, you have to create a method and subscribe to the `OnAfterCalcLine` event. Then you can simply create a [Page Extension object](devenv-page-ext-object.md) and make changes to the page.

## Example

The following example illustrates how to add the fields `"Add Currency Debit Amount"` and `"Add Currency Credit Amount"` to the `"G/L Account Balance Lines"` page. 

The first step is to extend the `"G/L Account Balance Buffer"` source table with the two new fields, as shown in the code below.

```
tableextension 50001 GLAccBalanceBufferExt extends "G/L Acc. Balance Buffer"
{
    fields
    {
        field(50001; "Add.-Currency Debit Amount"; Decimal)
        {

        }
        field(50002; "Add.-Currency Credit Amount"; Decimal)
        {

        }
    }
}
```

The `GLAccountBalanceLinesOnAfterCalcLine` method computes the values of the records of the `"Add.-Currency Credit Amount"` and `"Add.-Currency Debit Amount"` fields and updates the `"G/L Acc. Balance Buffer"` table.

```
codeunit 50001 GLAccountBalanceLinesExt
{
    [EventSubscriber(ObjectType::Page, Page::"G/L Account Balance Lines", 'OnAfterCalcLine', '', false, false)]
    local procedure GLAccountBalanceLinesOnAfterCalcLine(var GLAccount: Record "G/L Account"; var GLAccBalanceBuffer: Record "G/L Acc. Balance Buffer")
    begin
        // Calculate values
        GLAccount.CalcFields("Add.-Currency Credit Amount", "Add.-Currency Debit Amount");

        // Assign calculated values to the new fields of the buffer table
        GLAccBalanceBuffer."Add.-Currency Debit Amount" := GLAccount."Add.-Currency Debit Amount";
        GLAccBalanceBuffer."Add.-Currency Credit Amount" := GLAccount."Add.-Currency Credit Amount";

    end;
}
```

The page extension `GLAccountBalanceLinesExt` adds the `AddCurrencyDebitAmount`and `AddCurrencyCreditAmount` to the `"G/L Account Balance Lines"` page.

```
pageextension 50001 GLAccountBalanceLinesExt extends "G/L Account Balance Lines"
{
    layout
    {
        addlast(Control1)
        {

            field(AddCurrencyDebitAmount; "Add.-Currency Debit Amount")
            {

                ApplicationArea = Basic, Suite;
                Caption = 'Debit Amount (ACY)';
            }

            field(AddCurrencyCreditAmount; "Add.-Currency Credit Amount")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Credit Amount (ACY)';
            }
        }
    }
}
```


## See Also