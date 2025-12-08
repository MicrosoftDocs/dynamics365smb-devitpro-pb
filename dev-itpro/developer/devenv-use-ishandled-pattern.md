---
title: Using the IsHandled pattern
description: This article describes how, and when, to use the popular IsHandled pattern for events.
author: brentholtorf
ms.date: 08/14/2025
ms.topic: how-to
ms.author: bholtorf
ms.reviewer: bholtorf
ms.custom: bap-template
---

# Using the IsHandled pattern for events

`IsHandled` is a widely used event pattern in the code base. It's very popular for overriding the code. However, the pattern has significant drawbacks that might not be obvious to developers. We recommend that you limit the use of the pattern to a bare minimum, and only use it in cases where it's absolutely necessary. For example, when a better pattern isn't available.

## What is the IsHandled pattern?

The original goal of the `IsHandled` pattern was to enable developers to provide an implementation that didn't exist in the base code. The main use is to raise an event and throw an error if the event wasn't handled.

```AL
OnFoo(IsHandled)
if not IsHandled then
   Error(FooIsNotPossibleErr);
```

Today, we mostly use `exit` instead of the error, which increases the number of possible code paths.

According to the pattern's definition, only one subscriber can handle the event. All other subscribers must exit if the event is handled, so the subscriber code should start by checking whether the event was already handled.

```AL
[EventSubscriber(ObjectType::Codeunit, Codeunit::MyCodeunit, 'OnFoo', '', false, false)]
local procedure HandleFooOperation(var IsHandled: Boolean)
begin
    if IsHandled then
        exit;

    DoFoo();
    IsHandled := true;
end;
```

The goal of the `IsHandled` pattern was to provide interface-like functionality, before AL supported interfaces. Today, it's become a means of overriding the existing code, which was not the original intention.

## Why avoid the IsHandled pattern?

There are several issues with the `IsHandled` pattern.

- **Single subscribers only** - Event as a coding pattern, notifies all subscribers and enables them to react. By definition, the `IsHandled` pattern doesn't allow this. Only the first implementation called should be able to run. All other subscribers should exit. Subscribers to the `IsHandled` pattern are optional. They should allow other subscribers to do the task.
- **Coding by convention** - There's no way to enforce the rule defined in point 1 because the convention defines the pattern. A subscriber can break the rules and, for example, change the value back from True to False, or ignore the fact that the previous subscriber set the `IsHandled` value to True. This situation can make the code difficult to troubleshoot and can cause unexpected behavior in the code.
- **Clear purpose** - Events should have a clear purpose. The name of the event should reflect the purpose so it's easy to understand how to use the event. Handled patterns don't have a clear purpose in most cases because they're often named by the line or the function that is supposed to be skipped. That naming makes it difficult to know how it's going to be used and which code will run, which affects stability because any code can run. It also makes it difficult to refactor code.
- **Low readability** - The `IsHandled` pattern introduces nesting and new code paths. The code often raises many `IsHandled` events, which makes it difficult to understand which code will run, and how. There are over 8,000 `IsHandled` events.
- **Turning off parts of the code** - The `IsHandled` pattern is currently used as an override mechanism. Developers often use it to turn off large portions of code, which leads to fragile solutions. For example, the following are typical problems:

    - If the base code is refactored, all subscribers might be broken. If the subscribers depend on specific lines and context can be broken with updates to the code before the event and the code after the event runs.
    - Events might not be raised, which can break other extensions. Turning off the code can break extensions that subscribe to the events from the overridden code. This scenario is one we often face.
    - If we turn off the validation of a specific record and allow an unsupported value to save, the risk is that the event will be raised by a different part of the code, or that the other code produces incorrect values. For these reasons, we recommend that you don't turn off validation.

## What to do instead

The following sections describe ways to avoid using the `IsHandled` pattern.

### Implement proper extensibility and missing concepts

Rather than implementing the `IsHandled` pattern, the best solution is code contribution or contributing meaningful extensibility for an area.

Contributing code and implementing missing features eliminates the need for the events and improves the product.

If the code contribution isn't wanted, we need to add proper extensibility, which involves adding concepts to the base application. Adding concepts lets us add more implementations. In most cases, the solution involves adding and changing multiple object and setup fields that include multiple interfaces.

A good example are the payment services implemented in the base app. They only provide a generic concept, and then each implementation can come up with their own payment service. Another example is E-Documents.

By implementing missing features or extensibility for an area, we eliminate the need to add extra events for each implementation and helps keep the code clean with a clear purpose.

### Use regular events

The next best solution is to replace the handled event with a positive event that provides additional functionality. For example, this was the original event request:

```AL
local procedure CheckPeriodFormVendUniqueness()
var
    IRS1099FormDocHeader: Record "IRS 1099 Form Doc. Header";
    IsHandled: Boolean;
begin
    if Rec."Vendor No." = '' then
        exit;
    if Rec."Form No." = '' then
        exit;
    OnBeforeCheckPeriodFormVendUniqueness(IsHandled);
    if IsHandled then 
        exit;
    IRS1099FormDocHeader.SetFilter(Id, '<>%1', ID);
    IRS1099FormDocHeader.SetRange("Period No.", "Period No.");
    IRS1099FormDocHeader.SetRange("Vendor No.", "Vendor No.");
    IRS1099FormDocHeader.SetRange("Form No.", "Form No.");
    if not IRS1099FormDocHeader.IsEmpty() then
        Error(CannotCreateFormDocSamePeriodVendorFormErr);
end;

[IntegrationEvent(true, false)]
local procedure OnBeforeCheckPeriodFormVendUniqueness(var IsHandled: Boolean)
begin
end;
```

The main issue here is skipping validation. The second issue is that it isn't clear what the event is used for.

The following example shows the solution we settled on.

```AL
local procedure CheckPeriodFormVendUniqueness()
var
    IRS1099FormDocHeader: Record "IRS 1099 Form Doc. Header";
begin
    if Rec."Vendor No." = '' then
        exit;
    if Rec."Form No." = '' then
        exit;
    IRS1099FormDocHeader.SetFilter(Id, '<>%1', ID);
    IRS1099FormDocHeader.SetRange("Period No.", "Period No.");
    IRS1099FormDocHeader.SetRange("Vendor No.", "Vendor No.");
    IRS1099FormDocHeader.SetRange("Form No.", "Form No.");
    AddPeriodFormVendUniquenessFilters(IRS1099FormDocHeader);       
    if not IRS1099FormDocHeader.IsEmpty() then
        Error(CannotCreateFormDocSamePeriodVendorFormErr);
end;

/// <summary>
/// Provides an integration event that can be used to add additional filters to the period, vendor, and form uniqueness validation.
/// </summary>
/// <param name="IRS1099FormDocHeader">The form doc header record being filtered for the uniqueness validation.</param>
local procedure AddPeriodFormVendUniquenessFilters(var IRS1099FormDocHeader: Record "IRS 1099 Form Doc. Header")
begin
    OnAddPeriodFormVendUniquenessFilters(IRS1099FormDocHeader);
    if (IRS1099FormDocHeader.GetFilter("Period No.") <> Rec."Period No.") or (IRS1099FormDocHeader.GetFilter("Vendor No.") <> Rec."Vendor No.") or (IRS1099FormDocHeader.GetFilter("Form No.") <> Rec."Form No.") then
        Error(FiltersModifiedBySubscriberErr);
end;

[IntegrationEvent(false, false)]
local procedure OnAddPeriodFormVendUniquenessFilters(var IRS1099FormDocHeader: Record "IRS 1099 Form Doc. Header")
begin
end;
```

Rather than skip errors and other code, we added an event to add extra filters and to change the uniqueness condition. This is a better approach because we don't skip code and we have a clear definition of the event. Future refactoring will be easier because we know how the event is used. We also added logic to prevent the required filters from being removed.

Here's another example.

```AL
local procedure RunTransferDifferencetoAccountPage(BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line"; var TempGenJnlLine: Record "Gen. Journal Line" temporary; var Action: Action; var IsHandled: Boolean)
begin
    IsHandled := false;
    OnBeforeRunTransferDifferencetoAccountPage(BankAccReconciliationLine, TempGenJnlLine, IsHandled);
    if IsHandled then
        exit;

    Action := Page.RunModal(Page::"Transfer Difference to Account", TempGenJnlLine);
end
```

Because we just want to transfer a difference, we don't need to add a generic event. It's better to have a clear use and to specify that the event is used to transfer a difference.

```AL
local procedure RunTransferDifferencetoAccountPage(BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line"; var TempGenJnlLine: Record "Gen. Journal Line" temporary; var DifferenceTransferred: Boolean)
begin
    DifferenceTransferred := false;
    OnTransferDifference(BankAccReconciliationLine, TempGenJnlLine, DifferenceTransferred);
    if DifferenceTransferred then
        exit;

    Action := Page.RunModal(Page::"Transfer Difference to Account", TempGenJnlLine);
    DifferenceTransferred := PageAction = PageAction::LookupOK;
end;
```

Although this looks like an `IsHandled` pattern, this change gives us clear use and we can refactor if needed. There shouldn't be much code running after the exit check. We're only opening the page to let the user do the change manually.

The following is another good example.

```AL
procedure VerifyQuantity(var NewAssemblyHeader: Record "Assembly Header"; var OldAssemblyHeader: Record "Assembly Header")
var
    IsHandled: Boolean;
begin
    OnBeforeVerifyQuantity(NewAssemblyHeader, OldAssemblyHeader, IsHandled);
    if IsHandled then
        exit;

    if NewAssemblyHeader."Quantity (Base)" = OldAssemblyHeader."Quantity (Base)" then
        exit;

    ReservationManagement.SetReservSource(NewAssemblyHeader);
    if NewAssemblyHeader."Qty. per Unit of Measure" <> OldAssemblyHeader."Qty. per Unit of Measure" then
        ReservationManagement.ModifyUnitOfMeasure();
    ReservationManagement.DeleteReservEntries(false, NewAssemblyHeader."Remaining Quantity (Base)");
    ReservationManagement.ClearSurplus();
    OnVerifyQuantityOnBeforeAutoTrack(NewAssemblyHeader);
    ReservationManagement.AutoTrack(NewAssemblyHeader."Remaining Quantity (Base)");
    AssignForPlanning(NewAssemblyHeader);
end;
```

A partner was able to change this event, and three others, to positive events, as the following example shows.

```AL
procedure VerifyQuantity(var NewAssemblyHeader: Record "Assembly Header"; var OldAssemblyHeader: Record "Assembly Header")
begin
    if NewAssemblyHeader."Quantity (Base)" = OldAssemblyHeader."Quantity (Base)" then
        exit;

    ReservationManagement.SetReservSource(NewAssemblyHeader);
    if NewAssemblyHeader."Qty. per Unit of Measure" <> OldAssemblyHeader."Qty. per Unit of Measure" then
        ReservationManagement.ModifyUnitOfMeasure();
    OnVerifyQuantityOnBeforeDeleteReservationEntries(NewAssemblyHeader, OldAssemblyHeader);
    ReservationManagement.DeleteReservEntries(false, NewAssemblyHeader."Remaining Quantity (Base)");
```

No code is skipped, and the code is much more readable.

Learn more about the different event types that you can use for extensibility at [Types of events for extensibility](types-of-events-for-extensibility.md).

### Reimplement the functionality

Rather than implementing the `IsHandled` pattern, the code can add a new action or a field to do the operation. The following is an example.

```AL
action(CreateCreditMemo)
{
    ApplicationArea = Basic, Suite;
    Caption = 'Create Corrective Credit Memo';
    Image = CreateCreditMemo;
   Scope = Repeater;
    ToolTip = 'Create a credit memo for this posted invoice that you complete and post manually to reverse the posted invoice.';

    trigger OnAction()
    var
        PurchaseHeader: Record "Purchase Header";
        CorrectPostedPurchInvoice: Codeunit "Correct Posted Purch. Invoice";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCreateCreditMemoOnAction(Rec, IsHandled);
        if IsHandled then
            exit;

        if CorrectPostedPurchInvoice.CreateCreditMemoCopyDocument(Rec, PurchaseHeader) then begin
            PAGE.Run(PAGE::"Purchase Credit Memo", PurchaseHeader);
            CurrPage.Close();
        end;
    end;
}

[IntegrationEvent(false, false)]
local procedure OnBeforeCreateCreditMemoOnAction(var PurchInvHeader: Record "Purch. Inv. Header"; var IsHandled: Boolean)
begin
end;
```

This kind of event isn't useful. Just hide an action and introduce a new action via PageExtension.

Besides actions, you can replace fields. You can also replace either modules with different implementations. The important thing is that there is a clear cut, so that the effect of replacing the base implementation is clear. For example, if the customization is small, we can do it with events. However, for large customizations that would introduce many events (including `IsHandled` events), it's better to override the entire functionality and create a different implementation. We could expose proper public methods, so you can reuse logic from the base.

### Turn off as little as you can

If none of these approaches are feasible, consider turning off as little code as you can. A good example is the OnSkip pattern, where we skip individual lines. The code that's skipped shouldn't call underlying code or methods. It should be a few lines of code, and what's skipped must be visible. Avoid skipping validation.

To review an example of the OnSkip pattern, go to [OnSkip (operation) events](types-of-events-for-extensibility.md#onskip-operation-events).

## Summary

Defining `IsHandled` patterns is quick, however, they make the codebase more difficult to maintain and often make solutions less robust. The main problem is skipping large parts of code that might change in the future, and then risk that other events aren't raised. It also doesn't allow many extensions to subscribe to the same event.

The `IsHandled` pattern makes it difficult to troubleshoot because multiple subscribers could do any operation.

We should focus on defining proper extensibility and using better event patterns. Events should not skip code and should allow multiple subscribers to do an action. If you must use the `IsHandled` pattern, you should document your reason. To learn more, go to [Minimum requirements for new IsHandled events](devenv-use-ishandled-min-req.md).

## Related information

[Contribute a change yourself](devenv-contribute-extensibility.md)  
[Create an extensibility request](create-extensibility-request.md)
