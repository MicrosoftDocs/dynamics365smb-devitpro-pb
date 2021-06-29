---
title: "Query.SaveAsXml Method"
description: "Saves the resulting data set of a query as an .xml file."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# Query.SaveAsXml Method
> **Version**: _Available or changed with runtime version 1.0._

Saves the resulting data set of a query as an .xml file.


## Syntax
```
[Ok := ]  Query.SaveAsXml(Number: Integer, OutStream: OutStream)
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the query object that you want to save as an .xml file. If the query that you specify does not exist, then a run-time error occurs.
        
*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The stream that you want to save the query as XML to.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

When the **SaveAsXML** method is called, the dataset is generated and then saved in XML format in the file and location that is designated by the *FileName* parameter.  

The **SaveAsXML** method can be called at any place in the code and does not require that the **Close**, **Open**, or **Read** methods are called before it. When the **SaveAsXML** method is called, a new instance of the query is created. The query is implicitly opened, read, and closed. If there is currently a dataset in the opened state when the **SaveAsXML** method is called, then that instance is closed. This means that the following code is unauthorized because the query is not open on the second **Read** call.  

```al
Query.Open;  
Query.Read;  
Query.SaveAsXML('c:\test.xml');  
Query.Read;   
```  

The correct code for this example is as follows.  

```al
Query.Open;  
Query.Read;  
Query.SaveAsXML('c:\test.xml');  
Query.Open;  
Query.Read;   
```  

## Example

The following example shows how to save a query with the name **My Customer Query** as an .xml file. The file is given the name **myquery.xml** and is saved on the c: drive of the computer running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)].  


```al
var
    MyCustomerQuery: Query "My Customer Query";
    OK: Boolean;
    Text000: Label 'Query was not saved.';
begin
    OK := MyCustomerQuery.SaveAsXML('c:\myquery.xml');  
    if not OK then
          Error(Text000);  
end;
```  

If the file cannot be saved, then the follow message appears:  

**Query not saved.**

## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)