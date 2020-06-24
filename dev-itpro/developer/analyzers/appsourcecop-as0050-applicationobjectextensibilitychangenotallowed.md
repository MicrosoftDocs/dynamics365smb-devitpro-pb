---
title: "The extensibility of an application object cannot be removed"
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
# AppSourceCop Rule AS0050
The extensibility of an application object cannot be removed  

## Description
The extensibility of an application object cannot be removed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule verifies that an object that was extensible in the previous version of the extension, remains extensible in the current version of the extension.

The extensibility of an object is defined by the [Extensible](../properties/devenv-extensible-property.md) property.

> [!NOTE]
> The default property value for the `Extensible` property differs depending on the object type. For more information, see [Extensible](../properties/devenv-extensible-property.md) property.

## Code examples triggering the rule

### Example 1 - Changing the Extensible property value from true to false

Version 1.0 of the extension defines a page which is extensible:
```
page 50100 MyPage
{
    Extensible = true;
}
```

Version 2.0 of the extension:
```
page 50100 MyPage
{
    Extensible = false;
}
```

In version 2.0, the page is not extensible anymore. If a dependent extension extends this page, this will lead to a compilation error similar to `The object Page 'MyPage' is not extensible. AL(0564)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```
pageextension 50120 SomePageExtension extends MyPage
{
}
```

### Example 2 - Removing the extensible property on an Enum

The version 1.0 of the extension defines an enum which is extensible:
```
enum 50100 MyEnum
{
    Extensible = true;

    value(50100; MyEnumValue) { }
}
```

Version 2.0 of the extension:
```
enum 50100 MyEnum
{
    value(50100; MyEnumValue) { }
}
```

In version 2.0, the enum is not extensible anymore, because the default extensibility for enums is false. If a dependent extension extends this enum, this will lead to a compilation error similar to `The object Enum 'MyEnum' is not extensible. AL(0564)`.


For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```
enumextension 50120 SomeEnumExtension extends MyEnum
{
}
```

## Code examples not triggering the rule

In the following examples, the version 1.0 of the extension defines an enum which is not extensible.

Version 1.0 of the extension:
```
enum 50100 MyEnum
{
    Extensible = false;

    value(50100; MyEnumValue) { }
}
```

### Example 1 - Changing the Extensible property value from false to true

Version 2.0 of the extension:
```
enum 50100 MyEnum
{
    Extensible = true;

    value(50100; MyEnumValue) { }
}
```

In version 2.0, the enum `MyEnum` is now extensible by dependent extensions.

### Example 2 - Removing the Extensible property on a non extensible Enum

Version 2.0 of the extension:
```
enum 50100 MyEnum
{
    value(50100; MyEnumValue) { }
}
```

In version 2.0, the enum `MyEnum` remains not extensible, because the default property value is also false for enums.

### Example 3 - Removing the Extensible property on object types which are extensible by default

For object for which the default property value for the Extensible property is true, removing the property makes the object extensible.


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
