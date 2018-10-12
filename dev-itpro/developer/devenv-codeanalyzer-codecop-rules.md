---
title: "CodeCop Analyzer Rules"
description: "List of rules for CodeCop analyzer."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
redirect_url: analyzers/codecop
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# CodeCop Analyzer Rules 
CodeCop is an analyzer that enforces the official AL Coding Guidelines.

## Rules 

|Id|Title|Description|MessageFormat|Category|Default Severity|IsEnabledbyDefault|
|--|-----|-----------|-------------|--------|----------------|------------------|
|AA0001|There must be exactly one space character on each side of a binary operator such as := + - AND OR =.|There must be exactly one space character on each side of a binary operator such as := + - AND OR =. The parameter comma operator however, should have no spaces.|There must be exactly one space character on each side of '{0}'.|Readability|Warning|true|
|AA0002|There must be no space character.|There must be no space character between a unary operator and its argument.|There must be no space character after '{0}'.|Readability|Warning|true|
|AA0003|There must be exactly one space character between the NOT operator and its argument.|There must be exactly one space character between the NOT operator and its argument.|There must be exactly one space character after '{0}'.|Readability|Warning|true|
|AA0005|Only use BEGIN..END to enclose compound statements.|Only use BEGIN..END to enclose compound statements.|Only use BEGIN..END to enclose compound statements.|Readability|Warning|true|
|AA0008|Function calls should have parenthesis even if they do not have any parameters.|Use parenthesis in a function call even if the function does not have any parameters.|You must specify open and close parenthesis after '{0}'.|Readability|Warning|true|
|AA0013|When BEGIN follows THEN, ELSE, DO, it should be on the same line, preceded by one space character.|When BEGIN follows THEN, ELSE, DO, it should be on the same line, preceded by one space character.|When BEGIN follows THEN, ELSE, DO, it should be on the same line, preceded by one space character.|Readability|Warning|true|
|AA0018|The END, IF, REPEAT, FOR, WHILE, and CASE statement should always start a line.|The END, IF, REPEAT, FOR, WHILE, and CASE statement should always start a line.|The '{0}' keyword should always start a line.|Readability|Warning|true|
|AA0021|Variable declarations should be ordered by type.|Variable declarations should be ordered by type. In general, object and complex variable types are listed first followed by simple variables.|Variable declarations should be ordered by type.|Readability|Warning|true|
|AA0022|Substitute the IF THEN ELSE structure with a CASE.|An IF followed by two or more ELSE IF should be replaced with a CASE.|Substitute the IF THEN ELSE structure with a CASE.|Readability|Warning|true|
|AA0040|Avoid using nested WITH statements|It can be difficult to see what variable that a member variable or function refers to, when nesting WITH statements of variables with different types.|This WITH statement is nested inside another WITH statement at '{0}'.|Readability|Warning|true|
|AA0074|TextConst variable names should have an approved suffix|TextConst variable names should have a suffix (an approved three-letter suffix: Msg, Tok, Err, Qst, Lbl, Txt) describing usage.|TextConst variable '{0}' must have a suffix from this list: Msg, Tok, Err, Qst, Lbl, Txt.|Readability|Warning|true|
|AA0100|Do not have identifiers with quotes in the name.|Do not have identifiers with quotes in the name.|Do not have identifiers with quotes in the name.|Design|Warning|true|
|AA101|Use camel case captions in pages of type API.|For pages of the type API and all their field controls, the Caption property value must be camel-cased to follow the Microsoft REST API Guidelines.|For pages of the type API and all their field controls, the Caption property value must be camel-cased.|Design|Warning|true|
|AA102|Use camel case name for field controls in pages of type API.|Field controls in pages of type API must have a camel case name in order to follow the Microsoft REST API Guidelines.|Field controls in pages of type API must have a camel case name.|Design|Warning|true|
|AA0136|Do not write code that will never be hit.|Do not write code that will never be hit.|Unreachable code detected.|Design|Warning|true|
|AA0137|Do not declare variables that are unused.|Do not declare variables that are unused.|Variable '{0}' is unused in the method '{1}'.|Design|Warning|true|
|AA0139|Do not assign a text to a target with smaller size.|Do not assign a text  to a target with smaller size.|Possible overflow assigning '{0}' to '{1}'.|Design|Warning|true|
|AA0161|Only use ASSERTERROR in Test Codeunits|Only use ASSERTERROR in Test Codeunits|Only use ASSERTERROR in Test Codeunits|Design|Warning|true|
|AA0194|Only write actions that have an effect.|Remember to specify either the 'OnAction' trigger or 'RunObject' property on an action.|Remember to specify either the 'OnAction' trigger or 'RunObject' property on an action.|Design|Warning|true|


## See Also 
[PerTenantExtensionCop Analyzer Rules](devenv-codeanalyzer-pertenantextensioncop-rules.md)   
[AppSourceCop Analyzer Rules](devenv-codeanalyzer-appsourcecop-rules.md)  
[UICop Analyzer Rules](devenv-codeanalyzer-uicop-rules.md)   
[Using the Code Analysis Tool](devenv-using-code-analysis-tool.md)   
[Ruleset for the Code Analysis Tool](devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](devenv-using-code-analysis-tool-with-rule-set.md)