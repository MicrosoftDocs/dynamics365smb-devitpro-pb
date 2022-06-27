---
title: "Record.Ascending([Boolean]) Method"
description: "Gets or sets the order in which the system searches through a table."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.Ascending([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the order in which the system searches through a table.


## Syntax
```AL
[Ascending := ]  Record.Ascending([Ascending: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] Ascending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


## Return Value
*[Optional] Ascending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example 1

The following example returns a value that indicates the current search order of the Customer table, to which `MyRecord` record belongs. The return value is stored in the `IsAscending` variable and displayed in a message box. In this example, the value **Yes** is displayed in the message box, which means that the search order is ascending. This is because the `SetAscending` parameter is not used.
  
```al
codeunit 50111 IsAscending
{
    trigger OnRun()
    var
        MyRecord: Record Customer;
        IsAscending: Boolean;
        Text000: Text;

    begin
        IsAscending := MyRecord.Ascending;
        Message(Text000, IsAscending);
    end;
}

```
  
## Example 2

The following example sets the current sort order to descending by setting the `SetAscending` parameter to **false**. The value displayed in the message box is **No**.  

```al
codeunit 50111 IsAscending
{
    trigger OnRun()
    var
        MyRecord: Record Customer;
        IsAscending: Boolean;
        Text000: Text;

    begin
        IsAscending := MyRecord.Ascending(false);
        Message(Text000, IsAscending);
    end;
}

```  

## See Also
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)