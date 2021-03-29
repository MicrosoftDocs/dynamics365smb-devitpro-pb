---
title: "Record.FindFirst Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# Record.FindFirst Method
> **Version**: _Available or changed with runtime version 1.0._

Finds the first record in a table based on the current key and filter.


## Syntax
```
[Ok := ]  Record.FindFirst()
```

## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method should be used instead of **Find**\('-'\) when you only need the first record.  
  
 You should only use this method when you explicitly want to find the first record in a table or set. Do not use this method in combination with **Repeat**.. **Until**.  

Calling FindFirst on an empty table from the [OnNewRecord trigger](../../triggers/devenv-onnewrecord-trigger.md) causes the [!INCLUDE[server](../../includes/server.md)] to throw an exception, and the AL execution stops. However, the client suppresses this error and does not show any error message to the user. Therefore, when using FindFirst inside this trigger, you should add code that conditionally verifies whether a record was found, and if not, notify the user with a message. For example:

```al
if not MyRecord.FindFirst then
    Error('error message');
```
## Example
 
This example also assumes that you have a **ConfigurePost** method.
 
```al
var
    SalesSetupRec: Record "Sales & Receivables Setup";
begin
    // Read the first record only. 
    if SalesSetupRec.FindFirst then
        begin
           ConfigurePost(SalesSetupRec);
        end;
end;

```  
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)