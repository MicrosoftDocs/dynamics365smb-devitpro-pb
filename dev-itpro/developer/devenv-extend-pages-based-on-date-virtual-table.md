---
title: "Extending pages previously based on the Date virtual table"
description: "How to extend pages that previously had the Date virtual table as their source table."
author: blrobl
ms.custom: na
ms.reviewer: solsen
ms.date: 10/01/2020
ms.suite: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Extending Pages Previously Based on the Date Virtual Table

[!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)]

Pages that previously had the **Date** virtual table as their source table have been redesigned so that they are based on buffer tables instead. This way, base application pages such as **Item Availability Lines** and **Res. Availability Lines** can now be extended.

To perform extensions on such pages, you must first extend the underlying buffer table. Then you create a method that calculates and updates the values of the extended fields and subscribe it to the **OnAfterCalcLine** event of the page.

## Example

The following example illustrates how to add two new fields, `"Add. -Currency Debit Amount"` and `"Add. -Currency Credit Amount"`, to the **G/L Account Balance Lines** page, which used to be based on the **Date** table.

The first step is to create a [Table Extension object](devenv-table-ext-object.md) and add the two fields, `"Add.-Currency Debit Amount"` and `"Add.-Currency Credit Amount"`, to the **G/L Account Balance Buffer** source table. Then you create a [Page Extension object](devenv-page-ext-object.md) to display the fields in the **G/L Account Balance Lines** page. This is shown in the following code.

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

```
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

## See Also
[Page Extension object](devenv-page-ext-object.md)  
[Page object](devenv-page-object.md)  
[CalcFields Method](methods-auto/record/record-calcfields-method.md)
