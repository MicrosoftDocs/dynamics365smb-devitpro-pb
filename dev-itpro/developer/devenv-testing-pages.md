---
title: "Testing Pages"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 7f7961ce-7256-43e9-9dc5-7fd93e65ee3a
caps.latest.revision: 32
author: jswymer
---

# Testing Pages

You use test page objects to simulate user interactions with the application. You can:  
  
-   View or change the value of a field on a test page.  
  
-   View the data on page parts.  
  
-   View or change the value of a field on a subpage.  
  
-   Filter the data on a test page.  
  
-   Perform any actions that are available on the page.  
  
-   Navigate to different records.  


You can create and open a test page in the following ways:  
  
- Declare a test page variable and then write AL code to open the test page by using one of the following methods:  
  
  -   [OpenNew Method \(TestPage\)](methods-auto/testpage/testpage-opennew-method.md)  
  
  -   [OpenEdit Method \(TestPage\)](methods-auto/testpage/testpage-openedit-method.md)  
  
  -   [OpenView Method \(TestPage\)](methods-auto/testpage/testpage-openview-method.md)  
  
- Create a **PageHandler** or **ModalPageHandler** method that has a test page parameter. 
  
- Write AL code to trap a call to open a test page by using the [Trap Method \(TestPage\)](methods-auto/testpage/testpage-trap-method.md).  

> [!NOTE]
> You must consider how you set the [TransactionModel Property](properties/devenv-transactionmodel-property.md) to simulate the scenario that you want to test and to return the database to its initial state after the test. 

> [!NOTE]  
> Test methods and code on test pages run on the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] Server instance, even though they simulate client interactions.  
 
 For more information about the AL methods that you use on a test page, see [TestPage Data Type](methods-auto/testpage/testpage-data-type.md).  

## Accessing Fields on Test Pages

You access the fields on a test page by using the dot notation. For example, if you have a test page variable named `CustomerCard` that represents the `Customer Card` page, then to access the `Name` field on the test page, you write `CustomerCard.Name` in your code.  
  
These fields are instances of the [TestField Data Type](methods-auto/testfield/testfield-data-type.md), so you can use the corresponding AL methods to work with them. For example, if you have a test page variable named `CustomerCard` that represents the `Customer Card` page, then to assign the value of the `No.` field to a variable named `CustNo`, you write `CustNo := CustomerCard."No.".Value` in your code. To write a value in the `Address` field of a `Customer Card` page, you write `CustomerCard.Address.Value := '<address>'` in your code.  
 
  
## Accessing Page Parts and Subpages

You access page parts and subpages on a test page by using the dot notation. 
 
These are instances of the [TestPart Data Type](methods-auto/testpart/testpart-data-type.md), so you can use the corresponding AL methods to work with them.

For example, to compare the value of the `No.` field on a page to the value of the `No`. field on a FactBox on the page, you can write the following code.  

```AL
if CustomerCard."No.".Value <> CustomerCard."Sales Hist. Sell-to FactBox"."No.".Value then  
  error("Page part data is not updated.");  
  
```  

## Filtering Data on Test Pages

To filter the data that can be accessed on a test page, you use AL methods correspoding to the [TestFilter Data Type](methods-auto/testpart/testpart-data-type.md) instances. For example, to filter the customers on the `Customer List` page based on a range of values in the `No.` field, you can write the following code.  
  
```AL
CustomerList.Filter.SetFilter("No.", '20000..30000');  
```  
  
## Invoking Actions on Test Pages

Any action that is available on a page is also available on the test page that mimics that page. You access page actions by using the dot notation and the [Invoke Method](methods-auto/testaction/testaction-invoke-method.md). 

These are instances of the [TestAction Data Type](methods-auto/testaction/testaction-data-type.md), so you can use the corresponding AL methods to work with them. To access built-in actions, such as Yes, No, OK, or Cancel you can also call the [Yes Method](methods-auto/testpage/testpage-yes-method.md), [No Method](methods-auto/testpage/testpage-no-method.md), [Ok Method](methods-auto/testpage/testpage-ok-method.md) and [Cancel Method](methods-auto/testpage/testpage-ok-method.md) respectively, directly in the test page.
  
## Navigating Among Records

To simulate moving to different items on a list page or moving to different records on a card page, you use one of the following navigation methods:  
  
-   [Next Method \(TestPage\)](methods-auto/testpage/testpage-next-method.md)  
  
-   [Previous Method \(TestPage\)](methods-auto/testpage/testpage-previous-method.md) 
  
-   [First Method \(TestPage\)](methods-auto/testpage/testpage-first-method.md)   
  
-   [Last Method \(TestPage\)](methods-auto/testpage/testpage-last-method.md)  
  
-   [GoToRecord Method \(TestPage\)](methods-auto/testpage/testpage-gotorecord-method.md) )  
  
-   [GoToKey Method \(TestPage\)](methods-auto/testpage/testpage-gotokey-method.md)   
  
-   [FindFirstField Method \(TestPage\)](methods-auto/testpage/testpage-findfirstfield-method.md)   
  
-   [FindNextField Method \(TestPage\)](methods-auto/testpage/testpage-findnextfield-method.md)   
  
-   [FindPreviousField Method \(TestPage\)](methods-auto/testpage/testpage-findpreviousfield-method.md)   
  
## See Also

[Testing the Application](devenv-testing-pages.md)  
[Testing the Advanced Sample Extension](devenv-extension-advanced-example-test.md)  