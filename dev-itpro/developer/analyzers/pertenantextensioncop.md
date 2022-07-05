---
title: "PerTenantExtensionCop Analyzer"
description: "PerTenantExtensionCop is an analyzer that enforces rules that must be respected by extensions meant to be installed for individual tenants."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PerTenantExtensionCop Analyzer Rules
PerTenantExtensionCop is an analyzer that enforces rules that must be respected by extensions meant to be installed for individual tenants.

## Rules

|Id|Title|Category|Default Severity|
|--|-----------|--------|----------------|
|[PTE0001](pertenantextensioncop-pte0001.md)|Object ID must be in free range.|Extensibility|Error|
|[PTE0002](pertenantextensioncop-pte0002.md)|Field ID must be in free range.|Extensibility|Error|
|[PTE0003](pertenantextensioncop-pte0003.md)|Procedures must not subscribe to CompanyOpen events|Extensibility|Error|
|[PTE0004](pertenantextensioncop-pte0004.md)|Table definitions must have a matching permission set.|Configuration|Error|
|[PTE0005](pertenantextensioncop-pte0005.md)|The compilation target of an application must be a value that is allowed in a multi-tenant SaaS environment|Extensibility|Error|
|[PTE0006](pertenantextensioncop-pte0006.md)|Encryption key functions must not be invoked.|Extensibility|Error|
|[PTE0007](pertenantextensioncop-pte0007.md)|Test assertion functions are not allowed in a non-test context.|Extensibility|Error|
|[PTE0008](pertenantextensioncop-pte0008.md)|Page controls and actions must use the ApplicationArea property|Extensibility|Error|
|[PTE0009](pertenantextensioncop-pte0009.md)|This app.json property must not be used for per-tenant extensions.|Extensibility|Error|
|[PTE0010](pertenantextensioncop-pte0010.md)|The extension name is too long.|Extensibility|Error|
|[PTE0011](pertenantextensioncop-pte0011.md)|The publisher name is too long.|Extensibility|Error|
|[PTE0012](pertenantextensioncop-pte0012.md)|InternalsVisibleTo should not be used as a security feature.|Extensibility|Warning|
|[PTE0013](pertenantextensioncop-pte0013.md)|Entitlements cannot be defined in an extension.|Configuration|Error|
|[PTE0014](pertenantextensioncop-pte0014.md)|Permission Sets should not be defined in XML files.|Configuration|Warning|
|[PTE0015](pertenantextensioncop-pte0015.md)|The extension name is not valid.|Extensibility|Error|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Using the Code Analysis Tool](../devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](../devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](../devenv-using-code-analysis-tool-with-rule-set.md)