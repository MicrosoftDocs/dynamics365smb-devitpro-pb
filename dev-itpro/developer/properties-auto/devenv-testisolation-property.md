---
title: "TestIsolation Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestIsolation Property
Specifies which changes to the database to roll back after the tests in the test runner codeunit execute.

## Applies to
-   Codeunit

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|Disabled|TODO:Add documentation|
|Codeunit|TODO:Add documentation|
|Function|TODO:Add documentation|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
TestIsolation = Codeunit;
```

## Remarks  

We recommend that you design tests to be independent of each other. Tests might read from and write to the same database, which means that tests can interact with each other. If tests interact, then you may experience incorrect test results. To eliminate test interactions, use the **TestIsolation** property to roll back changes to the database after each test method or after each test codeunit.  
  
> [!NOTE]  
> If you specify that you want to roll back database changes, then all database changes are rolled back, including changes that were explicitly committed to the database during the test by using the [COMMIT Method](../methods-auto/database/database-commit-method.md).  

## See Also

[TestPermissions Property](devenv-testpermissions-property.md)  
[Properties](devenv-properties.md)
<!-- 
[How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md)   
[Testing the Application](Testing-the-Application.md)
-->