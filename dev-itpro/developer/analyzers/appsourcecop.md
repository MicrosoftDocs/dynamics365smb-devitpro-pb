---
title: "AppSourceCop Analyzer"
description: "AppSourceCop is an analyzer that enforces rules that must be respected by extensions meant to be published to Microsoft AppSource."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# AppSourceCop Analyzer Rules
AppSourceCop is an analyzer that enforces rules that must be respected by extensions meant to be published to Microsoft AppSource.

## Rules

|Id|Title|Category|Default Severity|
|--|-----------|--------|----------------|
|[AS0001](appsourcecop-as0001-tabledeletionnotallowed.md)|Tables and table extensions that have been published must not be deleted.|Upgrade|Error|
|[AS0002](appsourcecop-as0002-fielddeletionnotallowed.md)|Fields must not be deleted.|Upgrade|Error|
|[AS0003](appsourcecop-as0003-previousversionnotfound.md)|The previous version of the extension could not be found.|Upgrade|Error|
|[AS0004](appsourcecop-as0004-fieldtypechangenotallowed.md)|Fields must not change type, since dependent extensions may break|Upgrade|Error|
|[AS0005](appsourcecop-as0005-fieldnamechangenotallowed.md)|Fields must not change name|Upgrade|Error|
|[AS0006](appsourcecop-as0006-tablenamechangenotallowed.md)|Tables that have been published must not change name.|Upgrade|Error|
|[AS0009](appsourcecop-as0009-keyfieldschangenotallowed.md)|Key fields must not be changed|Upgrade|Error|
|[AS0010](appsourcecop-as0010-primarykeydeletenotallowed.md)|Keys must not be deleted|Upgrade|Error|
|[AS0011](appsourcecop-as0011-identifiersmusthaveaffix.md)|An affix is required|Extensibility|Error|
|[AS0013](appsourcecop-as0013-fieldidmustbewithinallocatedrange.md)|The field identifier must be within the allowed range|Extensibility|Error|
|[AS0014](appsourcecop-as0014-projectmanifestmustspecifyidrange.md)|The project manifest must contain the allocated identifier range|Extensibility|Error|
|[AS0015](appsourcecop-as0015-translationsmustbeenabled.md)|TranslationFile must be enabled.|Extensibility|Error|
|[AS0016](appsourcecop-as0016-dataclassificationmustbespecified.md)|Fields of field class 'Normal' must use the DataClassification property and its value should be different from ToBeClassified|Extensibility|Error|
|[AS0018](appsourcecop-as0018-publicapiprocedureremovalnotallowed.md)|A procedure belonging to the public API cannot be removed|Upgrade|Error|
|[AS0019](appsourcecop-as0019-eventattributecannotberemoved.md)|Event attributes cannot be removed|Upgrade|Error|
|[AS0020](appsourcecop-as0020-eventattributetypecannotbechanged.md)|The type of events cannot be changed.|Upgrade|Error|
|[AS0021](appsourcecop-as0021-argumentineventattributecannotbechangedtofalse.md)|An argument in an event attribute cannot be changed to false.|Upgrade|Error|
|[AS0022](appsourcecop-as0022-externalscopecannotberemoved.md)|An external scope cannot be removed|Upgrade|Error|
|[AS0023](appsourcecop-as0023-returntypecannotbemodifiedinpublicapi.md)|A return type cannot be modified in external procedures|Upgrade|Error|
|[AS0024](appsourcecop-as0024-parameterscannotberemovedoraddedinexternalprocedures.md)|Parameters cannot be removed or added in external procedures|Upgrade|Error|
|[AS0025](appsourcecop-as0025-parameterscannotbemodifiedorremovedfromevents.md)|Parameters cannot be modified, renamed, or removed from events.|Upgrade|Error|
|[AS0026](appsourcecop-as0026-parametertypesubtypecannotbemodifiedinpublicapi.md)|The type and subtype of parameters cannot be modified in events and external procedures|Upgrade|Error|
|[AS0027](appsourcecop-as0027-modifyingarraysizeofparameterinpublicapi.md)|Modifying the array size of a parameter in events and external procedures is not allowed|Upgrade|Error|
|[AS0028](appsourcecop-as0028-reducingarraysizeofparameterinpublicapi.md)|Reducing the array size of a parameter in events and external procedures is not allowed|Upgrade|Error|
|[AS0029](appsourcecop-as0029-pagedeletionnotallowed.md)|Pages and PageExtensions that have been published must not be deleted, since dependent extensions may break|Upgrade|Error|
|[AS0030](appsourcecop-as0030-pagerenamenotallowed.md)|Pages that have been published must not be renamed.|Upgrade|Error|
|[AS0031](appsourcecop-as0031-actiondeletionnotallowed.md)|Actions that have been published must not be deleted.|Upgrade|Error|
|[AS0032](appsourcecop-as0032-controldeletionnotallowed.md)|Controls that have been published must not be deleted/|Upgrade|Error|
|[AS0033](appsourcecop-as0033-viewdeletionnotallowed.md)|Views that have been published must not be deleted.|Upgrade|Error|
|[AS0034](appsourcecop-as0034-destructivetablepropertychangenotallowed.md)|Unsupported table property change|Upgrade|Error|
|[AS0036](appsourcecop-as0036-destructivetablefieldpropertychangenotallowed.md)|Unsupported table field property change|Upgrade|Error|
|[AS0038](appsourcecop-as0038-destructivekeypropertychangenotallowed.md)|Unsupported table key property change|Upgrade|Error|
|[AS0039](appsourcecop-as0039-destructivetablepropertyremovenotallowed.md)|Removing properties that cause destructive changes is not allowed|Upgrade|Error|
|[AS0041](appsourcecop-as0041-destructivetablefieldpropertyremovenotallowed.md)|Table field property changes that cause destructive changes must not be removed|Upgrade|Error|
|[AS0042](appsourcecop-as0042-destructivekeypropertyremovenotallowed.md)|Table key property changes that cause destructive changes must not be removed|Upgrade|Error|
|[AS0043](appsourcecop-as0043-clusteredkeydeletenotallowed.md)|The clustered key must not be deleted|Upgrade|Error|
|[AS0044](appsourcecop-as0044-destructivetablefieldpropertyoptionmemberschangenotallowed.md)|Property changes that cause destructive changes are not allowed|Upgrade|Error|
|[AS0047](appsourcecop-as0047-extensionnamelengthmustnotexceedlimit.md)|The extension name is too long.|Extensibility|Error|
|[AS0048](appsourcecop-as0048-extensionpublisherlengthmustnotexceedlimit.md)|The publisher name is too long.|Extensibility|Error|
|[AS0049](appsourcecop-as0049-applicationobjectaccessibilitychangenotallowed.md)|The access modifier of an application object cannot be changed to a value that provides less access.|Extensibility|Error|
|[AS0050](appsourcecop-as0050-applicationobjectextensibilitychangenotallowed.md)|The extensibility of an application object cannot be removed|Extensibility|Error|
|[AS0051](appsourcecop-as0051-applicationmanifestpropertymustbespecified.md)|Manifest property is required for AppSource submission|Extensibility|Error|
|[AS0052](appsourcecop-as0052-applicationmanifestmustspecifyurl.md)|The property 'url' must be set to a valid URL|Extensibility|Error|
|[AS0053](appsourcecop-as0053-applicationmanifestcompilationtargetmustbecloud.md)|The compilation target of an application must be a value that is allowed in a multi-tenant SaaS environment|Extensibility|Error|
|[AS0054](appsourcecop-as0054-appsourcecopconfigurationmustspecifyaffixes.md)|The AppSourceCop configuration must specify the set of affixes used by the application|Configuration|Error|
|[AS0055](appsourcecop-as0055-appsourcecopconfigurationshouldspecifysupportedcountries.md)|The AppSourceCop configuration must specify the list of countries/regions targeted by the application|Configuration|Hidden|
|[AS0056](appsourcecop-as0056-appsourcecopconfigurationsupportedcountriesmustbevalidcountrycode.md)|The country/region codes specified in the 'supportedCountries' property must be valid ISO 3166-1 alpha-2 codes|Configuration|Warning|
|[AS0057](appsourcecop-as0057-translationsnotprovidedforlocale.md)|Translations must be provided for all the locales in which the application will be available|Extensibility|Hidden|
|[AS0058](appsourcecop-as0058-onlyuseasserterrorintestcodeunits.md)|Only use AssertError in Test Codeunits|Extensibility|Error|
|[AS0059](appsourcecop-as0059-databasetablesarereadonly.md)|Reserved database tables are read-only in a multi-tenant environment|Extensibility|Error|
|[AS0060](appsourcecop-as0060-unsafemethodinvocationisnotallowed.md)|Unsafe methods cannot be invoked in an AppSource application|Extensibility|Error|
|[AS0061](appsourcecop-as0061-donotsubscribetooncompanyopenevents.md)|Procedures must not subscribe to CompanyOpen events|Extensibility|Error|
|[AS0062](appsourcecop-as0062-useapplicationareaproperty.md)|Page controls and actions must use the ApplicationArea property|Extensibility|Error|
|[AS0063](appsourcecop-as0063-removingvarparamatermodifierinevent.md)|Removing a var modifier in events is not allowed|Upgrade|Error|
|[AS0064](appsourcecop-as0064-interfaceimplementationdeletionnotallowed.md)|Interface implementations that have been published must not be deleted.|Upgrade|Error|
|[AS0065](appsourcecop-as0065-interfacedeletionnotallowed.md)|Interfaces that have been published must not be deleted.|Upgrade|Error|
|[AS0066](appsourcecop-as0066-addingpublicapiprocedurenotallowed.md)|A new method to an interface that has been published must not be added.|Upgrade|Error|
|[AS0067](appsourcecop-as0067-addinginterfacetoenumwithoutdefaultimplementationnotallowed.md)|Adding an interface to an enum that has been published must have a default implementation.|Upgrade|Error|
|[AS0068](appsourcecop-as0068-changingtableextensiontargetnotallowed.md)|Changing a table extension's target is not allowed.|Upgrade|Error|
|[AS0069](appsourcecop-as0069-invalidoptiontoenumconversionnumberofenumvalues.md)|An enum field replacing an option field should have at least the same number of members.|Upgrade|Error|
|[AS0070](appsourcecop-as0070-invalidoptiontoenumconversionvaluerenamed.md)|An enum field replacing an option field should preserve the member names.|Upgrade|Error|
|[AS0071](appsourcecop-as0071-invalidoptiontoenumconversionmissingordinalvalue.md)|An enum field replacing an option field should preserve the member ordinal values.|Upgrade|Error|
|[AS0072](appsourcecop-as0072-obsoletetagpreviousversionnotallowed.md)|The ObsoleteTag property and the Tag in the Obsolete attribute must be set to the next release version.|Design|Hidden|
|[AS0073](appsourcecop-as0073-obsoletetagmissingnotallowed.md)|Obsolete Tag must be set.|Design|Hidden|
|[AS0074](appsourcecop-as0074-obsoletetagdifferentfrombaselinenotallowed.md)|The Obsolete Tag must be the same across branches.|Design|Hidden|
|[AS0075](appsourcecop-as0075-obsoletereasonmissingnotallowed.md)|Obsolete Reason must be set.|Design|Warning|
|[AS0076](appsourcecop-as0076-obsoletetagformatnotallowed.md)|Obsolete Tag format.|Design|Hidden|
|[AS0077](appsourcecop-as0077-addingvarparamatermodifierinevent.md)|Adding a var modifier in events is not allowed|Upgrade|Warning|
|[AS0078](appsourcecop-as0078-changingvarparamatermodifier.md)|Adding or removing a var modifier in external procedures is not allowed|Upgrade|Warning|
|[AS0079](appsourcecop-as0079-extensionproceduresmusthaveaffix.md)|An affix is required for procedures defined in extension objects.|Extensibility|Warning|
|[AS0080](appsourcecop-as0080-fieldlengthdecreasenotallowed.md)|Fields must not decrease in length|Upgrade|Error|
|[AS0081](appsourcecop-as0081-internalsvisibletonosecurityfeature.md)|InternalsVisibleTo should not be used as a security feature.|Extensibility|Warning|
|[AS0082](appsourcecop-as0082-enumvaluechangenotallowed.md)|It is not allowed to rename an enum value.|Upgrade|Error|
|[AS0083](appsourcecop-as0083-enumvaluedeletionnotallowed.md)|It is not allowed to delete a value from an enum.|Upgrade|Error|
|[AS0084](appsourcecop-as0084-idrangeallocatedtoapplicationmustbewithinappsourcerange.md)|The ID range assigned to the extension must be within the allowed range|Extensibility|Error|
|[AS0085](appsourcecop-as0085-applicationdependencymustbeused.md)|The 'application' property must be used instead of explicit dependencies|Extensibility|Warning|
|[AS0086](appsourcecop-as0086-fieldlengthincreasenotallowed.md)|Fields must not increase in length|Upgrade|Warning|
|[AS0087](appsourcecop-as0087-translationsofenumvaluecaptionwithcommasisnotallowed.md)|Translations of enum value captions must not contain commas|Extensibility|Warning|
|[AS0088](appsourcecop-as0088-referenceableobjectwithiddeletionnotallowed.md)|Objects with an ID that can be referenced and which have been published must not be deleted.|Upgrade|Error|
|[AS0089](appsourcecop-as0089-referenceableobjectdeletionnotallowed.md)|Objects that can be referenced and which have been published must not be deleted.|Upgrade|Error|
|[AS0090](appsourcecop-as0090-referenceableobjectrenamenotallowed.md)|Objects that can be referenced and which have been published must not be renamed.|Upgrade|Error|
|[AS0091](appsourcecop-as0091-previousversiondependencynotfound.md)|One or more dependencies of the previous version of the extension could not be found.|Upgrade|Error|
|[AS0092](appsourcecop-as0092-applicationmanifestmustspecifyapplicationinsightsresource.md)|The app.json file must specify an Azure Application Insights resource.|Configuration|Warning|
|[AS0093](appsourcecop-as0093-entitlementobjectinappsourcenotallowed.md)|Entitlements cannot be defined in an extension.|Configuration|Error|
|[AS0094](appsourcecop-as0094-permissionsetsshouldnotbeinxml.md)|Permission Sets should not be defined in XML files.|Configuration|Warning|
|[AS0095](appsourcecop-as0095-tablefieldsaccessmustnotdegrade.md)|The access modifier of a table field cannot be changed to a value that provides less access.|Configuration|Error|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> Several rules enforced by the AppSourceCop analyzer are incompatible with rules enforced by the PerTenantExtensionCop. Make sure to enable only one of these at a time.

> [!NOTE]  
> Failing to comply with the rules whose default severity is set to `Error` will fail the submission of your extension to the AppSource marketplace. It is recommended, but not mandatory to comply with the rules whose severity is marked as `Warning` or `Info`. 

## Configuration
    
The AppSourceCop analyzer can be further configured by adding a file named `AppSourceCop.json` in the project's root folder. The AL Language extension will offer IntelliSense for this file.

The following table describes the settings in the `AppSourceCop.json` file:

|Setting|Mandatory|Value|
|-------|---------|-----|
|name|No|The name of a previous version of this package with which you want to compare the current package for breaking changes.|
|publisher|No|The publisher of a previous version of this package with which you want to compare the current package for breaking changes.|
|version|Yes|The version of a previous version of this package with which you want to compare the current package for breaking changes.|
|mandatoryAffixes|No|Affixes that must be prepended or appended to the name of all new application objects, extension objects, and fields.|
|supportedCountries|No|The set of country codes, in the alpha-2 ISO 3166 format, in which the application will be available.|
|targetVersion|No|Specifies the next Major.Minor version of the extension in the current branch in order to validate the ObsoleteTag values with [AS0072](appsourcecop-as0072-obsoletetagpreviousversionnotallowed.md). This is only relevant when the default obsoleteTagPattern '(\\d+)\\.(\\d+)' is used. This property is being deprecated in favor of obsoleteTagVersion.|
|obsoleteTagVersion|No|Specifies the next Major.Minor version of the extension in the current branch in order to validate the ObsoleteTag values with AS0072. This is only relevant when the default obsoleteTagPattern '(\\d+)\\.(\\d+)' is used.|
|obsoleteTagPattern|No|The Obsolete tag pattern used by AS0076. This should be a valid regular expression. By default, the pattern '(\\d+)\\.(\\d+)' is used.|
|obsoleteTagPatternDescription|No|A human-readable description for the ObsoleteTagPattern regular expression. This is used in diagnostics reported by AS0076. By default, 'Major.Minor' is used.|
|baselinePackageCachePath|No|The path to the folder containing the baseline and its dependencies with which you want to compare the current package for breaking changes. By default, the package cache path for the current project is used (see 'al.packageCachePath' setting).|

The `name`, `publisher`, `version` properties are used for specifying a previous version of the current package. This package must be located in the baseline package cache folder of your extension. This cache can be specified using the `baselinePackageCachePath` property. If this property is not specified, the dependency package cache path of the extension will be used instead. The `al.packageCachePath` setting allows you to specify the path to the folder that will act as the cache for the dependencies symbol files used by your project. AppSourceCop will compare the previous version of your extension with its current version and will report any breaking changes introduced by the current package.

The `mandatoryAffixes` property specifies strings that must be prepended or appended to the names of all new objects, extension objects and fields. By using these affixes, you can prevent clashes between objects added by your extension and objects added by other extensions.

The `supportedCountries` property specifies the codes that correspond to the countries for which the product allows AppSource submissions. For more information, see [Availability and supported Countries/Regions and Translations](../../compliance/apptest-countries-and-translations.md)

The properties `obsoleteTagVersion`, `obsoleteTagPattern`, and `obsoleteTagPatternDescription` can be used to enable additional validation on object obsoletion. These are not required for AppSource submissions.

## Example
In the following example, we will configure AppSourceCop to validate that all new elements have a name that contains one of the specified affixes.

> [!NOTE]  
> Make sure that code analysis is enabled and `${AppSourceCop}` is specified in the list of enabled code analyzers. For more information see [AL Language Extension Configuration](../devenv-al-extension-configuration.md).

We start by creating the default "Hello world" extension.
```AL
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

We continue by adding the configuration file `AppSourceCop.json` in the project's root folder and setting its content to the following. 

```json
{
    "mandatoryAffixes": [ "Foo", "Bar" ]
}
```

> [!IMPORTANT]  
> If you are running a multi-root workspace environment, you must have one `AppSourceCop.json` file in the root folder of each of the projects. For more information, see [Working with multiple AL project folders within one workspace](../devenv-multiroot-workspaces.md).


You are immediately greeted by the following error message:
```
AS0011: The identifier 'CustomerListExt' must have at least one of the mandatory affixes 'Foo, Bar'.
```

Prepending **Foo** to the name of the page extension object will fix this error and prevent clashes between this page extension and page extensions added by other developers.

> [!NOTE]  
> It is still possible to use the `mandatoryPrefix` and `mandatorySuffix` properties in the `AppSourceCop.json`. For more information see [AS0011](appsourcecop-as0011-identifiersmusthaveaffix.md).

## See Also  
[Using the Code Analysis Tool](../devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](../devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](../devenv-using-code-analysis-tool-with-rule-set.md)  
