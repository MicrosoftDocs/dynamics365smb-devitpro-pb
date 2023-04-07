---
title: Create a Test Page
description: Declare a test page variable and then write C/AL code to open the test page by using either OPENNEW, OPENEDIT or OPENVIEW function.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4d5d9eb3-00e4-4ffb-9819-f93aae75d51c
caps.latest.revision: 6
---
# Creating a Test Page in Dynamics NAV
You can create and open a test page in the following ways:  
  
-   Declare a test page variable and then write C/AL code to open the test page by using one of the following functions:  
  
    -   [OPENNEW Function \(TestPage\)](OPENNEW-Function--TestPage-.md)  
  
    -   [OPENEDIT Function \(TestPage\)](OPENEDIT-Function--TestPage-.md)  
  
    -   [OPENVIEW Function \(TestPage\)](OPENVIEW-Function--TestPage-.md)  
  
-   Create a PageHandler or ModalPageHandler function that has a test page parameter. For more information, see [How to: Create Handler Functions](How-to--Create-Handler-Functions.md).  
  
-   Write C/AL code to trap a call to open a test page by using the [TRAP Function \(TestPage\)](TRAP-Function--TestPage-.md).  
  
 The following procedure describes how to declare test page variables. The following code example shows how to use the test page variables to write code to open test pages.  
  
### To declare a test page variable  
  
1.  Create a test codeunit. For more information, see [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md).  
  
2.  In Object Designer, on the **View** menu, choose **C/AL Globals**.  
  
3.  In the **C/AL Globals** window, on the **Variables** tab, enter the following:  
  
    1.  In the **Name** column, enter a name for the test page variable.  
  
    2.  In the **DataType** column, select **TestPage** from the drop-down list.  
  
    3.  In the **Subtype** column, select the page that you want to test with the test page variable.  
  
## Example  
 This example shows how to use the OPENEDIT function to open a test page. It also shows how to use the TRAP function to trap a call to open a test page so that the opened page is assigned to a variable.  
  
 This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerCard|TestPage|Customer Card|  
|CustomerStatistics|TestPage|Customer Statistics|  
|ShipToAddressList|TestPage|Ship-to Address List|  
  
```  
CustomerCard.OPENEDIT;  
// Test Customer Card page  
CustomerStatistics.TRAP; // The next page that is invoked will be trapped and assigned to the CustomerStatistics variable.  
CustomerCard."Page Customer Statistics".INVOKE; // Invokes an action from the Customer Card page.   
CustomerStatistics."Balance (LCY)".ASSERTEQUALS(0); // Now that the CustomerStatistics test page is open, you can use the variable to test the page.  
ShipToAddressList.TRAP; // The next page that is invoked will be trapped and assigned to the ShipToAddressList variable.  
CustomerCard."Page Ship-to Address List".INVOKE; // Invoke an action from the Customer Card page.  
// Continue testing  
```  
  
 If the Balance \(LCY\) value for the customer whose card page you opened is 0, then the test result is SUCCESS, and you get a message that is like the following message.  
  
 **Test Code Unit 50001 TestBalanceLCY**  
  
 **OnRun: SUCCESS**  
  
 **SUCCESS**  
  
 If the Balance \(LCY\) value for the customer whose card page you opened is not 0, then the test result is FAILURE, and you get a message that is like the following message.  
  
 **Test Code Unit 50001 TestBalanceLCY**  
  
 **OnRun: FAILURE**  
  
 **AssertEquals for Field:Balance \(LCY\) Expected = ‘0,00’, Actual = ‘1.499,02’**  
  
 **FAILURE**  
  
## See Also  
 [Testing the Application](Testing-the-Application.md)
