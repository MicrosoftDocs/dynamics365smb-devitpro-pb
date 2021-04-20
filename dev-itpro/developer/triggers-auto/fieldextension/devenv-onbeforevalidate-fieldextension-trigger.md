---
title: "OnBeforeValidate (Field Extension) Trigger"
ms.description: "Runs before the user input is validated."
ms.author: solsen
ms.custom: na
ms.date: 04/16/2021
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

# OnBeforeValidate (Field Extension) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs before the user input is validated.


## Syntax
```
trigger OnBeforeValidate()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

This trigger is run before the default validation behavior is executed on a record field entry, which are default checks such as data type validation. An error message displays if an error occurs in the trigger code. In case of an error, the user entry is not written to the database.  

It applies to an already existing table field when it is being modified in a table extension. 

## Example

```AL
tableextension 50111 "CustomerExt" extends Customer
{
    fields
    {
        modify("Address 2")
        {
            trigger OnBeforeValidate()
            begin
                if (rec.Address = '') then
                    error('Please, input a first address before specifying a second one.');
            end;
        }
    }
}

```

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnBeforeValidate (Page Field Extension) Trigger](../pagefieldextension/devenv-onbeforevalidate-pagefieldextension-trigger.md)
