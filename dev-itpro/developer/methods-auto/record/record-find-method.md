---
title: "Record.Find Method"
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
# Record.Find Method
> **Version**: _Available or changed with runtime version 1.0._

Finds a record in a table that is based on the values stored in keys.


## Syntax
```
[Ok := ]  Record.Find([Which: String])
```
## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

*Which*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies how to perform the search. The table is searched until either a record  is found or there are no more records. Each character in this string can be present only one time. You can combine the '=', '\<', and '\>' characters. You can use the following characters:
-   =  to search for a record that equals the key values (default)
-  \>  to search for a record that is larger than the key values
-   \<  to search for a record that is less than the key values
-   +  to search for the last record in the table (+ can only be used alone)
-   -   to search for the first record in the table (- can only be used alone)
If this parameter contains '=', '\>' or '\<', then you must assign value to all fields of the current and primary keys before you call FIND.
          


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
Find retrieves the first record that meets the conditions set by *Which* and the filters associated with *Record*. The search path reflects the sort order defined by the current key. If the current key is not the primary key, several records might have the same values in current key fields. If this occurs, the sort order defined by the primary key as the search path is used.

Calling Find on an empty table from the [OnNewRecord trigger](../../triggers/page/devenv-onnewrecord-page-trigger.md) causes the [!INCLUDE[server](../../includes/server.md)] to throw an exception, and the AL execution stops. However, the client suppresses this error and does not show any error message to the user. Therefore, when using Find inside this trigger, you should add code that conditionally verifies whether a record was found, and if not, notify the user with a message. For example:

```al
if not MyRecord.Find then
    Error('error message');
```
  
## Example 1

 The following example shows how use the **Find** method to find a record in a table. The code sets the number of the record to find to 1100, which is the primary key of the record to find. The **Find** method uses the '=' parameter to find the record that has a primary value that equals the specified primary key. If the record is found, then the item number, description, and unit price of the item are displayed in a message box. Otherwise, a message that specifies that the item is not found is displayed.

```al
begin
    ItemRec."No." := '1100';
    if ItemRec.Find('=') then
        Message(Text000, ItemRec."No.", ItemRec.Description, ItemRec."Unit Price")
    else
        Message(Text001);
end;

var
    ItemRec: Record Item;
    Text000: Label 'Item No. %1.\Description: %2. Price: $%3.';
    Text001: Label 'The item was not found.';
```  
  
## Example 2

The following example defines a record variable that is named ItemRec. The **Find** method uses the '+' parameter to find the last record in the table. If the record is found, then the item number, description, and unit price of the item are displayed in a message box. Otherwise, the message that specifies that the item was not found is displayed. 

```al
begin
    if ItemRec.Find('+') then  
        Message(Text000, ItemRec."No.", ItemRec.Description, ItemRec."Unit Price")
    else
        Message(Text001);
end;

var
    ItemRec: Record Item;
    Text000: Label 'Item No. %1.\Description: %2. Price: $%3.';
    Text001: Label 'The item was not found.';
```  

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)