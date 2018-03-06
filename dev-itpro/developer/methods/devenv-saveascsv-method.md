---
title: "SAVEASCSV Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 21a88c17-da4e-4e3a-9cb5-2f8c4cfe2131
caps.latest.revision: 21
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SAVEASCSV Method
Saves the resulting dataset of a query as a comma separated values \(CSV\) file.  

 The following code shows the syntax of the **SAVEASCSV** method. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.  

## Syntax  

```  
[OK := ] QueryVariable.SAVEASCSV (FileName[, Format][, FormatArgument])  
```  

```  
[OK := ] QUERY.SAVEASCSV(Number, FileName[, Format][, FormatArgument)  
```  

#### Parameters  
 *QueryVariable*  
 Type: Query  

 A variable that specifies the query object.  

 *Number*  
 Type: Integer  

 The ID of the query object.  

If the query that you specify does not exist, then a run-time error occurs.  

 *FileName*  
 Type: Text  

 The path and name of the file that you want to save the query dataset to.  

 *Format*  
 Type: Integer  

 Specifies whether the columns of the resulting dataset are at fixed positions in the CSV file or separated only by a delimiter. The parameter has the following values:  

|Value|Description|  
|-----------|-----------------|  
|0|Places columns in fixed positions in lines of the CSV file. You can use this parameter to left align column values between lines in the CSV file. The following code illustrates a simple CSV example that includes two lines with three columns.<br /><br /> `aa   bbb            cccc`<br /><br /> `xxxx yyyyyyyyyyy   zzzzz`<br /><br /> You set the starting position using the *FormatArgument* parameter.|  
|1|Separates columns with a delimiter, There are no spaces between the columns. The following code illustrates a simple CSV example that includes two lines with three columns.<br /><br /> `aa;bbb;cccc`<br /><br /> `xxxx;yyyyyyyyyyy;zzzzz`<br /><br /> You specify the delimiter using the *FormatArgument* parameter. In this example, the *FormatArgument* parameter is set to **';'**.<br /><br /> **Note:** This is an optional parameter. If you omit the *Format* parameter, then columns are separated by a comma with no spaces.|  

 *FormatArgument*  
 Type: Text  

 You set the *FormatArgument* parameter based on the setting of the *Format* parameter.  

-   If the *Format* parameter is set to **0**, then the *FormatArgument* parameter specifies the starting position of each column in the dataset. The value is a comma separated string of integers that includes an integer for every column. In a CSV file, each line is evenly divided into positions for holding characters. The first integer corresponds to the starting position of the first column, the second integer corresponds to the starting position of the second column, and so on. For example, if the query includes three columns, then you could set the parameter to **'1, 5, 20'**. In CSV file, as illustrated in the following example, the first column would start at the first position, the second column at the fifth position, and the third column at the twentieth position.  

    ```  
    aa   bbb            cccc  
    xxxx yyyyyyyyyyy    zzzzz  

    ```  

    > [!NOTE]  
    >  In the CSV file, if the value for a column extends beyond the starting position of an adjacent column, then the column value is cut off where the adjacent column starts.  

-   If the *Format* parameter is set to **1**, then the *FormatArgument* parameter specifies the delimiter to use between columns. The value can be one or more characters, such as **‘,’**, **‘;’**, and **‘tab’**. If you do not specify a value, then the parameter is set to **‘,’** by default.  

## Return Value  
 Type: Boolean  

 If you omit this optional return value and if the query cannot be saved as a CSV file, then a run-time error occurs that states that the query cannot be saved. If you include a return value, then it is assumed that you will handle any errors and no run-time error occurs, even though the query is not saved.  

 **true** if the query was saved; otherwise, **false**.  

## Remarks  
 A CSV file stores data in a plain text format. When you save a query dataset as a CSV file, each row of the dataset is stored on a separate line in the file, and each column in a row is separated by a comma or another delimiter of your choice. The first line of the file will contain the column names of the query. A query column name is specified by its [Name Property](../properties/devenv-Name-Property.md).  

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
 The following example shows how to save the dataset of a query with the name **My Customers Query** as a CSV file. The file is given the name **mycustomers.csv** and is saved on the c: drive of the computer running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]. The query consists of three columns: No., Name, and City. The file is set to place the columns at the following positions: 1, 10, and 40.  

 This example requires that you do the following:  

-   Create a query called **My Customer Query** that is based on table **18 Customer** and contains the **No**, **Name**, and **City** columns. <!--NAV For more information, see [How to: Create Queries](How-to--Create-Queries.md). -->  

-   Create the following variables and text constant:  

    |Variable name|DataType|Subtype|  
    |-------------------|--------------|-------------|  
    |OK|Boolean|Not applicable|  
    |MyCustomerQuery|Query|My Customer Query|  

    |Text constant name|ENU Value|  
    |------------------------|---------------|  
    |Text000|Query was not saved.|  

```  
OK := MyCustomerQuery.SAVEASCSV('c:\mycustomers.csv', 0, '1,10,40');  
IF NOT OK THEN  
  ERROR(Text000);  
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
