---
title: Structuring namespaces in AL
description: Structuring your namespaces in AL for Business Central with script code example.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: bap-template
ms.date: 09/22/2023
ms.reviewer: na
ms.service: dynamics365-business-central
ms.topic: conceptual
---

# Structuring namespaces in AL

[!INCLUDE [2023-releasewave2](../includes/2023-releasewave2.md)]

Namespaces are used to organize code into logical groups and hierarchies and they ensure uniqueness in code names and allow reuse of names in different contexts. Namespaces also provide structure for the code base, making it easier to navigate and understand. For more information, see [Namespaces in AL](devenv-namespaces-overview.md).

To get started introducing namespaces in your application, we're sharing a script that we have been using ourselves. This script allows you to specify namespaces for multiple objects at a time, using your folder structure. Usually code is divided into folders according to some kind of structure, which is often what you would like to replicate to some degree in your namespaces. 

The script shown in this article, allows you to specify what namespace to assign all your AL objects within a folder. After you have run the script, you can then customize these a bit further. We recommend doing a commit once you have found the proper namespaces. You can then use the code action to apply `using` statements to your application.

The script takes a .csv file as input, which specifies what namespace to give to each file within a folder. The .csv file should contain a folder name and a namespace, as illustrated in the following example:

| Folder             | Namespace |
|--------------------|-----------|
| Azure AD Graph     | System.Azure.Identity|
| Azure AD Licensing | System.Azure.Identity |
| Data Archive       | System.DataAdministration |
| Retention Policy   | System.DataAdministration |
| SharePoint         | System.Integration.Sharepoint |

```csv
Folder,Namespace
Azure AD Graph,System.Azure.Identity
Azure AD Licensing,System.Azure.Identity
Data Archive,System.DataAdministration
Retention Policy,System.DataAdministration
SharePoint,System.Integration.Sharepoint
```

Copy and paste the following code lines into your preferred script editor, then save the file as a .ps1 file. Now, open PowerShell as an administrator, locate the folder of the script, and run the script with the following command: `.\<scriptname>.ps1`. The script will prompt you to specify the .csv file and the base path of your application. The script will then go through all the files in the base path and assign the namespaces specified in the .csv file based on the given folder names.

```powershell
param
(
    [Parameter(Mandatory=$true)]
    [string] $CsvMappingFile,
    [Parameter(Mandatory=$true)]
    [string] $BasePath,
    [ValidateSet("Add","Ignore")]
    [string] $License = "Ignore",
    [char] $Delimiter = ";"
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

You're now ready to open Visual Studio Code and use the AL code actions to apply all the missing `using` statements.

## See also

[Namespaces in AL](devenv-namespaces-overview.md)  
[Programming in AL](devenv-programming-in-al.md)  