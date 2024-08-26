---
title: "Query.SaveAsXml(Integer, Text) Method"
description: "Saves the resulting data set of a query as an .xml file."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Query.SaveAsXml(Integer, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves the resulting data set of a query as an .xml file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Query.SaveAsXml(Number: Integer, FileName: Text)
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the query object that you want to save as an .xml file. If the query that you specify does not exist, then a run-time error occurs.  

*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path and name of the file that you want to save the query to.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the SaveAsXml succeeded, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
When the **SaveAsXML** method is called, the dataset is generated and then saved in XML format in the file and location that is designated by the *FileName* parameter.

## Open, Read, or Close semantics

The **SaveAsXML** method can be called at any place in the code and does not require that the **Open**, **Read**, or **Close** methods are called before it. For more information, see [**Open**, **Read**, or **Close** semantics with the **SaveAsXML** method](./query-saveasxml-integer-outstream-method.md#open-read-or-close-semantics-with-the-saveasxml-method). 

## Example  
The following example shows how to save a query with the name **My Customer Query** as an .xml file. The file is given the name **myquery.xml** and is saved on the c: drive of the computer running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)].  

```al
var
    MyCustomerQuery: Query "My Customer Query";
    OK: Boolean;
    Text000: Label 'Query was not saved.';
begin
    OK := MyCustomerQuery.SaveAsXML(Query::MyCustomerQuery, 'c:\myquery.xml');  
    if not OK then  
      Error(Text000);  
end;
```  

If the file cannot be saved, then the follow message appears:  

 **Query not saved.**

## See Also

[Query Data Type](query-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)