---
title: "The Txt2Al Conversion Tool"
description: "Description of the converter tool."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# The Txt2Al Conversion Tool
The Txt2Al conversion tool allows you to take existing [!INCLUDE[navnow_md](includes/navnow_md.md)] objects that have been exported in .txt format and convert them into the new .al format. The .al format is used when developing extensions for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. Converting the objects consists of following two steps:

1. Exporting the objects from C/SIDE in a cleaned format.
2. Converting the objects to the new syntax.

## To run the Txt2Al conversion tool
To run the Txt2Al conversion tool, follow the steps outlined below.

1. Start with a clean Dynamics NAV database and compile the database.  
It is **very** important that you compile the database to get the right result in the next step.
2. Make an export of **all the baseline objects** in the command line using the following syntax:
```finsql.exe Command=ExportToNewSyntax, File=<filename.txt>, Database="<databasename>", ServerName=<servername> ,Filter=Type=table;ID=<tableID>``` The following example exports the table **225** from the Demo Database NAV 11-0 database:  
  ```finsql.exe Command=ExportToNewSyntax, File=exportedBaselineObjects.txt, Database="Demo Database NAV (11-0)", ServerName=.\NAVDEMO ,Filter=Type=table;ID=225```
3. Import your solution using the import option in C/SIDE and compile the database.  
It is **very** important that you compile the database to get the right result in the next step.
4. Export all **new and/or modified** objects using the following syntax:
```finsql.exe Command=ExportToNewSyntax, File=<filename.txt>, Database="<databasename>", ServerName=<servername> ,Filter=Type=table;ID=<tableID>``` The following example exports the table **231** from the Demo Database NAV 11-0 database:  
  ```finsql.exe Command=ExportToNewSyntax, File=exportedNewModifiedObjects.txt, Database="Demo Database NAV (11-0)", ServerName=.\NAVDEMO ,Filter=Type=table;ID=231```
5. Create .delta files using the Compare-NAVApplicationObject powershell script. For more information, see [Generating DELTA Files](devenv-generating-delta-files.md).
6. Go to the *\Program Files(x86)\DynamicsNAV\110\RoleTailored Client* folder and locate the **txt2al.exe** converter tool. 
7. Run the tool from the command line using the following syntax:  
```txt2al --source --target --rename --type --extensionStartId```

|Parameter   |Description|
|------------|-----------|
|--source=Path |Required. The path of the directory containing the .delta  files.|
|--target=Path |Required. The path of the directory into which the converted AL files will be placed.|
|--rename |Rename the output files to prevent clashes with the source .txt files.|
|--type=ObjectType |The type of object to convert. Allowed values: Codeunit, Table, Page, Report, Query, XmlPort|
|--extensionStartId |The starting numeric ID of the extension objects (Default: 70000000). It will be incremented by 1 for each extension object.|
|--help |Show help screen.|

> [!NOTE]   
> It is recommended to only use the conversion tool for export. Importing objects that have been exported can damage your application.

> [!TIP]  
> You can use the Dynamics NAV Development Shell cmdlet `Export-NAVApplicationObject` with the `-ExportToNewSyntax` flag set instead of using finsql. From the command prompt in the Dynamics NAV Development Shell, run `Get-Help Export-NAVApplicationObject -full` to see the full syntax.

## See Also
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Report Object](devenv-report-object.md)  
[Page Properties](properties/devenv-page-property-overview.md)