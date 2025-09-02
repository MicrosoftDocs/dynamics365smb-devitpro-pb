---
title: "AppSourceCop Hidden AS0138"
description: "Table fields should use the AllowInCustomizations property and its value must be different from ToBeClassified and Always."
ms.author: solsen
ms.date: 09/02/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Hidden AS0138
Table fields should use the AllowInCustomizations property

## Description
Table fields should use the AllowInCustomizations property and its value must be different from ToBeClassified and Always. From runtime 16.0, you can specify on the application object level the AllowInCustomizations to use as default for all its fields.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

To resolve this diagnostic, specify the `AllowInCustomizations` property on either the **field level**, the **table level**, or **table extension** level, and ensure that the value is not set to `ToBeClassified` or `Always`. Learn more in [AllowInCustomizations](..\properties\devenv-allowincustomizations-property.md).

## Code examples triggering the rule

### Example 1 - AllowInCustommizations not specified

The `AllowInCustomizations` property is missing on the field, which triggers the rule:

```al
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer) { }
    }
}
```

### Example 2 - AllowInCustommizations set to disallowed value

The `AllowInCustomizations` property is set to `ToBeClassified`, which triggers the rule:

```al
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            AllowInCustomizations = ToBeClassified; // Not allowed.
        }
    }
}
```

## Code examples not triggering the rule

### Example 1 - AllowInCustomizations specified on field level

Here, the field explicitly specifies `AllowInCustomizations = AsReadOnly;`, which is valid:

```al
table 50100 MyTable
{
    fields
    {
        field(1; MyField; Integer)
        {
            AllowInCustomizations = AsReadOnly;
        }
    }
}
```

### Example 2 - AllowInCustomizations specified on table level

Here, the table sets the property, which applies to all fields by default:

```al
table 50100 MyTable
{
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(1; MyField; Integer) { }
        field(2; MyOtherField; Integer) { }
    }
}
```

### Example 3 - AllowInCustomizations specified on table extension level

Here, the table extension sets the property, which applies to all fields within this object:

```al
tableextension 50100 MyTableExt extends Customer
{
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(50100; MyExtField; Integer) { }
        field(50101; MyOtherExtField; Integer) { }
    }
}
```

## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  