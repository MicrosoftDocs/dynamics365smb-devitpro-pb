---
title: SubType Property for Codeunits
description: Learn how the SubType property defines the purpose and runtime behavior of a codeunit in Dynamics 365 Business Central and review its values.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# SubType property on codeunits

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-subtype-property.md -->

Specifies the purpose of a codeunit.

## Applies to

- Codeunits

## Property value

| Value | Description |
|-------|-------------|
| `Normal` | Defines a general-purpose codeunit. This value is the default. |
| `Test` | Defines a codeunit that contains test methods. |
| `TestRunner` | Defines a codeunit that runs one or more test codeunits. |
| `Upgrade` | Defines a codeunit that contains data-upgrade triggers. |
| `Install` | Defines a codeunit that contains extension-installation triggers. |

## Syntax

```al
SubType = Normal;
```

## Remarks

Codeunits that have the `SubType` property set to `Test` or `TestRunner` support automated testing of your application.

- A `Test` codeunit contains the test methods that test your application. When a test codeunit runs, it executes the `OnRun` trigger, and then executes each test method in the codeunit. Unlike a normal codeunit, where a failing method terminates the codeunit, a test codeunit continues to run its remaining test methods even if one test method fails. Learn more in [Test codeunits and test methods](../devenv-test-codeunits-and-test-methods.md).

- A `TestRunner` codeunit manages the execution of one or more test codeunits and can integrate with external test management and reporting frameworks. It supports the `OnBeforeTestRun` and `OnAfterTestRun` triggers, which run immediately before and after each test codeunit runs, so you can do preprocessing and postprocessing, such as initialization or logging test results. Learn more in [Test runner codeunits](../devenv-testrunner-codeunits.md).

An `Upgrade` codeunit contains the code that upgrades data from a previous extension version so that it's compatible with the current version. Upgrade codeunits support system triggers, such as `OnUpgradePerCompany` and `OnUpgradePerDatabase`, that run when you start the data upgrade process. Learn more in [Upgrading extensions](../devenv-upgrading-extensions.md).

An `Install` codeunit contains code that runs operations, such as initializing data, when an extension is installed for the first time or reinstalled. Install codeunits support the `OnInstallAppPerCompany` and `OnInstallAppPerDatabase` triggers. Learn more in [Writing extension install code](../devenv-extension-install-code.md).

## Related information

[Codeunit properties](devenv-codeunit-properties.md)  
[Test codeunits and test methods](../devenv-test-codeunits-and-test-methods.md)  
[Test runner codeunits](../devenv-testrunner-codeunits.md)  
[Upgrade codeunits](../devenv-upgrading-extensions.md)  
[Install codeunits](../devenv-extension-install-code.md)  
[SubType property for BLOB fields](devenv-subtype-blob-property.md)
