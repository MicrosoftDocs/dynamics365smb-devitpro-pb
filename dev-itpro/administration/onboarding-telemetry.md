---
title: Measure Onboarding Progress Using Telemetry
description: Learn how you can use onboarding telemetry to measure customers' progress with onboarding to Dynamics 365 Business Central.
ms.date: 11/17/2026
ms.topic: how-to
author: jswymer
ms.author: jswymer
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Measure onboarding progress using telemetry

[!INCLUDE [prod_short](../includes/prod_short.md)] emits telemetry signals that help indicate a customer's progress in onboarding to [!INCLUDE [prod_short](../includes/prod_short.md)]. These signals are emitted based on the use of certain business processes in [!INCLUDE [prod_short](../includes/prod_short.md)]. For example, posting sales invoices or vendor payments. Measuring emitted onboarding signals is a great way for partners to know how well their customers are doing in the onboarding process. If a customer isn't progressing as expected, the partner can proactively provide services to unblock the customer.

## Signals emitted automatically

[!INCLUDE [prod_short](../includes/prod_short.md)] emits signals that are defined by Microsoft. The signals are generic enough to cover most types of businesses. More signals can be emitted by extending the onboarding signals functionality. Currently, the signals emitted automatically are based on these business processes:

- Onboarding starts when signals are registered for a company during app installation or company initialization.
- Sales, which indicates that the company has set up everything needed to sell products or services.
- Purchases, which indicate that the company has set up everything needed to buy products or services.
- Customer payments, which indicate that sales process cycles have been completed, from sales to payment.
- Vendor payments, which indicate that purchase process cycles have been completed, from ordering to payment.

## Criteria and timing for emitting the automatic signals

- **Onboarding started**: When each onboarding signal is registered for a company.
- **Sales Invoice Signal**: When five posted sales invoices exist (Table 112, Sales Invoice Header).
- **Purchase Invoice Signal**: When five posted purchase invoices exist (Table 122, Purch. Inv. Header).
- **Customer Payment Signal**: When five posted customer payments exist (Table 21, Cust. Ledger Entry, Document Type = Payment).
- **Vendor Payment Signal**: When five posted vendor payments exist (Table 25, Vendor Ledger Entry, Document Type = Payment).

A completion signal is emitted once for each registered process when its criteria are met. When job scheduling is permitted, signing in to Business Central online schedules a recurring daily telemetry job to check the criteria. The company signal completes when all other registered signals for the company have completed.

## Extend the onboarding telemetry signals

Partners can add more signals based on their own criteria. They can extend the Onboarding Signals framework to add the onboarding signals that suit their customers. The following process is an example of how to extend the framework:

1. Extend enum 7580 `"Onboarding Signal Type"` with new onboarding signals.

    This example adds a new onboarding signal that's intended to be emitted when the count of general ledger entries reaches 1,000.

    ```al
    using System.Feedback;

    enumextension 50100 "GL Entry Onboarding Signal" extends "Onboarding Signal Type"
    {
        value(50100; "GL Entry Signal")
        {
            Implementation = "Onboarding Signal" = "GL Entry Signal";
        }
    }
    ```

1. Implement the `"Onboarding Signal"` interface in a codeunit and add criteria code.

    This example is based on the number of general ledger entries reaching 1000.

    ```al
    using Microsoft.Finance.GeneralLedger.Ledger;
    using System.Feedback;

    codeunit 50100 "GL Entry Signal" implements "Onboarding Signal"
    {
        Access = Internal;
        Permissions = tabledata "G/L Entry" = r;

        procedure IsOnboarded(): Boolean
        var
            GLEntry: Record "G/L Entry";
            OnboardingThreshold: Integer;
        begin
            OnboardingThreshold := 1000;

            exit(GLEntry.Count() >= OnboardingThreshold);
        end;
    }
    ```

1. Register onboarding signals. Typically, when an app is installed or updated.

   ```al
    using System.Environment;
    using System.Feedback;

    codeunit 50101 "Register Onboarding Signals"
    {
        Access = Internal;
        Subtype = Install;

        trigger OnInstallAppPerCompany()
        begin
            RegisterOnboardingSignals();
        end;

        internal procedure RegisterOnboardingSignals()
        var
            Company: Record Company;
            OnboardingSignal: Codeunit "Onboarding Signal";
            EnvironmentInfo: Codeunit "Environment Information";
            OnboardingSignalType: Enum "Onboarding Signal Type";
        begin
            if not Company.Get(CompanyName()) then
                exit;

            if Company."Evaluation Company" then
                exit;

            if EnvironmentInfo.IsSandbox() then
                exit;

            OnboardingSignal.RegisterNewOnboardingSignal(Company.Name, OnboardingSignalType::"GL Entry Signal");
        end;
    }
    ```

## Telemetry event IDs used when emitting onboarding signals

These event IDs are used when emitting onboarding signals.

- Onboarding started: `AL0000EIW`
- Onboarding signal completed: `AL0000EIV`

Completion signals that partners add are emitted with the `AL0000EIV` event ID. In AL calls to `LogMessage`, use the event ID without the `AL` prefix.

> [!NOTE]
> Onboarding criteria aren't relevant for non-production scenarios. Evaluation companies and sandboxes aren't included when registering onboarding signals or emitting them.

## Related information

[Onboarding experiences in Business Central](onboarding-experiences.md)  
