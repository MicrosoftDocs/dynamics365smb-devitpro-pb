---
title: "Walkthrough: Create a Test with Confirmation Dialog"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a88497c5-d2cc-48f6-a8c1-8bf986fe8ced
caps.latest.revision: 2
---
# Walkthrough: Create a Test with Confirmation Dialog
Most tests run automatically without a dependency on the user interface. However, in some cases, you want to test functionality that requires user activity, such as choosing the OK button in a confirmation dialog. This walkthrough demonstrates how to use test handler functions in a test that includes a confirmation dialog.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   Creating two test handler functions in a test codeunit.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  
  
-   The CRONUS International Ltd. demo data company.  
  
## Story  
 Isaac is a business application developer working for CRONUS International Ltd. Earlier, Isaac started using the application test libraries to test codeunit 70, Purch-Calc.Discount, which is a codeunit in the [!INCLUDE[demoname](includes/demoname_md.md)] database. Now, Isaac wants to extend the test coverage to include testing that the VAT amount remains the same when the user chooses the **Price Including VAT** field.  
  
## Creating a Test Codeunit and Test Handler Function  
 Isaac creates a new codeunit and specifies that it is a test codeunit. Isaac defines the scenario to be verified, adds a test handler function to test the VAT functionality.  
  
#### To create the test codeunit and test handler function  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in **Object Designer**, create a new codeunit.  
  
2.  In the **Properties** window, in the **Subtype** field, select **Test** to specify that this is a test codeunit.  
  
3.  In the **C/AL Globals** window, on the Variables tab, enter the following variables.  
  
    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |LibrarySales|Codeunit|Library - Sales|  
    |LibraryRandom|Codeunit|Library - Random|  
    |Assert|Codeunit|Assert|  
    |LibraryERM|Codeunit|Library - ERM|  
  
     This adds 4 codeunits from the application test libraries as global variables so that you can use them in your test code.  
  
4.  In the **C/AL Globals** window, on the **Functions** tab, enter **HandlerSampleTest**. This is the name of the test function.  
  
5.  On the **Functions** tab, choose **Locals**.  
  
6.  In the **C/AL Locals** window, on the **Variables** tab, enter the following variables, which you will use in the **HandlerSampleTest** test function.  
  
    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |SalesHeader|Record|Sales Header|  
    |SalesLine|Record|Sales Line|  
    |ItemQty|Decimal||  
    |VATBaseOriginal|Decimal||  
  
    > [!IMPORTANT]  
    >  Make sure that you add these entries on the **Variables** tab, not on the **Parameters** tab. If you create them on the **Parameters** tab, you get an error when you compile that says the test method signature is invalid.  
  
7.  In the C/AL Editor, in the `HandlerSampleTest` function, enter the following code:  
  
    ```  
    // [SCENARIO] When the user chooses "Price Including VAT" and agrees to update sales lines, the VAT Amount must stay nearly the same.  
    //[GIVEN] Basic sales document with item  
    ItemQty := LibraryRandom.RandInt(100);  
    LibrarySales.CreateSalesDocumentWithItem(SalesHeader,SalesLine,SalesHeader."Document Type"::Invoice,'','',ItemQty,'',0D);  
    VATBaseOriginal := SalesLine."VAT Base Amount";  
  
    //[WHEN] The user chooses the "Price Including VAT" field and agrees to update the sales lines (handler)  
    SalesHeader.VALIDATE("Prices Including VAT",NOT SalesHeader."Prices Including VAT");  
    SalesHeader.MODIFY(TRUE);  
    //[THEN] Updated VAT Base Amount is the same as originally calculated  
    SalesLine.FIND;  
    Assert.AreNearlyEqual(SalesLine."VAT Base Amount",VATBaseOriginal,LibraryERM.GetAmountRoundingPrecision,'');  
  
    ```  
  
     Isaac first defines the test scenario \[SCENARIO\], then details it with the GIVEN-THEN-WHEN notation. Finally the C/AL code is added. The code in this test function prepares the test data by creating a sales document with a random quantity of items in a sales line. Then, emulates that a user has chosen the Prices Including VAT field, and then validates that the VAT Base Amount is the same as before, more or less. The test raises an error if the results are not as expected.  
  
     Isaac has created the test function. Next, Isaac runs the test in the CAL Test Tool window in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
8.  Compile and save the codeunit.  
  
#### Running the Test  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in Object Designer, select page ID 130401, and then choose **Run**.  
  
2.  On the Home tab, choose **Get Test Codeunits**, and then choose **Select Test Codeunits**.  
  
3.  In the window that appears, set a filter for the new test codeunit, and then choose the OK button.  
  
4.  Choose the new test, and then, on the Home tab, choose **Run Selected**.  
  
 The test fails with the error “Unhandled UI: Confirm”. Next, Isaac creates a function to handle the confirmation dialog.  
  
## Adding a Test Function to Handle the Confirmation Dialog  
 In the test codeunit, Isaac adds a second function that handles the confirmation dialog for accepting to update sales lines.  
  
#### To add a confirmation handler function  
  
1.  In the **C/AL Globals** window, on the **Functions** tab, in the **Name** field, enter **ConfirmationHandler**.  
  
2.  In the **Properties** window for the new function, set the **FunctionType** property to **ConfirmHandler**.  
  
3.  In the **C/AL Locals** window for the `ConfirmationHandler` function, on the **Parameters** tab, enter the following parameters.  
  
    |Var|Name|DataType|Subtype|Length|  
    |---------|----------|--------------|-------------|------------|  
    ||Question|Text||1024|  
    |Yes|Reply|Boolean|||  
  
4.  In the **C/AL Locals** window, on the **Variables** tab, enter the following variables.  
  
    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |SalesHeader|Record|Sales Header|  
    |SalesLine|Record|Sales Line|  
  
5.  In the **C/AL Locals** window, on the **Text Constants** tab, add a text constant, `ConfUpdateLines`, with the following text in English \(United States\): **You have modified the %1 field. The recalculation of VAT may cause penny differences, so you must check the amounts afterward. Do you want to update the %2 field on the lines to reflect the new value of %1?**.  
  
6.  In the C/AL Editor, in the **ConfirmationHandler** function, enter the following code.  
  
    ```  
    IF Question = STRSUBSTNO(ConfUpdateLines,SalesHeader.FIELDCAPTION("Prices Including VAT"),SalesLine.FIELDCAPTION("Unit Price")) THEN  
      Reply:=TRUE;  
  
    ```  
  
     The code in this function emulates that the user chooses the OK button when prompted after they have chosen the Prices Including VAT field for the sales document.  
  
7.  To link the new confirmation handler to the `HandlerSampleTest` function, in the **C/AL Globals** window, on the **Functions** tab, choose the `HandlerSampleTest` function, and then, set the **HandlerFunctions** property to **ConfirmationHandler**.  
  
8.  Compile and save the codeunit.  
  
 When you run the test again, the new confirmation handler handles the confirmation dialog, and the test passes successfully.  
  
## See Also  
 [How to: Create Handler Functions](How-to--Create-Handler-Functions.md)   
 [How to: Run Automated ApplicationTests](How-to--Run-Automated-ApplicationTests.md)   
 [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md)   
 [Testing the Application](Testing-the-Application.md)   
 [Application Test Automation](Application-Test-Automation.md)   
 [Code Coverage](uiref/-$-N_9990-Code-Coverage-$-.md)
