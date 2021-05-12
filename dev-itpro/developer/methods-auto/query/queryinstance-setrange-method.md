---
title: "Query.SetRange Method"
description: "Sets a filter on a range of values on a column of a query data set."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Query.SetRange Method
> **Version**: _Available or changed with runtime version 1.0._

Sets a filter on a range of values on a column of a query data set.


## Syntax
```
 Query.SetRange(Column: Any [, FromValue: Any] [, ToValue: Any])
```
## Parameters
*Query*  
&emsp;Type: [Query](query-data-type.md)  
An instance of the [Query](query-data-type.md) data type.

*Column*  
&emsp;Type: [Any](../any/any-data-type.md)  
The name of the column in the query that you want to filter. The name is defined by the column's Name Property.
        
*FromValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The lower limit of the range. The data type of this parameter must match the data type of Column. If you set only the FromValue parameter, then the ToValue parameter is set to the same value as FromValue.
          
*ToValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The upper limit of the range. The data type of this parameter must match the data type of Column. If you omit the ToValue parameter, then the only the value that is specified for FromValue is used, which enables you to filter on a single column value instead of a range. If you omit both the FromValue and ToValue parameters, then the method removes all filters that are already set on the column.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 SetRange is a quick way to set a simple filter on a field. The SetRange method is functionally equivalent to calling *Query*.SetFilter\(ColumnName, 'FromValue..ToValue'\).  
  
 To apply filters to a dataset, the **SetRange** method must be called before the **Open**, **SaveAsXML**, and **SaveAsCSV** methods, as shown in the following example. To remove filters, you call the [Clear Method](../system/system-clear-joker-method.md) or **SetRange** without values for the *FromValue* and *ToValue* parameters.  
  
```al
Query.SetRange(Column1, FromValue, ToValue);  
Query.Open;  
Query.Read;  
Clear(Query);  
```  
  
 A call to the **SetRange** method automatically closes a query dataset that is currently open. Therefore, the following code is unauthorized and will fail because there is no open dataset for the **Read** method to read.  
  
```al
Query.Open;  
Query.Read;  
Query.SetRange(Column1, FromValue, ToValue);  
Query.Read;  
```  
  
 In addition to the **SetRange** method, you can apply filters to a query using the **SetFilter** method and the [DataItemTableFilter Property](/dynamics365/business-central/dev-itpro/developer/methods-auto/query/devenv-dataitemtablefilter-property) and [ColumnFilter Property](../../properties/devenv-columnfilter-property.md).  
  
|If the **SetRange** method...|then...|  
|-------------------------------------|-------------|  
|Sets a filter on the same field as the **DataItemTableFilter** property|The two filters are joined into a resulting filter.|  
|Sets a filter on the same field as the **ColumnFilter** property|The **SetRange** method overwrites the **ColumnFilter** property, so the filter that is set by the **SetRange** method that is applied to the dataset.|  
|Sets a filter on the same field as the **SetFilter** method|The method that is called last is applied to the dataset.|  
|Sets a filter on a field that has global filters that are applied by the **FilterGroup\(1\)** method|The filters of the **SetRange** method are added to the global filters.|  
  
 For example, a query has the following filters set on the **Quantity** column:  
  
-   **DataItemTableFilter** property: Quantity=Filter\(\<>10\)  
  
-   **ColumnFilter** property: Quantity=Filter\(\<>5\)  
  
 `Query.setRange(Quantity, 1, 15)` will result in a filter that is equivalent to: 1 \< Quantity \<15, except for 10.  
  
 <!--Links For more information about how to set filters in Query Designer, see [Understanding Query Filters](Understanding-Query-Filters.md). --> 
  
## Example  
 The following AL code example demonstrates how to use the **SetRange** method on a query. The example code sets a filter on a query column and saves the resulting dataset as a CSV file. A message also displays when the query is run that indicates the filter on the column.  
  
 This example requires that you do the following:  
  
1.  Create a query called **Customer\_SalesQuantity** that has the following characteristics:  
  
    -   Links table **18 Customer** with table **37 Sales Lines** from the [!INCLUDE[demolong](../../includes/demolong_md.md)].  
  
    -   Includes columns for the **Name** and **No.** fields from the Customer table and the **Quantity** field from Sales Lines table.  

  
2.  Create the following AL variables and text constant in the object that will run the query, such as a codeunit.  
  
    ```al
     var
        MyQuery: Query "Customer SalesQuantity";
        Text000: Label 'Customer name = %1, Quantity = %2';
    ``` 
  
 The following AL code uses the **SetRange** method to filter a query dataset over a range of values on the **Quantity** column. You can add the code to a codeunit, and then run the codeunit to see the results.  
  
```al
// Sets a filter to display only sales quantities greater than 10.  
MyQuery.SetRange(Quantity, '10', '50');  
// Sets a filter to display the columns with the value Selangorian Ltd. only.  
MyQuery.SetFilter(Name, 'Selangorian Ltd.');  
// Runs the query.  
MyQuery.Open;  
// Reads each row in the dataset and displays message with column values.  
// Stops reading when there are no more rows remaining in the dataset (Read is False).  
while MyQuery.Read do  
begin  
  Message(Text000, MyQuery.Name, MyQuery.Quantity);  
end;   
// Saves the resulting dataset as a CSV file.  
MyQuery.SaveAsCSV('c:\temp\CustomerSales.csv');  
MyQuery.Close;  
```  
  
 When the code is run, a message that resembles the following appears for each row in the dataset:  
  
 **Customer name = Selangorian Ltd., Quantity = 30**

## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)