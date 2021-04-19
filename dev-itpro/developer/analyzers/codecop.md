---
title: "CodeCop Analyzer"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Analyzer Rules
CodeCop is an analyzer that enforces the official AL Coding Guidelines.

## Rules

|Id|Title|Category|Default Severity|
|--|-----------|--------|----------------|
|[AA0001](codecop-aa0001-binaryoperatorspacing.md)|There must be exactly one space character on each side of a binary operator such as := + - AND OR =.|Readability|Warning|
|[AA0002](codecop-aa0002-unaryoperatornospacing.md)|There must be no space character.|Readability|Warning|
|[AA0003](codecop-aa0003-unaryoperatorspacing.md)|There must be exactly one space character between the NOT operator and its argument.|Readability|Warning|
|[AA0005](codecop-aa0005-onlyusebeginendforcompoundstatements.md)|Only use BEGIN..END to enclose compound statements.|Readability|Warning|
|[AA0008](codecop-aa0008-useparenthesisforfunctioncall.md)|Function calls should have parenthesis even if they do not have any parameters.|Readability|Warning|
|[AA0013](codecop-aa0013-trailingbeginshouldbeonthesameline.md)|When BEGIN follows THEN, ELSE, DO, it should be on the same line, preceded by one space character.|Readability|Warning|
|[AA0018](codecop-aa0018-keywordshouldbefirstonline.md)|The END, IF, REPEAT, UNTIL, FOR, WHILE, and CASE statement should always start a line.|Readability|Warning|
|[AA0021](codecop-aa0021-variabledeclarationsshouldbeorderedbytype.md)|Variable declarations should be ordered by type.|Readability|Warning|
|[AA0022](codecop-aa0022-substituteifelsewithcasestatementifmorethantwoalternatives.md)|Substitute the IF THEN ELSE structure with a CASE.|Readability|Warning|
|[AA0040](codecop-aa0040-donotnestwiths.md)|Avoid using nested WITH statements.|Readability|Warning|
|[AA0072](codecop-aa0072-nameofvariablesmustbesuffixedwithtypeobjectname.md)|The name of variables and parameters must be suffixed with the type or object name.|Readability|Info|
|[AA0073](codecop-aa0073-temporaryvariablesmustbeprefixedtemp.md)|The name of temporary variable must be prefixed with Temp.|Readability|Warning|
|[AA0074](codecop-aa0074-textconstlabelvariablenamesshouldhaveapprovedsuffix.md)|TextConst and Label variable names should have an approved suffix.|Readability|Warning|
|[AA0087](codecop-aa0087-doonlylowerpermissionsinsidetestprocedures.md)|Lowering permissions should only be used in tests|Design|Warning|
|[AA0100](codecop-aa0100-donothaveidentifierswithquotesinthename.md)|Do not have identifiers with quotes in the name.|Design|Warning|
|[AA0101](codecop-aa0101-usecamelcasepropertyvaluesforapipages.md)|Use camel case property values in pages of type API.|Design|Warning|
|[AA0102](codecop-aa0102-usecamelcasefieldnamesforapipages.md)|Use camel case name for field controls in pages of type API.|Design|Warning|
|[AA0103](codecop-aa0103-usecamelcasepropertyvaluesforapiqueries.md)|Use camel case property values in queries of type API.|Design|Warning|
|[AA0104](codecop-aa0104-usecamelcasecolumnnamesforapiqueries.md)|Use camel case name for column controls in queries of type API.|Design|Warning|
|[AA0105](codecop-aa0105-pagepartmustnotrefertoparentpage.md)|PagePart controls must not refer to parent pages.|Design|Error|
|[AA0106](codecop-aa0106-apipagecanonlyrefertothesamesubpageonce.md)|A page of type API can only refer to the same subpage once.|Design|Error|
|[AA0131](codecop-aa0131-stringparamsmustmatchplaceholders.md)|String parameters must match placeholders.|Design|Warning|
|[AA0136](codecop-aa0136-donotwritecodethatwillneverbehit.md)|Do not write code that will never be hit.|Design|Warning|
|[AA0137](codecop-aa0137-donotdeclarevariablesthatareunused.md)|Do not declare variables that are unused.|Design|Warning|
|[AA0139](codecop-aa0139-donotassigntostringwithsmallercapacity.md)|Do not assign a text  to a target with smaller size.|Design|Warning|
|[AA0150](codecop-aa0150-donotdeclareparametersbyreferenceifneverchanged.md)|Do not declare parameters by reference if their values are never changed.|Design|Warning|
|[AA0161](codecop-aa0161-onlyuseasserterrorintestcodeunits.md)|Only use AssertError in Test Codeunits.|Design|Warning|
|[AA0175](codecop-aa0175-donotfindrecordandnotuse.md)|Only find record if you need to use it.|Design|Warning|
|[AA0181](codecop-aa0181-findsetfindshouldbeusedwithnext.md)|The FindSet() or Find() methods must be used only in connection with the Next() method.|Design|Warning|
|[AA0189](codecop-aa0189-applicationareahasinvalidvalue.md)|Only use a correct values of ApplicationArea.|Design|Warning|
|[AA0194](codecop-aa0194-donotwriteactionswithnoeffect.md)|Only write actions that have an effect.|Design|Warning|
|[AA0198](codecop-aa0198-globallocalvariablesshouldnothavesamename.md)|Do not use identical names for local and global variables.|Design|Warning|
|[AA0199](codecop-aa0199-applicationareaincorrectorder.md)|Use only a correct order for ApplicationArea.|Design|Warning|
|[AA0200](codecop-aa0200-applicationareaallshouldbealone.md)|When ApplicationArea is set to 'All', no other values for ApplicationArea should be specified.|Design|Warning|
|[AA0201](codecop-aa0201-applicationareabasicandsuite.md)|When ApplicationArea is set to 'Basic', you must also specify 'Suite'.|Design|Warning|
|[AA0462](codecop-aa0462-calcdateonlywithdateformulausage.md)|The CalcDate should only be used with DataFormula variables. Alternatively the string should be enclosed using the <> symbols.|Localizability|Warning|
|[AA0202](codecop-aa0202-donotnamelocalvarasfieldormethod.md)|To avoid confusion, do not give local variables the same name as fields, methods or actions in the same scope.|Design|Warning|
|[AA0203](codecop-aa0203-donotnamemethodasfield.md)|To avoid confusion, do not give methods the same name as fields or actions in the same scope.|Design|Warning|
|[AA0204](codecop-aa0204-donotnameglobalvarasfieldormethod.md)|To avoid confusion, do not give global variables the same name as fields, methods or actions in the same scope.|Design|Warning|
|[AA0205](codecop-aa0205-variablesmustalwaysbeinitialized.md)|Variables must be initialized before usage.|Design|Warning|
|[AA0206](codecop-aa0206-initializedvariablesmustalwaysbeused.md)|The value assigned to a variable must be used.|Design|Warning|
|[AA0207](codecop-aa0207-eventsubscriberfunctionsmustbelocal.md)|The EventSubscriber method must be local.|Design|Warning|
|[AA0210](codecop-aa0210-suboptimalindex.md)|Avoid non-indexed fields into filtering.|Design|Info|
|[AA0211](codecop-aa0211-calcfieldsonlyonflowfields.md)|Avoids a runtime error from using CalcFields on a field that is not a FlowField or a field of type Blob.|Design|Warning|
|[AA0213](codecop-aa0213-obsoletejustification.md)|Obsoleted object must have a state 'Pending' or 'Removed' and a justification specifying why this field is being obsoleted.|Design|Warning|
|[AA0214](codecop-aa0214-blindwritelocalrecord.md)|The local record should be modified before saving to the database.|Design|Warning|
|[AA0215](codecop-aa0215-followfilenameguide.md)|Follow [the style guide](../../compliance/apptest-bestpracticesforalcode.md#file-naming) about the best practices for naming.|Readability|Warning|
|[AA0216](codecop-aa0216-passusermessageanderrorbytextconstant.md)|Use a text constant for passing user messages and errors without concatenations.|Localizability|Warning|
|[AA0217](codecop-aa0217-strsubstnoformatstringshouldbetextconstantorlabel.md)|Use a text constant or label for format string in StrSubstNo.|Localizability|Warning|
|[AA0218](codecop-aa0218-tooltipmustbefilledonpageforfieldsandactions.md)|You must write a tooltip in the Tooltip property for all controls of type Action and Field that exist on page objects.|Localizability|Warning|
|[AA0219](codecop-aa0219-tooltipforfieldmuststartwithspecifies.md)|The Tooltip property of Fields must start with 'Specifies'.|Localizability|Warning|
|[AA0220](codecop-aa0220-tooltiplanguagevaluemustbefilled.md)|The value of the Tooltip property of Fields must be filled.|Localizability|Warning|
|[AA0221](codecop-aa0221-optioncaptionmustbefilledonpageforoptionfields.md)|You must specify a OptionCaption property for all fields which source expressions is not a table field.|Localizability|Warning|
|[AA0222](codecop-aa0222-siftindexshouldnotbeusedforprimaryanduniquekey.md)|SIFT index should not be used on primary or unique key.|Design|Warning|
|[AA0223](codecop-aa0223-optioncaptionlanguagevaluemustbefilled.md)|The value of the OptionCaption property of Fields must be filled in.|Localizability|Warning|
|[AA0224](codecop-aa0224-countofoptionscaptioniswrong.md)|The count of option captions specified in the OptionCaption property is wrong.|Localizability|Warning|
|[AA0225](codecop-aa0225-captionmustbefilledonpageforfields.md)|You must specify a caption in the Caption property for Fields that exist on page objects.|Localizability|Warning|
|[AA0226](codecop-aa0226-captionlanguagevaluemustbefilled.md)|The value of the Caption property of Fields must be filled in.|Localizability|Warning|
|[AA0227](codecop-aa0227-alwaysguardmethodswithunhandlederrorsinupgradecodeunits.md)|Optional return value should not be omitted in upgrade codeunits.|Design|Warning|
|[AA0228](codecop-aa0228-thelocalmethodisdeclaredbutneverused.md)|The local method must be used; otherwise removed.|Design|Warning|
|[AA0230](codecop-aa0230-noversionnumberonbcassembliesdotnetvars.md)|Version should not be specified for internal assemblies.|Design|Warning|
|[AA0231](codecop-aa0231-donotusestrsubstnoinerrormessage.md)|StrSubstNo or string concatenation must not be used as a parameter in the Error method.|Design|Warning|
|[AA0232](codecop-aa0232-flowfieldoftableshouldbeindexed.md)|The FlowField of a table should be indexed.|Design|Info|
|[AA0233](codecop-aa0233-usegetfindfirstandfindlastwithoutnext.md)|Use Get(), FindFirst() and FindLast() without Next() method.|Design|Warning|
|[AA0235](codecop-aa0235-whenusingoninstallpercompanyaddcodetocompanyinitializesubscription.md)|When using 'OnInstallPerCompany' you should also add 'Company-Initialize'::'OnCompanyInitialize' event subscriber.|Design|Info|
|[AA0237](codecop-aa0237-nontemporaryvariablesmustnotbeprefixedtemp.md)|The name of non-temporary variables must not be prefixed with Temp.|Readability|Warning|
|[AA0240](codecop-aa0240-emailandphonenomustnotbepresentinthesource.md)|Email and Phone No must not be present in any part of the source code.|Design|Warning|
|[AA0241](codecop-aa0241-uselowercaseforlanguagekeywords.md)|Use all lowercase letters for reserved language keywords.|Readability|Warning|
|[AA0448](codecop-aa0448-usefieldtablecaptionforusermessages.md)|You must use the FieldCaption method instead of the FieldName method and TableCaption method instead of TableName method.|Localizability|Warning|
|[AA0470](codecop-aa0470-placeholdershouldhavecommentexplainingcontent.md)|Placeholders should have a comment explaining their content.|Localizability|Warning|
|[AA0242](codecop-aa0242-partialrecordsdetectjitloads.md)|Limit JIT loads by selecting all fields for load.|Design|Warning|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Using the Code Analysis Tool](../devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](../devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](../devenv-using-code-analysis-tool-with-rule-set.md)