---
title: "AppSourceCop Analyzer Rules"
description: "List of rules for AppSourceCop analyzer."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/13/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# AppSourceCop Analyzer Rules 
AppSourceCop is an analyzer that enforces rules that must be respected by extensions meant to be published to Microsoft AppSource.

## Rules 

|Id|Title|Description|MessageFormat|Category|Default Severity|IsEnabledbyDefault|
|--|-----|-----------|-------------|--------|----------------|------------------|
|AS0001|Tables cannot be deleted.|Tables cannot be deleted.|Table '{0}' has been deleted.|Upgrade|Error|true|
|AS0002|Fields cannot be deleted.|Fields cannot be deleted.|Field '{0}' has been deleted from table '{1}'.|Upgrade|Error|true|
|AS0003|The previous version was not found.|The previous version was not found.|The previous version was not found. Name='{0}', Publisher='{1}', Version'{2}'|Upgrade|Warning|true|
|AS0004|Fields cannot change type.|Fields cannot change type.|Field '{0}' has changed type from '{1}' to '{2}'. Type changes are not allowed.|Upgrade|Error|true|
|AS0005|Fields cannot change name.|Fields cannot change name.|Field '{0}' has changed name to '{1}'. Name changes are not allowed.|Upgrade|Error|true|
|AS0006|Tables cannot change name.|Tables cannot change name.|Table '{0}' has changed name to '{1}'. Name changes are not allowed.|Upgrade|Error|true|
|AS0007|Properties cannot change value.|Properties cannot change value.|The property '{0}' has changed value. Value change is not allowed for this property.|Upgrade|Error|true|
|AS0008|Keys cannot change name.|Keys cannot change name.|Key '{0}' has changed name to '{1}'. Name changes are not allowed.|Upgrade|Error|true|
|AS0009|Key fields cannot be changed.|Key fields cannot be changed.|Key '{0}' has changed the key fields. Changes to the field list are not allowed.|Upgrade|Error|true|
|AS0010|Keys cannot be deleted.|Keys cannot be deleted.|Key '{0}' has been deleted. Key deletions is not allowed.|Upgrade|Error|true|
|AS0011|A prefix is required|A prefix is required|The identifier '{0}' must have the prefix '{1}'.|Extensibility|Error|true|
|AS0012|A suffix is required|A suffix is required|The identifier '{0}' must have the suffix '{1}'.|Extensibility|Error|true|
|AS0013|The field identifier must be within the allowed range.|The field identifier must be within the allowed range.|The field identifier '{0}' is not valid. It must be within the allowed range '{1}' - '{2}'|Extensibility|Error|true|
|AS0014|The project manifest must contain the allocated identifier range.|The project manifest must contain the allocated identifier range.|The project manifest must contain the allocated identifier range.|Extensibility|Error|true|


## See Also 
[CodeCop Analyzer Rules](devenv-codeanalyzer-codecop-rules.md)   
[PerTenantExtensionCop Analyzer Rules](devenv-codeanalyzer-pertenantextensioncop-rules.md)  
[Using the Code Analysis Tool](devenv-using-code-analysis-tool)  
[Ruleset for the Code Analysis Tool](devenv-rule-set-syntax-for-code-analysis-tools)  
[Using the Code Analysis Tools with the Ruleset](devenv-using-code-analysis-tool-with-rule-set)