---
title: UICop Analyzer Rules
description: "List of rules for UICop analyzer in Dynamics 365 Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/24/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# UICop Analyzer Rules 
UICop is an analyzer that enforces rules that must be respected by extensions meant to be installed for individual tenants.

## Rules 

|Id|Title|Description|MessageFormat|Category|Default Severity|IsEnabledbyDefault|
|--|-----|-----------|-------------|--------|----------------|------------------|
|AW0001|The Web client does not support displaying the Request page of XMLPorts.|The Web client does not support displaying the Request page of XMLPorts.|The Web client does not support displaying the Request page of the XMLPort '{0}'.|WebClient|Warning|true|
|AW0002|The Web client does not support displaying both Actions and Fields in Cue Groups. Only Fields will be displayed.|The Web client does not support displaying both Actions and Fields in Cue Groups. Only Fields will be displayed.|The Web client does not support displaying both Actions and Fields in the Cue Group '{0}'. Only Fields will be displayed.|WebClient|Warning|true|
|AW0003|The Web client does not support displaying Repeater controls containing Parts.|The Web client does not support displaying Repeater controls containing Parts.|The Web client does not support displaying Repeater controls containing Parts.|WebClient|Warning|true|
|AW0004|A Blob cannot be used as a source expression for a page field.|A Blob cannot be used as a source expression for a page field.|A Blob cannot be used as a source expression for a page field.|WebClient|Warning|true|
|AW0005|Actions should use the Image property.|Actions should use the Image property.|Action with name '{0}' should have a value for the Image property.|WebClient|Warning|true|

## See Also 
[PerTenantExtensionCop Analyzer Rules](devenv-codeanalyzer-pertenantextensioncop-rules.md)   
[CodeCop Analyzer Rules](devenv-codeanalyzer-codecop-rules.md)   
[AppSourceCop Analyzer Rules](devenv-codeanalyzer-appsourcecop-rules.md)   
[Using the Code Analysis Tool](devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](devenv-using-code-analysis-tool-with-rule-set.md)