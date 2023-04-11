---
title: "Testing Pages"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 006974e4-4cfb-4c92-9683-10e160ef057c
caps.latest.revision: 13
---
# Testing Pages
You use test page objects to simulate user interactions with the application. You can:  
  
-   View or change the value of a field on a test page.  
  
-   View the data on page parts.  
  
-   View or change the value of a field on a subpage.  
  
-   Filter the data on a test page.  
  
-   Perform any actions that are available on the page.  
  
-   Navigate to different records.  
  
 You must consider how you set the [TransactionModel Property](TransactionModel-Property.md) to simulate the scenario that you want to test and to return the database to its initial state after the test.  
  
> [!NOTE]  
>  Test functions and code on test pages run on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, even though they simulate client interactions.  
  
## Accessing Fields on Test Pages  
 You access the fields on a test page by using the dot notation. For example, if you have a test page variable named CustomerCard that represents the Customer Card page, then to access the Name field on the test page, you write `CustomerCard.Name` in your code.  
  
 To get the value of a field or to write a value in a field, you use the Value property. For example, if you have a test page variable named CustomerCard that represents the Customer Card page, then to assign the value of the No. field to a variable named CustNo, you write `CustNo := CustomerCard."No.".Value` in your code. To write a value in the Address field of a Customer Card page, you write `CustomerCard.Address.Value := '<address>'` in your code.  
  
 For more information about C/AL functions that you use to access fields on a test page, see [TestPage Field Functions](TestPage-Field-Functions.md).  
  
## Accessing Page Parts and Subpages  
 You access page parts and subpages on a test page by using the dot notation. For example, to compare the value of the No. field on a page to the value of the No. field on a FactBox on the page, you can write the following code.  
  
```  
If CustomerCard."No.".Value <> CustomerCard."Sales Hist. Sell-to FactBox"."No.".Value THEN  
  ERROR("Page part data is not updated.");  
  
```  
  
 You can use the Symbol Menu to view page parts and subpages and to access the functions, properties, fields, and actions on page parts and subpages.  
  
## Filtering Data on Test Pages  
 To filter the data that can be accessed on a test page, you use the Filter property and filter functions. For example, to filter the customers on the Customer List page based on a range of values in the No. field, you can write the following code.  
  
```  
CustomerList.Filter.SETFILTER("No.", '20000..30000');  
```  
  
 For more information about C/AL functions that you use for filtering, see [TestPage Filter Functions](TestPage-Filter-Functions.md).  
  
## Invoking Actions on Test Pages  
 Any action that is available on a page is also available on the test page that mimics that page. You access page actions by using the dot notation and the [INVOKE Function \(TestPage Action\)](INVOKE-Function--TestPage-Action-.md). You can use the Symbol Menu to view the actions that are available on a test page. To view actions that you designed by using Page Designer, select the test page variable in the first column of the symbols, and then select **Actions** in the second column. To view built-in actions, such as Yes, No, OK, or Cancel, select the test page variable in the first column of the symbols, and then select **BuiltInActions** in the second column.  
  
> [!NOTE]  
>  The Symbol Menu may include built-in actions that are not available on the page. If you call a built-in action that is not available on the page, then the test fails.  
  
 For example, to choose **OK** after you create a new customer on the Customer Card page, you can write the following code.  
  
```  
CustomerCard.OPENNEW;  
CustomerCard.Name.Value := 'Adventure Works';  
CustomerCard.OK.INVOKE;  
```  
  
## Navigating Among Records  
 To simulate moving to different items on a list page or moving to different records on a card page, you use one of the following navigation functions:  
  
-   [NEXT Function \(TestPage\)](NEXT-Function--TestPage-.md)  
  
-   [PREVIOUS Function \(TestPage\)](PREVIOUS-Function--TestPage-.md)  
  
-   [FIRST Function \(TestPage\)](FIRST-Function--TestPage-.md)  
  
-   [LAST Function \(TestPage\)](LAST-Function--TestPage-.md)  
  
-   [GOTORECORD Function \(TestPage\)](GOTORECORD-Function--TestPage-.md)  
  
-   [GOTOKEY Function \(TestPage\)](GOTOKEY-Function--TestPage-.md)  
  
-   [FINDFIRSTFIELD Function \(TestPage\)](FINDFIRSTFIELD-Function--TestPage-.md)  
  
-   [FINDNEXTFIELD Function \(TestPage\)](FINDNEXTFIELD-Function--TestPage-.md)  
  
-   [FINDPREVIOUSFIELD Function \(TestPage\)](FINDPREVIOUSFIELD-Function--TestPage-.md)  
  
## See Also  
 [Testing the Application](Testing-the-Application.md)   
 [How to: Create a Test Page](How-to--Create-a-Test-Page.md)
