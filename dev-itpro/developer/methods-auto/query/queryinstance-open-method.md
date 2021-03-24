---
title: "Query.Open Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Query.Open Method
> **Version**: _Available or changed with runtime version 1.0._

Runs a query object and generates a data set that can be read. The following code shows the syntax of the OPEN method. Query is a variable of the Query data type that specifies the query object.


## Syntax
```
[Ok := ]  Query.Open()
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
 When the **Open** method is called, the query is executed and the *Query* variable is put in a state in which the resulting dataset can be read by the **Read** method. The **Open** method has the following behavior:  

-   To apply filters for the **SetFilterS** method or **SetRange** method, you call the **SetFilterS** method or **SetRange** method before the **Open** method.  

-   To read a row from the dataset, you must call the **Open** method before the **Read** method, as shown in the following code example.  

    ```al
    Query.SetFilter(Column1, String);  
    Query.Open;  
    Query.Read;  
    ```  

-   To close an open query and return it to the initialized state, you can call the **Close** method. However, you can call the **Open** method multiple times without calling the **Close** method because the **Open** method implicitly calls the **Close** method if the query dataset is currently in an opened state.  

-   If the **Open** method is called on a query that is already in the opened or in the reading state, then the query dataset is closed, and then the query is executed again. To continue to loop through the dataset, the **Read** method must be called again. The next **Read** method call returns the first row in the dataset, as shown in the following code example.  

    ```al
    // Opens the query and generates a dataset.  
    Query.Open;  
    Query.Read;  
    // Closes the query and reopens it.  
    Query.Open;  
    // Reads the first row in the new dataset.  
    Query.Read;  
    ```  

-  **Open** method does not clear any filters that were set by the **SetFilter** or **SetRange** methods on a previous **Open** call. If you want to clear the filters, then you must call the **Clear** method on the query variable.  

    ```al
    Query.SetFilter(Column1, String);  
    Query.Open;  
    Query.Read;  
    Clear(query);  
    Query.Open;  
    Query.Read;  
    ```  

-   You are required to call the **Open** method before the [SaveAsXML Method](../library.md) or [SaveAsCSV Method](../library.md). The **SaveAsXML** and **SaveAsCSV** methods automatically close the current query dataset and initialize a new instance of the query.  

## Example  
 The following example demonstrates how to use the **Open** method on a query. The example code sets filters on the query, opens the query, and then reads the dataset. For each row in the dataset, a message box is displayed that contains the values of the columns in the row.  

 This example requires that you create a query called **Customer\_SalesQuantity** that links table **18 Customer** with table  **37 Sales Lines** from the [!INCLUDE[demolong](../../includes/demolong_md.md)]. Include columns for the **Name** and **No.** fields from the Customer table and the **Quantity** field from Sales Lines table.  

<!--NAV For step-by-step instructions for creating this query, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).-->  

 The following AL code opens the query, reads each row of the dataset, and then displays a message that uses the content of the row. You can add the code to a codeunit, and then run the codeunit to see the results.  

```al
var
    MyQuery: Query "Customer SalesQuantity";
    Text000: Label 'Customer name = %1, Quantity = %2';
begin
    // Sets a filter to display only sales quantities greater than 20.  
    MyQuery.SetFilter(Quantity, '>20');   
    // Runs the query.  
    MyQuery.Open;  
    // Reads each row in the dataset and displays a message with column values.  
    // Stops reading when there are no more rows remaining in the dataset (Read is False).  
    while MyQuery.Read do  
    begin  
      Message(Text000, MyQuery.Name, MyQuery.Quantity);  
    end;  
    MyQuery.Close;  
end;
```  

 When the code is run, a message that resembles the following appears for each row in the dataset:  

 **Customer name = The Device Shop, Quantity = 30**  

## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)