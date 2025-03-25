---
title: "AppSourceCop Error AS0001"
description: "Tables and table extensions that have been published must not be deleted."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0001
Tables and table extensions that have been published must not be deleted.

## Description
Tables and table extensions that have been published must not be deleted. This might break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule validates tables independently of their Accessibility or ObsoleteState, because tables are always used when synchronizing the schema defined in the extension to the database.

This rule validates table extensions independently of the ObsoleteState of their target tables. Table extensions extending a table, which is marked with obsolete state Removed must be preserved, since they're still contributing to the database schema defined by the extension. If the target table of an extension has been deleted, then the table extension can be deleted as well.

From version 26 and later, there is an exception for table extensions targeting Microsoft tables which have either been deleted or marked with `ObsoleteState = Removed`. In this case, it is possible to remove the table extensions as long as the extension requires a runtime with version '13.0' and higher.

## How to fix this diagnostic?

Revert the changes done by adding back the tables and table extensions that have been removed.

## Examples not triggering this rule

### Example 1 - Removing a table extension on a Microsoft table which is obsolete removed

Version 1 of the extension

```
// The target table is removed from BC 15.0 and later
tableextension 50100 MyExtension extends "Bank Data Conversion Pmt. Type"
{
    fields
    {
        field(50100; "MyField"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }
}
```

Version 2 of the extension
```
// The table extension is removed
```

### Example 2 - Targeting runtime less than 13.0

Version 1 of the extension

```
// The target table is removed from BC 15.0 and later
tableextension 50100 MyExtension extends "Bank Data Conversion Pmt. Type"
{
    fields
    {
        field(50100; "MyField"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }
}
```

app.json
```
{
    ....,
    "runtime": "12.0"
}
```

In this case, it is not possible to just remove the table extension. A new version of the application needs to be created which targets runtime 13.0.

Version 2 of the extension

```
// table extension is removed
```

app.json
```
{
    ....,
    "runtime": "13.0",
    "application": "24.0.0.0" // or higher
}
```

Then for compatibility with the older runtime, hotfixes must be used for the previous version of the application which is compatible with the older runtimes.


## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
