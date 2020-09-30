---
title: "Application Testing Example: Testing Purchase Invoice Discounts"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: blrobl
---

# Application Testing Example: Testing Purchase Invoice Discounts
Before you release a customized [!INCLUDE[d365_bus_central](includes/d365_bus_central_md.md)] application to a production environment, you must test the application. This walkthrough demonstrates how to use the test codeunits and test libraries to test an application.  
  
## About this example  
You have modified codeunit 70, Purch-Calc.Discount, which is a codeunit in the [!INCLUDE[demoname](includes/demoname_md.md)] database. You want to test the functionality of the customized codeunit before you offer the customized application for sale. You create a new test codeunit with new test methods to test the Purch-Calc.Discount codeunit. During development, You use the application test libraries to help write a test with fewer lines of code.  
  
## Prerequisites  
To complete this example, you will need:  
  
- [!INCLUDE[d365_bus_central](includes/d365_bus_central_md.md)] with a developer license.  
  
- The CRONUS International Ltd. demo data company.  

- To import the Test Toolkit.
 
## Task 1: Create the test codeunit and method

1. Create a new codeunit and specifies that it is a test codeunit.
2. Define the scenario that you want to verify, and add a test method to test the Purch-Calc.Discount functionality.

    > [!TIP]
    > By default, methods in test codeunits are test methods unless you specify otherwise. 

### Guidelines

-  In this example, the name of the test method consists of the tested functionality, Purchase Invoice Discount Calculation, and relevant parameters that affect the test result. We recommend that you follow this naming pattern for your test methods also. In our example, the following parameters are introduced:  
  
  -  `PInv` for the document that is tested, purchase invoices. You can apply the same test to purchase orders or purchase credit memos. Also, we recommend that you have mirrored sets of tests for the sales area.  
  
  -  `Above`. It is a good practice to have tests for positive and negative scenarios. In this test, Isaac wants to check that discount come into effect when the document amount is above a minimum amount. But the amount in the document can be also less than or equal to the minimum amount.  

-  Isaac first defines the test scenario \[SCENARIO\], then details it with the GIVEN-THEN-WHEN notation. Finally, he adds the AL code.The code in this test method prepares the test data by setting a random discount percent, a minimum amount, and a document amount. Then, it creates a purchase document with a line and runs the Purch-Calc.Discount codeunit, which contains the code that is being tested. Finally, it verifies the results of running the Purch-Calc.Discount codeunit and raises an error if the results are not as expected.  
 
-  You can create additional test methods in this test codeunit to test other aspects of vendor discounts. These test methods should include negative tests, which validate that the code being tested works as intended under failing conditions.  

## Task 2: Create a helper method

Tne next task is to create a helper method that generates data for the test. The helper method can be reused if you decide to extend test coverage.

### Guidelines

-  The code in the helper method prepares data for the test by creating a new vendor, setting up the invoice discount, and creating a purchase document with an item. Because this helper method is not specific to the test itself, you can reuse it for similar tests. For example, you can call it with other parameters and create a purchase credit memo, or set up 0% discount, or create a document where the total amount is less than the minimum amount that is specified in **Vendor Invoice Disc.** table.  
  
> [!NOTE]  
>  This test code does not guarantee that the state of the database after you run the test is the same as the state of the database before you run the test.  

## Code

```
codeunit 50111 "ERM Vendor Discount"
{
    // Specifies the codeunit to be a test codeunit
    Subtype = Test;

    trigger OnRun()
    begin

    end;

    // Makes the method a test method
    [Test]

    // Adds the test logic to the test method
    procedure PurchInvDiscCalculationPInvAbove()

    var
        PurchLine: Record "Purchase Line";
        MinAmount: Decimal;
        DocAmount: Decimal;
        DiscountPct: Decimal;
        PurchCalcDisc: Codeunit "Purch.-Calc.Discount";

    begin
        // [SCENARIO] "Inv. Discount Amount" should be calculated on Purchase Invoice (in LCY), where Invoice amount is
        // above the minimal amount required for invoice discount calculation.
        // [GIVEN] Vendor with invoice discount percentage "D" for minimal amount "A" in LCY
        // [GIVEN] Create purchase invoice with one line and amount >"A"
        DiscountPct := RandomNumberGenerator.RandDec(100, 5);
        MinAmount := RandomNumberGenerator.RandDec(1000, 2);
        DocAmount := MinAmount + RandomNumberGenerator.RandDec(100, 2);
        CreatePurchDocument(PurchLine, PurchLine."Document Type"::Invoice, DocAmount, MinAmount, DiscountPct);
        // [WHEN] Calculate invoice discount for purchase document (line)
        PurchCalcDisc.RUN(PurchLine);
        // [THEN] "Inv. Discount Amount" = Amount "A" * discount "D" / 100
        PurchLine.FIND;
        Assert.AreEqual(ROUND(PurchLine."Line Amount" * DiscountPct / 100), PurchLine."Inv. Discount Amount", PurchInvDiscErr);
    end;

    // Creates the test helper method
    local procedure CreatePurchDocument(var PurchLine: Record "Purchase Line"; DocumentType: Option; DocAmount: Decimal; MinAmount: Decimal; DiscountPct: Decimal)

    var
        VendorInvoiceDisc: Record "Vendor Invoice Disc.";
        PurchaseHeader: Record "Purchase Header";
        VendorNo: Code[30];

    begin
        // Create vendor
        VendorNo := LibraryPurchase.CreateVendorNo;
        // Create vendor invoice discount
        VendorInvoiceDisc.INIT;
        VendorInvoiceDisc.Code := VendorNo;
        VendorInvoiceDisc.VALIDATE("Currency Code", '');
        VendorInvoiceDisc.VALIDATE("Minimum Amount", MinAmount);
        VendorInvoiceDisc.VALIDATE("Discount %", DiscountPct);
        VendorInvoiceDisc.INSERT(TRUE);
        // Create purchase line
        LibraryPurchase.CreatePurchaseDocumentWithItem(PurchaseHeader, Purchline, DocumentType, VendorNo, '', 1, '', 0D);
        PurchLine.VALIDATE("Direct Unit Cost", DocAmount);
        PurchLine.MODIFY(TRUE);
    end;

    var
        RandomNumberGenerator: Codeunit "Library - Random";
        LibraryPurchase: Codeunit "Library - Purchase";
        Assert: Codeunit Assert;
        myInt: Integer;
        PurchInvDiscErr: Label 'The Purchase Invoice Discount Amount was not calculated correctly.';

}
```

## See Also  
 [Testing the Application](devenv-Testing-Application.md)
