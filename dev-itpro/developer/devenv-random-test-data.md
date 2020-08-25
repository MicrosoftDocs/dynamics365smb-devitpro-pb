---
title: "Random Test Data"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
author: blrobl
---

# Random Test Data
You can use codeunit **Library – Random** to help generate random data for your application tests. Only use hardcoded values in tests when you really need it. For all other data, consider using random data.  
  
## Using random data  
When your application test does not require a specific value, use the methods in the **Library – Random** codeunit to generate random data for you on the fly. For example, the following code snippet illustrates how you generate two values and test that the second is larger than the first.  
  
```  
Number1 := RandomNumberGenerator.RandInt(10);   
  
Number2 := Number1+ RandomNumberGenerator.RandInt(10);   
  
Result := MIN(Number1,Number2);   
  
Assert.AreEqual(Number1,Result,Err);  
```  
  
 This example uses random integers because it does not matter if the second number is 2 or 2000. You can use similar code to generate random decimal numbers, dates, and so on. 

> [!TIP]
> Use the [Any module](https://github.com/microsoft/ALAppExtensions/tree/master/Modules/DevTools/TestFramework/TestLibraries/Any) in the Microsoft/ALAppExtensions GitHub repo to generate pseudo-random values during test set-up. This module generates the same set of numbers, allowing you to reproduce test failures.
  
### Seeding test data  
Sometimes random value can lead to test failures, so you want to be able to reproduce the failure and fix it. In most of codeunits in the application test libraries, you find an `Initialize` method that often contains following statement:  
  
```  
RandomTestRunner.SetSeed(1);  
```  
  
The `SetSeed` method injects a starting point for the random numbers that the test will generate. Then, when you rerun the test or try to reproduce the failure in another table or database, the same sequence of records is created each time. The followed code snippet illustres this seeding of data.  
  
```  
RandomHistory.DELETEALL;   
  
RandomTestRunner.SetSeed(1);   
  
for Counter := 1 TO 400 do begin  
  
  RandomHistory.EntryNo := Counter;   
  
  RandomHistory.RandomValue := RandomTestRunner.RandDec(1000,2);   
  
  RandomHistory.INSERT;   
  
end;  
```  
  
If a test codeunit contains two tests, and both use random data, they run in sequence so that Test A gets Random Data A and Test B gets Random Data B. But if you decide to run only Test B, it gets a new random value. Similarly, if you change the order of the tests in your test codeunit, they all get new random data. You can use this behavior in different ways. For example, you can call the `SetSeed` method in the beginning of each test to ensure that the same set of random number is generated; or you can use this for fuzzy testing.  
  
## See Also  
 <!--[Application Test Automation](Application-Test-Automation.md)--> 
 [Testing the Application](devenv-Testing-Application.md)
