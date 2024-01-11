---
title: "Random test data"
ms.custom: na
ms.date: 01/03/2024
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 61228c16-7d4e-44a7-a3b3-bc3fc2a8b6f9
caps.latest.revision: 2
---
# Random test data
You can use codeunit 130440 **Library – Random** to help generate random data for your application tests. Only use hardcoded values in tests when you really need it. For all other data, consider using random data.  
  
## Using random data  
 When your application test doesn't require a specific value, use the functions in the **Library – Random** codeunit to generate random data for you on the fly. For example, the following code snippet illustrates how you generate two values and test that the second is larger than the first.  
  
```  
Number1 := RandomNumberGenerator.RandInt(10);   
  
Number2 := Number1+ RandomNumberGenerator.RandInt(10);   
  
Result := MIN(Number1,Number2);   
  
Assert.AreEqual(Number1,Result,Err);  
```  
  
 This example uses random integers because it doesn't matter if the second number is 2 or 2000. You can use similar code to generate random decimal numbers, dates, and so on.  
  
### Seeding test data  
 Sometimes random value can lead to test failures, so you want to be able to reproduce the failure and fix it. In most of codeunits in the application test libraries, you find an `Initialize` function that often contains following statement:  
  
```  
RandomTestRunner.SetSeed(1);  
```  
  
 The `SetSeed` function injects a starting point for the random numbers that the test will generate. Then, when you rerun the test or try to reproduce the failure in another table or database, the same sequence of records is created each time. The following code snippet illustrates this seeding of data.  
  
```  
RandomHistory.DELETEALL;   
  
RandomTestRunner.SetSeed(1);   
  
FOR Counter := 1 TO 400 DO BEGIN  
  
  RandomHistory.EntryNo := Counter;   
  
  RandomHistory.RandomValue := RandomTestRunner.RandDec(1000,2);   
  
  RandomHistory.INSERT;   
  
END;  
```  
  
 If a test codeunit contains two tests, and both use random data, they run in sequence so that Test A gets Random Data A and Test B gets Random Data B. But if you decide to run only Test B, it gets a new random value. Similarly, if you change the order of the tests in your test codeunit, they all get new random data. You can use this behavior in different ways. For example, you can call the `SetSeed` function in the beginning of each test to ensure that the same set of random number is generated; or you can use this for fuzzy testing.  
  
## See also  
 [Application Test Automation](Application-Test-Automation.md)   
 [How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md)   
 [Testing the Application](Testing-the-Application.md)