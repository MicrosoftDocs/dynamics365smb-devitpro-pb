---
title: Test Codeunits and Test Functions
description: This topic describes how to create test codeunits and how to create test functions in the test codeunits in Dynamics NAV. 
ms.custom: na
ms.date: 12/05/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6da55c81-d0e3-4a77-b45c-751479ff17b9
caps.latest.revision: 15
manager: edupont
---
# Creating Test Codeunits and Test Functions
In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can create test codeunits and create test functions in the test codeunits.  

 When you create a new function in a test codeunit, the **FunctionType** property is set to **Test** by default.  

### To create a test codeunit and test functions  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, choose **Codeunit**, and then choose **New**.  

3.  On the **View** menu, choose **Properties**.  

4.  In the **Properties** window, in the **Subtype** field, select **Test** to specify that this is a test codeunit.  

5.  On the **View** menu, choose **C/AL Globals**.  

6.  In the **C/AL Globals** window, on the **Functions** tab, enter the names of the test functions in this test codeunit.  

7.  For each test function, select the function, choose **View**, choose **Properties**, and then verify that the **FunctionType** property is set to **Test**.  

8.  In the **Properties** window, choose how you want to commit changes to the database during the test by setting the [TransactionModel Property](TransactionModel-Property.md).  

9. If any test functions need UI handlers, then enter the names of the handler functions in the **C/AL Globals** window. For more information, see [How to: Create Handler Functions](How-to--Create-Handler-Functions.md).  

10. In the **C/AL Editor**, enter code for each test function and handler function that you defined. You can also enter code in the **OnRun** function. The **OnRun** function runs when you execute the codeunit and before the test functions run.  

    > [!NOTE]  
    >  Test functions must not have parameters or return values.  

11. On the **File** menu, choose **Save**. In the **Save** window, verify that the **Compiled** check box is selected, and then choose the **OK** button to save and compile the test codeunit.  

## See Also  
 [Testing the Application](Testing-the-Application.md)   
 [How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md)   
 [How to: Create Handler Functions](How-to--Create-Handler-Functions.md)  
 [Testing with Permission Sets](testing-permissionsets.md)  
