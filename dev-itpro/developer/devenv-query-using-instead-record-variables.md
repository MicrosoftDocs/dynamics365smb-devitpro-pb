---
title: "Using Queries Instead of Record Variables"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Using Queries Instead of Record Variables

In scenarios where you want to read records from multiple tables, it can be a good idea to use a query instead of implementing code with record variables. Using a query can improve performance and also simplify the AL code that is required to perform the operation.  

## Code Example Using Record Variables

The following AL code shows an example of using record variables to retrieve and handle records from two tables. You could potentially use this code to track item movement. The code uses two record variables, `Item` and `ItemLedgerEntry`, to retrieve the first five records from table **27 Item** and table **32 Item Ledger Entry** where the **Entry Type** field equals **Sale**. The retrieved records are passed to and handled by the `OutputData` method.  

```AL
begin
    count := 0;
    if Item.FINDSET then
        repeat
            PrevDate := 0D;
            TotalQty := 0;
            ItemLedgerEntry.SETCURRENTKEY("Item No.", "Posting Date");
            ItemLedgerEntry.SETRANGE("Item No.", Item."No.");
            ItemLedgerEntry.SETRANGE("Entry Type",
                ItemLedgerEntry."Entry Type"::Sale);
            if ItemLedgerEntry.FINDSET then
                repeat
                    if (ItemLedgerEntry."Posting Date" <> PrevDate) and (PrevDate <> 0D) then begin
                        OutputData(1, Item."No.", Item.Description, PrevDate, -TotalQty);
                        TotalQty := 0;
                        count := count + 1;
                    end;
                    PrevDate := ItemLedgerEntry."Posting Date";
                    TotalQty := TotalQty + ItemLedgerEntry.Quantity;
                until (ItemLedgerEntry.NEXT = 0) or (count >= 4);
            if PrevDate <> 0D then begin
                OutputData(1, Item."No.", Item.Description, PrevDate, -TotalQty);
                count := count + 1;
            end;
        until (Item.NEXT = 0) or (count >= 4);
end;
```  

## Corresponding Query Implementation  

The following AL code represents a query object and additional code that will return the same results as the previous example that uses record variables.

```AL
query 50100 "Item Movements Query"
{
    QueryType = Normal;

    elements
    {
        // This dataitem corresponds to the `Item` record variable in the record variable example. 
        dataitem(Item; Item)
        {
            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }

            // This dataitem corresponds to the `ItemLedgerEntry` record variable in the record variable example. 
            dataitem(Item_Ledger_Entry; "Item Ledger Entry")
            {
                // The DataItemLink and  SqlJoinType settings correspond to the `ItemLedgerEntry.SETRANGE("Item No.",Item."No.");` statement in the record variable example.
                DataItemLink = "Item No." = Item."No.";
                SqlJoinType = InnerJoin;

                filter(Entry_Type; "Entry Type")
                {
                }
                column(Posting_Date; "Posting Date")
                {
                }

                // The SUM corresponds to the `TotalQty := TotalQty + ItemLedgerEntry.Quantity;` statement in the record variable example.
                column(Sum_Quantity; Quantity)
                {
                    Method = Sum;
                }
            }
        }
    }
}
```

Add the following code to a codeunit that will run the query.

```AL
var
    ItemMovements: Query "Item Movements"
begin
    ItemMovements.TopNumberOfRows(5);  
    ItemMovements.SetRange(Entry_Type,ItemMovements.Entry_Type::Sale);  
    ItemMovements.Open;  
    while ItemMovements.Read do 
      OutputData(2, ItemMovements.Item_No,ItemMovements.Description,ItemMovements.Posting_Date,ItemMovements.Sum_Quantity);  
end;
```  

The `ItemMovements.TOPNUMBEROFROWS(5);` statement will include only the first 5 records in the resulting dataset and corresponds to implementing the `count` variable in the record-based code example.  

The `OutputData` method performs the same operations as the `OutputData` method in the record variable example.  

## See Also

[Query Object](devenv-query-object.md)  
[Linking and Joining Data Items](devenv-query-links-joins.md)  
[Aggregating Data in Query Objects](devenv-query-totals-grouping.md)  
[Filtering Data in Query Objects](devenv-query-filters.md)  
[SETRANGE Method](methods-auto/query/queryinstance-setrange-method.md)  
[OPEN Method](methods-auto/query/queryinstance-open-method.md)   
[TOPNUMBEROFROWS Method](methods-auto/query/queryinstance-topnumberofrows-method.md)  
[API Query Type](devenv-api-querytype.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
