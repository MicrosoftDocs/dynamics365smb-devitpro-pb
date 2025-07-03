---
title: Deprecate external business events
description: Learn how to deprecate external business events in AL for Business Central.
ms.date: 07/02/2025
ms.reviewer: solsen
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Deprecate external business events

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

External business events provide a way for external systems to subscribe to and react to events exposed by an AL application. For long-lived or widely distributed applications, you might need to phase out certain events over time, ensuring that external integrations have sufficient notice to update their subscriptions. This process is managed by deprecating external business events in a predictable way so that consumers of the event are informed and encouraged to transition to new or replacement events. The approach for deprecating an external business event is similar to the standard deprecation process for procedures.

## Deprecation steps

First, mark the event as obsolete pending.  

  1. Decorate the procedure with the `[Obsolete('<Reason>','<Tag>')]` attribute, as you would for any other procedure that is pending deprecation.
  1. Prefix the `DisplayName` of the `ExternalBusinessEvent` attribute with an `[OBSOLETE]` marker. This ensures that the obsoletion is reflected in the name, and external subscribers see the deprecation notice.

Then, remove the event in a future version.  
  In an upcoming release, once external consumers of the event have updated their integration, remove the obsolete-pending external business event entirely.

## Example 1

The following example illustrates how you can deprecate an external business event:

Version one of the extension:

- The `MyEventDisplayName` is prefixed with the `[OBSOLETE]` marker.
- The procedure `MyEventProcedure` is decorated with the `[Obsolete('The event will be removed', '27.0')]` attribute.

```AL
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', '[OBSOLETE] MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    [Obsolete('The event will be removed', '27.0')]
    procedure MyEventProcedure()
    begin
    end;
}
```

Version two of the extension:

The procedure `MyEventProcedure` is removed.

```AL
codeunit 10 MyCodeunit
{
}
```

## Example 2

The following is an example of deprecating an external business event and introducing a replacement:

Version one of the extension:

- The `MyEventDisplayName` is prefixed with the `[OBSOLETE]` marker.
- The procedure `MyEventProcedure` is decorated with the `[Obsolete('The event will be replaced by version 2.0 of MyEvent', '27.0')]` attribute.
- The new version of the event is introduced via the procedure `MyEventProcedure2`.

```AL
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', '[OBSOLETE] MyEventDisplayName', 'Description', EventCategory::MyValue, '1.0')]
    [Obsolete('The event will be replaced by version 2.0 of MyEvent', '27.0')]
    procedure MyEventProcedure()
    begin
    end;

    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '2.0')]
    procedure MyEventProcedure2()
    begin
    end;
}
```

Version 2 of the extension:

The old procedure `MyEventProcedure` is removed.

```AL
codeunit 10 MyCodeunit
{
    [ExternalBusinessEvent('MyEvent', 'MyEventDisplayName', 'Description', EventCategory::MyValue, '2.0')]
    procedure MyEventProcedure2()
    begin
    end;
}
```

## Related information

[Best practices for deprecation of AL code](devenv-deprecation-guidelines.md)  
[External business event attribute](attributes/devenv-externalbusinessevent-attribute.md)  