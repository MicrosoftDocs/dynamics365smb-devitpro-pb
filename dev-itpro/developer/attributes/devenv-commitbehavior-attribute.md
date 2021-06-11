---
title: "CommitBehavior Attribute"
description: "Specifies the behavior of a commit call inside the method scope."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# CommitBehavior Attribute
> **Version**: _Available or changed with runtime version 6.0._

Specifies the behavior of a commit call inside the method scope.


## Applies To

- Method


## Syntax

```
[CommitBehavior(Behavior: CommitBehavior)]
```

### Arguments
*Behavior*  
&emsp;Type: [CommitBehavior](../methods-auto/commitbehavior/commitbehavior-option.md)  
Specifies if a commit must be ignored or throw an error. The options are: Ignored or Error.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> It is only possible to assign a more restrictive commit behavior. That is, if `CommitBehavior::Ignore` is attempted on a method scope, but the method calling the current method, e.g. the parent method is actually running with `CommitBehavior::Error`, then the current method will continue running with `CommitBehavior::Error`, even though the `Ignore` attribute was specified.

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
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  