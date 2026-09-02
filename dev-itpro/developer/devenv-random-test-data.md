---
title: Random Test Data for Application Tests
description: Learn how to generate random data for application tests in Business Central, and how to seed random values so you can reproduce and fix test failures.
ms.date: 08/24/2026
ms.reviewer: solsen
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Random test data

You can use codeunit **Library - Random** to help generate random data for your application tests. Only use hardcoded values in tests when you really need them. For all other data, consider using random data.

## Using random data

When your application test doesn't require a specific value, use the methods in the **Library - Random** codeunit to generate random data for you on the fly. For example, the following code snippet illustrates how you generate two values and test that the second is larger than the first.

```al
var
    LibraryRandom: Codeunit "Library - Random";
    Assert: Codeunit Assert;
    Number1: Integer;
    Number2: Integer;
begin
    Number1 := LibraryRandom.RandInt(10);
    Number2 := Number1 + LibraryRandom.RandInt(10);

    Assert.IsTrue(Number2 > Number1, Err);
end;
```

This example uses random integers because it doesn't matter if the second number is 2 or 2000. You can use similar code to generate random decimal numbers, dates, and so on.

> [!TIP]
> Use the [Any library](https://github.com/microsoft/BCApps/tree/main/src/Tools/Test%20Framework/Test%20Libraries/Any) in the BCApps repository to generate pseudo-random values during test set-up. This module generates the same set of numbers, allowing you to reproduce test failures.

### Seeding test data

Sometimes random values lead to test failures, so you want to be able to reproduce the failure and fix it. In most codeunits in the application test libraries, you find an `Initialize` method that often contains the following statement:

```al
LibraryRandom.SetSeed(1);
```

The `SetSeed` method on the **Library - Random** codeunit injects a starting point for the random numbers that the test generates. Then, when you rerun the test or try to reproduce the failure in another table or database, the same sequence of records is created each time. The following code snippet illustrates this seeding of data.

```al
RandomHistory.DeleteAll();

LibraryRandom.SetSeed(1);

for Counter := 1 to 400 do begin
    RandomHistory.EntryNo := Counter;
    RandomHistory.RandomValue := LibraryRandom.RandDec(1000, 2);
    RandomHistory.Insert();
end;
```

If a test codeunit contains two tests, and both use random data, they run in sequence so that Test A gets Random Data A and Test B gets Random Data B. But if you decide to run only Test B, it gets a new random value. Similarly, if you change the order of the tests in your test codeunit, they all get new random data. You can use this behavior in different ways. For example, you can call the `SetSeed` method in the beginning of each test to ensure that the same set of random numbers is generated, or you can use this for fuzzy testing.

## Related information
 <!--[Application Test Automation](Application-Test-Automation.md)-->
[Testing the application](devenv-testing-application.md)  
