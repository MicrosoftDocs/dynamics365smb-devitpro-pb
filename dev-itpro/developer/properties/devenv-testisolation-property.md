---
title: "TestIsolation Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 01226286-33b5-41a5-991c-5db627a077d8
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# TestIsolation Property
Specifies which changes to the database to roll back after the tests in the test runner codeunit execute.  
  
## Applies To  
 Test runner codeunits. A test runner codeunit has the [SubType Property \(Codeunit\)](devenv-subtype-property-codeunit.md) set to **TestRunner**.   
  
## Property Value  
  
|Value|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|Disabled|Do not roll back any changes to the database. Tests are not isolated from each other.<br/><br /> This is the default value.|  
|Codeunit|Roll back all changes to the database after each test codeunit executes.|  
|Function|Roll back all changes to the database after each test method executes.|  
 
## Syntax
```
TestIsolation = Codeunit;
```

## Remarks  
We recommend that you design tests to be independent of each other. Tests might read from and write to the same database, which means that tests can interact with each other. If tests interact, then you may experience incorrect test results. To eliminate test interactions, use the **TestIsolation** property to roll back changes to the database after each test method or after each test codeunit.  
  
> [!NOTE]  
>  If you specify that you want to roll back database changes, then all database changes are rolled back, including changes that were explicitly committed to the database during the test by using the [COMMIT Method](../methods-auto/database/database-commit-method.md).  

## See Also  
[TestPermissions Property](devenv-testpermissions-property.md)  
[Properties](devenv-properties.md)
<!-- 
[How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md)   
[Testing the Application](Testing-the-Application.md)
-->