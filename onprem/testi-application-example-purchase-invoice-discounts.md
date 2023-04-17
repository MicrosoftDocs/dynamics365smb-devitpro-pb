---
title: "Walkthrough: Testing Purchase Invoice Discounts"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7e8b10a5-5769-437c-ac27-a3d5400f3199
caps.latest.revision: 20
---
# Application Testing Example: Testing Purchase Invoice Discounts
Before you release a customized [!INCLUDE[navnowlong](includes/navnowlong_md.md)] application to a production environment, you must test the application. This walkthrough demonstrates how to use the test codeunits and test libraries to test an application.  
  
## About This Example  
You have modified codeunit 70, Purch-Calc.Discount, which is a codeunit in the [!INCLUDE[demoname](includes/demoname_md.md)] database. You want to test the functionality of the customized codeunit before you offer the customized application for sale. You create a new test codeunit with new test functions to test the Purch-Calc.Discount codeunit. During development, You use the application test libraries to help write a test with fewer lines of code.  
  
## Prerequisites  
To complete this example, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  
  
-   The CRONUS International Ltd. demo data company.  

-   Imported the Test Toolkit.
 
## Creating a Test Codeunit and Test Function  
 Isaac creates a new codeunit and specifies that it is a test codeunit. He defines the scenario that he wants to verify, adds a test function to tests the Purch-Calc.Discount functionality, and adds a helper function that can be reused if he decides to extend test coverage.  
  
#### To create the test codeunit and test function  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in **Object Designer**, create a new codeunit.  
  
2.  In the **Properties** window, in the **Subtype** field, select **Test** to specify that this is a test codeunit.  
  
3.  In the **C/AL Globals** window, on the Variables tab, enter the following variables.  
  
    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |RandomNumberGenerator|Codeunit|Random Number Generator|  
    |LibraryPurchase|Codeunit|Library - Purchase|  
    |Assert|Codeunit|Assert|  
  
     This adds 3 codeunits from the application test libraries as global variables so that you can use them in your test code.  
  
4.  In the **C/AL Globals** window, on the **Text Constants** tab, in the **Name** field, enter **PurchInvDiscErr**. In the **ConstValue** field, enter **The Purchase Invoice Discount Amount was not calculated correctly**.  
  
5.  In the **C/AL Globals** window, on the **Functions** tab, enter **PurchInvDiscCalculationPInvAbove**. This is the name of the test function.  
  
     In this example, the name of the test function consists of the tested functionality, Purchase Invoice Discount Calculation, and relevant parameters that affect the test result. We recommend that you follow this naming pattern for your test functions also. In our example, the following parameters are introduced:  
  
    -   `PInv` for the document that is tested, purchase invoices. You can apply the same test to purchase orders or purchase credit memos. Also, we recommend that you have mirrored sets of tests for the sales area.  
  
    -   `Above`. It is a good practice to have tests for positive and negative scenarios. In this test, Isaac wants to check that discount come into effect when the document amount is above a minimum amount. But the amount in the document can be also less than or equal to the minimum amount.  
  
6.  On the **Functions** tab, choose **Locals**.  
  
7.  In the **C/AL Locals** window, on the **Variables** tab, enter the following variables, which you will use in the **PurchInvDiscCalculationPInvAbove** test function.  
  
    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |PurchLine|Record|Purchase Line|  
    |MinAmount|Decimal||  
    |DocAmount|Decimal||  
    |DiscountPct|Decimal||  
    |PurchCalcDisc|Codeunit|Purch.-Calc.Discount|  
  
    > [!IMPORTANT]  
    >  Make sure that you add these entries on the **Variables** tab, not on the **Parameters** tab. If you create them on the **Parameters** tab, you get an error when you compile that says the test method signature is invalid.  
  
8.  In the C/AL Editor, in the `PurchInvDiscCalculationPInvAbove` function, enter the following code:  
  
    ```  
    // [SCENARIO] "Inv. Discount Amount" should be calculated on Purchase Invoice (in LCY), where Invoice amount is above the minimal amount required for invoice discount calculation.  
    // [GIVEN] Vendor with invoice discount percentage "D" for minimal amount "A" in LCY  
    // [GIVEN] Create purchase invoice with one line and amount >"A"  
  
    DiscountPct := RandomNumberGenerator.RandDec(100,5);  
    MinAmount := RandomNumberGenerator.RandDec(1000,2);  
    DocAmount := MinAmount + RandomNumberGenerator.RandDec(100,2);  
  
    CreatePurchDocument(PurchLine,PurchLine."Document Type"::Invoice,DocAmount,MinAmount,DiscountPct);  
  
    // [WHEN] Calculate invoice discount for purchase document (line)  
    PurchCalcDisc.RUN(PurchLine);  
  
    // [THEN] "Inv. Discount Amount" = Amount "A" * discount "D" / 100  
    PurchLine.FIND;  
    Assert.AreEqual(ROUND(PurchLine."Line Amount" * DiscountPct / 100),PurchLine."Inv. Discount Amount", PurchInvDiscErr);  
  
    ```  
  
     Isaac first defines the test scenario \[SCENARIO\], then details it with the GIVEN-THEN-WHEN notation. Finally, he adds the C/AL code.The code in this test function prepares the test data by setting a random discount percent, a minimum amount, and a document amount. Then, it creates a purchase document with a line and runs the Purch-Calc.Discount codeunit, which contains the code that is being tested. Finally, it verifies the results of running the Purch-Calc.Discount codeunit and raises an error if the results are not as expected.  
  
     Isaac has created the test function. Next, he creates a helper function that generates data for the test.  
  
 Isaac can now create additional test functions in this test codeunit to test other aspects of vendor discounts. These test functions should include negative tests, which validate that the code being tested works as intended under failing conditions.  
  
## Adding a Test Helper Function  
 In the test codeunit, Isaac adds a second function that generates data for the test itself.  
  
#### To add a test helper function  
  
1.  In the **C/AL Globals** window, on the **Functions** tab, in the **Name** field, enter **CreatePurchDocument**.  
  
2.  In the **Properties** window for the new function, set the **FunctionType** property to **Normal** and the **Local** property to **Yes**.  
  
3.  In the **C/AL Locals** window for the `CreatePurchDocument` function, on the **Parameters** tab, enter the following parameters.  
  
    |Var|Name|DataType|Subtype|  
    |---------|----------|--------------|-------------|  
    |Yes|PurchLine|Record|Purchase Line|  
    ||DocumentType|Option||  
    ||DocAmount|Decimal||  
    ||MinAmount|Decimal||  
    ||DiscountPct|Decimal||  
  
4.  In the **C/AL Locals** window, on the **Variables** tab, enter the following variables.  
  
    |Name|DataType|Subtype|Length|  
    |----------|--------------|-------------|------------|  
    |VendorInvoiceDisc|Record|Vendor Invoice Disc.||  
    |PurchaseHeader|Record|Purchase Header||  
    |VendorNo|Code||20|  
  
5.  In the C/AL Editor, in the **CreatePurchDocument** function, enter the following code.  
  
    ```  
    // Create vendor  
    VendorNo := LibraryPurchase.CreateVendorNo;  
  
    // Create vendor invoice discount  
    VendorInvoiceDisc.INIT;  
    VendorInvoiceDisc.Code := VendorNo;  
    VendorInvoiceDisc.VALIDATE("Currency Code",'');  
    VendorInvoiceDisc.VALIDATE("Minimum Amount",MinAmount);  
    VendorInvoiceDisc.VALIDATE("Discount %", DiscountPct);  
    VendorInvoiceDisc.INSERT(TRUE);  
  
    // Create purchase line  
    LibraryPurchase.CreatePurchaseDocumentWithItem(PurchaseHeader,PurchaseLine,DocumentType,VendorNo,'',1,'',0D);  
    PurchaseLine.VALIDATE("Direct Unit Cost",DocAmount);  
    PurchaseLine.MODIFY(TRUE);  
    ```  
  
     The code in this helper function prepares data for the test by creating a new vendor, setting up the invoice discount, and creating a purchase document with an item. Because this helper function is not specific to the test itself, Isaac can reuse it for similar tests. For example, he can call it with other parameters and create a purchase credit memo, or set up 0% discount, or create a document where the total amount is less than the minimum amount that is specified in **Vendor Invoice Disc.** table.  
  
    > [!NOTE]  
    >  This test code does not guarantee that the state of the database after you run the test is the same as the state of the database before you run the test.  
  
6.  On the **File** menu, choose **Save**.  
  
7.  In the **Save As** window, in the **ID** field, enter **50005**. In the **Name** field, enter **ERM Vendor Discount**. Verify that the **Compiled** check box is selected, and then choose the **OK** button.  
  
## Next Steps  
 The next steps are:  
  
-   Create additional test functions to test different aspects of vendor discounts. These test functions should include negative tests that validate that the code being tested works as intended under failing conditions.  
  
-   Run the test codeunit in the **Test Tool** page.  


## Task 1: Create the test codeunit and function

Create a new codeunit and specifies that it is a test codeunit. Define the scenario that you want to verify, add a test function to test the Purch-Calc.Discount functionality, and add a helper function that can be reused if you decide to extend test coverage.  

### Guidelines
-  In this example, the name of the test function consists of the tested functionality, Purchase Invoice Discount Calculation, and relevant parameters that affect the test result. We recommend that you follow this naming pattern for your test functions also. In our example, the following parameters are introduced:  
  
  -  `PInv` for the document that is tested, purchase invoices. You can apply the same test to purchase orders or purchase credit memos. Also, we recommend that you have mirrored sets of tests for the sales area.  
  
  -  `Above`. It is a good practice to have tests for positive and negative scenarios. In this test, Isaac wants to check that discount come into effect when the document amount is above a minimum amount. But the amount in the document can be also less than or equal to the minimum amount.  

-  Isaac first defines the test scenario \[SCENARIO\], then details it with the GIVEN-THEN-WHEN notation. Finally, he adds the C/AL code.The code in this test function prepares the test data by setting a random discount percent, a minimum amount, and a document amount. Then, it creates a purchase document with a line and runs the Purch-Calc.Discount codeunit, which contains the code that is being tested. Finally, it verifies the results of running the Purch-Calc.Discount codeunit and raises an error if the results are not as expected.  
 
## Task 2: Create a helper function
Tne next task is to create a helper function that generates data for the test.  

### Guidelines
Isaac can now create additional test functions in this test codeunit to test other aspects of vendor discounts. These test functions should include negative tests, which validate that the code being tested works as intended under failing conditions.  

-  The code in this helper function prepares data for the test by creating a new vendor, setting up the invoice discount, and creating a purchase document with an item. Because this helper function is not specific to the test itself, Isaac can reuse it for similar tests. For example, he can call it with other parameters and create a purchase credit memo, or set up 0% discount, or create a document where the total amount is less than the minimum amount that is specified in **Vendor Invoice Disc.** table.  
  
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

    // Creates the test function
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
        PurchInvDiscErr: TextConst ENU = 'The Purchase Invoice Discount Amount was not calculated correctly.';

}
```

## See Also  
 [Testing the Application](Testing-the-Application.md)
