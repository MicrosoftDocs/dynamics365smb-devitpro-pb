---
title: Run AL Tests in Visual Studio Code
description: Learn how to use the Test Explorer in Visual Studio Code to discover and run AL tests for Business Central directly from the IDE.
ms.date: 03/05/2026
ms.reviewer: solsen
ms.topic: how-to
author: SusanneWindfeldPedersen
ms.author: solsen
ms.service: dynamics-365-business-central
---

# Run AL tests from Visual Studio Code with Test Explorer

[!INCLUDE [2026-releasewave1-later](../includes/2026-releasewave1-later.md)]

You can use the built-in *Test Explorer* in Visual Studio Code to discover and run AL tests in your workspace. This feature lets you run tests directly from the IDE instead of using an external test runner or the [!INCLUDE [prod_short](includes/prod_short.md)] web client.

> [!NOTE]
> This feature is under active development and should be considered experimental. More functionality may be added, or existing functionality may change.

## Prerequisites

Before you run tests from Visual Studio Code, make sure you meet the following requirements:

- [!INCLUDE [prod_short](includes/prod_short.md)] version 28.0 or newer (2026 release wave 1).
- The AL Language extension for Visual Studio Code is installed.
- Your tests are published to a [!INCLUDE [prod_short](includes/prod_short.md)] server (sandbox or local).

## Discover and run tests

The Test Explorer automatically detects test codeunits and test methods in the active workspace.

1. Open the **Test Explorer** view in Visual Studio Code. Learn more about the Test Explorer in [Testing in Visual Studio Code](https://code.visualstudio.com/docs/debugtest/testing).
1. Verify that your test codeunits appear in the test list. Only tests in the active workspace are added to the Test Explorer.
1. Select the test you want to run, and then choose the **Run** button.
1. Review the test results in the **Test Explorer** panel.

> [!IMPORTANT]
> You must publish your tests to a [!INCLUDE [prod_short](includes/prod_short.md)] server before you can run them. The Test Explorer doesn't compile or publish tests for you.

## View code coverage information

The tests can collect information about the procedures that are invoked as part of the test run. You can view this information in the CodeLens bar of a procedure by selecting the test that ran it.

## Supported environments

Running tests from Visual Studio Code is supported on [!INCLUDE [prod_short](includes/prod_short.md)] version 28.0 and newer on the following environments:

- Online sandbox environments.
- Local (on-premises) server installations.

> [!NOTE]
> Running tests on production environments isn't supported because it might affect business operations. Learn more in [Testing the application overview](devenv-testing-application.md).

## Related information

[Testing the application overview](devenv-testing-application.md)  
[Create test codeunits and test methods](devenv-test-codeunits-and-test-methods.md)  
[Testing in Visual Studio Code](https://code.visualstudio.com/docs/debugtest/testing)
