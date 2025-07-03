---
title: "AppSourceCop Error AS0135"
description: "One-step removal of the external business event is not allowed as it can introduce breaking changes for external subscribers."
ms.author: solsen
ms.date: 06/19/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0135
External business events must be marked obsolete before they can be removed.

## Description
One-step removal of the external business event is not allowed as it can introduce breaking changes for external subscribers. External business events must be marked obsolete prior to removal. Alternatively, if deprecation was not intended, move the event to a different object.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This rule validates external business events independently of the `Accessibility` of the containing application object or procedure, because these events are always exposed to external subscribers.

## How to fix this diagnostic?

Reverting the change will fix this diagnostic.

If removing the event is required, the recommended approach is to decorate the procedure with the Obsolete attribute and prefix the display name of the external business event with an `[OBSOLETE]` marker. In a future version, once external subscribers have unsubscribed or changed the trigger of their external processes to a different event, you can remove it.

Alternatively, if the intention is only to remove the containing object or procedure rather than the event itself, then follow the standard deprecation process for these elements and move the external business event to a different object.

## Examples triggering this rule

### Example 1 - Removing an external business event (independant of the object / procedure accessibilty)

Version 1 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    local procedure MyCodeunitEvent()
    begin
    end;
}
```

Version 2 of the extension

```al
codeunit 10 MyCodeunit
{
}
```

### Example 2 - Removing an incorrectly obsoleted external business event

To correctly obsolete an external business event, both the `Obsolete` attribute on the procedure and the `[Obsolete]` prefix in the display name must be present.

Version 1 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    [Obsolete('The event will be replaced by version 2.0 of MyEvent', '27.0')]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

Version 2 of the extension

```al
codeunit 10 MyCodeunit
{
}
```

### Example 3 - Removing an obsolete object with a non-obsolete external business event

Version 1 of the extension

```al
codeunit 10 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'This codeunit will be removed in a future version';
    ObsoleteTag = '27.0';

    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

Version 2 of the extension

```al
// Removed codeunit
```

## Examples not triggering this rule

### Example 1 - Removing a correctly obsoleted external business event

Version 1 of the extension

```al
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', '[OBSOLETE]MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    [Obsolete('The event will be removed', '27.0')]
    procedure MyCodeunitEvent()
    begin
    end;
}
```

Version 2 of the extension

```al
codeunit 10 MyCodeunit
{
}
```

### Example 2 - Moving an external business event from an obsolete codeunit within the same app

Version 1 of the extension

```al
codeunit 10 MyCodeunit
{
    ObsoleteState = Pending;
    ObsoleteReason = 'This codeunit will be replaced by MyNewCodeunit';
    ObsoleteTag = '27.0';

    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    local procedure MyCodeunitEvent()
    begin
    end;
}

codeunit 20 MyNewCodeunit
{
}
```

Version 2 of the extension

```al
codeunit 20 MyNewCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    local procedure MyCodeunitEvent()
    begin
    end;
}
```

## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  