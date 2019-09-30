---
title: "AppSourceCop Analyzer"
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
# AppSourceCop Analyzer Rules
AppSourceCop is an analyzer that enforces rules that must be respected by extensions meant to be published to Microsoft AppSource.

## Rules

|Id|Title|Description|MessageFormat|Category|Default Severity|IsEnabledbyDefault|
|--|-----|-----------|-------------|--------|----------------|------------------|
|[AS0001](appsourcecop-as0001-tabledeletionnotallowed.md)|Tables cannot be deleted.|Tables cannot be deleted.|Table '{0}' has been deleted.|Upgrade|Error|true|
|[AS0002](appsourcecop-as0002-fielddeletionnotallowed.md)|Fields cannot be deleted.|Fields cannot be deleted.|Field '{0}' has been deleted from table '{1}'.|Upgrade|Error|true|
|[AS0003](appsourcecop-as0003-previousversionnotfound.md)|The previous version was not found.|The previous version was not found.|The previous version was not found. Name='{0}', Publisher='{1}', Version'{2}'.|Upgrade|Warning|true|
|[AS0004](appsourcecop-as0004-fieldtypechangenotallowed.md)|Fields cannot change type.|Fields cannot change type.|Field '{0}' has changed type from '{1}' to '{2}'. Type changes are not allowed.|Upgrade|Error|true|
|[AS0005](appsourcecop-as0005-fieldnamechangenotallowed.md)|Fields cannot change name.|Fields cannot change name.|Field '{0}' has changed name to '{1}'. Name changes are not allowed.|Upgrade|Error|true|
|[AS0006](appsourcecop-as0006-tablenamechangenotallowed.md)|Tables cannot change name.|Tables cannot change name.|Table '{0}' has changed name to '{1}'. Name changes are not allowed.|Upgrade|Error|true|
|[AS0007](appsourcecop-as0007-propertyvaluechangenotallowed.md)|Properties cannot change value.|Properties cannot change value.|The property '{0}' has changed value. Value change is not allowed for this property.|Upgrade|Error|true|
|[AS0008](appsourcecop-as0008-keynamechangenotallowed.md)|Keys cannot change name.|Keys cannot change name.|Key '{0}' has changed name to '{1}'. Name changes are not allowed.|Upgrade|Error|true|
|[AS0009](appsourcecop-as0009-keyfieldschangenotallowed.md)|Key fields cannot be changed.|Key fields cannot be changed.|Key '{0}' has changed the key fields. Changes to the field list are not allowed.|Upgrade|Error|true|
|[AS0010](appsourcecop-as0010-keydeletenotallowed.md)|Keys cannot be deleted.|Keys cannot be deleted.|Key '{0}' has been deleted. Key deletions is not allowed.|Upgrade|Error|true|
|[AS0011](appsourcecop-as0011-identifiersmusthaveaffix.md)|An affix is required.|An affix is required.|The identifier '{0}' must have at least one of the mandatory affixes '{1}'.|Extensibility|Error|true|
|[AS0013](appsourcecop-as0013-fieldidmustbewithinallocatedrange.md)|The field identifier must be within the allowed range.|The field identifier must be within the allowed range.|The field identifier '{0}' is not valid. It must be within the allowed range '{1}' - '{2}'.|Extensibility|Error|true|
|[AS0014](appsourcecop-as0014-projectmanifestmustspecifyidrange.md)|The project manifest must contain the allocated identifier range.|The project manifest must contain the allocated identifier range.|The project manifest must contain the allocated identifier range.|Extensibility|Error|true|
|[AS0015](appsourcecop-as0015-translationsmustbeenabled.md)|Please enable the TranslationFile feature in the app.json file for your project.|Please enable the TranslationFile feature in the app.json file for your project.|Please enable the TranslationFile feature in the app.json file for your project.|Extensibility|Error|true|
|[AS0016](appsourcecop-as0016-dataclassificationmustbespecified.md)|Fields of field class 'Normal' must use the DataClassification property and its value should be different from ToBeClassified.|Fields of field class 'Normal' must use the DataClassification property and its value must be different from ToBeClassified. FlowFields and FlowFilter fields are automatically set to the SystemMetadata data classification.|Field with name '{0}' must use the DataClassification property and its value should be different from ToBeClassified.|Extensibility|Error|true|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> Several rules enforced by the AppSourceCop analyzer are incompatible with rules enforced by the PerTenantExtensionCop. Make sure to enable only one of these at a time.

## Configuration
The AppSourceCop analyzer can be further configured by adding a file named ```AppSourceCop.json``` in the project's root folder. The AL Language extension will offer intellisense for this file.

The following table describes the settings in the ```AppSourceCop.json``` file:

|Setting|Mandatory|Value|
|-------|---------|-----|
|name|No|The name of a previous version of this package with which you want to compare the current package for breaking changes.|
|publisher|No|The publisher of a previous version of this package with which you want to compare the current package for breaking changes.|
|version|Yes|The version of a previous version of this package with which you want to compare the current package for breaking changes.|
|mandatoryAffixes|No|Affixes that must be prepended or appended to the name of all new application objects, extension objects, and fields.|

The ```name```, ```publisher```, ```version``` properties are used for specifying a previous version of the current package. AppSourceCop will use this information to download the specified package from the server and compare the current package with it. AppSourceCop will report any breaking changes introduced by the current package.

The ```mandatoryAffixes``` property specifies strings that must be prepended or appended to the names of all new objects, extension objects and fields. By using these affixes, you can prevent clashes between objects added by your extension and objects added by other extensions.

## Example
In the following example, we will configure AppSourceCop to validate that all new elements have a name that contains one of the specified affixes.

> [!NOTE]  
> Make sure code analysis is enabled and ```${AppSourceCop}``` is in the list of enabled code analyzers.

We start by creating the default "Hello world" extension.
```
pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        begin
            Message('App published: Hello world');
        end;
    end;
}
```

We continue by adding the configuration file ```AppSourceCop.json``` in the project's root folder and setting its content to the following. 

```
{
    "mandatoryAffixes": [ "Foo", "Bar" ]
}
```

You are immediately greeted by the following error message:
```
AS0011: The identifier 'CustomerListExt' must have at least one of the mandatory affixes 'Foo, Bar'.
```

Prepending **Foo** to the name of the page extension object will fix this error and prevent clashes between this page extension and page extensions added by other developers.

> [!NOTE]  
> It is still possible to use the ```mandatoryPrefix``` and ```mandatorySuffix``` properties in the ```AppSourceCop.json```, for more information see [AS0011](appsourcecop-as0011-identifiersmusthaveaffix.md).

## See Also  
[Using the Code Analysis Tool](../devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](../devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](../devenv-using-code-analysis-tool-with-rule-set.md)  