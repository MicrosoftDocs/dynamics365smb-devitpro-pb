---
title: Extend Pages Based on the Date Virtual Table
description: Learn how to extend Business Central pages that previously used the Date virtual table, by extending the buffer table and subscribing to the OnAfterCalcLine event.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.date: 08/24/2026
ms.topic: concept-article
---

# Extending pages previously based on the Date virtual table

[!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)]

Pages that previously had the **Date** virtual table as their source table are redesigned to use buffer tables instead. This way, you can extend base application pages such as **Item Availability Lines** and **Res. Availability Lines**.

To extend such a page, first extend the underlying buffer table. Then create a method that calculates and updates the values of the extended fields, and subscribe it to the **OnAfterCalcLine** event of the page.

## Example

The following example shows how to add two new fields, `"Add.-Currency Debit Amount"` and `"Add.-Currency Credit Amount"`, to the **G/L Account Balance Lines** page, which used to be based on the **Date** table.

First, create a [table extension object](devenv-table-ext-object.md) and add the two fields, `"Add.-Currency Debit Amount"` and `"Add.-Currency Credit Amount"`, to the **G/L Acc. Balance Buffer** source table. Then create a [page extension object](devenv-page-ext-object.md) to display the fields on the **G/L Account Balance Lines** page, as shown in the following code.

```al
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

The subscriber method `GLAccountBalanceLinesOnAfterCalcLine` computes the values of the `"Add.-Currency Credit Amount"` and `"Add.-Currency Debit Amount"` fields and updates the **G/L Acc. Balance Buffer** table. This method is called when the **OnAfterCalcLine** event in the **G/L Account Balance Lines** page is raised.

```al
codeunit 50001 GLAccountBalanceLinesExt
{
    // Subscribe to OnAfterCalcLine event
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

## Related information

[Page extension object](devenv-page-ext-object.md)  
[Page object](devenv-page-object.md)  
[CalcFields method](methods-auto/record/record-calcfields-method.md)  
[Date virtual table](devenv-date-virtual-table.md)
