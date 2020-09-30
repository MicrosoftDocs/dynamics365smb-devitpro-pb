---
title: Generate HTML files from the contents of a Microsoft GitHub repository
description: This article describes the HtmlFromRepoGenerator tool in the custom help toolkit for Business Central. 

author: edupont04
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 07/24/2020
ms.author: edupont
---

# Custom Help Toolkit: The HtmlFromRepoGenerator tool

The custom help toolkit includes the **HtmlFromRepoGenerator** tool that gets Microsoft's content in MarkDown files and converts it to HTML files. You can then deploy the HTML files to a website.  

## <a name="consoleapp"></a>Use the HtmlFromRepoGenerator tool to get MarkDown files and generate HTML files

HtmlFromRepoGenerator.exe provides functionality that supports the creation of custom Help based on source files from Microsoft. You can use HtmlFromRepoGenerator.exe to:

- Clone a Microsoft documentation repository (repo)
- Update links to files that are no longer in the clone
- Update the **ms.locale** value to match the language options that are supported by Business Central

- Generate HTML files that can be used for publishing.

    The HTML files will be generated in the **business-central\d365businesscentral** subfolder. The files are generated based on stylesheets and templates that are part of the tool.<!-- For more information, see [Modifying the styling of the generated HTML files](#modifying-the-styling-of-the-generated-html-files).-->

- Compare a localized Microsoft repo to the en-US repo to identify differences and update links accordingly.

### Syntax

Here is the syntax for HtmlFromRepoGenerator.exe:  

```
HtmlFromRepoGenerator.exe --Out <path> [--DoNotClone <true|false>] [--Repo <URL>] [--RemoveGitFolder <true|false>] [--LogsDir <.\logs>] [--EnRepo <URL>] [--EnOut <path>] [--Lng <language code>] [--Rtl] [--?[--]]
```

The following table provides an explanation of the parameters:

|Parameter   |Description  |
|------------|-------------|
|Out |Specifies the folder where your existing clone is, or the folder to clone the repo to. If you run HtmlFromRepoGenerator to clone a repo, this folder must not already exist. <!--Use the language name as the folder name as described in [Language and locale descriptors in across product and Help](language-locale.md). -->|
|DoNotClone |Set this parameter when you run the tool against a previously cloned repo. |
|Repo |Specifies the repo URL. Optional if you run the tool based on a previously cloned repo. Examples of Microsoft documentation repo URLs include *https://github.com/MicrosoftDocs/dynamics365smb-docs* for English (US) and *https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.de-de* for German (Germany).|
|RemoveGitFolder|Specifies whether to remove the `.git` folder.|
|LogsDir|Specifies the folder to save logs files to.|

The following additional parameters are used when the tool is run against the localized Microsoft documentation repos:

|Parameter   |Description  |
|------------|-------------|
|EnRepo|Specifies the URL of the en-US repo. Optional if you run the tool on a previously cloned repo. The Microsoft documentation repo URL for English (US) is [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs).|
|EnOut|Specifies the folder where the en-US repo exists, or the folder to clone it to. This folder must not already exist if you run the tool based on a previously cloned repo.|
|Lng|Specifies the language value to use for `ms.locale` metadata in the generated HTML files. The value must correspond to the value that is specified in the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] language settings. If this parameter is not set, the tool uses en-US. <!--For more information, see [Language and locale descriptors in across product and Help](language-locale.md).-->|
|Rtl|Set this parameter if the language uses right-to-left (RTL) formatting. Examples of RTL languages include Arabic and Hebrew.|

## Examples

> [!NOTE]
> The Microsoft repos contain many files, so the process takes several minutes. If you run the tool against multiple localization repos, the process takes longer.

The following example clones the en-US repo and generates HTML files.

```
HtmlFromRepoGenerator.exe --out "D:\BC\en-US" --repo "https://github.com/MicrosoftDocs/dynamics365smb-docs" --LogsDir D:\BC\logs\en-US
```

The following example uses a previously cloned en-US repo and generates HTML files.

```
HtmlFromRepoGenerator.exe --out "D:\BC\en-US" --DoNotClone --LogsDir D:\BC\logs\en-US
```

The following example clones both the de-DE and en-US repos, and generates HTML files for de-DE.

```
HtmlFromRepoGenerator.exe --out "D:\BC\de-DE" --repo "https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.de-de" --EnRepo "https://github.com/MicrosoftDocs/dynamics365smb-docs" --EnOut "D:\BC\en-US" --lng "de-DE" --LogsDir D:\BC\logs\de-DE
```

The following example uses previously cloned de-DE and en-US repos to generate HTML files for de-DE. Make sure that the de-DE repo is up to date if you use an existing cloned repo.

```
HtmlFromRepoGenerator.exe --out "D:\BC\de-DE" --DoNotClone --enOut "D:\BC\en-US" --lng "de-DE" --LogsDir D:\BC\logs\de-DE
```

> [!IMPORTANT]
> Do not run HtmlFromRepoGenerator.exe repeatedly on a previously-cloned repo. HtmlFromRepoGenerator modifies the links during processing, so running HtmlFromRepoGenerator more than once on the same content will result in incorrect links. If you want to rerun HtmlFromRepoGenerator, either use HtmlFromRepoGenerator to create a new clone of the repo, or revert all local changes to your existing clone.

## Modifying the styling of the generated HTML files

The tool generates the HTML files based a set of predefined templates. In most cases, you can modify the stylesheets in the ```styles``` folder to modify the appearance of your content.

For advanced scenarios, you can modify the templates used by the HtmlFromRepoGenerator tool. The source files are included in the *SourceCode* folder in the GitHub repo. The templates are in the *SourceCode\HtmlFromRepoGenerator\HtmlFromRepoGenerator\HtmlFromRepoGenerator\Resources* subfolder.  

> [!NOTE]
> If you modify the templates, you must rebuild HtmlFromRepoGenerator.exe.

For more information, see [Introduction to DocFX Template System](https://dotnet.github.io/docfx/tutorial/intro_template.html).

## See also

[Custom Help Toolkit](custom-help-toolkit.md)  
