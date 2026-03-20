---
title: Adopting namespaces in AL
description: Learn about features, tools, and best practices for structuring and adopting namespaces in your AL code for Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: bap-template
ms.date: 09/22/2023
ms.topic: concept-article
ms.reviewer: solsen
---

# Adopting namespaces in AL

[!INCLUDE [2023-releasewave2](../includes/2023-releasewave2.md)]

Namespaces are used to organize code into logical groups and hierarchies and they ensure uniqueness in code names and allow reuse of names in different contexts. Namespaces also provide structure for the code base, making it easier to navigate and understand. Learn more in [Namespaces in AL](devenv-namespaces-overview.md).

Several features and tools are available to help you progressively adopt namespaces in your AL projects. These tools automate repetitive tasks and provide guidance to streamline the transition of your codebase to use namespaces effectively.

## Using a code action for automated namespace addition

[!INCLUDE [2026-releasewave1-later](../includes/2026-releasewave1-later.md)]

A code action automatically adds namespaces to AL files that are missing them, helping you quickly bring your codebase into compliance with CodeCop rule [AA0247](analyzers/codecop-aa0247.md).

### Namespace resolution logic

When you invoke the code action, the system resolves the appropriate namespace using the following priority:

1. **Namespace template** - The system reads and parses the `al.namespaceTemplate` setting. You can use the `$(parentfolder)` placeholder to dynamically insert the parent directory name of the AL file.

2. **Sibling file analysis** - If the namespace template isn't defined or doesn't resolve to a valid identifier, the system examines other AL files in the same folder, extracts their namespace declarations, and uses the longest common namespace prefix.

3. **Publisher and project name** - If no sibling files exist or they don't have a common namespace, the system falls back to constructing a namespace from `publisher.projectname` as defined in your `app.json` file.

4. **No namespace added** - If none of the above methods produce a valid namespace name, no namespace declaration is added, and you must define one manually.

### Example workflow

Consider a project structure like this:

```
MyApp/
├── src/
│   ├── Sales/
│   │   ├── SalesOrder.Codeunit.al
│   │   └── SalesInvoice.Codeunit.al
│   └── Inventory/
│       └── ItemCard.Page.al
```

If your `al.namespaceTemplate` is set to `"MyCompany.$(parentfolder)"`, the code action suggests:

- `MyCompany.Sales` for files in the `Sales` folder
- `MyCompany.Inventory` for files in the `Inventory` folder

If the template isn't set and the file `SalesOrder.Codeunit.al` already defines a namespace, the code action suggests the same namespace for the `SalesInvoice.Codeunit.al` file.

## Using a PowerShell script for bulk namespace addition

For most scenarios, the code action described in the previous section in combination with the `al.namespaceTemplate` setting should suffice. However, for situations where you require more granular control that can't be expressed through the `namespaceTemplate` configuration, we're sharing a PowerShell script that allows you to specify namespaces for multiple objects at a time, using your folder structure. Usually code is divided into folders according to some kind of structure, which is often what you would like to replicate to some degree in your namespaces. 

The script shown in this article, allows you to specify what namespace to assign all your AL objects within a folder. After you run the script, you can then customize it a bit further. We recommend doing a commit once you have found the proper namespaces. You can then use the code action to apply `using` statements to your application.

The script takes a .csv file as input, which specifies what namespace to give to each file within a folder. The .csv file should contain a folder name and a namespace, as illustrated in the following example:

| Folder             | Namespace |
|--------------------|-----------|
| Microsoft Entra ID Graph     | System.Azure.Identity|
| Microsoft Entra ID Licensing | System.Azure.Identity |
| Data Archive       | System.DataAdministration |
| Retention Policy   | System.DataAdministration |
| SharePoint         | System.Integration.Sharepoint |

```csv
Folder,Namespace
Microsoft Entra ID Graph,System.Azure.Identity
Microsoft Entra ID Licensing,System.Azure.Identity
Data Archive,System.DataAdministration
Retention Policy,System.DataAdministration
SharePoint,System.Integration.Sharepoint
```

Copy and paste the following code lines into your preferred script editor, then save the file as a .ps1 file. Now, open PowerShell as an administrator, locate the folder of the script, and run the script with the following command: `.\<scriptname>.ps1`. The script prompts you to specify the .csv file and the base path of your application. The script goes through all the files in the base path and assigns the namespaces specified in the .csv file based on the given folder names.

```powershell
param
(
    [Parameter(Mandatory=$true)]
    [string] $CsvMappingFile,
    [Parameter(Mandatory=$true)]
    [string] $BasePath,
    [ValidateSet("Add","Ignore")]
    [string] $License = "Ignore",
    [char] $Delimiter = ","
)

$files = Import-Csv $CsvMappingFile -Delimiter $Delimiter

$licenseText = 
        "// ------------------------------------------------------------------------------------------------`r`n" +
        "// Copyright (c) <insert copyright>.`r`n" + 
        "// <Insert license>`r`n" + 
        "// ------------------------------------------------------------------------------------------------`r`n"

foreach ($file in $files) {
    $folder = $file.Folder
    $namespace = $file.Namespace
    $namespaceLine = "namespace $namespace;`r`n"

    $folderPath = Join-Path $BasePath $folder
    $alFiles = Get-ChildItem -Path $folderPath -Filter "*.al" -File -Recurse

    foreach ($alFile in $alFiles) {
        $path = $alFile.FullName
        $content = Get-Content $path -Raw
                             
        if ($content.IndexOf($licenseText) -eq -1) { # The file doesn't a contain license statement
            if ($License -eq "Ignore") {
                $content = $namespaceLine + $content
            } 
            else {$content = $licenseText + "`r`n" + $namespaceLine + $content # Add a license statement
            }
        } 
        else {
            $content = $content.Replace($licenseText, $licenseText + "`r`n" + $namespaceLine) # Keep the license and add a namespace
        }

        $content | Set-Content $path -NoNewline
    }
}

```

You're now ready to open Visual Studio Code and use the AL code actions to apply all the missing `using` statements. Learn more in [AL code actions](devenv-code-actions.md).

## Organize `using` statements

To maintain clean and readable code, especially in files with many namespace imports, keeping `using` statements alphabetically sorted is a good practice. A code action is available to automatically sort your `using` statements alphabetically.

### Before sorting

```al
using Microsoft.Sales.Document;
using System.Utilities;
using Microsoft.Inventory.Item;
using Microsoft.Finance.GeneralLedger.Setup;
```

### After sorting

```al
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Inventory.Item;
using Microsoft.Sales.Document;
using System.Utilities;
```

## Best practices

When adopting namespaces in your AL projects, consider the following best practices:

- **Use namespace templates** - Define `al.namespaceTemplate` in your workspace settings to ensure consistent namespace naming across your project.
- **Organize by feature** - Structure your folder hierarchy to align with your namespace strategy, such as `Sales`, `Purchasing`, `Inventory`.
- **Sort using statements** - Keep using statements alphabetically sorted for clean and readable imports.
- **Review generated namespaces** - Always verify that automatically generated namespaces match your organizational standards before committing changes.

## Support for fully qualified names

[!INCLUDE [2026-releasewave1-later](../includes/2026-releasewave1-later.md)]

Business Central 2026 release wave 1 introduces method overloads that accept fully qualified names for application objects. This enhancement simplifies the process of referencing objects across different namespaces, improving code clarity and maintainability.

### Running objects by fully qualified name

You can now invoke codeunits, pages, and reports using their fully qualified names. Additionally, `RecordRef.Open` can be invoked with the fully qualified name of a table.

```al
codeunit 10 MyCodeunit
{
    procedure MyProcedure()
    var
        rec: Record Customer;
        recRef: RecordRef;
    begin
        // Run codeunit by fully qualified name
        Codeunit.Run('MyNamespace.CodeunitName');

        // Page methods by fully qualified name
        Page.Run('MyNamespace.PageName');
        Page.RunModal('MyNamespace.PageName');

        // Report methods by fully qualified name
        Report.Run('MyNamespace.ReportName');
        Report.RunModal('MyNamespace.ReportName');
        Report.Execute('MyNamespace.ReportName', 'foo', rec);

        // Load record by fully qualified name
        recRef.Open('MyNamespace.TableName');
    end;
}
```

### Runtime namespace properties

[!INCLUDE [2026-releasewave1-later](../includes/2026-releasewave1-later.md)]

With 2026 release wave 1, the `Record` and `RecordRef` instances expose a `FullyQualifiedName` property, enabling you to determine the complete namespace path of an object at runtime.

```al
codeunit 10 MyCodeunit
{
    procedure MyProcedure()
    var
        rec: Record Customer;
        recRef: RecordRef;
    begin
        Message(rec.FullyQualifiedName);
        Message(recRef.FullyQualifiedName);
    end;
}
```

## Related information

[Namespaces in AL](devenv-namespaces-overview.md)
[Code actions](devenv-code-actions.md)
[Programming in AL](devenv-programming-in-al.md)
