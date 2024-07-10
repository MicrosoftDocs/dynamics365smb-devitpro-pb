---
title: "Query.SaveAsXml(Text) Method"
description: "Saves the resulting data set of a query as XML"
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Query.SaveAsXml(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves the resulting data set of a query as XML

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Query.SaveAsXml(FileName: Text)
```
## Parameters
*Query*  
&emsp;Type: [Query](query-data-type.md)  
An instance of the [Query](query-data-type.md) data type.  

*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path and name of the file that you want to save the query to.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

When the **SaveAsXML** method is called, the dataset is generated and then saved in XML format in the file and location that is designated by the *FileName* parameter.  


## **Open**, **Read**, or **Close** semantics

The **SaveAsXML** method can be called at any place in the code and does not require that the **Open**, **Read**, or **Close** methods are called before it. For more information, see [**Open**, **Read**, or **Close** semantics with the **SaveAsXML** method](./query-saveasxml-integer-outstream-method.md#open-read-or-close-semantics-with-the-saveasxml-method). 


## Example

For example code on how to use Query.SaveAsXml to save XML directly to a file, see [Query.SaveAsXml(Integer, Text) Method) Method](./query-saveasxml-integer-string-method.md).


## See Also

[Query.SaveAsXml(Integer, Text) Method) Method](./query-saveasxml-integer-string-method.md)  
[Query Data Type](query-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)