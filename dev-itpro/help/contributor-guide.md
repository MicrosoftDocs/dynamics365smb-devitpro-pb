---
title: Extend, customize, collaborate on the Help
description: Tips and tricks for working with the GitHub repos and MarkDown files for Dynamics 365 Business Central.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 03/08/2019
ms.author: edupont
---

# Extend, Customize, and Collaborate on the Help for [!INCLUDE[prodlong](developer/includes/prodlong.md)]

The Help for the base application is available in a public GitHub repo so that you can easily extend and customize for your customers. In this section, you can learn about working with the GitHub repos and MarkDown files.  

## GitHub repos

There are different repos in GitHub for the source content and each of the languages that Microsoft translates to. The [dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs) repo contains the content in English (US). If you want access to the content in other languages, navigate to the relevant repo - the names follow this pattern: dynamics365smb-docs-pr.<language>-<country>, such as [dynamics365smb-docs-pr.da-DK](https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.da-DK) for the Danish version.  

> [!NOTE]
> Microsoft accepts pull requests to the *dynamics365smb-docs* repo only, not the language-specific repos. If you have feedback about translations, you can report a GitHub issue in the relevant repo.

For guidance about extending and customizing the Microsoft-provided content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)], see [Configuring the Help Experience](../deployment/configure-help.md) and [User Assistance Model](../user-assistance.md).

### Get started with GitHub

1. Fork this repo

    You cannot work directly in the dynamics365smb-docs repo, so the first thing you need to do is create a fork of the repo under your GitHub account. A fork basically is copy of this repo that lets you work freely on the content without affecting the dynamics365smb-docs repo. For more information, see [Fork a Repo](https://help.github.com/articles/fork-a-repo/).

2.  Install GitHub Desktop (optional) and clone your forked repo.

    GitHub Desktop makes is easy to work and collaborate with repos locally from your own desktop. For more information, see [GitHub Desktop](https://desktop.github.com/).   

2. Get hold of your favorite MarkDown editor, and start making changes.

    The help content is stored in the articles folder of the repo. Articles use a syntax for formatting text called GitHub Flavored Markdown. To learn more about working with markdown, see [Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/).

You can also find guidance for how to get started with MarkDown in the [Docs Contributor Guide](https://docs.microsoft.com/en-us/contribute/), which is published by the team that built the Docs.microsoft.com site where the Business Central team publishes their docs.

### Contributing

A benefit of GitHub is the ability for you to contribute to the core content that the Microsoft team provides in the dynamics365smb-docs repo. For example, you might have a new article that you think would be beneficial or you might have a correction to an existing article. If you would like to contribute to the dynamics365smb-docs repo, you create what is called a *pull request* from your repo to the dynamics365smb-docs repo. The Microsoft team will then review the request and include the changes as appropriate.

For example, to create a pull request to the dynamics365smb-docs repo by using GitHub Desktop, do the following:

1.  Commit the changes to your repo that you want to include in the pull request.
2.  Choose **Sync** to push the changes up to your repo on GitHub.
3.  When the sync is completed, choose **Pull Request**, make sure that the pull request points at the *live* branch, and then choose send **Pull Request**.

## Building HTML files
For publishing to your own website, you can use tools such as [DocFx](https://dotnet.github.io/docfx/). For example, if you want to preview your content locally, or if you want to publish to the legacy Microsoft Dynamics NAV Help Server. DocFX is an open source tool for converting markdown files. This section provides some guidance on how you can use DocFX to publish HTML files for the Dynamics NAV Hep Server.

1.  Install DocFX on your computer.

    For more information, see [DocFx](https://dotnet.github.io/docfx/).

2.  Specify the output folder in which to store the generated HTML files.

    By default the files will be saved in the folder *c:/output*. The output folder is set in the NAVdocfx.json file. If you want to change this folder, do the following:

    a. In the folder where your local clone is, such as *C:\GitHub\dynamics365smb-docs\business-central*, open the NAVdocfx.json file in your preferred editor.  
    b.  Set the **"dest:"** parameter to your output folder, and save the changes.  

3.  Go to your desktop and open a command prompt.

3.  Go to the docfx installation folder.

4.  Run the following command:
    ```
    docfx "c:\GitHub\dynamics365smb-docs\business-central\NAVdocfx.json"
    ```
    
The files are generated as .html files and stored in the specified output.

The root of the repo contains files that are related to internal Microsoft processes, such as .openpublishing.build.ps1. These scripts are used to validate and preview content, but they rely on internal Microsoft resources that are not publicly available. 


## Authoring in Markdown

The content is styled using a Markdown syntax as described below..

### General info:
[Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/)

### Authoring tools:
If you want to work locally, you can edit using any text editor. Just save the file as a .md type. Here are a couple good tools that provide you with some nice features, such as Preview.  
- [Visual Studio Code](https://code.visualstudio.com/)
- [Atom](https://atom.io/) (this has spell check and is good for managing many files)

### Properties and tags
All topics must start with a YAML header with the following set of attributes.

```
---
title: 'Short title with a couple of buzzwords for the feature. Not the same as your heading for the topic. | Microsoft Docs'
description: 'A longer description that identifies the topic in search results.'
author: MyGitHubAccount
ms-service: dynamics365-business-central
ms.topic: article
ms.search.keywords:keyword1, keyword2
ms.date: MM/DD/YYYY

---
```

The ms.date tag must be updated to the date when you make the change. The ms.date property must follow the US date format of MM/DD/YYYY.