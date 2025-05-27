---
title: Properties overview
description: Explore Dynamics 365 Business Central Developer Properties for objects like tables, pages, and reports. Maximize efficiency with our guide.
ms.date: 04/26/2024
ms.topic: overview
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Properties overview

This section describes the properties that are available to developers in [!INCLUDE [prod_short](../includes/prod_short.md)] for controlling the behavior of objects, like tables, pages, and reports.

> [!TIP]  
> If you already know the name of, for example, a data type, method, property, or trigger, use the **Filter by title** field in the upper left corner, above the table of contents to find the topic faster. Otherwise, you can scan the table of contents to find it.

There are different properties for various AL object types. Some properties can be set on the object-level, and others pertain to specific controls of the object. Properties are added at the beginning of the code for the object or control, after the its definition, by using the syntax: `Property_name = value;`. For example:

```al
page 50100 MyPage
{
    // Page object properties
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Name)
                {
                    // Field properties
                    ApplicationArea = All;                                     
                }
            }
        }
    }
```

> [!TIP]
> Use <kbd>Ctrl</kbd>+<kbd>Space</kbd> to trigger IntelliSense and get assistance on selecting a property and help on its syntax.

## Related information

[Methods](../methods-auto/library.md)  
[Triggers](../triggers-auto/devenv-triggers.md)  
