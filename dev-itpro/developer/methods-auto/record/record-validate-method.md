---
title: "Record.Validate(Any [, Any]) Method"
description: "Calls the OnValidate trigger for the field that you specify."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.Validate(Any [, Any]) Method
> **Version**: _Available or changed with runtime version 1.0._

Calls the OnValidate trigger for the field that you specify.


## Syntax
```AL
 Record.Validate(Field: Any [, NewValue: Any])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
A field together with associated triggers.  

*[Optional] NewValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value to insert into Field.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Code example

The following example shows how to use the `Validate` method to validate a field in a record. The example uses the `Customer` table and validates the fields `"No."`, `Name`, `"Phone No."`, `Address`, and `City`. The `Validate` method not only assigns the value but also triggers any validation logic defined for the field in the table. This ensures that the data adheres to any business rules or constraints defined in the table. The `CustomerRec.Insert()` method is called to insert the newly created and validated record into the database. This step commits the data, making it available for use in the system.

```al
codeunit 50222 MyCodeunit
{
    local procedure ValidateCustomerFields()
    var
        CustomerRec: Record Customer;
    begin
        // Initialize the record
        CustomerRec.Init();

        // Validate and set fields
        CustomerRec.Validate("No.", '1234');
        CustomerRec.Validate(Name, 'Windy City Solutions');
        CustomerRec.Validate("Phone No.", '555-444-333');
        CustomerRec.Validate(Address, '1241 Druid Avenue');
        CustomerRec.Validate(City, 'Windy City');

        // Insert the record into the database
        CustomerRec.Insert();
    end;
}
```


## Related information
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)