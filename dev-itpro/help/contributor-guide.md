---
title: Extend, customize, collaborate on the Help
description: Tips and tricks for working with the GitHub repos and MarkDown files for Dynamics 365 Business Central.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 12/12/2019
ms.author: edupont
---

# Extend, Customize, and Collaborate on the Help for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

The source files for the Help for the base application is available in public GitHub repos so that you can easily extend and customize the content for your customers. In this section, you can learn about working with the GitHub repos and MarkDown files.  

You can also find guidance in the [Docs Contributor Guide](/contribute/).  

## Get content from the GitHub repos

There are different repos in GitHub for the source content and each of the languages that Microsoft translates to. The [dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs) repo contains the source content in English (US). If you want access to the content in other languages, navigate to the relevant repo - the names follow this pattern: ```dynamics365smb-docs-pr.\<language>-\<country>```, such as [dynamics365smb-docs-pr.da-DK](https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.da-DK) for the Danish version.  

When Microsoft publishes an update to the content, the *live* branch in the corresponding GitHub repo is updated. The source repo is updated weekly, and the related language-specific repos are updated less frequently, based on when new translations are made available. If you fork one of our repos, you can choose to update your fork with updates from the Microsoft repo on a monthly basis or less frequently, depending on your preferred work processes. The GitHub platform and tooling will help you manage any potential merge conflicts if you have made changes to the same files as Microsoft has. For more information, see [Set up Git repository locally for documentation](/contribute/get-started-setup-local) in the Docs Authoring Guide and [Fork a repo](https://help.github.com/articles/fork-a-repo/) in the Help for GitHub.  

> [!TIP]
> You do not have to get acquainted with GitHub if you just want to get the Microsoft content in HTML format to deploy to a Help Server website, for example. For more information, see the [Getting by without GitHub](#getting-by-without-github) section. However, if you want to extend or customize the Microsoft content, we recommend that you join us in GitHub.

For guidance about what the Microsoft-provided content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)] is all about, see [User Assistance Model](../user-assistance.md).

### Get started with GitHub

1. Fork the right repo

    You cannot work directly in the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] repos in the MicrosoftDocs GitHub org, such as the dynamics365smb-docs repo, so the first thing you need to do is create a fork of the repo under your GitHub account. A fork basically is copy of this repo that lets you work freely on the content without affecting the MicrosoftDocs/dynamics365smb-docs repo. For more information, see [Set up your GitHub account](/contribute/get-started-setup-github) and [Set up Git repository locally for documentation](/contribute/get-started-setup-local) in the Docs Authoring Guide.

    > [!TIP]
    > You are not required to make your GitHub repos public. When you fork a public repo, you can specify in the settings for the new repo if the repo is public, private, or available only to specific GitHub accounts.

2. Install GitHub Desktop (optional) and clone your forked repo.

    GitHub Desktop makes is easy to work and collaborate with repos locally from your own desktop. For more information, see [GitHub Desktop](https://desktop.github.com/).  

3. Get hold of your favorite MarkDown editor, and start making changes.

    The help content is stored in the *business-central* folder of the repo. Articles use a syntax for formatting text called GitHub Flavored Markdown, which is widely popular in the MarkDown community. To learn more about working with markdown, see [Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/).

    If you want to work locally, you can edit using any text editor. Just save the file as a .md type. Here are a couple good tools that provide you with some nice features, such as Preview:

    - [Visual Studio Code](https://code.visualstudio.com/)

        Add the [Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack), which gives you spell checker, MarkDown validation, and many other productivity features  
    - [Atom](https://atom.io/)

        Atom has spell check and is good for managing many files

You can also find guidance for how to get started with MarkDown in the [Docs Contributor Guide](/contribute/), which is published by the team that built the Docs.microsoft.com site where the Business Central team publishes their docs.

> [!IMPORTANT]
> The [Writate](https://writage.com/) plugin for Word can be very helpful for converting existing content to MarkDown, but we recommend that you do not use it to edit MarkDown files in Word. When you save the MarkDown file, all metadata tags and some of the formatting is erased.

### What the GitHub repos contain

Microsoft's GitHub repos for [!INCLUDE [prodshort](../developer/includes/prodshort.md)] Help contain the following folders:

- accountant

    Contains files that are relevant for Dynamics 365 — Accountant Hub
- business-central

    Contains files that are relevant for [!INCLUDE [prodshort](../developer/includes/prodshort.md)]
- invoicing

    Contains files that are relevant for Microsoft Invoicing
- media-source

    Contains source files for some of the pictures that are used in the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] content

The repos also contain files in the root of the repos that are used internally by Microsoft for managing the content on the Docs.microsoft.com site and on GitHub. They are not relevant for the purpose of extending or customizing the content.

> [!NOTE]
> The [!INCLUDE [prodshort](../developer/includes/prodshort.md)] installation media contain CAB files for Help Server. However, you can always get newer content from the GitHub repos. If you find that the CAB files are outdated, or if they do not contain the files that you expect, you can get the latest files from GitHub. For more information, see the [Get updates from Microsoft](#get-updates-from-microsoft) and [Getting by without GitHub](#getting-by-without-github) sections, respectively.

### Get updates from Microsoft

Microsoft makes frequent changes to the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] content, and those changes show up in the public GitHub repos. The base repo, MicrosoftDocs/dynamics365smb-docs, is updated weekly, and the translations are updated monthly. But you can choose to get updates monthly, twice a year, or once a year, for example. That is entirely up to you.  

When you decide it is time to get the latest version of the content from Microsoft, you can do that using GitBash or GitHub Desktop. In the Help for GitHub, you can see [an example of how this works in GitBash](https://help.github.com/en/articles/merging-an-upstream-repository-into-your-fork), but in GitHub Desktop, you simply use the *Merge into current branch* menu item to pull changes from the origin into your fork.  

However, if your solution is available in more than one country, then you are likely to want to make content available in multiple languages. Microsoft has a GitHub repo for each supported language, but the configuration files are only available in the English (US) source repo, MicrosoftDocs/dynamics365smb-docs. To help you get the content that you need, you might want to run a PowerShell script that picks up content from the various GitHub repos.  

The following example is based on a script that a Danish partner developed in order to get the Microsoft source for a number of languages, and then build HTML files for the legacy Dynamics NAV Help Server. The script is provided in agreement with the partner without further support.

```powershell
$languages = $("da-dk","de-ch","de-de")
$git = "C:\Program Files\Git\cmd\git.exe"
$docfx = "C:\GitHub\DocFx\docfx.exe"
$365docs = "C:\GitHub\MSFT\dynamics365smb-docs"
$langDir = "c:\GitHub\MSFT\dynamics365smb-docs-pr."

Start-Process -FilePath $git -ArgumentList "clone --single-branch --branch live https://github.com/MicrosoftDocs/dynamics365smb-docs.git" -WorkingDirectory "C:\working\Help" -Wait
foreach ($language in $languages)
{
    $arguments = $("clone --single-branch --branch live https://github.com/MicrosoftDocs/dynamics365smb-docs-pr." + $language + ".git")
    Start-Process -FilePath $git -ArgumentList $arguments -WorkingDirectory "C:\working\Help" -Wait
    Copy-Item $($365docs + "\business-central\NAVdocfx.json") $($langDir + $language + "\business-central")
    Copy-Item $($365docs + "\business-central\media") $($langDir + $language + "\business-central") -Recurse -Force
    Copy-Item $($365docs + "\business-central\LocalFunctionality") $($langDir + $language + "\business-central") -Recurse -Force
    Copy-Item $($365docs + "\Templates") $($langDir + $language) -Recurse -Force
    Set-Content -Path $($langDir + $language + "\business-central\NAVdocfx.json") -Value (get-content -Path $($365docs + "\business-central\NAVdocfx.json") | Select-String -Pattern 'dest": "c:\working\output",' -NotMatch)
    Start-Process -FilePath $docfx -ArgumentList $("C:\working\help\dynamics365smb-docs-pr." + $language + "\business-central\NAVdocfx.json" + " --output c:\working\output\" + $language)
```

Because the Microsoft repos are public, you do not need a valid GitHub account in order to get the content. However, we recommend that your organization has a system account with access to GitHub at a minimum.  

### Contributing

A benefit of GitHub is the ability for you to contribute to the core content that the Microsoft team provides in the dynamics365smb-docs repo. For example, you might have a new article that you think would be beneficial or you might have a correction to an existing article. If you would like to contribute to the MicrosoftDocs/dynamics365smb-docs repo, you create what is called a *pull request* from your repo to the MicrosoftDocs/dynamics365smb-docs repo. The Microsoft team will then review the request and include the changes as appropriate.

> [!NOTE]
> Microsoft accepts pull requests to the *dynamics365smb-docs* repo only, not the language-specific repos. If you have feedback about translations, you can report a GitHub issue in the relevant repo.

For example, to create a pull request to the MicrosoftDocs/dynamics365smb-docs repo by using GitHub Desktop, do the following:

1. Commit the changes to your repo that you want to include in the pull request.
   Alternatively, here is the command for Git Shell:

   ```powershell
   git add -u
   git commit -m "update doc"
   git push
   ```

2. Choose **Sync** to push the changes up to your repo on GitHub.
3. When the sync is completed, choose **Pull Request**, make sure that the pull request points at the *live* branch, and then choose send **Pull Request**.

## Getting by without GitHub

If you do not want to collaborate with Microsoft on the content, you can get the latest version of the content from GitHub without a GitHub account. For example, if you want content that is newer than the content on the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] installation media, you can get the latest by simply downloading the content of the relevant GitHub repo, which you can do without a GitHub account - the Microsoft repos are public so that anyone can always get to them.

### To get files without a GitHub account

1. Go to the relevant GitHub repo, such as this one for German: [https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.de-de/](https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.de-de/).  

    You can see in the browser when the content was last updated.  
2. Choose the green **Clone or download** button, and then choose **Download ZIP**.
3. Open the downloaded *dynamics365smb-docs-pr.de-de-live.zip* file and extract to a relevant location.

    Now you have a copy of Microsoft's content, and you can generate HTML files for use on Help Server or elsewhere as described in the [Building HTML files](#building-html-files) section.

## Building HTML files

For publishing to your own website, you can use tools such as [DocFx](https://dotnet.github.io/docfx/). DocFX is an open source tool for converting markdown files, such as if you want to preview your content locally, generate content for your website, or if you want to publish to the legacy Microsoft Dynamics NAV Help Server. This section provides some guidance on how you can use DocFX to publish HTML files for the Dynamics NAV Hep Server.  

> [!TIP]
> You can also use DocFx to generate content for other websites. In that case, either modify NAV docfx.json or replace NAVdocfx.json with docfx.json and reconfigure that to meet your website's requirements.

1. Install DocFX on your computer.

    For more information, see [DocFx](https://dotnet.github.io/docfx/).

2. Specify the output folder in which to store the generated HTML files.

    By default the files will be saved in the folder *c:/output*. The output folder is set in the NAVdocfx.json file. If you want to change this folder, do the following:

    a. In the folder where your local clone is, such as *C:\GitHub\MSFT\dynamics365smb-docs\business-central*, open the NAVdocfx.json file in your preferred editor.  
    b.  Set the **"dest:"** parameter to your output folder, and save the changes.  

3. Go to your desktop and open a command prompt.

4. Go to the docfx installation folder.

5. Run the equivalent of the following command:

    ```powershell
    docfx "c:\GitHub\MSFT\dynamics365smb-docs\business-central\NAVdocfx.json"
    ```

The files are generated as .html files and stored in the specified output.

> [!NOTE]
> The root of the MicrosoftDocs repos contain files that are related to internal Microsoft processes, such as .openpublishing.build.ps1. These scripts are used to validate and preview content, but they rely on internal Microsoft resources that are not publicly available.  

For tips and tricks about writing in MarkDown, see the [Authoring Guide](writing-guide.md).  

### Links to anchors across languages

If your website supports two or more locales, you can use DocFx to generate HTML files for the relevant languages. However, you may experience problems with links to anchors, also known as bookmarks. For example, if your content has a link from article1.md to a specific section in article2.md, that link would be formatted like this: ```[My translated subheading](article2.md#my-translated-subheading)```. Then, when you run DocFx to generate HTML files in Danish, DocFx will convert that link to ```[Min oversatte overskrift](article2.md#min-oversatte-overskrift)```. That is not a problem because the link will work in both English and Danish.  

But if you then want to use that link elsewhere, the link only works for one of the languages because that anchor changed its name in the Danish translation. So if you link to that subheading in article2 from your marketing site or support site, or if you use it as the value of the [ContextSensitiveHelpPage](../developer/properties/devenv-contextsensitivehelppage-property.md) property, then it only works in English.  

To work around this problem, you can add a post-processing step to the script that you use to run DocFx to change the equivalent of ```<h3 id=da-DK-anchor-name>``` with ```<h3 id=en-US-anchor-name>```. In this example, the step would change ```<h3 id=min-oversatte-overskrift’>``` to ```<h3 id=my-translated-subheading’>```.  

Alternatively, you can create explicit anchors by tagging your subheading to give it a *fixed anchor*. In this example, this is how that would look in MarkDown:

```
### <a name="subheading"></a>My translated subheading
```

You would then be able to use the same link across all locales: ```[My translated subheading](article2.md#subheading)```, which would render in HTML as ```myurl.com/docs/article2#subheading``` across all languages.  

For more information, see [Using hashtag in cross reference](https://dotnet.github.io/docfx/tutorial/links_and_cross_references.html#using-hashtag-in-cross-reference) in the GitHub documentation.  

## See also

[Business Central User Assistance Model](../user-assistance.md)  
[Configuring the Help Experience](../deployment/configure-help.md)  
[Authoring Guide](writing-guide.md)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
[Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/)  
[Visual Studio Code](https://code.visualstudio.com/)  
[Atom](https://atom.io/)  
[DocFx](https://dotnet.github.io/docfx/)  
[Blog post: Extending and customizing the Help](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/extending-and-customizing-the-help-in-dynamics-365-business-central)  
[Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/)  
