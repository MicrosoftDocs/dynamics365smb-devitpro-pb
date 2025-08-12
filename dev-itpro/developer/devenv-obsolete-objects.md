---
title: Obsolete objects, methods, and symbols in AL
description: Description of how you use the obsoletion properties to obsolete an object used in Business Central.
author: SusanneWindfeldPedersen
ms.topic: concept-article
ms.author: solsen
ms.date: 08/12/2025
ms.reviewer: solsen
---

# Obsolete objects, methods, and symbols in AL

As part of the development cycle, you may need to obsolete objects, methods, or other symbols in your AL code. This can happen for various reasons, such as changes in business requirements, improvements in functionality, or the introduction of new features. In that case, you need to ensure that you properly mark this code as obsolete, which makes it easier for, for example, developers to identify and update deprecated code. The AL language has a set of properties and attributes specifically designed for this purpose.

## Obsolete objects

To obsolete objects such as tables, table fields, reports, pages, or interfaces, you need to know about the following properties:

- [ObsoleteState property](properties/devenv-obsoletestate-property.md) Specifies the current state of the object (for example; Pending, Removed).
- [ObsoleteReason property](properties/devenv-obsoletereason-property.md) Provides a description of why the object is being marked as obsolete.
- [ObsoleteTag property](properties/devenv-obsoletetag-property.md) Indicates the version in which the object will be removed or deprecated.

These properties can be set in the object definition, and they help communicate the status and reason for obsoletion to developers who work with the code. Set the `ObsoleteState` property to indicate the current state of the object. With the  `ObsoleteReason` property, you provide a reason for the obsoletion. Finally, with the `ObsoleteTag` property, you indicate the version in which the object will be removed or deprecated. In this first example, we warn developers that the table is pending removal.

One important thing to note here, is that you don't comment out the code for the obsolete objects. Instead, you should keep the code in place so that you don't break any dependencies, but instead you mark it as obsolete.

```al
table 12345 MyObsoleteTable
{
    ObsoleteState = Pending;
    ObsoleteReason = 'To be replaced by MyNewTable';
    ObsoleteTag = '20.0';
}

And then, we can mark a page as obsolete, as we reach version 21.0, as shown in this example:

```al
table 12345 MyObsoleteTable
{
    ObsoleteState = Removed;
    ObsoleteReason = 'Replaced by MyNewTable';
    ObsoleteTag = '21.0';
}
```

You can use the [preprocessor directives in AL](directives/devenv-directives-in-al.md) to check for the version and conditionally compile code based on the obsoletion state as illustrated in the example:

```al

// Example of how to set obsoletion properties on a table
table 12345 MyObsoleteTable
{
    #if Version2
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

## Obsolete methods, variables, and symbols

To obsolete methods, variables, events, and other symbols, you can mark them as obsolete using the [[Obsolete] attribute](attributes/devenv-obsolete-attribute.md). This example illustrates how to use the attribute for a procedure.

```al

[Obsolete('Pending removal, use NewMethod instead', '17.0')]
procedure OldMethod()
begin
    // Implementation
end;

```

The `[Obsolete]` attribute takes two parameters:

- **Reason** Explains why the object is deprecated.
- **Tag** Indicates the version or context (for example, `'17.0'`)

In the article [Best practices for deprecation of AL code](devenv-deprecation-guidelines.md), you can read more about guidelines that Microsoft uses internally for deprecation of AL code in the base application.

## Related information

[Best practices for deprecation of AL code](devenv-deprecation-guidelines.md)  
[ObsoleteState property](properties/devenv-obsoletestate-property.md)  
[ObsoleteReason property](properties/devenv-obsoletereason-property.md)  
[ObsoleteTag property](properties/devenv-obsoletetag-property.md)  
[Obsolete attribute](attributes/devenv-obsolete-attribute.md)  