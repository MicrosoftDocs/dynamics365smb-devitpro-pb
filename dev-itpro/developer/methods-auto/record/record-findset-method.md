---
title: "Record.FindSet([Boolean] [, Boolean]) Method"
description: "Finds a set of records in a table based on the current key and filter."
ms.author: solsen
ms.custom: na
ms.date: 01/05/2022
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
# Record.FindSet([Boolean] [, Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Finds a set of records in a table based on the current key and filter.


## Syntax
```AL
[Ok := ]  Record.FindSet([ForUpdate: Boolean] [, UpdateKey: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] ForUpdate*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Set this parameter to true if you want to modify any records in the set; otherwise, set the parameter to false.If you set this parameter to true, then the LOCKTABLE method (Record) is immediately run on the table before the records are read. If you set this parameter to false, then you can still modify the records in the set, but these updates will not be performed optimally. The default value is false.
          
*[Optional] UpdateKey*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Set this parameter to true if you want to modify any field value within the current key. This parameter only applies if the ForUpdate parameter is true. If you set this parameter to false, then you can still modify the records in the set, but these updates will not be performed optimally. The default value is false.
          


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You should use this method only when you explicitly want to loop through a recordset. You should only use this method in combination with `repeat..until`.  
  
Furthermore, `FindSet` only allows you to loop through the recordset from the top down. If you want to loop from the bottom up, you should use `Find(‘+’)`.  
  
The general rules for using `FindSet` are the following:  
  
- `FindSet(False,False)` - Read-only. This uses no server cursors and the record set is read with a single server call.  
- `FindSet(True,False)` - This is used to update non-key fields. This uses a cursor with a fetch buffer similar to `Find(‘-’)`.  
  
- `FindSet(True,True)` - This is used to update key fields.  
  
This method is designed to optimize finding and updating sets. If you set any or both of the parameters to **false**, you can still modify the records in the set but these updates will not be performed optimally.  

This method works the same way as the [FindSet Method (RecordRef)](../recordref/recordref-findset-method.md).

## Examples

The following examples are meant for illustration purposes of the usage of the `FindSet` method only and are not meant to illustrate best practices.

## Example 1

This example shows how to use the `FindSet` method to loop through a set without updating it, but running a validation on each record. This example requires a `VATRegistrationValidation` method, which is not included in this example:

```al
procedure Example_1()
    var
        CompanyInformation: Record "Company Information";
        Customer: Record Customer;
    begin
        CompanyInformation.Get();
        Customer.SetFilter("Country/Region Code", '<>%1', CompanyInformation."Country/Region Code");
        if Customer.FindSet() then
            repeat
                Customer.VATRegistrationValidation();
            until Customer.Next() = 0;
    end;


```

## Example 2

This example shows how to use the `FindSet` method function to loop through a set and update a field that is *not within* the current key.

```al
procedure Example_2()
    var
        Customer: Record Customer;
        SalesLine: Record "Sales Line";
    begin
        Customer.FindFirst();
        SalesLine.SetRange("Sell-to Customer No.", Customer."No.");
        SalesLine.SetFilter("Bill-to Customer No.", '<>%1', Customer."No.");
        if Salesline.FindSet(true, false) then
            repeat
                SalesLine."Bill-to Customer No." := Customer."No.";
                SalesLine.Modify();
            until SalesLine.Next() = 0;
    end;

```

## Example 3

This example shows how to use the `FindSet` method to loop through a set and update a field that is *within* the current key.

```al
procedure Example_3(SalesLine: Record "Sales Line")
    var
        SalesShptLine: Record "Sales Shipment Line";
        SalesShptLine2: Record "Sales Shipment Line";
    begin
        SalesShptLine.SetCurrentKey("Order No.", "Order Line No.");
        SalesShptLine.SetRange("Order No.", SalesLine."Document No.");
        SalesShptLine.SetRange("Order Line No.", SalesLine."Line No.");
        if SalesShptLine.FindSet(true, true) then
            repeat
                SalesShptLine2 := SalesShptLine;
                SalesShptLine2."Order No." := '';
                SalesShptLine2."Order Line No." := 0;
                SalesShptLine2.Modify();
            until SalesShptLine.Next = 0;
    end;

```


## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)