---
title: "The Txt2Al Conversion Tool"
description: "Description of the converter tool."

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# The Txt2Al Conversion Tool

The Txt2Al conversion tool allows you to take C/AL objects, which were created in [!INCLUDE[navnow_md](includes/navnow_md.md)] or [!INCLUDE[prod_short](includes/prod_short.md)] Spring 2019 (version 14), and convert them into the new .al format. The .al format is used when developing extensions for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. Converting the objects consists of following two steps:

1. Exporting the objects from C/SIDE in a cleaned .txt format.
2. Converting the objects to the new syntax.

## Where to get the Txt2Al conversion tool

The Txt2Al conversion tool (txt2al.exe) is only available with version 14, which is the last version to support C/AL. Use this version no matter what later version you may eventually be upgrading to. The AL objects created by the tool will be compatible with later versions.

You find the txt2al.exe on the installation media (DVD) in the "DVD\RoleTailoredClient\program files\Microsoft Dynamics NAV\140\RoleTailored Client" folder. Or, it's installed locally with [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)], for example, in the "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client" folder.

## Using the Txt2Al conversion tool

To run the Txt2Al conversion tool, follow the steps outlined below.

1. Start with a clean [!INCLUDE[navnow_md](includes/navnow_md.md)] database and compile the database.  
It's **very** important that you compile the database to get the right result in the next step.
2. Make an export of **all the baseline objects** in the command line using the following syntax:
```finsql.exe Command=ExportToNewSyntax, File=<filename.txt>, Database="<databasename>", ServerName=<servername> ,Filter=Type=table;ID=<tableID>``` The following example exports the table **225** from the Demo Database NAV (13-0) database:  
  ```finsql.exe Command=ExportToNewSyntax, File=exportedBaselineObjects.txt, Database="Demo Database NAV (13-0)", ServerName=.\NAVDEMO ,Filter=Type=table;ID=225```
3. Import your solution using the import option in C/SIDE and compile the database.  
It's **very** important that you compile the database to get the right result in the next step.
4. Export all **new and/or modified** objects using the following syntax:
```finsql.exe Command=ExportToNewSyntax, File=<filename.txt>, Database="<databasename>", ServerName=<servername> ,Filter=Type=table;ID=<tableID>``` The following example exports the table **231** from the Demo Database NAV (13-0) database:  
  ```finsql.exe Command=ExportToNewSyntax, File=exportedNewModifiedObjects.txt, Database="Demo Database NAV (13-0)", ServerName=.\NAVDEMO ,Filter=Type=table;ID=231```
5. Run the Set-ObjectPropertiesFromMenuSuite cmdlet, which will convert MenuSuite information on pages and reports in the generated AL objects to enable them for search. For more information, see [Making Pages and Reports Searchable in the Web client](../upgrade/upgrade-pages-report-for-search.md)
6. Create .delta files using the Compare-NAVApplicationObject PowerShell script. For more information, see [Generating DELTA Files](devenv-generating-delta-files.md).
7. Go to the *\Program Files(x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client* folder and locate the **txt2al.exe** converter tool. 
8. Run the tool from the command line using the following syntax:  
```txt2al --source --target --rename --type --extensionStartId --injectDotNetAddIns --dotNetAddInsPackage --dotNetTypePrefix --translationFormat --addLegacyTranslationInfo```

## Parameters

<!-- source file https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_git/Platform-Core?path=%2FPlatform%2FModel%2FProd.Txt2Al%2FCommandLineOptionsExtensions.cs&version=GBreleases%2F14.x&_a=contents -->
|Parameter   |Description|
|------------|-----------|
|--source=Path |Required. The path of the directory containing the .delta files.|
|--target=Path |Required. The path of the directory into which the converted AL files will be placed.|
|--rename |Rename the output files to prevent clashes with the source .txt files.|
|--type=ObjectType |The type of object to convert. Allowed values: Codeunit, Table, Page, Report, Query, XmlPort|
|--extensionStartId |The starting numeric ID of the extension objects (Default: 70000000). It will be incremented by 1 for each extension object.|
|--stacktrace|Display the stack trace of exceptions raised during the conversion.|
|--help |Show help screen.|
|--injectDotNetAddIns|Inject the definition of standard .NET add-ins in the resulting .NET package. The standard .NET add-ins are a set of add-ins that are embedded into the platform.|
|--dotNetAddInsPackage=Path |Specify the path to an AL file that contains a definition for a .NET package containing .NET type declarations that should be included in the .NET package definition that's produced by the conversion. This parameter should be used to inject a custom set of .NET control add-in declarations. The file should contain something similar to the example shown below.|
|--multithreaded|Run using multiple threads. This parameter improves performance but results in non-repeatable extension numbers and .xlf content.|
|--dotNetTypePrefix |Specify a prefix to be used for all .NET type aliases created during the conversion.|
|--translationFormat=ObjectType |Specify the format to use when generating translation files. The allowed values are: Xliff, Lcg.|
|--addLegacyTranslationInfo |Add information to the translation file that can be used to migrate existing translations/translated resources. During conversion, XLIFF files from all the ML properties in the app are extracted. If this switch is set, a comment is added in the generated XLIFF that specifies what the ID of the translation item would be in C/SIDE. This acts as a mapping that allows you to convert existing translation resources for your app.|
|--runtime|Specify the target runtime for the converted AL. The default is the latest supported runtime. The string should be in a format similar to `major.minor`.|
|--objectFileNamePattern|Specify the pattern for naming AL files that contain AL objects by using the following placeholders: `{name}` - object name, `{type}` - object type, `{id}` - object ID. This parameter only takes effect if `--rename` is specified. The default is `{name}.{type}`.|
|--extensionObjectFileNamePattern|Specify the pattern for naming AL files containing AL extension objects by using the following placeholders: `{name}` - extension object name, `{type}` - extension object type, `{id}` - object ID, `{targetName}` - the name of the object being extended, `{targetId}` - the ID of the object being extended. This parameter only takes effect if `--rename` is specified. The default is `{name}.{type}-{targetName}`.|
|--format|Format the converted AL code using the standard formatter.|
|--dataClassificationDefaulting|Specify the DataClassification property for all table fields that don't have it specified. For more information, see [DataClassification Property](properties/devenv-dataclassification-property.md).|
|--tableDataOnly|For table objects, specifies to convert only the table and field definitions, including properties. Methods and trigger code isn't included. **Note:** This parameter was first introduced in Business Central version 14.2 (cumulative update 11) and Business Central version 15.5.|

> [!NOTE]  
> It's recommended to only use the conversion tool for export. Importing objects that have been exported can damage your application.

> [!TIP]  
> You can use the Dynamics NAV Development Shell cmdlet `Export-NAVApplicationObject` with the `-ExportToNewSyntax` flag set instead of using finsql. From the command prompt in the Dynamics NAV Development Shell, run `Get-Help Export-NAVApplicationObject -full` to see the full syntax.

## See Also
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Report Object](devenv-report-object.md)  
[Page Properties](properties/devenv-page-property-overview.md)