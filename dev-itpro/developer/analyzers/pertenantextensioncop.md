---
title: "PerTenantExtensionCop Analyzer"
description: Overview of the PerTenantExtensionCop analyzer rules.
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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

|Id|Title|Description|MessageFormat|Category|Default Severity|IsEnabledbyDefault|
|--|-----|-----------|-------------|--------|----------------|------------------|
|[PTE0001](pertenantextensioncop-pte0001-objectidmustbeinfreerange.md)|Object ID must be in free range.|Object ID must be in free range.|{0} '{1}' has an ID of [{2}]. It must be between within the range '{3}'.|ObjectValidation|Error|true|
|[PTE0002](pertenantextensioncop-pte0002-fieldidmustbeinfreerange.md)|Field ID must be in free range.|Field ID must be in free range.|Field '{0}' has an ID of [{1}]. It must be between within the range '{2}'.|ObjectValidation|Error|true|
|[PTE0003](pertenantextensioncop-pte0003-donotsubscribetooncompanyopenevents.md)|Functions must not subscribe to CompanyOpen events.|Functions must not subscribe to CompanyOpen events.|Function {0} subscribes to {1}.|ObjectValidation|Error|true|
|[PTE0004](pertenantextensioncop-pte0004-tablesmusthavepermissionsetdefined.md)|Table definitions must have a matching permission set.|Table definitions must have a matching permission set.|Table '{0}' is missing a matching permission set.|ObjectValidation|Error|true|
|[PTE0005](pertenantextensioncop-pte0005-manifesttargetmustnotbeinternal.md)|Property 'target' has invalid value.|'Internal' is a reserved usage for the 'target' property.|App.json 'target' property must not be set to 'Internal' or 'OnPrem'.|PackageValidation|Error|true|
|[PTE0006](pertenantextensioncop-pte0006-donotcallencryptionkeyfunctions.md)|Encryption key functions must not be invoked.|Encryption key functions must not be invoked.|Encryption key function '{0}' is not allowed.|PackageValidation|Error|true|
|[PTE0007](pertenantextensioncop-pte0007-donotcallasserterror.md)|Test assertion functions are not allowed in a non-test context.|Test assertion functions are not allowed in a non-test context.|Assertion function '{0}' must not be invoked.|PackageValidation|Error|true|
|[PTE0008](pertenantextensioncop-pte0008-useapplicationareaproperty.md)|Fields must use ApplicationArea property.|Fields must use ApplicationArea property.|Field with name '{0}' must have a value for the ApplicationArea property.|PackageValidation|Error|true|
|[PTE0009](pertenantextensioncop-pte0009-donotusemanifesttranslationproperties.md)|This app.json property must not be used for per-tenant extensions.|The properties 'HelpBaseUrl' and 'SupportedLocales' are reserved for translation apps.|The app.json '{0}' property must not be used for per-tenant extensions.|PackageValidation|Error|true|
|[PTE0010](pertenantextensioncop-pte0010-extensionnamelengthmustnotexceedlimit.md)|The extension name length must not exceed the specified limit.|The extension name length must not exceed the specified limit.|The length of the extension name must not exceed {0} characters.|PackageValidation|Error|true|
|[PTE0011](pertenantextensioncop-pte0011-extensionpublisherlengthmustnotexceedlimit.md)|The extension publisher length must not exceed the specified limit.|The extension publisher length must not exceed the specified limit.|The length of the extension publisher must not exceed {0} characters.|PackageValidation|Error|true|
|[PTE0012](pertenantextensioncop-pte0012-internalsvisibletonosecurityfeature.md)|InternalsVisibleTo should not be used as a security feature.|The InternalsVisibleTo setting will expose your internal objects to any extension with the given name, publisher, and ID. Access modifiers are not designed to be used as a security boundary, but for API development.|The InternalsVisibleTo setting will expose your internal objects to any extension with the given name, publisher, and ID. Access modifiers are not designed to be used as a security boundary, but for API development.|Extensibility|Warning|true|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Using the Code Analysis Tool](../devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](../devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](../devenv-using-code-analysis-tool-with-rule-set.md)