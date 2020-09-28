---
title: "An affix is required for procedures defined in extension objects."
ms.author: solsen
ms.custom: na
ms.date: 06/19/2020
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
# AppSourceCop Rule AS0079
An affix is required for procedures defined in extension objects.  

## Description
An affix is required for procedures defined in extension objects, because it prevents breaking dependent extensions that reference it in case a procedure with the same signature is introduced by the base object or by another extension.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

In order to avoid name clashes for procedures added by your extension objects (i.e table extension, page extension) and procedures added by other extensions, an affix must be prepended or appended to the name of all new procedures in extension objects, extension objects, and fields. For more information, see [Benefits and Guidelines for using a Prefix or Suffix](../../compliance/apptest-prefix-suffix.md).

## How to fix this diagnostic

### For new extension objects or new procedures

For procedures that are introduced with the current version of the extension, appending one of the mandatory affixes to the object's name will fix the diagnostic. Renaming procedures which are not part of the baseline is allowed.

### For existing objects

For procedures which already exist in the version of the extension used as baseline, it is not possible to rename them. It is therefore not possible to append one of the mandatory affixes. Instead, the offending object procedure be deprecated using the Obsolete attribute and a new procedure whose name has one of the mandatory affixes should be introduced instead.

#### Example - Adding an affix to an existing procedure

For instance, if the baseline of the extension contains a codeunit without affix:
```
tableextension 50100 Foo_CustomerExtension extends Customer
{
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```

The extension should be modified to:
```
tableextension 50100 Foo_CustomerExtension extends Customer
{
    [Obsolete('Use Foo_MyProcedure instead')]
    procedure MyProcedure()
    begin
        // Re-direct calls to not break the runtime of dependent extensions.
        Foo_MyProcedure();
    end;

    procedure Foo_MyProcedure()
    begin
        // Business logic.
    end;
}
```

## Example of issues detected by this rule

The following example involves three extensions; Foo, Bar, and Foobar.

Foo defines a table named that does not have any procedure:
```
table 10 Foo_Table
{
    fields
    {
        field(1; MyField; Integer) { }
    }
}
```

Bar depends on Foo and defines a table extension that introduces a procedure named MyProcedure:
```
tableextension 50100 Bar_TableExtension extends Foo_Table
{
    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```

Foobar depends on both Foo and Bar and defines a procedure referencing MyProcedure from Bar:
```
tableextension 50120 Foobar_TableExtension extends Foo_Table
{
    procedure Foobar_SomeProcedure()
    begin
        // Calls into MyProcedure from Bar
        MyProcedure();
    end;
}
```

In a later version, the base extension Foo introduces a new method named Foo on the table:
```
table 10 Foo_Table
{
    fields
    {
        field(1; MyField; Integer) { }
    }

    procedure MyProcedure()
    begin
        // Business logic.
    end;
}
```

When compiling the extension Bar, the AL compiler reports now a warning similar to `AL0523: The 'Table Bar_Table' already defines a method called 'MyProcedure' with the same parameter types.`. The runtime behavior of your extension is still preserved though as it will run the procedure defined in the table extension.

When compiling the extension Foobar, the compilation fails because the AL compiler reports an error similar to `AL0196: The call is ambiguous between the method 'MyProcedure()' defined in TableExtension 'Bar_CustomerExtension' by the extension 'Bar' and the method 'MyProcedure()' defined in Table 'Foo_Table' by the extension 'Foo`.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
