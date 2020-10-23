---
title: "Fields must not change name"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0005
Fields must not change name  

## Description
Fields must not change name. This might break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Examples of non-valid name changes

### Example 1 - Field renamed

Version 1.0 of the app:
```
table 50 MyTable
{
    fields
    {
        field(1; Identifier; Integer) { }
    }
}
```

Version 2.0 of the app:
```
table 50 MyTable
{
    fields
    {
        field(1; Id; Integer) { }
    }
}
```
The field `Identifier` was renamed to `Id`, this is not allowed and will trigger this rule.

### Example 2 - Changed capital letters
Version 1.0 of the app:
```
table 50 MyTable
{
    fields
    {
        field(1; Id; Integer) { }
    }
}
```

Version 2.0 of the app:
```
table 50 MyTable
{
    fields
    {
        field(1; ID; Integer) { }
    }
}
```
The field `Id` had its casing changed to `ID`, this is not allowed and will trigger this rule.

### Example 3 - Rename currently obsolete field
Version 1.0 of the app:
```
table 50 MyTable
{
    fields
    {
        field(10; "Cust. Rep."; Text[40])
        {
            ObsoleteState = Pending;
        }
    }
}
```

Version 2.0 of the app:
```
table 50 MyTable
{
    fields
    {
        field(10; "Alt. Name"; Text[40])
        {
            ObsoleteState = Pending;
        }
    }
}
```
The field `Cust. Rep.` was renamed to `Alt. Name`. It is not allowed to change the name of a field if it is obsolete in both the previous and the new version, because the field is still part of the extension's API. 


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  