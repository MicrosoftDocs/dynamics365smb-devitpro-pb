---
title: "CommitBehavior attribute"
description: "Specifies the behavior of a commit call inside the method scope."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# CommitBehavior attribute
> **Version**: _Available or changed with runtime version 6.0._

Specifies the behavior of a commit call inside the method scope.


## Applies to

- Method


## Syntax

```AL
[CommitBehavior(Behavior: CommitBehavior)]
```

### Arguments
*Behavior*  
&emsp;Type: [CommitBehavior](../methods-auto/commitbehavior/commitbehavior-option.md)  
Specifies if a commit must be ignored or throw an error. The options are: Ignored or Error.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks

- It's only possible to assign a more restrictive commit behavior. That is, if `CommitBehavior::Ignore` is attempted on a method scope, but the method calling the current method, for example, the parent method is actually running with `CommitBehavior::Error`, then the current method will continue running with `CommitBehavior::Error`, even though the `Ignore` attribute was specified.

- The `CommitBehavior` only lasts for the method scope. Regardless of whether the method finishes successfully or an error causes the method to exit prematurely, the `CommitBehavior` returns to the behavior that was in effect before the method was called.

- The `CommitBehavior` only applies to explicit commits, not implicit commits done as part of [Codeunit.Run](../methods-auto/codeunit/codeunit-run-method.md). 

## Local method example

The example shown below illustrates how the attribute is used on a local method; it can also be applied on a global method.

```AL
codeunit 50100 MyCodeunit
{
    trigger OnRun()
    begin
        FunctionAllowCommit();
    end;

    local procedure FunctionAllowCommit()
    begin
        FunctionIgnoreCommit();
        Commit(); // This commit is executed.
    end;

    [CommitBehavior(CommitBehavior::Ignore)]
    local procedure FunctionIgnoreCommit()
    begin
        TryFunctionErrorCommit();
        Commit(); // This commit is ignored.
    end;

    [CommitBehavior(CommitBehavior::Error)]
    [TryFunction]
    local procedure TryFunctionErrorCommit()
    begin
        Commit(); // This commit causes an error.
    end;
}
```

## Event subscriber example

This example illustrates how you can protect your code from commits happening in event subscriber code; typically written by a third party.

```AL
codeunit 50102 MyPublishingCodeunit
{
    // Ignore explicit commits attempted by event subscribers.
    [CommitBehavior(CommitBehavior::Ignore)]
    [IntegrationEvent(true, false)]
    procedure OnSomethingChangedEvent()
    begin
        // This part of the operation is extensible.
    end;

    procedure Validate(): Boolean
    begin
        exit(true);
    end;

    procedure DoImportantAtomicOperation()
    begin
        // Do work before notifying subscribers.
        OnSomethingChangedEvent();
        // Do more work after notifying subscribers.

        if Validate() then
            Commit()
        else
            Error('Validation failed');
    end;
}

codeunit 50103 MySubscribingCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyPublishingCodeunit, 'OnSomethingChangedEvent', '', true, true)]
    local procedure SubscribeToOnSomethingChangedEvent(Sender: Codeunit MyPublishingCodeunit)
    begin
        Commit();
    end;
}

```

## Related information

[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
