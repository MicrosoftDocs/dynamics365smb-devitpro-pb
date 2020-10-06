---
title: "CommitBehavior Attribute"
description: "The CommitBehavior attribute in AL for Business Central"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# CommitBehavior Attribute

[!INCLUDE[2020_releasewave2.md](../../includes/2020_releasewave2.md)]

Specifies the behavior of `commit` calls inside the method scope of the call. This attribute can be used on both local and global methods.

## Syntax  

```  
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

## Example
The example shown below illustrates how the attribute is used on a local method; it can also be applied on a global method.

```
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
  
## See Also  

[AL Method Reference](../methods-auto/library.md)  
