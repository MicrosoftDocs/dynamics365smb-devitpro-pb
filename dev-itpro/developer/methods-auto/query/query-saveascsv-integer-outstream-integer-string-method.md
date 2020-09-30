---
title: "Query.SaveAsCsv Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Query.SaveAsCsv Method
Saves the resulting data set of a query as a comma separated values (CSV) file.


## Syntax
```
[Ok := ]  Query.SaveAsCsv(Number: Integer, OutStream: OutStream [, Format: Integer] [, FormatArgument: String])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the query object. If the query that you specify does not exist, then a run-time error occurs.
        
*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The stream that you want to save the query as CSV to.
        
*Format*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies whether the columns of the resulting data set are at fixed positions in the CSV file or separated only by a delimiter.
        
*FormatArgument*  
&emsp;Type: [String](../string/string-data-type.md)  
You set the FormatArgument parameter based on the setting of the Format parameter. If the Format parameter is set to 0, then the FormatArgument parameter specifies the starting position of each column in the data set. The value is a comma separated string of integers that includes an integer for every column. In a CSV file, each line is evenly divided into positions for holding characters. The first integer corresponds to the starting position of the first column, the second integer corresponds to the starting position of the second column, and so on.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 A CSV file stores data in a plain text format. When you save a query dataset as a CSV file, each row of the dataset is stored on a separate line in the file, and each column in a row is separated by a comma or another delimiter of your choice. The first line of the file will contain the column names of the query. A query column name is specified by its [Name Property](../../properties/devenv-name-property.md).  

 When the **SAVEASCSV** method is called the query dataset is generated and then saved in CSV format to the file that is designated by the *FileName* parameter.  

 To apply filters with the **SETFILTER** and **SETRANGE** methods, the SAVEASCSV method must be called after **SETFILTER** and **SETRANGE** methods, as shown in the following example.  

```  
// Sets a filter on the Quantity column of the query  
Query.SETFILTER(Quantity, '>50');  

// Opens a new query that is filtered by the SETFILTER method and saves the dataset  
Query.SAVEASCSV('c:\test.csv');  
```  

 The **SAVEASCSV** method can be called at any place in the code and does not require that the **CLOSE**, **OPEN** or **READ** methods are called before it. When the **SAVEASCSV** method is called, a new instance of the query is created. The query is implicitly opened, read, and closed. If there is currently a dataset in the opened state when the **SAVEASCSV** method is called, then that instance is closed. This means that the following code is illegal because the query is not open on the second **READ** call.  

```  
Query.OPEN;  
Query.READ;  
Query.SAVEASCSV('c:\test.csv');  
Query.READ;   
```  

 The correct code for this example is as follows.  

```  
Query.OPEN;  
Query.READ;  
Query.SAVEASCSV('c:\test.csv');  
Query.OPEN;  
Query.READ;   
```  

## Example  
 The following example shows how to save the dataset of a query with the name **My Customers Query** as a CSV file. The file is given the name **mycustomers.csv** and is saved on the c: drive of the computer running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)]. The query consists of three columns: No., Name, and City. The file is set to place the columns at the following positions: 1, 10, and 40.  

 This example requires that you create a query called **My Customer Query** that is based on table **18 Customer** and contains the **No**, **Name**, and **City** columns. <!--NAV For more information, see [How to: Create Queries](How-to-Create-Queries.md). -->  

```
  var
    MyCustomerQuery: Query "My Customer Query";
    OK: Boolean;
    Text000: Label 'Query was not saved.';
begin
    OK := MyCustomerQuery.SAVEASCSV('c:\mycustomers.csv', 0, '1,10,40');  
    if not OK then  
          ERROR(Text000);  
end;
```  

 The following code shows an example of the content of the saved file.  

```  
No       Name                          City  
01121212 Spotsmeyer's Furnishings      Miami  
01445544 Progressive Home Furnishings  Chicago  
01454545 New Concepts Furniture        Atlanta  
01905893 Candoxy Canada Inc.           Thunder Bay  
01905899 Elkhorn Airport               Elkhorn  
01905902 London Candoxy Storage Campus London  

```  

 If for some reason the file cannot be saved, then the message **Query was not saved.** appears.


## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)