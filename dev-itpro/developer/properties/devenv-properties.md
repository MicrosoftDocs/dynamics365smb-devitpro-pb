---
title: "Properties Overview"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Properties Overview

This section describes the properties that are available to developers in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] for controlling the behavior of objects, like tables, pages, and reports. Use the table of contents to scan the properties, or use search to find a property if you know its name.

There are different properties for various the AL object types. Some properties can be set on the object-level, and others pertain to specific controls of the object. Properties are added at the beginning of the code for the object or control, after the its definition, by using the syntax: `Property_name = value;`. For example:

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
> Use Ctrl+Space to trigger IntelliSense and get assistance on selecting a property and help on its syntax.

<!--
`Promoted = true;`<br>
`PromotedCategory = Process;`<br>
`ApplicationArea = All;`


In the sections below, properties are sorted according to the object(s) they apply to.

- [Table and Table Extension Properties](devenv-table-properties.md)  
- [Page and Page Extension Properties](devenv-page-property-overview.md)
- [Codeunit Properties](devenv-codeunit-properties.md)  
- [Query Properties](devenv-query-properties.md)  
- [Report Properties](devenv-report-properties.md)  
- [XMLPort Properties](devenv-xmlport-properties.md)  
- [Control Add-In Properties](devenv-control-addin-properties.md)
- [Enum Properties](devenv-enum-properties.md)
- [View Properties](devenv-view-properties.md)
- [Profile Properties](devenv-profile-properties.md)
- [Integrating with Dynamics 365 for Sales](../devenv-integrating-dynamics-365-for-sales-extension-development.md)
-->
## See Also

[Methods](../methods-auto/library.md)  
[Triggers](../triggers-auto/devenv-triggers.md)  