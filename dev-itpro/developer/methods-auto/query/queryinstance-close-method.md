---
title: "Query.Close Method"
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
# Query.Close Method
> **Version**: _Available from runtime version 1.0._

Closes a query data set and returns the query instance to the initialized state. The following code shows the syntax of the CLOSE method.  Query is a variable of the Query data type that specifies the query object.


## Syntax
```
 Query.Close()
```

## Parameters
*Query*
&emsp;Type: [Query](query-data-type.md)
An instance of the [Query](query-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The **CLOSE** method does not clear any filters that are set by the SETFILTERS method. If you want to clear the filters, then you must call the CLEAR method.  

 In most cases, you do not have to call the **CLOSE** method explicitly. The **CLOSE** method is called implicitly when the following conditions are true:  

-   When the query variable goes out of scope.  

-   When the **OPEN** method is called on a dataset that is currently open.  

-   When the [SETFILTER Method \(Query\)](../../methods-auto/query/queryinstance-setfilter-method.md)  or [SETRANGE Method \(Query\)](../../methods-auto/query/queryinstance-setrange-method.md) are called on a dataset that is currently open.  

## Example  
 The following example demonstrates how to use the **CLOSE** method on a query. The example code sets filters on the query, opens the query, and then reads the dataset. For each row in the dataset, a message box is displayed that contains the values of the columns in the row.  

 This example requires that you create a query called **Customer\_SalesQuantity** that is links table **18 Customer** with table  **37 Sales Lines** from the [!INCLUDE[demolong](../../includes/demolong_md.md)]. Include columns for the **Name** and **No.** fields from the Customer table and the **Quantity** field from Sales Lines table.  


 The following AL code opens the query, reads each row of the dataset, and then closes the query. You can add the code to a codeunit, and then run the codeunit to see the results.  

```  
var
  MyQuery: Query "Customer SalesQuantity";
  Text000: Label 'Customer name = %1, Quantity = %2';
begin
    // Sets a filter to display only sales quantities greater than 20.  
    MyQuery.SETFILTER(Quantity, '>20');   
    // Runs the query.  
    MyQuery.OPEN;  
    // Reads each row in the dataset and displays a message with column values.   
    // Stops reading when there are no more rows remaining in the dataset (READ is FALSE).  
    while MyQuery.READ do  
    begin  
      MESSAGE(Text000, MyQuery.Name, MyQuery.Quantity);   
    end;  
    MyQuery.CLOSE;  
end;
```  

## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)