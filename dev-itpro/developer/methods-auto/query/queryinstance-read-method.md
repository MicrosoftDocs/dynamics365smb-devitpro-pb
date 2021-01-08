---
title: "Query.Read Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Query.Read Method
> **Version**: _Available from runtime version 1.0._

Reads data from a row in the resulting data set of a query.


## Syntax
```
[Ok := ]  Query.Read()
```

## Parameters
*Query*
&emsp;Type: [Query](query-data-type.md)
An instance of the [Query](query-data-type.md) data type.

## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 When the **Read** method is called, the next row in the dataset query is retrieved. While in the reading state, values of columns in the row can be accessed by calling *Query.ColumnName*, where *Query* is the query type variable that specifies the query object and *ColumnName* is the column of the query.  
  
 To read a row in the dataset, you must call the **Open** method before the **Read** method. After the **Read** method call, columns can be accessed as shown in the following code example.  
  
```  
query.Open;  
query.Read;  
query.ColumnName  
  
```  
  
 You can call the **Read** method multiple times after the **Open** method to read consecutive rows in the dataset. The first **Read** method call retrieves the first row from the resulting dataset and each subsequent **Read** method retrieves the next row from the dataset. For example, the second **Read** method call retrieves the second row, the third **Read** method call retrieves the third row, and so on.  
  
```  
Query.Open;  
// Reads the first row in the dataset.  
Query.Read;   
// Accesses a column in the first row of the dataset.  
Query.ColumnName  
// Reads the second row in the dataset.  
Query.Read;   
// Accesses a column in the first row of the dataset.  
Query.ColumnName  
```  
  
> [!NOTE]  
>  If the **Read** method is called and there are no more rows in the dataset, then the **Read** method returns **false**.  
  
## Example  
 The following example demonstrates how to use the **Read** method on a query. The example code sets filters on the query, opens the query, and then reads the dataset. For each row in the dataset, a message box is displayed that contains the values of the columns in the row.  
  
 This example requires that you create a query called **Customer\_SalesQuantity** that is links table **18 Customer** with table  **37 Sales Lines** from the [!INCLUDE[demolong](../../includes/demolong_md.md)]. Include columns for the **Name** and **No.** fields from the Customer table and the **Quantity** field from Sales Lines table.  
  
  <!--NAV For step-by-step instructions for creating this query, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).-->  
  
 The following AL code opens the query, reads each row of dataset, and then displays a message that has the content of the row. You can add the code to a codeunit, and then run the codeunit to see the results.  
  
``` 
var
  MyQuery: Query "Customer SalesQuantity";
  Text000: Label 'Customer name = %1, Quantity = %2'; 
begin
    // Sets a filter to display only sales quantities greater than 20.  
    MyQuery.SetFilter(Quantity, '>20');   
    // Runs the query.  
    MyQuery.Open;  
    // Reads each row in the dataset and displays message with column values.  
    // Stops reading when there are no more rows remaining in the dataset (Read is FALSE).  
    while MyQuery.Read do  
    begin  
      Message(Text000, MyQuery.Name, MyQuery.Quantity);   
    end;  
    // Closes the query.  
    MyQuery.Close;  
end;
```

## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)