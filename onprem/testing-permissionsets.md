---
title: "Testing With Permission Sets"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics-nav-2018"
---
# Testing With Permission Sets
You can write application tests in C/AL that use specific permission sets when the test is run. The permission sets define the access rights (such as read, write, and execute ) on tables, reports, functions, and other objects in the database.

Without applying any permission sets, a test will run with full permissions, similar to the rights that are granted by the SUPER permission set. This is probably satisfactory for testing the functionality in general. However, in most cases, users will be running with a permission set that limits their access to the functionality they need to do their work.

>[!IMPORTANT]  
>Security filters are not tested. 

## Overview
To run tests with permission sets requires that you work with test codeunits and/or test functions and test runner codeunits.

-   Test codeunits and test functions

    Test codeunits and test functions include the **TestPermissions** property. This  property has the following values: **Disabled**, **Restrictive**, **NonRestrictive**, **InheritFromCodeunit**. The values alone do not assign any permission sets to the test. At runtime, the property value is passed on to the **OnBeforeTestRun** and **OnAfterTestRun** triggers of test runner codeunits.You define which permission sets are applied to the test for each value by coding the **OnBeforeTestRun** and **OnAfterTestRun** triggers of a test runner codeunit.
    For more information, see [TestPermissions Property](property-testpermissions.md)  
    
-   Test runner codeunits

    You use test runner codeunits to apply the permission sets to use in the test based on the value of the **TestPermissions** property of the test. You do this by adding code to the **OnBeforeTestRun** and **OnAfterTestRun** triggers of the test runner codeunit. These triggers include the *TestPermissions* data type parameter.  The *TestPermissions* data type parameter takes the value of the **TestPermissions** property that is passed on from the test codeunit or test function that is run. On the triggers, you add code to define what permission sets to use for the test according to the value of the *TestPermissions* data type parameter.

    Typically, you code the **OnBeforeTestRun** trigger to assign the permission sets to the test, and the **OnAfterTestRun** trigger to clear the permission sets.
    
To summarize, a test codeunit or test function defines a general permission set level to use in a test run, while the test runner codeunit determines the specific permission set to use in the test run.    

## General Procedure for Using Permission Sets in Tests
1.  Determine the application functionality that you want to test with permission sets.
2.  Add or modify test codeunits or test functions that perform the tests.

    Set the TestPermissions property to the desired permission set level.
3.  Add or modify test runner codeunits that run the test codeunits and test functions.

    Add logic to the **OnBeforeTestRun** and **OnAfterTestRun** triggers to apply and clear the permission sets for the test. 
 

## Example
This simple code example illustrates how to test with permission sets. It uses a test runner codeunit to apply permission sets to test functions. The applied permission sets are determined by the different values of the **TestPermissions** property of the test function. 

For applying permission sets, the code uses a DotNet data type variable for **Microsoft.Dynamics.Nav.PermissionTestHelper** assembly. This assembly is provided as a server add-in with the [!INCLUDE[nav_server_md](includes/nav_server_md.md)] installation.

The OnBeforeTestRun trigger will apply one of three permission sets, which have the Role IDs **O365 BASIC**, **O365 BUS FULL ACCESS**, and **SUPER**.

```
OBJECT Codeunit 90000 MyTestPermissionsTestRunner
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=Test Objects;
  }
  PROPERTIES
  {
    Subtype=TestRunner;
    OnRun=BEGIN
          END;

  }
  CODE
  {
    VAR
      PermissionTestHelper@1000 : DotNet "'Microsoft.Dynamics.Nav.PermissionTestHelper, Version=10.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Runtime.PermissionTestHelper";

    PROCEDURE OnBeforeTestRun@1102601000(CodeunitId@1102601000 : Integer;CodeunitName@1102601001 : Text[30];FunctionName@1102601002 : Text[128];Permissions@1000 : TestPermissions) : Boolean;
    BEGIN
      IF ISNULL(PermissionTestHelper) THEN
        PermissionTestHelper := PermissionTestHelper.PermissionTestHelper;

      PermissionTestHelper.Clear;

      CASE Permissions OF
        TESTPERMISSIONS::Restrictive:
          PermissionTestHelper.AddEffectivePermissionSet('O365 BASIC');
        TESTPERMISSIONS::NonRestrictive:
          PermissionTestHelper.AddEffectivePermissionSet('O365 BUS FULL ACCESS');
        TESTPERMISSIONS::Disabled:
          PermissionTestHelper.AddEffectivePermissionSet('SUPER');
      END;

      EXIT(TRUE);
    END;

    PROCEDURE OnAfterTestRun@1102601002(CodeunitId@1003 : Integer;CodeunitName@1002 : Text[30];FunctionName@1001 : Text[128];Permissions@1000 : TestPermissions;Success@1102601003 : Boolean);
    VAR
      PermissionTestHelper@1004 : DotNet "'Microsoft.Dynamics.Nav.PermissionTestHelper, Version=10.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Runtime.PermissionTestHelper";
    BEGIN
      IF ISNULL(PermissionTestHelper) THEN
        PermissionTestHelper := PermissionTestHelper.PermissionTestHelper;

      IF Permissions <> TESTPERMISSIONS::Disabled THEN
        PermissionTestHelper.Clear;
    END;

    BEGIN
    END.
  }
}
```

## See Also  
[OnBeforeTestRun](trigger-onbeforetestrun.md)  
[OnAfterTestRun](trigger-onaftertestrun.md)  
[Testing the Application](Testing-the-Application.md)  
[How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md)  
[How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md)  
[How to: Create Handler Functions](How-to--Create-Handler-Functions.md)  
[Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md)  
