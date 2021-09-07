---
title: "Using Queries Instead of Record Variables"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: af6d360a-242d-4274-9d3d-863dad6fdf48
caps.latest.revision: 9
manager: edupont
---
# Using Queries Instead of Record Variables
In scenarios where you want to read records from multiple table, it can be a good idea to use a query instead of implementing code with record variables. Using a query can improve performance and also simplify the C/AL code that is required to perform the operation.  

## Code Example Using Record Variables  
 The following C/AL code shows an example of using record variables to retrieve and handle records from two tables. You could potentially use this code to track item movement. The code uses two record variables, `Item` and `ItemLedgerEntry`, to retrieve the first five records from table 27 Item and table 32 Item Ledger Entry where the **Entry Type** field equals **Sale**. The retrieved records are passed to and handled by the `OutputData` function.  

```  
count := 0;  
IF Item.FINDSET THEN  
  REPEAT  
    PrevDate := 0D;  
    TotalQty := 0;  
    ItemLedgerEntry.SETCURRENTKEY("Item No.","Posting Date");  
    ItemLedgerEntry.SETRANGE("Item No.",Item."No.");  
    ItemLedgerEntry.SETRANGE("Entry Type",  
      ItemLedgerEntry."Entry Type"::Sale);  
    IF ItemLedgerEntry.FINDSET THEN  
      REPEAT  
        IF (ItemLedgerEntry."Posting Date" <> PrevDate) AND (PrevDate <> 0D) THEN BEGIN  
          OutputData(1, Item."No.",Item.Description,PrevDate,-TotalQty);  
          TotalQty := 0;  
          count := count + 1;  
        END;  
        PrevDate := ItemLedgerEntry."Posting Date";  
        TotalQty := TotalQty + ItemLedgerEntry.Quantity;  
      UNTIL (ItemLedgerEntry.NEXT = 0) OR (count >= 4);  
      IF PrevDate <> 0D THEN BEGIN  
        OutputData(1, Item."No.",Item.Description,PrevDate,-TotalQty);  
        count := count +1;  
      END;  
  UNTIL (Item.NEXT = 0) OR (count >= 4);  

```  

## Corresponding Query Implementation  
 To get the same results with a query instead of record variables, you create a query and add C/AL code to an object to run the query as follows:  

1.  In Query Designer, create a query that has the following characteristics:  

    -   Include a data item for table 27 Item with columns for the **No.** and **Description** fields of the table.  

         This corresponds to the `Item` record variable in the record variable example.  

    -   Include a data item for table 32 ItemLedgerEntry with a filter row for the **Entry Type** field and columns for the **Posting Date** and **Quantity** fields.  

         This corresponds to the `ItemLedgerEntry` record variable in the record variable example.  

        > [!NOTE]  
        >  The field of a filter row is not included in the resulting dataset. For more information, see [Understanding Query Filters](Understanding-Query-Filters.md) and [How to: Set Up Filter Rows in Query Designer](How-to--Set-Up-Filter-Rows-in-Query-Designer.md).  

    -   Link the data items on the **No.** field of table 27 Item and **Item No.** field of table 32 ItemLedgerEntry by setting DataItemLink property. Set the DataItemLinkType property to **Exclude If No Matches**.  

         This corresponds to the `ItemLedgerEntry.SETRANGE("Item No.",Item."No.");` statement in the record variable example.  

    -   Set a SUM method on the **Quantity** column for calculating the total number of items.  

         This corresponds to the `TotalQty := TotalQty + ItemLedgerEntry.Quantity;` statement in the record variable example.  

     The following illustration shows the query in Query Designer.  

     ![Query that links Item and Item Legder Entry tables.](media/NAV_Query_Example_InsteadOfRecords.png "NAV\_Query\_Example\_InsteadOfRecords")  

2.  Add the following code to a codeunit that will run the query.  

```  
ItemMovements.TOPNUMBEROFROWS(5);  
ItemMovements.SETRANGE(Entry_Type,ItemMovements.Entry_Type::Sale);  
ItemMovements.OPEN;  
WHILE ItemMovements.READ DO  
  OutputData(2, ItemMovements.Item_No,ItemMovements.Description,ItemMovements.Posting_Date,ItemMovements.Sum_Quantity);  

```  

 The `ItemMovements.TOPNUMBEROFROWS(5);` statement will include only the first 5 records in the resulting dataset and corresponds to implementing the `count` variable in the record-based code example.  

 The `OutputData` function performs the same operations as the OutputData function in the record variable example.  

## See Also  
 [Queries](Queries.md)   
 [How to: Create Queries](How-to--Create-Queries.md)   
 [Working with Queries in C/AL](Working-with-Queries-in-C-AL.md)   
 [Understanding Query Filters](Understanding-Query-Filters.md)   
 [SETRANGE Function \(Query\)](SETRANGE-Function--Query-.md)   
 [OPEN Function \(Query\)](OPEN-Function--Query-.md)   
 [TOPNUMBEROFROWS Function](TOPNUMBEROFROWS-Function.md)
