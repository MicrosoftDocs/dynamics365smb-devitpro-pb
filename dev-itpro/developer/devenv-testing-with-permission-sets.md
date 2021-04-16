---
title: "Testing With Permission Sets"
description: Learn how to run tests in Business Central using permission sets
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: blrobl
ROBOTS: NOINDEX
---

# Testing With Permission Sets
You can write application tests in AL that use specific permission sets when the test is run. The permission sets define the access rights (such as read, write, and execute) on tables, reports, methods, and other objects in the database.

Without applying any permission sets, a test will run with full permissions, similar to the rights that are granted by the SUPER permission set. This is probably satisfactory for testing the functionality in general. However, in most cases, users will be running with a permission set that limits their access to the functionality they need to do their work.

> [!IMPORTANT]  
> Security filters are not tested. 

## Overview
To run tests with permission sets requires that you work with test codeunits and/or test methods and test runner codeunits.

- Test codeunits and test methods

  Test codeunits and test methods include the [TestPermissions Property](properties/devenv-testpermissions-property.md) . This  property has the following values: **Disabled**, **Restrictive**, **NonRestrictive**, **InheritFromCodeunit**. The values alone do not assign any permission sets to the test. At runtime, the property value is passed on to the **OnBeforeTestRun** and **OnAfterTestRun** triggers of test runner codeunits. You define which permission sets are applied to the test for each value by coding the **OnBeforeTestRun** and **OnAfterTestRun** triggers of a test runner codeunit.
    
- Test runner codeunits

You use test runner codeunits to apply the permission sets to use in the test based on the value of the [TestPermissions Property](properties/devenv-testpermissions-property.md) of the test. You do this by adding code to the **OnBeforeTestRun** and **OnAfterTestRun** triggers of the test runner codeunit. These triggers include the *TestPermissions* data type parameter.  The *TestPermissions* data type parameter takes the value of the [TestPermissions Property](properties/devenv-testpermissions-property.md)  that is passed on from the test codeunit or test method that is run. On the triggers, you add code to define what permission sets to use for the test according to the value of the *TestPermissions* data type parameter.

Typically, you code the **OnBeforeTestRun** trigger to assign the permission sets to the test, and the **OnAfterTestRun** trigger to clear the permission sets.
    
To summarize, a test codeunit or test method defines a general permission set level to use in a test run, while the test runner codeunit determines the specific permission set to use in the test run.    

## General procedure for using Permission Sets in tests
1. Determine the application functionality that you want to test with permission sets.
2. Add or modify test codeunits or test methods that perform the tests.

    Set the TestPermissions property to the desired permission set level.
3. Add or modify test runner codeunits that run the test codeunits and test methods.

    Add logic to the **OnBeforeTestRun** and **OnAfterTestRun** triggers to apply and clear the permission sets for the test. 
 
## Example
This simple code example illustrates how to test with permission sets. It uses a test runner codeunit to apply permission sets to test methods. The applied permission sets are determined by the different values of the [TestPermissions Property](properties/devenv-testpermissions-property.md) of the test method. 

For applying permission sets, the code uses a *DotNet* data type variable for **PermissionTestHelper** assembly. This assembly is provided as a server add-in with the [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] installation.

The OnBeforeTestRun trigger will apply one of three permission sets, which have the Role IDs **O365 BASIC**, **O365 BUS FULL ACCESS**, and **SUPER**.

```AL
codeunit 50101 MyTestPermissionsTestRunner
{
    Subtype = TestRunner;

    trigger OnBeforeTestRun(CodeunitId: Integer; CodeunitName: Text; MethodName: Text; Permissions: TestPermissions): Boolean
    var
        myInt: Integer;
    begin
        if ISNULL(PermissionTestHelper) then
            PermissionTestHelper := PermissionTestHelper.PermissionTestHelper;

        PermissionTestHelper.Clear;

        case Permissions of
            TESTPERMISSIONS::Restrictive:
                PermissionTestHelper.AddEffectivePermissionSet('O365 BASIC');
            TESTPERMISSIONS::NonRestrictive:
                PermissionTestHelper.AddEffectivePermissionSet('O365 BUS FULL ACCESS');
            TESTPERMISSIONS::Disabled:
                PermissionTestHelper.AddEffectivePermissionSet('SUPER');
        end;

        exit(true);
    end;

    trigger OnAfterTestRun(CodeunitId: Integer; CodeunitName: Text; MethodName: Text; Permissions: TestPermissions; Success: Boolean)
    begin
      if ISNULL(PermissionTestHelper) then
        PermissionTestHelper := PermissionTestHelper.PermissionTestHelper;

      if Permissions <> TESTPERMISSIONS::Disabled then
        PermissionTestHelper.Clear;
    end;

    var
        PermissionTestHelper: DotNet PermissionTestHelper;
}

```
## See Also  
[OnBeforeTestRun](triggers/devenv-onbeforetestrun-trigger.md)  
[OnAfterTestRun](triggers/devenv-onaftertestrun-trigger.md)  
[Testing the Application](devenv-Testing-Application.md)  
[Creating Handler Methods](devenv-creating-handler-methods.md)  
[Special Permission Sets](../administration/administration-special-permission-sets.md)  
