---
title: "Query.SaveAsXml(Integer, OutStream) Method"
description: "Saves the resulting data set of a query as an .xml file."
ms.author: solsen
ms.date: 08/15/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Query.SaveAsXml(Integer, OutStream) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves the resulting data set of a query as an .xml file.


## Syntax
```AL
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
**true** if the SaveAsXml succeeded, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

When the **SaveAsXML** method is called, the dataset is generated as XML and streamed to the OutStream object designated by the *OutStream* parameter.  

## **Open**, **Read**, or **Close** semantics with the **SaveAsXML** method

The **SaveAsXML** method can be called at any place in the code and does not require that the **Open**, **Read**, or **Close** methods are called before it. When the **SaveAsXML** method is called, a new instance of the query is created. The query is implicitly opened, read, and closed. If there is currently a dataset in the opened state when the **SaveAsXML** method is called, then that instance is closed. This means that the following code is in-correct because the query is not open on the second **Read** call.  

```al 
// Not correct way to use Query.SaveAsXML
Query.Open;  
Query.Read;  
Query.SaveAsXML(myOutStream);  
// Query is now closed, so next read call will fail
Query.Read;   
```  

The correct code for this example is as follows.  

```al
// Correct way to use Query.SaveAsXML
Query.SaveAsXML(myOutStream);  
Query.Open;  
Query.Read;   
```  


## Example

The following example shows how to get data from a query with the name **My Customer Query** into an outstream for further processing. 

```al
var
    MyCustomerQuery: Query "My Customer Query";
    myOutStream: OutStream;
    OK: Boolean;
    Text000: Label 'Query was not saved.';
begin
    OK := MyCustomerQuery.SaveAsXML(Query::MyCustomerQuery, myOutStream);  
    if not OK then
          Error(Text000);  
end;
```  


## See Also
[Query Data Type](query-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)