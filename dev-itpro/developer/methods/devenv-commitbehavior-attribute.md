---
title: "CommitBehavior Attribute"
description: "The CommitBehavior attribute in AL for Business Central"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# CommitBehavior Attribute

[!INCLUDE[2020_releasewave2.md](../../includes/2020_releasewave2.md)]

Specifies the behavior of `commit` calls inside the method scope of the call. This attribute can be used on both local and global methods.

## Syntax  

```AL
[CommitBehavior(CommitBehavior::Ignore)]
local procedure ProcedureIgnoreCommit()
begin
    // Do something
end;
```

## Attribute values

`CommitBehavior::Ignore`
This will ignore all `commit` calls until the method scope ends.

`CommitBehavior::Error`
This will throw an exception and stop the execution of further code when a `commit` is called before the end of the scope of the method.

> [!NOTE]  
> It is only possible to assign a more restrictive `commit` behavior. That is, if `CommitBehavior::Ignore` is attempted on a method scope, but the method calling the current method, e.g. the parent method is actually running with `CommitBehavior::Error`, then the current method will continue running with `CommitBehavior::Error`, even though the `Ignore` attribute was specified.

> [!NOTE]  
> The `CommitBehavior` only lasts for the method scope. Regardless of whether the method finishes successfully or if an error causes the method to exit prematurely, the `CommitBehavior` reverts to the standard behavior, where `commit` statements will commit to the database.

## Example - local method

The example shown below illustrates how the attribute is used on a local method; it can also be applied on a global method.

```AL
codeunit 50100 MyCodeunit
{
    trigger OnRun()
    var
    begin
        FunctionAllowCommit();
    end;

    local procedure FunctionAllowCommit()
    begin
        FunctionIgnoreCommit();
        commit; // This is valid, and commit call will be executed.
    end;

    [CommitBehavior(CommitBehavior::Ignore)]
    local procedure FunctionIgnoreCommit()
    begin
        TryFunctionErrorCommit();
        commit; // This call will be silently ignored.
    end;

    [CommitBehavior(CommitBehavior::Error)]
    [TryFunction]
    local procedure TryFunctionErrorCommit()
    begin
        commit; // This will throw an error. No further code will be executed and the user will see a dialog to contact the system administrator.
    end;

    var
        myInt: Integer;
}
```

## Example - event subscriber

This example illustrates how you can protect your code from commits happening in event subscriber code; typically written by a third party.

```AL
codeunit 50102 MyPublishingCodeunit
{
    // by stating CommitBehavior::Ignore here, any subscribers attempt to commit will be ignored
    [CommitBehavior(CommitBehavior::Ignore)]
    [IntegrationEvent(true, false)]
    procedure OnSomethingChangedEvent()
    begin
        // this part of ImportantAtomicOperation is extensible
    end;

    procedure Validate() result: Boolean
    begin
        // validation code 
    end;

    procedure DoImportantAtomicOperation()
    begin
        // do work
        OnSomethingChangedEvent();
        // do more work

        if Validate() then Commit() else Error('Validation failed');
    end;

}

codeunit 50103 MySubscribingCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyPublishingCodeunit, 'OnSomethingChangedEvent', '', true, true)]
    local procedure SubcribeToOnAddressLineChangedEvent(sender: Codeunit MyPublishingCodeunit)
    begin
        // subscriber code
        Commit();
    end;

```


## See Also  

[AL Method Reference](../methods-auto/library.md)  
