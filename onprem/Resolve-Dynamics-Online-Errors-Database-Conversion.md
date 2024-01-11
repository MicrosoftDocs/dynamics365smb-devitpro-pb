---
title: "Mock Code for Codeunit 824 DO Encryption Mgt."
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6ea75b39-cf7d-4c88-868b-86fa0be2426b
caps.latest.revision: 4
author: jswymer
---
# Resolving Dynamics Online Compilation Errors When Converting a Database
This article explains how to resolve compilation errors for Dynamics Online Payment Services codeunits that occur when converting a [!INCLUDE[navcorfu_md](includes/navcorfu_md.md)] database to [!INCLUDE[nav2017](includes/nav2017.md)]. These errors occur because Dynamics Online Payment Service has been discontinued in [!INCLUDE[nav2017](includes/nav2017.md)].

## What to do
To resolve the compilation errors and other related issues, you replace the Dynamics Online Payment Services codeunits in the converted database with the mock codeunits defined in this article. The following sections contain replacement code for all the Dynamics Online Payment Services codeunits. For each codeunit section, complete these steps:
1.  Copy the code to a text editor, and save it as a .txt file type.
2.  Use the [!INCLUDE[nav_dev_long_md](includes/nav_dev_long_md.md)] to import the file and compile the object, which replaces the existing codeunit.

## Codeunit 824 DO Encryption Mgt.
```
OBJECT Codeunit 824 DO Encryption Mgt.
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    SingleInstance=Yes;
    OnRun=BEGIN
          END;

  }
  CODE
  {

    PROCEDURE Encrypt@1(Input@1000 : Text[1024]) : Text[1024];
    BEGIN
    END;

    PROCEDURE Decrypt@2(Input@1000 : Text[1024]) : Text[1024];
    BEGIN
    END;

    PROCEDURE Import@4(Filename@1001 : Text;PasswordText@1002 : Text);
    BEGIN
    END;

    PROCEDURE Export@5(Filename@1000 : Text;PasswordText@1002 : Text);
    BEGIN
    END;

    PROCEDURE HasKey@8() : Boolean;
    BEGIN
    END;

    PROCEDURE CreateKey@6();
    BEGIN
    END;

    PROCEDURE DeleteKey@7();
    BEGIN
    END;

    PROCEDURE SetKeyFilePath@12(NewKeyFilePath@1000 : Text);
    BEGIN
    END;

    BEGIN
    END.
  }
}
```
## Codeunit 825 DO Payment Mgt.
```
OBJECT Codeunit 825 DO Payment Mgt.
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    Permissions=TableData 829=m;
    OnRun=BEGIN
          END;

  }
  CODE
  {

    PROCEDURE AuthorizeSalesDoc@14(SalesHeader@1000 : Record 36;CustLedgerEntryNo@1008 : Integer;AuthorizationRequired@1006 : Boolean) : Integer;
    BEGIN
      EXIT;
    END;

    PROCEDURE CheckGenJnlLine@10(GenJournalLine@1000 : Record 81);
    BEGIN
      EXIT;
    END;

    PROCEDURE CaptureGenJnlLine@11(GenJnlLine@1000 : Record 81) : Integer;
    BEGIN
      EXIT(0);
    END;

    PROCEDURE CaptureSalesDoc@15(SalesHeader@1003 : Record 36;CustLedgerEntryNo@1000 : Integer) : Integer;
    BEGIN
      EXIT(0);
    END;

    PROCEDURE RefundGenJnlLine@8(GenJnlLine@1000 : Record 81) : Integer;
    BEGIN
      EXIT;
    END;

    PROCEDURE RefundSalesDoc@2(SalesHeader@1001 : Record 36;CustLedgerEntryNo@1010 : Integer) : Integer;
    BEGIN
      EXIT;
    END;

    PROCEDURE CheckSalesDoc@5(SalesHeader@1000 : Record 36);
    BEGIN
      EXIT;
    END;

    PROCEDURE VoidSalesDoc@28(VAR SalesHeader@1001 : Record 36;VAR DOPaymentTransLogEntry@1002 : Record 829);
    BEGIN
      EXIT;
    END;

    PROCEDURE UpdateTransactEntryAfterPost@17(DOPaymentTransLogEntryNo@1000 : Integer;RelatedCustLedgerEntryNo@1002 : Integer;DocumentType@1003 : 'Payment,Refund');
    BEGIN
      EXIT;
    END;

    PROCEDURE IsAuthorizationRequired@18() : Boolean;
    BEGIN
      EXIT;
    END;

    PROCEDURE IsValidPaymentMethod@22(PaymentMethodCode@1000 : Code[10]) : Boolean;
    BEGIN
      EXIT(FALSE);
    END;

    PROCEDURE CheckCreditCardData@25(CreditCardNo@1000 : Code[20]);
    BEGIN
      EXIT;
    END;

    PROCEDURE FindCurrencyCode@21(CurrencyCode@1000 : Code[10]) : Code[10];
    BEGIN
      EXIT;
    END;

    BEGIN
    END.
  }
```
## Codeunit 826 DO Payment Integration Mgt.
```
OBJECT Codeunit 826 DO Payment Integration Mgt.
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    Permissions=TableData 824=rimd,
                TableData 828=r,
                TableData 829=m;
    OnRun=BEGIN
          END;

  }
  CODE
  {
    VAR
      Text001@1001 : TextConst 'ENU="Error Code = %1; Message = %2."';
      Text002@1002 : TextConst 'ENU=Failed to read parent transaction ID.';
      Text003@1003 : TextConst 'ENU=You must complete Microsoft Dynamics ERP Payment Services Connection Setup before you use Payment Services.';
      Text004@1004 : TextConst 'ENU=Microsoft Dynamics ERP Payment Services has not been enabled.';
      Text005@1005 : TextConst 'ENU=Credit card authorization in progress...';
      Text006@1006 : TextConst 'ENU=Failed to refresh the transaction status.\';
      Text007@1007 : TextConst 'ENU=Microsoft Dynamics ERP Payment Services Signup was canceled.';
      Text008@1008 : TextConst 'ENU=Sign-up process must be completed before you can select a service.';
      Text009@1009 : TextConst 'ENU=Sign-up process succeeded. Select a valid service ID.';
      CreateKeyBeforeSignupError@1000 : TextConst 'ENU=You must create an encryption key before starting sign-up process.';
      DOPaymentTransLogMgt@1101 : Codeunit 829;

    PROCEDURE Disassociate@32();
    BEGIN
      EXIT;
    END;

    PROCEDURE SelectServiceId@31(VAR ServiceId@1000 : GUID);
    BEGIN
      EXIT;
    END;

    PROCEDURE RefreshTransactionStatus@1(DOPaymentTransLogEntry@1000 : Record 829);
    BEGIN
      EXIT;
    END;

    PROCEDURE ServiceBoarding@2();
    BEGIN
    END;

    BEGIN
    END.
  }
}
```
## Codeunit 827 DO Payment Card Validation
```
OBJECT Codeunit 827 DO Payment Card Validation
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    OnRun=BEGIN
          END;

  }
  CODE
  {
    VAR
      Text001@1000 : TextConst 'ENU=''Invalid card type''.';
      Text002@1002 : TextConst 'ENU=%1 must not contain spaces.';
      Text003@1003 : TextConst 'ENU=The specified %1 is not valid.';
      Text004@1004 : TextConst 'ENU=%1 can only contain digits.';
      Text005@1005 : TextConst 'ENU=You must specify %1.';
      Text006@1006 : TextConst 'ENU=Validation rule does not allow spaces.';
      Text007@1007 : TextConst 'ENU=%1 does not meet the required length.';
      Text008@1008 : TextConst 'ENU=%1 exceeds the maximum length.';

    PROCEDURE ValidateCreditCard@1(CardNumber@1000 : Text[30];CardTypeName@1001 : Text[20]);
    BEGIN
      EXIT;
    END;

    BEGIN
    END.
  }
}
```

## Codeunit 829 DO Payment Trans. Log Mgt.
```
OBJECT Codeunit 829 DO Payment Trans. Log Mgt.
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
    Permissions=TableData 829=im;
    OnRun=BEGIN
          END;

  }
  CODE
  {

    PROCEDURE ValidateCanDeleteDocument@1(PaymentMethodCode@1010 : Code[10];DocumentType@1011 : Integer;DocumentTypeName@1012 : Text[30];DocumentNo@1013 : Code[20]);
    BEGIN
      EXIT;
    END;

    PROCEDURE ValidateHasNoValidTransactions@2(DocumentType@1000 : Integer;DocumentTypeName@1001 : Text[30];DocumentNo@1002 : Code[20]);
    BEGIN
      EXIT;
    END;

    PROCEDURE FindValidAuthorizationEntry@4(DocumentType@1000 : Integer;DocumentNo@1001 : Code[20];VAR DOPaymentTransLogEntry@1002 : Record 829) : Boolean;
    BEGIN
      EXIT(FALSE);
    END;

    PROCEDURE FindPostingNotFinishedEntry@5(DocumentType@1000 : Integer;DocumentNo@1001 : Code[20];VAR DOPaymentTransLogEntry@1002 : Record 829) : Boolean;
    BEGIN
      EXIT(FALSE);
    END;

    PROCEDURE FindCapturedButNotFinishedEntr@10(CustomerNo@1000 : Code[20];DocumentNo@1001 : Code[20];PaidAmount@1002 : Decimal;CurrencyCode@1003 : Code[10];CreditCardNo@1004 : Code[20];VAR DOPaymentTransLogEntry@1005 : Record 829) : Boolean;
    BEGIN
      EXIT(FALSE);
    END;

    PROCEDURE InitializeTransactionLogEntry@8(VAR DOPaymentTransLogEntry@1000 : Record 829;CreditCardNo@1001 : Code[20];SourceType@1002 : ' ,Order,Invoice';SourceNo@1003 : Code[20];CustomerNo@1004 : Code[20];TransactionType@1005 : Option;VAR ParentDOPaymentTransLogEntry@1006 : Record 829) : Integer;
    BEGIN
      EXIT(0);
    END;

    BEGIN
    END.
  }
}
```
## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2016 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2016-Database.md)  
 [How to: Import-Objects](How-to--Import-Objects.md)
