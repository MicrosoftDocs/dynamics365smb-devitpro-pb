---
title: "Parameters cannot be removed or added in external procedures"
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
# AppSourceCop Rule AS0024
Parameters cannot be removed or added in external procedures  

## Description
Parameters cannot be removed or added in external procedures, because it will break dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

It is not allowed to remove or add new parameters in public procedures as this will break dependent extensions which are calling them.

## Code examples triggering the rule

### Example 1 - Removing parameters

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    procedure MyProcedure(i: Integer)
    begin
    end;
}
```

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    procedure MyProcedure()
    begin
    end;
}
```

In version 2.0, the parameter i of the procedure has been removed. If a dependent extension calls this procedure, this will lead to a compilation error similar to `No overload for method 'MyProcedure' takes 1 argument. (AL0126)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```
codeunit 50120 AnotherCodeunit
{
    procedure RaiseEvent()
    begin
        MyProcedure(5);
    end;
}
```

### Example 2 - Adding new parameters

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    procedure MyProcedure(i: Integer)
    begin
    end;
}
```

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    procedure MyProcedure(i: Integer; j: Integer)
    begin
    end;
}
```

In version 2.0, a new parameter j has been added to the procedure. If a dependent extension calls this procedure, this will lead to a compilation error similar to `There is no argument given that corresponds to the required formal parameter 'j' of 'MyProcedure(Integer, Integer)' (AL0135)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```
codeunit 50120 AnotherCodeunit
{
    procedure RaiseEvent()
    begin
        MyProcedure(5);
    end;
}
```

## How to fix this diagnostic

In order to fix this diagnostic, the changes on the procedure signature must be reverted. The procedure should be marked as obsolete, and a new procedure should be introduced.
The behavior of the obsoleted procedure should be preserved in order to not break the runtime behavior of dependent extensions while they have not yet uptaken the new procedure.

### Example - Adding a parameter to a public procedure

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    procedure MyProcedure(i: Integer)
    begin
    end;
}
```

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [Obsolete('Use MyProcedure(i: Integer;j: Integer) instead. This method will be removed in version 3.0.', '2.0')]
    procedure MyProcedure(i: Integer)
    begin
    end;
    
    procedure MyProcedure(i: Integer; j: Integer)
    begin
    end;
}
```

Once dependent extensions have been updated to use the new procedure, the obsolete procedure can be removed.

Version 3.0 of the extension:
```
codeunit 50100 MyCodeunit
{  
    procedure MyProcedure(i: Integer; j: Integer)
    begin
    end;
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
