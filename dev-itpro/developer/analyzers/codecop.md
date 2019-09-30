---
title: "CodeCop Analyzer"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml or .resx files in the ModernDev repo.)
# CodeCop Analyzer Rules
CodeCop is an analyzer that enforces the official AL Coding Guidelines.

## Rules

|Id|Title|Description|MessageFormat|Category|Default Severity|IsEnabledbyDefault|
|--|-----|-----------|-------------|--------|----------------|------------------|
|[AA0001](codecop-aa0001-binaryoperatorspacing.md)|There must be exactly one space character on each side of a binary operator such as := + - AND OR =.|There must be exactly one space character on each side of a binary operator such as := + - AND OR =. The parameter comma operator however, should have no spaces.|There must be exactly one space character on each side of '{0}'.|Readability|Warning|true|
|[AA0002](codecop-aa0002-unaryoperatornospacing.md)|There must be no space character.|There must be no space character between a unary operator and its argument.|There must be no space character after '{0}'.|Readability|Warning|true|
|[AA0003](codecop-aa0003-unaryoperatorspacing.md)|There must be exactly one space character between the NOT operator and its argument.|There must be exactly one space character between the NOT operator and its argument.|There must be exactly one space character after '{0}'.|Readability|Warning|true|
|[AA0005](codecop-aa0005-onlyusebeginendforcompoundstatements.md)|Only use BEGIN..END to enclose compound statements.|Only use BEGIN..END to enclose compound statements.|Only use BEGIN..END to enclose compound statements.|Readability|Warning|true|
|[AA0008](codecop-aa0008-useparenthesisforfunctioncall.md)|Function calls should have parenthesis even if they do not have any parameters.|Use parenthesis in a function call even if the function does not have any parameters.|You must specify open and close parenthesis after '{0}'.|Readability|Warning|true|
|[AA0013](codecop-aa0013-trailingbeginshouldbeonthesameline.md)|When BEGIN follows THEN, ELSE, DO, it should be on the same line, preceded by one space character.|When BEGIN follows THEN, ELSE, DO, it should be on the same line, preceded by one space character.|When BEGIN follows THEN, ELSE, DO, it should be on the same line, preceded by one space character.|Readability|Warning|true|
|[AA0018](codecop-aa0018-keywordshouldbefirstonline.md)|The END, IF, REPEAT, UNTIL, FOR, WHILE and CASE statement should always start a line.|The END, IF, REPEAT, UNTIL, FOR, WHILE and CASE statement should always start a line.|The '{0}' keyword should always start a line.|Readability|Warning|true|
|[AA0021](codecop-aa0021-variabledeclarationsshouldbeorderedbytype.md)|Variable declarations should be ordered by type.|Variable declarations should be ordered by type. In general, object and complex variable types are listed first followed by simple variables.|Variable declarations should be ordered by type.|Readability|Warning|true|
|[AA0022](codecop-aa0022-substituteifelsewithcasestatementifmorethantwoalternatives.md)|Substitute the IF THEN ELSE structure with a CASE.|An IF followed by two or more ELSE IF should be replaced with a CASE.|Substitute the IF THEN ELSE structure with a CASE.|Readability|Warning|true|
|[AA0040](codecop-aa0040-donotnestwiths.md)|Avoid using nested WITH statements.|It can be difficult to see what variable that a member variable or function refers to, when nesting WITH statements of variables with different types.|This WITH statement is nested inside another WITH statement at '{0}'.|Readability|Warning|true|
|[AA0074](codecop-aa0074-textconstlabelvariablenamesshouldhaveapprovedsuffix.md)|TextConst and Label variable names should have an approved suffix.|TextConst and Label variable names should have a suffix (an approved three-letter suffix: Msg, Tok, Err, Qst, Lbl, Txt) describing usage.|TextConst and Label variable '{0}' must have a suffix from this list: Msg, Tok, Err, Qst, Lbl, Txt.|Readability|Warning|true|
|[AA0100](codecop-aa0100-donothaveidentifierswithquotesinthename.md)|Do not have identifiers with quotes in the name.|Do not have identifiers with quotes in the name.|Do not have identifiers with quotes in the name.|Design|Warning|true|
|[AA0101](codecop-aa0101-usecamelcasecaptionsforapipages.md)|Use camel case captions in pages of type API.|For pages of the type API and all their field controls, the Caption property value should be camel-cased to follow the Microsoft REST API Guidelines.|For pages of the type API and all their field controls, the Caption property value should be camel-cased.|Design|Warning|true|
|[AA0102](codecop-aa0102-usecamelcasefieldnamesforapipages.md)|Use camel case name for field controls in pages of type API.|Field controls in pages of type API should have a camel case name in order to follow the Microsoft REST API Guidelines.|Field controls in pages of type API should have a camel case name.|Design|Warning|true|
|[AA0136](codecop-aa0136-donotwritecodethatwillneverbehit.md)|Do not write code that will never be hit.|Do not write code that will never be hit.|Unreachable code detected.|Design|Warning|true|
|[AA0137](codecop-aa0137-donotdeclarevariablesthatareunused.md)|Do not declare variables that are unused.|Do not declare variables that are unused.|Variable '{0}' is unused in '{1}'.|Design|Warning|true|
|[AA0139](codecop-aa0139-donotassigntostringwithsmallercapacity.md)|Do not assign a text  to a target with smaller size.|Do not assign a text  to a target with smaller size.|Possible overflow assigning '{0}' to '{1}'.|Design|Warning|true|
|[AA0161](codecop-aa0161-onlyuseasserterrorintestcodeunits.md)|Only use ASSERTERROR in Test Codeunits.|Only use ASSERTERROR in Test Codeunits.|Only use ASSERTERROR in Test Codeunits.|Design|Warning|true|
|[AA0194](codecop-aa0194-donotwriteactionswithnoeffect.md)|Only write actions that have an effect.|Remember to specify either the 'OnAction' trigger or 'RunObject' property on an action.|Remember to specify either the 'OnAction' trigger or 'RunObject' property on an action.|Design|Warning|true|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Using the Code Analysis Tool](../devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](../devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](../devenv-using-code-analysis-tool-with-rule-set.md)