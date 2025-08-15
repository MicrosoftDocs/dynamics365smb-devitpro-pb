---
title: Obsolete objects, methods, and symbols in AL
description: Description of how you use the obsoletion properties to obsolete an object used in Business Central.
author: SusanneWindfeldPedersen
ms.topic: concept-article
ms.author: solsen
ms.date: 08/14/2025
ms.reviewer: solsen
---

# Obsolete objects, methods, and symbols in AL

When you develop and maintain an AL extension, part of the process is often that some objects, or symbols must be retired. Instead of deleting or commenting out code, mark it as obsolete so you preserve compatibility and give dependent extensions time to find an alternative solution or stop using it. AL provides dedicated obsoletion properties for objects (`ObsoleteState`, `ObsoleteReason`, `ObsoleteTag`) and the `[Obsolete]` attribute for methods, variables, events, and other symbols.

Overall, the guidance for deprecating objects, methods, and symbols in AL can be illustrated like this:

- Version 1.0 - has the symbol
- Version 2.0 - obsoletes the symbol and introduces an alternative solution
- Version 3.0 - removes the symbol in favor of the alternative solution

This article explains how to:

- Mark objects, such as tables, fields, pages, reports, and interfaces with obsoletion properties.
- Use `ObsoleteState` values (`Pending`, `Removed`) to signal lifecycle stage.
- Supply clear reasons and version tags to guide dependent developers.
- Apply the `[Obsolete]` attribute to procedures and other symbols.
- Combine version tags with preprocessor directives for conditional compilation.
- Use analyzer rules to enforce obsoletion policies for the lifecycle of AL code.

For broader guidance, see [Best practices for deprecation of AL code](devenv-deprecation-guidelines.md).

## Obsolete objects

To obsolete objects such as tables, table fields, reports, pages, or interfaces, you need to know about the following properties:

- [ObsoleteState property](properties/devenv-obsoletestate-property.md) Specifies the current state of the object (for example; Pending, Removed).
- [ObsoleteReason property](properties/devenv-obsoletereason-property.md) Provides a description of why the object is being marked as obsolete, including how it will be replaced. This is an important piece of information for the developer who is using the object.
- [ObsoleteTag property](properties/devenv-obsoletetag-property.md) Specifies a free-form text to support tracking of where and when the object was marked as obsolete, for example, branch, build, or date of obsoleting the object.

These properties can be set in the object definition, and they help communicate the status and reason for obsoletion to developers who work with the code. Set the `ObsoleteState` property to indicate the current state of the object. With the  `ObsoleteReason` property, you provide a reason for the obsoletion along with the alternative solution. Finally, with the `ObsoleteTag` property, you can indicate the version in which the object is obsolete. In this first example, we warn developers that the table is pending removal.

An important thing to note here is that you don't comment out the code for the obsolete objects. Instead, you should keep the code in place so that you don't break any dependencies, but instead you mark it as obsolete.

```al
table 12345 MyObsoleteTable
{
    ObsoleteState = Pending;
    ObsoleteReason = 'The table no longer supports the business scenario. It is to be replaced by MyNewTable';
    ObsoleteTag = '20.0';
}

And then, we can mark a page as obsolete, as we reach version 21.0, as shown in this example:

```al
table 12345 MyObsoleteTable
{
    ObsoleteState = Removed;
    ObsoleteReason = 'The table no longer supported the business scenario. It is replaced by MyNewTable';
    ObsoleteTag = '21.0';
}
```

## Obsolete methods, variables, and symbols

To obsolete methods, variables, events, and other symbols, you can mark them as obsolete using the [[Obsolete] attribute](attributes/devenv-obsolete-attribute.md). This example illustrates how to use the attribute for a procedure, which becomes obsolete with version 17.0. This allows for a transition to the new method and makes developers aware not to rely on the old method.

```al

[Obsolete('Pending removal, use NewMethod instead', '17.0')]
procedure OldMethod()
begin
    // Implementation
end;

```

The `[Obsolete]` attribute takes two parameters:

- **Reason**, which explains why the object is deprecated.
- **Tag**, which indicates the version or context (for example, `'17.0'`)

In the article [Best practices for deprecation of AL code](devenv-deprecation-guidelines.md), you can read more about guidelines that Microsoft uses internally for deprecation of AL code in the base application.

## Preprocessor directives for conditional check

You can check code using a conditional directive, first you must define a symbol to check. A symbol returns a boolean value: `true` or `false` and can be defined at the beginning of a source file, where the scope of the specific symbol is in that file. Or, you can define symbols in the `app.json` file, and then the scope is global for the extension. Learn more in [Preprocessor directives in AL](directives/devenv-directives-in-al.md).

When the symbol is defined, you can check conditionally for the version and obsoletion state. In the following example, the `VERSION22` symbol is used to check for the version. The `VERSION22` symbol is defined in the `app.json` file.

```al
"preprocessorSymbols": [ "VERSION22"]
```

```al
// Example of how to set obsoletion properties on a table
table 12345 MyObsoleteTable
{
    #if 
        ObsoleteState = Removed;
        ObsoleteTag = '21.0';
    #else
        ObsoleteState = Pending;
        ObsoleteTag = '20.0';
    #endif
        ObsoleteReason = 'The MyObsoleteTable has been replaced by MyNewTable.';
}
#endif
```


## Use analyzer rules to enforce obsoletion policies

Analyzer rules in AL help enforce obsoletion policies and ensure that deprecated objects aren't used in new development. Specifically, a number of [AppSourceCop](analyzers/appsourcecop.md) analyzer rules help detect breaking changes. 

|AppSourceCop rule|Description|
|-----------------|-----------|
|[AS0001](analyzers/appsourcecop-as0001.md)|Prevents removal of tables and table extensions without proper obsoletion.|
|[AS0002](analyzers/appsourcecop-as0002.md)|Prevents removal of table fields without proper obsoletion.|
|[AS0004](analyzers/appsourcecop-as0004.md)|Prevents changing the type of a field (e.g., from Option to Enum) without obsoleting and replacing.|
|[AS0005](analyzers/appsourcecop-as0005.md)|Prevents renaming or changing the casing of table fields.|
|[AS0006](analyzers/appsourcecop-as0006.md)|Prevents removal of tables without proper obsoletion.|
|[AS0009](analyzers/appsourcecop-as0009.md)|Prevents breaking changes to table keys.|
|[AS0010](analyzers/appsourcecop-as0010.md)|Prevents breaking changes to field properties (e.g., length, type).|
|[AS0013](analyzers/appsourcecop-as0013.md)|Prevents changing the ID of an object; must obsolete and create a new object.|
|[AS0016](analyzers/appsourcecop-as0016.md)|Explains that tables marked as Removed are not deleted from the database, so schema must be managed carefully.|
|[AS0029](analyzers/appsourcecop-as0029.md)|Prevents removal of pages and page extensions without proper obsoletion.|
|[AS0043](analyzers/appsourcecop-as0043.md)|Prevents breaking structural changes to tables.|
|[AS0072](analyzers/appsourcecop-as0072.md)|Enforce correct use of obsoletion properties (Pending, Removed, Reason, Tag) and sequencing.|
|[AS0080](analyzers/appsourcecop-as0080.md)|Prevents decreasing the length of a field without obsoleting and replacing.|
|[AS0086](analyzers/appsourcecop-as0086.md)|Provides guidance for increasing the length of a field.|
|[AS0088](analyzers/appsourcecop-as0088.md)|Prevents deleting or renaming objects without first marking them as obsolete (Pending).|
|[AS0098](analyzers/appsourcecop-as0098.md)|Prevents renaming or changing the ID of objects; must obsolete and create new.|
|[AS0105](analyzers/appsourcecop-as0105.md)|Additional schema evolution nuances.|
|[AS0117](analyzers/appsourcecop-as0117.md)|Requires use of PendingMove when moving objects.|

## Related information

[Best practices for deprecation of AL code](devenv-deprecation-guidelines.md)  
[ObsoleteState property](properties/devenv-obsoletestate-property.md)  
[ObsoleteReason property](properties/devenv-obsoletereason-property.md)  
[ObsoleteTag property](properties/devenv-obsoletetag-property.md)  
[Obsolete attribute](attributes/devenv-obsolete-attribute.md)  