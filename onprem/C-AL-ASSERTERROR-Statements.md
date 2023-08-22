---
title: "C/AL ASSERTERROR Statements"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 56de551c-f53e-4ab9-a738-3f9a58beb853
caps.latest.revision: 8
---
# C/AL ASSERTERROR Statements
You use ASSERTERROR statements in test functions to test how your application behaves under failing conditions. The ASSERTERROR keyword specifies that an error is expected at run time in the statement that follows the ASSERTERROR keyword.  

 If a simple or compound statement that follows the ASSERTERROR keyword causes an error, then execution successfully continues to the next statement in the test function. You can get the error text of the statement by using the [GETLASTERRORTEXT Function](GETLASTERRORTEXT-Function.md).  

 If a statement that follows the ASSERTERROR keyword does not cause an error, then the ASSERTERROR statement causes the following error and the test function that is running produces a FAILURE result:  

 **TestAsserterrorFail: FAILURE**  

 **An error was expected inside an ASSERTERROR statement.**  

## Example  
 To create a test function to test the result of a failure of a CheckDate function that you have defined, you can use the following code. This example requires that you create a function called CheckDate to check whether the date is valid for the customized application and that you create the following text constant and variables.  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text001|'The date is outside the valid date range.'|  

|Name|DataType|  
|----------|--------------|  
|InvalidDate|Date|  
|InvalidDateErrorMessage|Text|  

```  
InvalidDate := 010184D;  
InvalidDateErrorMessage := Text001;  
ASSERTERROR CheckDate(InvalidDate);  
IF GETLASTERRORTEXT <> InvalidDateErrorMessage THEN  
  ERROR('Unexpected error: %1', GETLASTERRORTEXT);  
```  

## See Also  
 [Testing the Application](Testing-the-Application.md)   
 [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md)   
 [C/AL Reserved Words](C-AL-Reserved-Words.md)
