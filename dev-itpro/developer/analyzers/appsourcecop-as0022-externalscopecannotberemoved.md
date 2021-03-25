---
title: "An external scope cannot be removed"
ms.author: solsen
ms.custom: na
ms.date: 03/08/2021
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
# AppSourceCop Rule AS0022
An external scope cannot be removed

## Description
An external scope cannot be removed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule verifies that procedures which were exposed to dependent extensions in the previous version of the extension, remain exposed to other extensions.

The availability of a procedure is defined by:
- the access modifier set on the object declaring the procedure
- the access modifier set on the procedure
- the [Scope attribute](../methods/devenv-scope-attribute.md) that is added on the procedure

## Code examples triggering the rule

In the following examples, version 1.0 of the extension defines a procedure which is public and available for `Cloud` development.

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [Scope('Cloud')]
    procedure MyProcedure()
    begin
    end;
}
```

### Example 1 - Adding a local access modifier

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [Scope('Cloud')]
    local procedure MyProcedure()
    begin
    end;
}
```

In version 2.0, the procedure is only accessible within its declaring codeunit. If a dependent extension called this procedure, this will lead to a compilation error similar to `'MyProcedure()' is inaccessible due to its protection level. (AL0161)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```AL
codeunit 50120 AnotherCodeunit
{
    procedure AnotherMethod()
    var
        c: Codeunit MyCodeunit;
    begin
        c.MyProcedure();
    end;
}
```


### Example 2 - Changing the Scope attribute from 'Cloud' to 'OnPrem'

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [Scope('OnPrem')]
    procedure MyProcedure()
    begin
    end;
}
```

In version 2.0, the procedure is only available for `OnPrem` development. If a dependent extension uses the `Cloud` compilation target in the app.json and calls this procedure, this will lead to a compilation error similar to `The type or method 'MyProcedure' cannot be used for 'Extension' development. (AL0296)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```AL
codeunit 50120 AnotherCodeunit
{
    procedure AnotherMethod()
    var
        c: Codeunit MyCodeunit;
    begin
        c.MyProcedure();
    end;
}
```

## Code examples not triggering the rule

In the following examples, version 1.0 of the extension defines a procedure which does not have a return type.

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [Scope('OnPrem')]
    procedure MyOnPremProcedure()
    begin
    end;

    local procedure MyLocalProcedure()
    begin
    end;
}
```

### Example 1 - Removing a local access modifier

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [Scope('OnPrem')]
    procedure MyOnPremProcedure()
    begin
    end;

    procedure MyLocalProcedure()
    begin
    end;
}
```

In version 2.0, the procedure `MyLocalProcedure` is now public and becomes available to dependent extensions.

### Example 2 - Changing the Scope attribute from 'OnPrem' to 'Cloud'

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [Scope('Cloud')]
    procedure MyOnPremProcedure()
    begin
    end;

    local procedure MyLocalProcedure()
    begin
    end;
}
```

In version 2.0, the procedure `MyOnPremProcedure` becomes available for both `OnPrem` and `Cloud` development. Any dependent extension can now call this procedure, regardless of the compilation target specified in their app.json. The default Scope of a procedure is `Cloud`. Removing the attribute is then also allowed.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
