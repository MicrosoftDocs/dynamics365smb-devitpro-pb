---
title: Types of events for extensibility
description: This article describes various types of events for extensibility. 
author: brentholtorf
ms.author: bholtorf 
ms.reviewer: solsen
ms.topic: conceptual 
ms.collection: 
ms.date: 10/09/2024
ms.custom: bap-template
---

# Types of events for extensibility

Use events to design the application to react to specific actions or behaviors. Events let you separate custom functionality from the application's business logic. By using events where customizations are typically made, you lower the cost of code modifications and upgrades to the original application.

This article describes the types of integration events, and the events that we consider as high, medium, and low quality. How we define these rankings varies, depending on factors such as:

* The number of times they're implemented.
* How easy they are to maintain when you refactor code.

To learn more about events, go to [Events in AL](devenv-events-in-al.md).

## Types of events

The following list includes the types of events that are available. Use the links to learn more about them.

* [Business Events](#business-events)
* [OnBefore/OnAfter Events](#onbeforeonafter-events)
   * [Before/After Operation](#beforeafter-operation)
   * [Before/After Procedure](#beforeafter-procedure)
   * [Before/After specific line](#beforeafter-specific-line)
* [Verify Events](#verify-events)
* [Isolated Events](#isolated-events)
* [Switch Events](#switch-events-manually-bound-events)
* [OnSkip Events](#onskip-operation-events)
* [Handled Events](#handled-events)
* [Discovery Events](#discovery-events-mostly-obsoleted)

### Business events

**Very High Value** - Use business events to notify subscribers that a specific business event has occurred. 

Examples:

* OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry"),
* OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry"),
<!--[BusinessEvent_01]-->
```AL
**codeunit 1535 "Approvals Mgmt."**
	[IntegrationEvent(false, false)]
	local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
	begin
	end;
	
    local procedure ApproveSelectedApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeApproveSelectedApprovalRequest(ApprovalEntry, IsHandled);
        if IsHandled then
            exit;
        CheckOpenStatus(ApprovalEntry, "Approval Action"::Approve, ApproveOnlyOpenRequestsErr);

        if ApprovalEntry."Approver ID" <> UserId then
            CheckUserAsApprovalAdministrator(ApprovalEntry);

        ApprovalEntry.Validate(Status, ApprovalEntry.Status::Approved);
        ApprovalEntry.Modify(true);
        <r>OnApproveApprovalRequest(ApprovalEntry);</r>
    end;
```

<!--[BusinessEvent_02]

need to replace the images with code examples-->

#### OnBefore/OnAfter Events

`OnBefore/After` events vary in terms of quality, depending on where they're implemented.

`OnBefore/After` events might not allow the code to override existing behavior just to add additional logic to flows.

#### Before/After Operation

**High Value** - If events are implemented before or after a large operation starts, they're high quality.

Examples of high-quality events are:

* `OnAfterPostSalesDoc`
* `OnBeforeSendEmail`
* `OnAfterEmailSent`

<!--[OnBeforeAfterOperationEvents_01]-->
```AL
**codeunit 80 "Sales-Post"**
    [IntegrationEvent(false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    begin
    end;
	
	internal procedure RunWithCheck(var SalesHeader2: Record "Sales Header")
    var
        SalesHeader: Record "Sales Header";
        CustLedgEntry: Record "Cust. Ledger Entry";	
		...
	    if not (InvtPickPutaway or SuppressCommit or PreviewMode) then begin
            Commit();
            UpdateAnalysisView.UpdateAll(0, true);
            UpdateItemAnalysisView.UpdateAll(0, true);
        end;

        <r>OnAfterPostSalesDoc(SalesHeader2, GenJnlPostLine, SalesShptHeader."No.", ReturnRcptHeader."No.", SalesInvHeader."No.", SalesCrMemoHeader."No.", SuppressCommit, InvtPickPutaway, CustLedgEntry, WhseShip, WhseReceive, PreviewMode);</r>
```

<!--[OnBeforeAfterOperationEvents_02]

Need to replace with a code example-->

#### Before/After Procedure

**Medium Value** - We often use these events to provide more processing before or after a specific method is called. 

These events are medium quality because they're connected to the specific procedure, but it's unclear how to handle them if the procedure is removed or changed.

<!--[OnBeforeAfterProcedureEvents_01]-->
```AL
**table 900 "Assembly Header"**
    [IntegrationEvent(false, false)]
    local procedure OnAfterGetSKU(AssemblyHeader: Record "Assembly Header"; var Result: Boolean)
    begin
    end;
	
    local procedure GetSKU()
    var
        SKU: Record "Stockkeeping Unit";
        Result: Boolean;
    begin
        if (StockkeepingUnit."Location Code" = "Location Code") and
           (StockkeepingUnit."Item No." = "Item No.") and
           (StockkeepingUnit."Variant Code" = "Variant Code")
        then
            exit;

        GetItem();
        StockkeepingUnit := Item.GetSKU("Location Code", "Variant Code");
        Result := SKU.Get("Location Code", "Item No.", "Variant Code");

        <r>OnAfterGetSKU(Rec, Result);</r>
    end;
```

<!--[OnBeforeAfterProcedureEvents_02]-->

<!--NEED TO REPLACE WITH A CODE EXAMPLE OR DELETE-->

#### Before/After specific line

**Low Value** - A valid use could be before we insert or modify a line to update specific fields. Otherwise, avoid them because the point to a specific line of code. They were needed before because the Hook pattern was used as a default extensibility.

We should carefully consider whether we need Hook events before we introduce them. Hook events have little reuse between extensions, and can be fragile to code changes.

Example of valid usage: <!--replace images with code examples-->

<!--"images/OnBeforeAfterLineEvents_01.png"-->
```AL
**codeunit 5056 "CustCont-Update"**
    [IntegrationEvent(false, false)]
    local procedure OnInsertNewContactOnBeforeContBusRelInsert(var ContactBusinessRelation: Record "Contact Business Relation"; Contact: Record Contact; Customer: Record Customer)
    begin
    end;
	
	procedure InsertNewContact(var Cust: Record Customer; LocalCall: Boolean)
	var
        ContactBusinessRelation: Record "Contact Business Relation";
		...
	    ContactBusinessRelation."Contact No." := Contact."No.";
        ContactBusinessRelation."Business Relation Code" := MarketingSetup."Bus. Rel. Code for Customers";
        ContactBusinessRelation."Link to Table" := ContactBusinessRelation."Link to Table"::Customer;
        ContactBusinessRelation."No." := Cust."No.";
        <r>OnInsertNewContactOnBeforeContBusRelInsert(ContactBusinessRelation, Contact, Cust);</r>
        ContactBusinessRelation.Insert(true);
    end;
```

<!--"images/OnBeforeAfterLineEvents_02.png" alt="OnBeforeAfterLineEvents_02"

Need to replace or delete-->

Example of a lower quality usage, because they could be grouped into a single event, rather than several:

<!--"images/OnBeforeAfterLineEvents_bad_01.png" alt="OnBeforeAfterLineEvents_bad_01"-->
```AL
**codeunit 12 "Gen. Jnl.-Post Line"**	
    local procedure CalcPmtDisc(var NewCVLedgEntryBuf: Record "CV Ledger Entry Buffer"; var OldCVLedgEntryBuf: Record "CV Ledger Entry Buffer"; var OldCVLedgEntryBuf2: Record "CV Ledger Entry Buffer"; var DtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer"; GenJnlLine: Record "Gen. Journal Line"; PmtTolAmtToBeApplied: Decimal; ApplnRoundingPrecision: Decimal; NextTransactionNo: Integer; FirstNewVATEntryNo: Integer)
    var
        PmtDisc: Decimal;
        PmtDiscLCY: Decimal;
        ...

        MinimalPossibleLiability := Abs(OldCVLedgEntryBuf2."Remaining Amount" - OldCVLedgEntryBuf2.GetRemainingPmtDiscPossible(NewCVLedgEntryBuf."Posting Date"));
        <r>OnAfterCalcMinimalPossibleLiability(NewCVLedgEntryBuf, OldCVLedgEntryBuf, OldCVLedgEntryBuf2, MinimalPossibleLiability);</r>

        PaymentExceedsLiability := Abs(OldCVLedgEntryBuf2."Amount to Apply") >= MinimalPossibleLiability;
        <r>OnAfterCalcPaymentExceedsLiability(NewCVLedgEntryBuf, OldCVLedgEntryBuf, OldCVLedgEntryBuf2, MinimalPossibleLiability, PaymentExceedsLiability);</r>

        ToleratedPaymentExceedsLiability := Abs(NewCVLedgEntryBuf."Remaining Amount" + PmtTolAmtToBeApplied) >= MinimalPossibleLiability;
        <r>OnAfterCalcToleratedPaymentExceedsLiability(NewCVLedgEntryBuf, OldCVLedgEntryBuf, OldCVLedgEntryBuf2, MinimalPossibleLiability, ToleratedPaymentExceedsLiability, PmtTolAmtToBeApplied);</r>
```
or
<!--"images/OnBeforeAfterLineEvents_bad_02.png" alt="OnBeforeAfterLineEvents_bad_02"-->
```AL
**table 900 "Assembly Header"**
	field(12; "Variant Code"; Code[10])
	{
		Caption = 'Variant Code';
		TableRelation = "Item Variant".Code where("Item No." = field("Item No."), Code = field("Variant Code"));

		trigger OnValidate()
		var
			ItemVariant: Record "Item Variant";
			IsHandled: Boolean;
		begin
			CheckIsNotAsmToOrder();
			TestStatusOpen();
			...
			IsHandled := false;
			<r>OnValidateVariantCodeOnBeforeValidateDates(Rec, xRec, IsHandled);</r>
			if not IsHandled then
				ValidateDates(FieldNo("Due Date"), true);
   }
```

### Verify events

**Medium Value** - Use verify events before or after the operation to check whether the business logic is correct.

Verify events shouldn't create transactions. If the operation should be rolled back from an after event, make sure that the code before the event uses the `Ignore Commit` parameter.

Use before events as early in the code as possible. We must avoid any risk of partial commits when we introduce verify events.

<!--replace the images with code examples-->

<!--[VerifyEvents_01]-->
```AL
**codeunit 370 "Bank Acc. Reconciliation Post"**
    [Scope('OnPrem')]
    <r>[CommitBehavior(CommitBehavior::Ignore)]</r>
    procedure RunPreview(var BankAccReconciliation: Record "Bank Acc. Reconciliation"): Boolean
    begin
        PreviewMode := true;
        InitPost(BankAccReconciliation);
        Post(BankAccReconciliation);
        <r>FinalizePost(BankAccReconciliation);</r>
        exit(true);
    end;
	
	[IntegrationEvent(false, false)]
    local procedure OnBeforeFinalizePost(var BankAccReconciliation: Record "Bank Acc. Reconciliation")
    begin
    end;

    local procedure FinalizePost(BankAccRecon: Record "Bank Acc. Reconciliation")
    var
		...
    begin
        if PreviewMode then
            exit;
        <r>OnBeforeFinalizePost(BankAccRecon);</r>
        CreationDateTime := BankAccRecon.SystemCreatedAt;
        MatchedWithAI := AIMatchProposalsExist(BankAccRecon);
        if BankAccReconLine.LinesExist(BankAccRecon) then
            repeat
                AppliedPmtEntry.FilterAppliedPmtEntry(BankAccReconLine);
                AppliedPmtEntry.DeleteAll();

                BankAccReconLine.Delete();
                BankAccReconLine.ClearDataExchEntries();
                LineCount += 1;

            until BankAccReconLine.Next() = 0;

        BankAccRecon.Find();
        BankAccRecon.Delete();
        TelemetryCategories.Add('Category', BankAccountRecCategoryLbl);
        TelemetryCategories.Add('MatchedWithAI', Format(MatchedWithAI, 0, 9));
        TelemetryCategories.Add('NumberOfLines', Format(LineCount));
        if TryCalculateDurationToPost(DurationUntilPosting, CreationDateTime) then
            Session.LogMessage('0000LHY', Format(DurationUntilPosting), Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, TelemetryCategories);
        <r>OnAfterFinalizePost(BankAccRecon);</r>
    end;
```

<!--[VerifyEvents_02]

[VerifyEvents_03]

REPLACE OR DELETE    -->

### Isolated events

**Medium Value** - Use isolated events to allow handling errors that won't interrupt the code execution.

Multiple extensions can subscribe and do their processing. An error from one extension won't interrupt the transaction.

Isolated events require a commit before invoking the code, and will commit before invoking the next subscriber. Therefore, they require a detailed review.

An alternative is to invoke `if Codeunit.Run()` and then handle things in isolation.

`Codeunit.Run` requires an explicit commit before and has better testability, because there isn't an easy to test isolated events for error cases. To do error case testing, disable test isolation. Otherwise, the error eon't be handled.

Events are better than `Codeunit.Run` because they allow multiple subscribers. Running a codeunit only lets one implementation run at a time.

<!--need to replace the images with code examples-->

<!--[IsolatedEvents_01]-->
```AL
**codeunit 6759 "Create Reminders Action Job"**
    [IntegrationEvent(false, false, true)]
    local procedure OnCreateReminderSafe(var Customer: Record Customer; var CustLedgEntry: Record "Cust. Ledger Entry"; var ReminderHeader: Record "Reminder Header"; OverdueEntriesOnly: Boolean; IncludeEntriesOnHold: Boolean; var FeeCustLedgEntryLine: Record "Cust. Ledger Entry"; var Success: Boolean)
    begin
    end;
	
    local procedure CreateReminderForCustomer(var Customer: Record Customer): Boolean
    var
        Success: Boolean;
    begin
        Commit();
        <r>OnCreateReminderSafe(Customer, GlobalCustLedgEntry, GlobalReminderHeader, GlobalCreateRemindersSetup."Only Overdue Amount Entries", GlobalCreateRemindersSetup."Include Entries On Hold", GlobalFeeCustLedgEntry, Success);</r>
        if Success then
            exit(true);

        ReminderAutomationLogErrors.LogLastError(Enum::"Reminder Automation Error Type"::"Create Reminder");
        ClearLastError();
        exit(false);
    end;

**codeunit 6761 "Create Aut. Event Handler"**
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Reminders Action Job", <r>'OnCreateReminderSafe'</r>, '', false, false)]
    local procedure CreateReminderSafeHandler(var Customer: Record Customer; var CustLedgEntry: Record "Cust. Ledger Entry"; var ReminderHeader: Record "Reminder Header"; OverdueEntriesOnly: Boolean; IncludeEntriesOnHold: Boolean; var FeeCustLedgEntryLine: Record "Cust. Ledger Entry"; var Success: Boolean)
    begin
        CreateReminders(Customer, CustLedgEntry, ReminderHeader, OverdueEntriesOnly, IncludeEntriesOnHold, FeeCustLedgEntryLine, Success);
    end;

    <r>[CommitBehavior(CommitBehavior::Ignore)]</r>
    local procedure CreateReminders(var Customer: Record Customer; var CustLedgEntry: Record "Cust. Ledger Entry"; var ReminderHeader: Record "Reminder Header"; OverdueEntriesOnly: Boolean; IncludeEntriesOnHold: Boolean; var FeeCustLedgEntryLine: Record "Cust. Ledger Entry"; var Success: Boolean)
    var
        ReminderMake: Codeunit "Reminder-Make";
    begin
        ReminderMake.Set(Customer, CustLedgEntry, ReminderHeader, OverdueEntriesOnly, IncludeEntriesOnHold, FeeCustLedgEntryLine);
        ReminderMake.Code();
        Success := true;
    end;
```

<!--[IsolatedEvents_02]

[IsolatedEvents_03]

REPLACE OR DELETE
-->

### Switch events (manually bound events)

**Medium Value** - For switch events, the idea is to create an event that only manually bound subscribers should subscribe to.

Then, early in the action, you can implement a manually bound subscriber that helps you change the behavior of that specific call.

<!--Need to replace the images with code examples-->

<!--[SwitchEvents_01]-->
```AL
**xmlport 1220 "Data Exch. Import - CSV"**
    [IntegrationEvent(false, false)]
    local procedure OnNoLinesFoundSetErrorMessage(var ErrorMessage: Text);
    begin
    end;

    trigger OnPostXmlPort()
    var
        ErrorMessage: Text;
    begin
        if (not LastLineIsFooter and SkipLine) or HeaderWarning then begin
            ErrorMessage := LastLineIsHeaderErr;
            <r>OnNoLinesFoundSetErrorMessage(ErrorMessage);</r>
            Error(ErrorMessage);
        end;
    end;

**table 273 "Bank Acc. Reconciliation"**
	procedure ImportBankStatement()
    var
        DataExch: Record "Data Exch.";
        ProcessBankAccRecLines: Codeunit "Process Bank Acc. Rec Lines";
    begin
        CreateBankAccountReconcillation();
        if BankAccountCouldBeUsedForImport() then begin
            DataExch.Init();
            <r>BindSubscription(ProcessBankAccRecLines);</r>
            ProcessBankAccRecLines.SetBankAccountNo(Rec."Bank Account No.");
            ProcessBankAccRecLines.ImportBankStatement(Rec, DataExch);
            UnBindSubscription(ProcessBankAccRecLines);
        end;
    end;
```

<!--[SwitchEvents_02]-->
```AL
**codeunit 1248 "Process Bank Acc. Rec Lines"**	
	[EventSubscriber(ObjectType::XmlPort, XmlPort::"Data Exch. Import - CSV", <r>'OnNoLinesFoundSetErrorMessage'</r>, '', false, false)]
    local procedure HandleOnNoLinesFoundSetErrorMessage(var ErrorMessage: Text);
    begin
        InvalidFileFormatError(ErrorMessage);
    end;
```

<!--[SwitchEvents_03]

[SwitchEvents_04]

REPLACE OR DELETE    
-->

### OnSkip (operation) events

**Medium Value** - Skip events are similar to handled events. However, they can have multiple skip parameters, which gives us more granular control of the code.

The signature expects multiple subscribers, so there can be multiple extensions that handle the event.

<!--need to replace the images with code examples-->

<!--[SkipEvents_01]-->
```AL
**table 36 "Sales Header"**	
    [IntegrationEvent(false, false)]
    local procedure OnAfterCopySellToCustomerAddressFieldsFromCustomer(var SalesHeader: Record "Sales Header"; SellToCustomer: Record Customer; CurrentFieldNo: Integer; var SkipBillToContact: Boolean; var SkipSellToContact: Boolean)
    begin
    end;
	
	local procedure CopySellToCustomerAddressFieldsFromCustomer(var SellToCustomer: Record Customer)
    var
        IsHandled: Boolean;
    begin
        ...
            OnCopySellToCustomerAddressFieldsFromCustomerOnBeforeUpdateLocation(Rec, SellToCustomer, IsHandled);
            if not IsHandled then
                UpdateLocationCode(SellToCustomer."Location Code");
        end;

        <r>OnAfterCopySellToCustomerAddressFieldsFromCustomer(Rec, SellToCustomer, CurrFieldNo, SkipBillToContact, SkipSellToContact);</r>
    end;
```

<!--[SkipEvents_02]

REPLACE OR DELETE   
-->

or

<!--[SkipEvents_03]-->
```AL
**codeunit 5600 "FA Insert Ledger Entry"**
	[IntegrationEvent(false, false)]
    local procedure OnInsertReverseEntryOnBeforeInsertMaintenanceLedgerEntryBuffer(var MaintenanceKedgerEntry: Record "Maintenance Ledger Entry"; var SkipInsertOfMaintenanceLedgerEntry: Boolean)
    begin
    end;
	
    procedure InsertReverseEntry(NewGLEntryNo: Integer; FAEntryType: Option " ","Fixed Asset",Maintenance; FAEntryNo: Integer; var NewFAEntryNo: Integer; TransactionNo: Integer)
    ...
		<r>OnInsertReverseEntryOnBeforeInsertMaintenanceLedgerEntryBuffer(MaintenanceLedgEntry3, SkipInsertOfMaintenanceLedgerEntry);</r>
		if not SkipInsertOfMaintenanceLedgerEntry then begin
			TempMaintenanceLedgEntry := MaintenanceLedgEntry3;
			TempMaintenanceLedgEntry.Insert()
		end;
```

<!--[SkipEvents_04]

REPLACE OR DELETE    
-->

### Handled events

**Low Value** - Handled events are low quality events.

> [!NOTE]
> Subscribers must exit if the event is already handled, thus these events don't scale. Consider using skip events.

<!--need to replace the images with code examples-->

<!--[HandledEvents_01]-->
```AL
**page 42 "Sales Order"**	
    [IntegrationEvent(false, false)]
    local procedure OnBeforeStatisticsAction(var SalesHeader: Record "Sales Header"; var Handled: Boolean)
    begin
    end;	
	
	action(Statistics)
		{
			ApplicationArea = Basic, Suite;
			Caption = 'Statistics';
			...

			trigger OnAction()
			var
				Handled: Boolean;
			begin
				Handled := false;
				<r>OnBeforeStatisticsAction(Rec, Handled);</r>
				if Handled then
					exit;

				Rec.OpenSalesOrderStatistics();
				CurrPage.SalesLines.Page.ForceTotalsCalculation();
			end;
		}	
		
	**usage exmple**
	[EventSubscriber(ObjectType: : Page, Page::"Sales Order", <r>'OnBeforeStatisticsAction'</r>, '', false, false)]
	local procedure CheckReleased(Sa1esHeader: Record "Sales Header"; var Handled: Boolean)
	begin
		<r>if Handled then
			exit;</r>
			
		with SalesHeader do begin
			if Status = Status::Re1eased then		
				exit;
				
			Handled := not Confirm(ConfShowStatsCaption);
		end;
	end;
```

<!--[HandledEvents_02]

[HandledEvents_03]

REPLACE OR DELETE    
-->

**Advantage**

* Easy to implement

**Disadvantages**

* Only one subscriber can process the request. If there are multiple subscribers, by contract the first subscriber should handle the event.
* We need to be careful about the events raised by the existing code. The question is whether to raise them. Introducing a handled event can break these events.
* It's unclear whether the code was handled, and why it was handled.

### Discovery events (mostly obsoleted)

Discovery events were used to discover all possible implementations of the functionality.

The event was raised with a temporary table, and all subscribers would fill in the temporary table. The table would show in the UI so you could select the specific implementation.

We can get better designs with enums and interfaces.

<!--need to replace the images with code examples-->

<!--[DiscoveryEvents_01]-->
```AL
**table 1060 "Payment Service Setup"**
    [IntegrationEvent(false, false)]
    procedure OnRegisterPaymentServiceProviders(var PaymentServiceSetup: Record "Payment Service Setup")
    begin
    end;
	
    procedure NewPaymentService(): Boolean
    var
        TempPaymentServiceSetup: Record "Payment Service Setup" temporary;
        TempPaymentServiceSetupProviders: Record "Payment Service Setup" temporary;
    begin
        <r>OnRegisterPaymentServiceProviders(TempPaymentServiceSetupProviders);</r>
        case TempPaymentServiceSetupProviders.Count of
            0:
                exit(false);
            1:
                begin
                    TempPaymentServiceSetupProviders.FindFirst();
                    OnCreatePaymentService(TempPaymentServiceSetupProviders);
                    exit(true);
                end;
            else begin
                Commit();
                if PAGE.RunModal(PAGE::"Select Payment Service Type", TempPaymentServiceSetup) = ACTION::LookupOK then begin
                    OnCreatePaymentService(TempPaymentServiceSetup);
                    exit(true);
                end;
                exit(false);
            end;
        end;
    end;
```

<!--[DiscoveryEvents_02]

REPLACE OR DELETE
-->

## See also

[Extensibility overview](devenv-extensibility-overview.md)  
[Extension objects overview](devenv-extension-object-overview.md)  