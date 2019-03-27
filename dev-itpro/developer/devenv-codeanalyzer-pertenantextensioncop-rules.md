---
title: "PerTenantExtensionCop Analyzer Rules"
description: "List of rules for PerTenantExtensionCop analyzer."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
redirect_url: analyzers/pertenantextensioncop
---

<!-- This topic is redirected because it has been automated -->

 

# PerTenantExtensionCop Analyzer Rules 
PerTenantExtensionCop is an analyzer that enforces rules that must be respected by extensions meant to be installed for individual tenants.

## Rules 

|Id|Title|Description|MessageFormat|Category|Default Severity|IsEnabledbyDefault|
|--|-----|-----------|-------------|--------|----------------|------------------|
|PTE0001|Object ID must be in free range.|Object ID must be in free range.|{0} '{1}' has an ID of [{2}]. It must be between {3} and {4}.|ObjectValidation|Error|true|
|PTE0002|Field ID must be in free range.|Field ID must be in free range.|Field '{0}' has an ID of [{1}]. It must be between {2} and {3}.|ObjectValidation|Error|true|
|PTE0003|Functions must not subscribe to CompanyOpen events.|Functions must not subscribe to CompanyOpen events.|Function {0} subscribes to {1}.|ObjectValidation|Error|true|
|PTE0004|Table definitions must have a matching permission set.|Table definitions must have a matching permission set.|Table '{0}' is missing a matching permission set.|ObjectValidation|Error|true|
|PTE0005|Property 'target' has invalid value.|'Internal' is a reserved usage for the 'target' property.|App.json 'target' property must not be set to 'Internal'.|PackageValidation|Error|true|
|PTE0006|Encryption key functions must not be invoked.|Encryption key functions must not be invoked.|Encryption key function '{0}' is not allowed.|PackageValidation|Error|true|
|PTE0007|Test assertion functions are not allowed in a non-test context.|Test assertion functions are not allowed in a non-test context.|Assertion function '{0}' must not be invoked.|PackageValidation|Error|true|
|PTE0008|Fields must use ApplicationArea property.|Fields must use ApplicationArea property.|Field with name '{0}' must have a value for the ApplicationArea property.|PackageValidation|Error|true|
|PTE0009|This app.json property must not be used for per-tenant extensions.|The properties 'HelpBaseUrl' and 'SupportedLocales' are reserved for translation apps.|The app.json '{0}' property must not be used for per-tenant extensions.|PackageValidation|Error|true|


## See Also 
[CodeCop Analyzer Rules](devenv-codeanalyzer-codecop-rules.md)   
[AppSourceCop Analyzer Rules](devenv-codeanalyzer-appsourcecop-rules.md)   
[UICop Analyzer Rules](devenv-codeanalyzer-uicop-rules.md)  
[Using the Code Analysis Tool](devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](devenv-using-code-analysis-tool-with-rule-set.md)