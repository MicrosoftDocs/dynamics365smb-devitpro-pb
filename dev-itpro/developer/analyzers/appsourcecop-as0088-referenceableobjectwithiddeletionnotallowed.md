---
title: "AppSourceCop Rule AS0088"
ms.author: solsen
ms.custom: na
ms.date: 05/05/2021
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
# AppSourceCop Rule AS0088
Objects with an ID that can be referenced and which have been published must not be deleted.

## Description
Objects that can be referenced by ID and which have been published must not be deleted. This might break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?
Reverting the change will fix this diagnostic. If deleting the object is required, the recommended approach is to mark it first as [ObsoleteState Pending](../properties/devenv-obsoletestate-property.md). 
You can then remove the object in a later version, or mark it as [ObsoleteState Removed](../properties/devenv-obsoletestate-property.md) if the object is a table. You cannot mark a table `ObsoleteState = Removed` if the table is not `ObsoleteState = Pending` in the previous version.

## Code Examples
### Example 1: Deleting a Codeunit triggers the rule
Version 1.0 of the extension:
```AL
codeunit 50120 Foo_MyCodeunit
{
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```
In version 2.0 of the extension, codeunit 50120 has been deleted. This will trigger rule AS0088.

### Example 2: Deleting an obsolete pending Codeunit
Version 2.0 of the extension:
```AL
codeunit 50120 Foo_MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use 50121 Foo_MyNewCodeunit instead.';
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}

codeunit 50121 Foo_MyNewCodeunit
{
    procedure SomeProcedure()
    begin
        // Business logic.
    end;
}
```
In version 3.0 of the extension, codeunit 50120 has been deleted. This is okay, because codeunit 50120 previously had been marked with `ObsoleteState = Pending` informing developers to use "50121 Foo_MyNewCodeunit" instead.


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
