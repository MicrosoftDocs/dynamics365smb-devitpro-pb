---
title: Generate HTML files from the contents of a Microsoft GitHub repository
description: This article describes the HtmlFromRepoGenerator tool in the custom help toolkit for Business Central. 

author: edupont04
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.date: 10/01/2020
ms.author: edupont
---

# Custom Help Toolkit: The HtmlFromRepoGenerator tool

The custom help toolkit includes the **HtmlFromRepoGenerator** tool that gets Microsoft's content in MarkDown files and converts it to HTML files. You can then deploy the HTML files to a website.  

The HtmlFromRepoGenerator tool is a wrapper around the [DocFx](https://dotnet.github.io/docfx/) component that Microsoft uses to generate HTML files for the Docs.microsoft.com site. You can write your own scripts around this component, and maybe you already have that in place. If you don't, then the HtmlFromRepoGenerator tool can help you get started. Run the tool from a command prompt, use the examples as inspiration but remember to update the paths to suit your configuration.  

## <a name="htmltool"></a>Use the HtmlFromRepoGenerator tool to get MarkDown files and generate HTML files

HtmlFromRepoGenerator.exe provides functionality that supports the creation of custom Help based on source files from Microsoft. You can use HtmlFromRepoGenerator.exe to:

- Clone a Microsoft documentation repository (repo)
- Update links to files that are no longer in the clone
- Update the **ms.locale** value to match the language options that are supported by [!INCLUDE [prod_short](../developer/includes/prod_short.md)]
- Generate HTML files that can be used for publishing to your own website

    The HTML files will be generated in the **business-central\d365businesscentral** subfolder, such as *D:\BC\de-DE\business-central\d365businesscentral*. This name of the subfolder is set in the docfx.json file in the en-US source repo. The tool applies the `<meta name="robots" content="NOINDEX, NOFOLLOW">` tag to the HTML files, so if you use the tool to process your own content, you should remove these tags from your files but leave the tags in your version of Microsoft's content.

    The files are generated based on stylesheets and templates that are part of the tool.<!-- For more information, see [Modifying the styling of the generated HTML files](#modifying-the-styling-of-the-generated-html-files).-->

- Compare a localized Microsoft repo to the en-US repo to identify differences and update links accordingly

    The en-US repo includes files that are required for building the various localized versions, including the very important docfx.json file that sets the output location and certain metadata settings, some of which are important for the Docs.microsoft.com site only. For more information, see [Get content from the GitHub repos](contributor-guide.md#get-content-from-the-github-repos).  

### Syntax

Here is the syntax for HtmlFromRepoGenerator.exe:  

```cmd
HtmlFromRepoGenerator.exe --Out <path> [--DoNotClone <true|false>] [--Repo <URL>] [--RemoveGitFolder <true|false>] [--LogsDir <.\logs>] [--EnRepo <URL>] [--EnOut <path>] [--Lng <language code>] [--Rtl] [--?[--]]
```

The following table provides an explanation of the parameters:

|Parameter   |Description  |
|------------|-------------|
|Out |Specifies the folder where your existing clone is, or the folder to clone the repo to, such as D:\BC\. If you run HtmlFromRepoGenerator to clone a repo, this folder must not already exist.|
|DoNotClone |Set this parameter when you run the tool against a previously cloned repo. |
|Repo |Specifies the repo URL. Optional if you run the tool based on a previously cloned repo. Examples of Microsoft documentation repo URLs include `https://github.com/MicrosoftDocs/dynamics365smb-docs` for English (US) and `https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.de-de` for German (Germany).|
|Tag |Specifies the tag corresponding to a release of the Business Central documentation. You can see a list of the releases at [https://github.com/MicrosoftDocs/dynamics365smb-docs/releases](https://github.com/MicrosoftDocs/dynamics365smb-docs/releases). |
|RemoveGitFolder|Specifies whether to remove the `.git` folder.|
|LogsDir|Specifies the folder to save logs files to.|

The following additional parameters are used when the tool is run against the localized Microsoft documentation repos:

|Parameter   |Description  |
|------------|-------------|
|EnRepo|Specifies the URL of the en-US repo. Optional if you run the tool on a previously cloned repo. The Microsoft documentation repo URL for English (US) is [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs).|
|EnOut|Specifies the folder where the en-US repo exists, or the folder to clone it to. This folder must not already exist if you run the tool based on a previously cloned repo.|
|Lng|Specifies the language value to use for `ms.locale` metadata in the generated HTML files. If this parameter is not set, the tool uses en-US.|
|Rtl|Set this parameter if the language uses right-to-left (RTL) formatting. Examples of RTL languages include Arabic and Hebrew.|

## Examples

> [!NOTE]
> The Microsoft repos contain many files, so the process takes several minutes. If you run the tool against multiple localization repos, the process takes longer.

The following example clones the en-US repo and generates HTML files.

```cmd
HtmlFromRepoGenerator.exe --out "D:\BC\en-US" --repo "https://github.com/MicrosoftDocs/dynamics365smb-docs" --LogsDir D:\BC\logs\en-US
```

The following example clones the en-US repo, checks out the repo at tag v16.5 (corresponding to the release "Microsoft Dynamics 365 Business Central v. 16.5 docs") and generates HTML files.

```cmd
HtmlFromRepoGenerator.exe --out "D:\BC\en-US" --repo "https://github.com/MicrosoftDocs/dynamics365smb-docs" --tag v16.5 --LogsDir D:\BC\logs\en-US
```

The following example uses a previously cloned en-US repo and generates HTML files.

```cmd
HtmlFromRepoGenerator.exe --out "D:\BC\en-US" --DoNotClone --LogsDir D:\BC\logs\en-US
```

The following example clones both the de-DE and en-US repos, and generates HTML files for de-DE.

```cmd
HtmlFromRepoGenerator.exe --out "D:\BC\de-DE" --repo "https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.de-de" --EnRepo "https://github.com/MicrosoftDocs/dynamics365smb-docs" --EnOut "D:\BC\en-US" --lng "de-DE" --LogsDir D:\BC\logs\de-DE
```

The following example uses previously cloned de-DE and en-US repos to generate HTML files for de-DE. Make sure that the de-DE repo is up to date if you use an existing cloned repo.

```cmd
HtmlFromRepoGenerator.exe --out "D:\BC\de-DE" --DoNotClone --enOut "D:\BC\en-US" --lng "de-DE" --LogsDir D:\BC\logs\de-DE
```

> [!IMPORTANT]
> Do not run HtmlFromRepoGenerator.exe repeatedly on a previously-cloned repo. HtmlFromRepoGenerator modifies the links during processing, so running HtmlFromRepoGenerator more than once on the same content will result in incorrect links. If you want to rerun HtmlFromRepoGenerator, either use HtmlFromRepoGenerator to create a new clone of the repo, or revert all local changes to your existing clone.

## Modifying the styling of the generated HTML files

The tool generates the HTML files based a set of predefined templates. In most cases, you can modify the stylesheets in the ```styles``` folder to modify the appearance of your content.

For advanced scenarios, you can modify the templates used by the HtmlFromRepoGenerator tool. The source files are included in the *SourceCode* folder in the GitHub repo. The templates are in the *SourceCode\HtmlFromRepoGenerator\HtmlFromRepoGenerator\HtmlFromRepoGenerator\Resources* subfolder.  

> [!NOTE]
> If you modify the templates, you must rebuild HtmlFromRepoGenerator.exe using Visual Studio or similar.

For more information, see [Introduction to DocFX Template System](https://dotnet.github.io/docfx/tutorial/intro_template.html).

## See also

[Custom Help Toolkit](custom-help-toolkit.md)  
