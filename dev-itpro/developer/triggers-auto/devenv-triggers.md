---
title: "Triggers Overview"
ms.custom: na
ms.date: 04/29/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Triggers Overview

This section describes the triggers that are available to developers in [!INCLUDE [prod_short](../../includes/prod_short.md)]. Use the table of contents to scan the triggers, or use **Filter by title** to find a trigger if you know its name.

Triggers activate a method when a certain event occurs. When AL methods are run because of a predefined event on either an object or a control, the event triggers the method. Together the event and method make a trigger.

Triggers are useful for doing calculations and validations. Compared to properties, they provide a more diverse, effective way of doing such operations. For example, you can use triggers in reports to control how data is selected and retrieved.

## Coding triggers

There are different triggers for the various AL object types. Some triggers are set on the object-level, while others are set on the controls. For example, a table has some triggers on the table object and other triggers on field controls. Or consider reports, which have some triggers on the report object and some on the data items. Trigger are typically added at the end the code block for the object or control. Triggers have the following syntax:

```al
trigger OnWhat()
var
    myVariable: type;
begin
    // Custom code
end;
```

## Snippet support

Typing the shortcut `ttrigger` will create the basic layout for a trigger when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](../includes/intelli_shortcut.md)]

## Example

The following example shows the basic trigger layout for a table object.

```al
table 50100 MyTable
{
   
    fields
    {
        field(1;MyField; Integer)
        {
            // Field triggers
            trigger OnLookup()
            var
                myInt: Integer;
            begin
                
            end;
        }
    }
    
    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    // Table object triggers
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;  
}
```

## See Also

[Methods](../methods-auto/library.md)  
[Properties](../properties/devenv-properties.md)