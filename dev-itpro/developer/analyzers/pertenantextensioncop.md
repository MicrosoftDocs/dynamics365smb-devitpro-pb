---
title: "PerTenantExtensionCop Analyzer"
ms.author: solsen
ms.custom: na
ms.date: 12/14/2020
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
# PerTenantExtensionCop Analyzer Rules
PerTenantExtensionCop is an analyzer that enforces rules that must be respected by extensions meant to be installed for individual tenants.

## Rules

|Id|Title|Category|Default Severity|
|--|-----------|--------|----------------|
|[PTE0001](pertenantextensioncop-pte0001-objectidmustbeinfreerange.md)|Object ID must be in free range.|ObjectValidation|Error|
|[PTE0002](pertenantextensioncop-pte0002-fieldidmustbeinfreerange.md)|Field ID must be in free range.|ObjectValidation|Error|
|[PTE0003](pertenantextensioncop-pte0003-donotsubscribetooncompanyopenevents.md)|Functions must not subscribe to CompanyOpen events.|ObjectValidation|Error|
|[PTE0004](pertenantextensioncop-pte0004-tablesmusthavepermissionsetdefined.md)|Table definitions must have a matching permission set.|ObjectValidation|Error|
|[PTE0005](pertenantextensioncop-pte0005-manifesttargetmustnotbeinternal.md)|Property 'target' has invalid value.|PackageValidation|Error|
|[PTE0006](pertenantextensioncop-pte0006-donotcallencryptionkeyfunctions.md)|Encryption key functions must not be invoked.|PackageValidation|Error|
|[PTE0007](pertenantextensioncop-pte0007-donotcallasserterror.md)|Test assertion functions are not allowed in a non-test context.|PackageValidation|Error|
|[PTE0008](pertenantextensioncop-pte0008-useapplicationareaproperty.md)|Fields must use ApplicationArea property.|PackageValidation|Error|
|[PTE0009](pertenantextensioncop-pte0009-donotusemanifesttranslationproperties.md)|This app.json property must not be used for per-tenant extensions.|PackageValidation|Error|
|[PTE0010](pertenantextensioncop-pte0010-extensionnamelengthmustnotexceedlimit.md)|The extension name length must not exceed the specified limit.|PackageValidation|Error|
|[PTE0011](pertenantextensioncop-pte0011-extensionpublisherlengthmustnotexceedlimit.md)|The extension publisher length must not exceed the specified limit.|PackageValidation|Error|
|[PTE0012](pertenantextensioncop-pte0012-internalsvisibletonosecurityfeature.md)|InternalsVisibleTo should not be used as a security feature.|Extensibility|Warning|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Using the Code Analysis Tool](../devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](../devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](../devenv-using-code-analysis-tool-with-rule-set.md)