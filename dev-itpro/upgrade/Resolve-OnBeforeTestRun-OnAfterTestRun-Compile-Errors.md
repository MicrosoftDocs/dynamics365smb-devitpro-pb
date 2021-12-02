---
title: "Fix OnBeforeTestRun and OnAfterTestRun After Database Conversion"
description: Explains how to resolve the problems with the OnBeforeTestRun and OnAfterTestRun triggers you convert a Dynamics NAV database.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---

# Resolving OnBeforeTestRun and OnAfterTestRun Trigger Errors When Converting a Database

Use the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] to change the signature of the C/AL OnBeforeTestRun and OnAfterTestRun trigger functions of the test runner codeunits to include the *TestPermissions* parameter.

OnBeforeTestRun trigger before change:
```
OnBeforeTestRun(CodeunitID : Integer;CodeunitName : Text[30];FunctionName : Text[128];) Ok : Boolean)
```
OnBeforeTestRun trigger after change:
```
OnBeforeTestRun(CodeunitID : Integer;CodeunitName : Text[30];FunctionName : Text[128];FunctionTestPermissions : TestPermissions) Ok : Boolean)
```
OnAfterTestRun trigger before change:
```
OnAfterTestRun(CodeunitID : Integer;CodeunitName : Text[30];FunctionName : Text[128];Success : Boolean)
```
OnAfterTestRun trigger after change:
```
OnAfterTestRun(CodeunitID : Integer;CodeunitName : Text[30];FunctionName : Text[128];FunctionTestPermissions : TestPermissions;Success : Boolean)
```
If you do not change the signature, you will get errors when you compile these objects.

## See Also  
 [Converting a Database](Converting-a-Database.md)  
