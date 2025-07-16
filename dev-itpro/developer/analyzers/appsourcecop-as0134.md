---
title: "AppSourceCop Warning AS0134"
description: "The version attribute parameter of an external business event cannot be changed because it might break external subscribers."
ms.author: solsen
ms.date: 06/19/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0134
The version of an external business event cannot be changed.

## Description
The version attribute parameter of an external business event cannot be changed because it might break external subscribers. To update the version, introduce a new event with the increased version and follow the standard deprecation process to obsolete the existing event.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

Revert the changes done to the version attribute parameter of the external business event.

## Examples triggering this rule

### Example 1 - Adding the version parameter to an existing external business event

Version 1 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue)]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

Version 2 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

### Example 2 - Removing the version parameter from an external business event

Version 1 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

Version 2 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue)]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

### Example 2 - Changing the version parameter of an external business event

Version 1 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

Version 2 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '2.0')]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

## Examples not triggering this rule

### Example 1 - Adding a new event with a different version and deprecating the existing event

Version 1 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

Version 2 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', '[OBSOLETE]MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    [Obsolete('The event will be replaced by version 2.0 of MyEvent', '27.0')]
    procedure MyCodeunitEvent()
    begin
    end;

    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '2.0')]
    procedure MyCodeunitEvent2()
    begin
    end;
}
```

## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  