---
title: "Record.Ascending([Boolean]) Method"
description: "Gets or sets the order in which the system searches through a table."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
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

## Remarks

The `Ascending` method controls the sort order used when traversing records in a table. This method works in conjunction with the current key set on the record and any filters that have been applied, including security filters.

### How it works

- When you call `Ascending` without a parameter, it returns the current sort order (true for ascending, false for descending)
- When you call `Ascending` with a boolean parameter, it sets the sort order for the entire record set
- The sort order applies to the current key set by [SetCurrentKey](record-setcurrentkey-method.md) or the primary key if no key has been explicitly set
- The method affects how methods like [Next](record-next-method.md) and [Find](record-find-method.md) traverse through the filtered record set

### Relationship to permissions and security filters

While the `Ascending` method itself doesn't directly check or enforce permissions, it's important to understand that:

- The sort order applies to the records visible to the current user, which may be limited by [security filters](record-securityfiltering-method.md)
- Permission checks happen when you attempt to read records, not when you set the sort order
- If you have [partial read permissions](record-readpermission-method.md) due to security filters, the `Ascending` method will sort only the records you're permitted to see
- Permission errors typically occur during record traversal (for example, with `Find`, `Next`) rather than when setting the sort order

Learn more in [ReadPermission Method](record-readpermission-method.md), [SecurityFiltering Method](record-securityfiltering-method.md), and [SetPermissionFilter Method](record-setpermissionfilter-method.md).

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

## Related information
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)