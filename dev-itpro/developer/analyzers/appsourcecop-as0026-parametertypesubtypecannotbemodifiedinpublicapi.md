---
title: "The type and subtype of parameters cannot be modified in events and external procedures"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2020
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
# AppSourceCop Rule AS0026
The type and subtype of parameters cannot be modified in events and external procedures  

## Description
The type and subtype of parameters cannot be modified in events and external procedures.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

It is not allowed to change the type of subtype of parameters in public procedures as this will break dependent extensions which are calling them.

## Examples of invalid code:

### Example 1: Modifying parameters type

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
    procedure MyProcedure(i: Boolean)
    begin
    end;
}
```

In version 2.0, the type of the parameter i has changed from Integer to Boolean. If a dependent extension calls this method, this will lead to a compilation error similar to `Argument 1: cannot convert from 'Integer' to 'Boolean' (AL0133)`.

### Example 2: Modifying parameters subtype

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    procedure MyProcedure(i: Record Customer)
    begin
    end;
}
```

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    procedure MyProcedure(i: Record Vendor)
    begin
    end;
}
```

In version 2.0, the subtype of the parameter i has changed from a Customer record to a Vendor record. If a dependent extension calls this method, this will lead to a compilation error similar to `Argument 1: cannot convert from 'Record Vendor' to 'Record Customer' (AL0133)`.

## How to fix this diagnostic?

In order to fix this diagnostic, the changes on the procedure signature must be reverted. The procedure should be marked as obsolete, and a new procedure should be introduced.
The behavior of the obsoleted procedure should be preserved in order to not break the runtime behavior of dependent extensions while they haven't uptaken yet the new procedure.

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [Obsolete('Use MyProcedure(i: Record Vendor) instead. This method will be removed in version 3.0.', '2.0')]
    procedure MyProcedure(i: Record Customer)
    begin
    end;
    
    procedure MyProcedure(i: Record Vendor)
    begin
    end;
}
```

Once dependent extensions have been updated to use the new procedure, the obsolete procedure can be removed.

Version 3.0 of the extension:
```
codeunit 50100 MyCodeunit
{  
    procedure MyProcedure(i: Record Vendor)
    begin
    end;
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  