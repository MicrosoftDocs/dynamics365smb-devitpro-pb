---
title: "OPEN Method (Query)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f9c876a7-a29c-4b4c-a255-e67747a0e6a2
caps.latest.revision: 16
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# OPEN Method (Query)
Runs a query object and generates a dataset that can be read.  

 The following code shows the syntax of the OPEN method. *Query* is a variable of the Query data type that specifies the query object.  

## Syntax  

```  
[Ok :=] Query.OPEN  
```  

## Return Value  
 Type: Boolean  

 **true** if the query was opened without errors; otherwise, **false**.  

 If you omit this optional return value and if the query does not execute successfully, then a run-time error occurs. If you include a return value, then it is assumed that you will handle any errors and no run-time error occurs when the **OPEN** method is called. However, a run-time error will occur if the **READ** method is called afterward.  

## Remarks  
 When the **OPEN** method is called, the query is executed and the *Query* variable is put in a state in which the resulting dataset can be read by the **READ** method. The **OPEN** method has the following behavior:  

-   To apply filters for the **SETFILTERS** method or **SETRANGE** method, you call the **SETFILTERS** method or **SETRANGE** method before the **OPEN** method.  

-   To read a row from the dataset, you must call the **OPEN** method before the **READ** method, as shown in the following code example.  

    ```  
    Query.SETFILTER(Column1, String);  
    Query.OPEN;  
    Query.READ;  
    ```  

-   To close an open query and return it to the initialized state, you can call the **CLOSE** method. However, you can call the **OPEN** method multiple times without calling the **CLOSE** method because the **OPEN** method implicitly calls the **CLOSE** method if the query dataset is currently in an opened state.  

    -   If the **OPEN** method is called on a query that is already in the opened or in the reading state, then the query dataset is closed, and then the query is executed again. To continue to loop through the dataset, the **READ** method must be called again. The next **READ** method call returns the first row in the dataset, as shown in the following code example.  

        ```  
        // Opens the query and generates a dataset.  
        Query.OPEN;  
        Query.READ;  
        // Closes the query and reopens it.  
        Query.OPEN;  
        // Reads the first row in the new dataset.  
        Query.READ;  

        ```  

    -   **OPEN** method does not clear any filters that were set by the **SETFILTER** or **SETRANGE** methods on a previous **OPEN** call. If you want to clear the filters, then you must call the **CLEAR** method on the query variable.  

        ```  
        Query.SETFILTER(Column1, String);  
        Query.OPEN;  
        Query.READ;  
        CLEAR(query);  
        Query.OPEN;  
        Query.READ;  
        ```  

-   You are required to call the **OPEN** method before the [SAVEASXML Method](devenv-SAVEASXML-Method.md) or [SAVEASCSV Method](devenv-SAVEASCSV-Method.md). The **SAVEASXML** and **SAVEASCSV** methods automatically close the current query dataset and initialize a new instance of the query.  

## Example  
 The following example demonstrates how to use the **OPEN** method on a query. The example code sets filters on the query, opens the query, and then reads the dataset. For each row in the dataset, a message box is displayed that contains the values of the columns in the row.  

 This example requires that you do the following:  

1.  Create a query called **Customer\_SalesQuantity** that links table **18 Customer** with table  **37 Sales Lines** from the [!INCLUDE[demolong](../includes/demolong_md.md)]. Include columns for the **Name** and **No.** fields from the Customer table and the **Quantity** field from Sales Lines table.  

     <!--NAV For step-by-step instructions for creating this query, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md).-->  

2.  Create the following variable and text constant.  

    |Variable name|DataType|Subtype|  
    |-------------------|--------------|-------------|  
    |MyQuery|Query|Customer\_SalesQuantity|  

    |Text constant name|ENU Value|  
    |------------------------|---------------|  
    |Text000|Customer name = %1, Quantity = %2|  

 The following AL code opens the query, reads each row of the dataset, and then displays a message that uses the content of the row. You can add the code to a codeunit, and then run the codeunit to see the results.  

```  
// Sets a filter to display only sales quantities greater than 20.  
MyQuery.SETFILTER(Quantity, '>20');   
// Runs the query.  
MyQuery.OPEN;  
// Reads each row in the dataset and displays a message with column values.  
// Stops reading when there are no more rows remaining in the dataset (READ is FALSE).  
WHILE MyQuery.READ DO  
BEGIN  
  MESSAGE(Text000, MyQuery.Name, MyQuery.Quantity);  
END;  
MyQuery.CLOSE;  
```  

 When the code is run, a message that resembles the following appears for each row in the dataset:  

 **Customer name = The Device Shop, Quantity = 30**  

## See Also  
 <!--Links [How to: Create Queries](How-to--Create-Queries.md)  
 [Working with Queries in AL](Working-with-Queries-in-AL.md)-->  
 [Query Object](../devenv-query-object.md)
