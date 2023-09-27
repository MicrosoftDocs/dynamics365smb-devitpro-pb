---
title: Deprecated bank reconciliation and deposits features in the North American version
description: If you're using the deprecated Bank Reconciliation Worksheet and Deposits features in the US, CA, and MX versions, this article can help you understand what to do after you upgrade to 2023 release wave 2.
author: brentholtorf
ms.author: bholtorf
ms.reviewer: bnielse
ms.topic: conceptual
ms. search.keywords: deprecated, Dutch, NL, Netherlands, local functionality
ms.date: 09/26/2023
ms.custom: bap-template
---

# NA bank reconciliation and deposits are deprecated in the North American version

Several releases ago, we announced that we're deprecating the bank reconciliation worksheet and deposits features in the US, CA, and MX versions of [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. The features are removed from the product in 2023 release wave 2. To learn more about the announcement, go to [Bank Reconciliation Worksheet and Deposits in North American versions (US, CA, MX)](deprecated-features-w1.md#bank-reconciliation-worksheet-and-deposits-in-north-american-versions-us-ca-mx).

We're standardizing the features for reconciling bank accounts and making cash deposits, so that more country versions can benefit from them. To learn more about what we've changed, go to [Standardizing the bank reconciliation process in North American versions](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/standardizing-bank-reconciliation-process-north-american-versions). To learn more about standard bank reconciliations, go to [Manage and Reconcile Your Bank Accounts](/dynamics365/business-central/bank-manage-bank-accounts).

This article includes what you need to know if you're still using the NA Bank Reconciliation Worksheet page to do your bank reconciliations.

## Transfer of open bank reconciliation worksheets

When your product version is upgraded to 2023 release wave 2 (23.0), open bank reconciliations are migrated to standard bank reconciliations one by one. 

* All cleared entries in the Payments, Deposits, and Checks sections are transferred to Statement Lines and are auto-matched to bank ledger entries when possible.
* All non-cleared entries in the Payments and Checks sections are not transferred to standard bank reconciliation.
* All entries in the Adjustments section are transferred to Statement Lines, but are not auto-matched. You can complete the bank reconciliations by filling in any entries that weren't transferred and match entries that weren't auto-matched. In the standard bank reconciliation, you must post such differences to a general journal before you post the reconciliation. To learn more about posting a standard bank reconciliation, go to [To create missing ledger entries to match bank statement lines](/dynamics365/business-central/bank-how-reconcile-bank-accounts-separately#to-create-missing-ledger-entries-to-match-bank-statement-lines).

You can complete the bank reconciliations, and fill in any entries that weren't transferred and match entries that weren't auto-matched.

## Review earlier bank reconciliations

You can still review bank reconciliations that you did using the bank reconciliation worksheet. On the **Bank Account** card, choose the **Posted Reconciliation Worksheets** action.

## Transfer of open deposits

Open deposits are transferred to new bank deposits on a line-by-line basis. On the **Bank Deposits** page, you can find the new bank deposits, complete the registration, and post the deposits. To learn more about bank deposits, go to [Create Bank Deposits](/dynamics365/business-central/bank-create-bank-deposits).

## Review earlier bank deposits

You can still review deposits that you made using the deprecated deposits feature. They're available non the **Posted Deposits** page. You can open the page from search. 

## Deprecated objects

The following table lists the objects that are removed for bank account reconciliations.

|Object type  |Name  |
|---------|---------|
|Page     |PAG 10120 Bank Rec. Worksheet         |
|Report   |REP 10407 Bank Rec. Test Report         |
|Report   |REP 10406 Bank Rec. Process Lines         |

The following table lists the objects that are removed for the Deposits feature.

|Object type  |name  |
|---------|---------|
|Page     |Page 10140 Deposit        |
|Page     |Page 10146 "Deposit List"         |
|Page     |Page 36646 Deposits         |
|Page     |Page 10141 "Deposit Subform"         |
|Table    |Table 10140 "Deposit Header"        |
|Codeunit |Codeunit 10140 "Deposit-Post"         |
|Codeunit |Codeunit 10142 "Deposit-Post + Print"         |
|Codeunit |Codeunit 10141 "Deposit-Post (Yes/No)"         |
|Report   |Report 10402 "Deposit Test Report"         |

## See also

[Deprecated Features in the Base App](deprecated-features-w1.md)  
[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading the Application Code](upgrading-the-application-code.md)  
[Important Information and Considerations for Before Upgrading to Dynamics 365 Business Central](upgrade-considerations.md)  
[Best Practices for Deprecation of Code in the Base App](../developer/devenv-deprecation-guidelines.md)  
[Microsoft Timeline for Deprecating Code in Business Central](../developer/devenv-deprecation-timeline.md)