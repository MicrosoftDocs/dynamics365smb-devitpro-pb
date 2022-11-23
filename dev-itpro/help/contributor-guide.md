---
title: Extend and collaborate on the Help
description: Tips and tricks for working with the GitHub repos and Markdown files for Dynamics 365 Business Central.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.date: 11/03/2022
ms.author: edupont
---

# Extend and Collaborate on the Help for [!INCLUDE[prod_long](../developer/includes/prod_long.md)]

The source files for the Help for the base application are available in public GitHub repos so that you can easily extend and customize the content for your customers. In this section, you can learn about working with the GitHub repos and Markdown files. You can also find guidance in the [Learn Contributor Guide](/contribute/).  

## Get content from the GitHub repos

[!INCLUDE [help-toolkit-deprecate](../includes/help-toolkit-deprecate.md)]

The [dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs) and [dynamics365smb-devitpro](https://github.com/MicrosoftDocs/dynamics365smb-devitpro) repos contain the source content in English (US). When Microsoft publishes an update to the content, the *main* branch in the corresponding public GitHub repo is updated. Typically, the source repo is updated weekly.

<!--This is about customizing, and we want to focus on contributions. Leaving the para but commenting it out as a placeholder for an update when DevRel provides HTML files as downloads for on-prem or private cloud instances. 

Alternatively, if you customize the Microsoft content based on Markdown, you can use scripts to get the current version. The GitHub platform and tooling will help you manage any potential merge conflicts if you have made changes to the same files as Microsoft has. Learn more at [Set up Git repository locally for documentation](/contribute/get-started-setup-local) in the Docs Authoring Guide and [Fork a repo](https://help.github.com/articles/fork-a-repo/) in the Help for GitHub. --> 

> [!TIP]
> You do not have to get acquainted with GitHub if you just want to get the Microsoft content in HTML format to deploy to a website, for example. You do not even have to get a GitHub account, as shown in the [Getting by without GitHub](#get-the-content-without-a-github-account) section. However, in many scenarios, you might want to join us in GitHub for closer collaboration and easier extensibility.

If you fork one of our repos, you can choose to update your fork with regular updates from the Microsoft repo.  

[!INCLUDE [ua-github-releases](../includes/ua-github-releases.md)]

Guidance about what the Microsoft-provided content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] is all about is available at [User Assistance Model](../user-assistance.md).  

The following table lists some of the key subjects that you should know about.  

|To learn more about this subject|Go to this section |
|--------------------------------|------------------|
|Files and subfolders in the GitHub repos| [What the GitHub repos contain](#what-the-github-repos-contain) |
|How to interact with the GitHub repos |[Get updates from Microsoft](#get-updates-from-microsoft) |
|The mechanics of working in GitHub based on our internal contributor guide|  [Get started with GitHub](#get-started-with-github) |
|How you can contribute to Microsoft's content| [Contributing](#contributing)|
|Forking a repo| [Get the content without a GitHub account](#get-the-content-without-a-github-account)|
|Generating content for your website|[Build HTML files](#build-html-files)|
|Potential problems you might have when you customize Microsoft's content| [Known issues with Microsoft's content](#known-issues-with-microsofts-content) |
|Using the Dynamics 365 Translation Service to manage translations| [Translate the content](#translate-the-content) |

### What the GitHub repos contain

Microsoft's GitHub *dynamics365smb-docs* repos for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] Help contain the following folders:

- archive

    In the source repo only, this folder contains files that are not published but kept for backwards compatibility use internally at Microsoft. You can ignore this folder. The folder does not exist in the translation repos.
- business-central

    Contains Markdown files with content that is relevant for business users, administrators, and consultants of [!INCLUDE [prod_short](../developer/includes/prod_short.md)]
- media-source

    Contains source files for some of the pictures that are used in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] content
- templates

    Contains three Markdown files that you can use as templates for your content. The templates define required metadata and a recommended structure of the content.

The repos also contain files in the root of the repos that are used internally by Microsoft for managing the content on the learn.microsoft.com site and by GitHub. They are not relevant for extending or customizing the content.

> [!TIP]
> [!INCLUDE [ua-github-releases](../includes/ua-github-releases.md)]

If you want to contribute to the developer and administration content, clone or fork the `https://github.com/MicrosoftDocs/dynamics365smb-devitpro-pb` repo.

### Get updates from Microsoft

Microsoft makes frequent changes to the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] content, and those changes show up in the public GitHub repos. The base repo, *MicrosoftDocs/dynamics365smb-docs*, is updated weekly, and the translations are updated monthly. When you decide it is time to get the latest version of the content from Microsoft, you can do that using GitBash or GitHub Desktop. The Help for GitHub offers [an example of how this works in GitBash](https://help.github.com/en/articles/merging-an-upstream-repository-into-your-fork). In GitHub Desktop, just use the *Merge into current branch* menu item to pull changes from the origin into your fork.  

The following script was developed by a Danish partner to perform the following tasks:

- Get the Microsoft source for a number of languages
- Copy media files to the localization repos
- Build HTML files

The script is provided in agreement with the partner without further support.

```powershell
$languages = $("da-dk","de-ch","de-de")
$git = "C:\Program Files\Git\cmd\git.exe"
$docfx = "C:\GitHub\DocFx\docfx.exe"
$365docs = "C:\GitHub\MSFT\dynamics365smb-docs"
$langDir = "c:\Working\help\dynamics365smb-docs-pr."

Start-Process -FilePath $git -ArgumentList "clone --single-branch --branch main https://github.com/MicrosoftDocs/dynamics365smb-docs.git" -WorkingDirectory "C:\working\help" -Wait
foreach ($language in $languages)
{
    $arguments = $("clone --single-branch --branch main https://github.com/MicrosoftDocs/dynamics365smb-docs-pr." + $language + ".git")
    Start-Process -FilePath $git -ArgumentList $arguments -WorkingDirectory "C:\working\help" -Wait
    Copy-Item $($365docs + "\business-central\docfx.json") $($langDir + $language + "\business-central")
    Copy-Item $($365docs + "\business-central\media") $($langDir + $language + "\business-central") -Recurse -Force
    Copy-Item $($365docs + "\business-central\LocalFunctionality") $($langDir + $language + "\business-central") -Recurse -Force
    Copy-Item $($365docs + "\Templates") $($langDir + $language) -Recurse -Force
    Set-Content -Path $($langDir + $language + "\business-central\docfx.json") -Value (get-content -Path $($365docs + "\business-central\docfx.json"))
    Start-Process -FilePath $docfx -ArgumentList $("C:\working\help\dynamics365smb-docs-pr." + $language + "\business-central\docfx.json" + " --output c:\working\output\" + $language)
}
```

More information is available in the [Build HTML files](#build-html-files) section.  

Because the Microsoft repos are public, you do not need a valid GitHub account in order to get the content. However, we recommend that your organization has a system account with access to GitHub at a minimum.  

### Get started with GitHub

To join Microsoft in the world of GitHub and Markdown, there are terminology and tools to get used to. The following list outlines the main steps, but you can find additional content, tools, and ideas in the [GitHub documentation](https://help.github.com/en/github) and other forums.

1. Fork the right repo

    You cannot work directly in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] repos in the MicrosoftDocs GitHub org, such as the dynamics365smb-docs repo. The first thing you need to do is create a fork of the repo under your GitHub account. A fork is a copy of this repo that lets you work freely on the content without affecting the MicrosoftDocs/dynamics365smb-docs repo.  

    Alternatively, you can *clone* the Microsoft repo. This is useful if you don't intend to customize Microsoft's content, for example. But in many cases, *forking* the repo is more preferable.  

    Learn more at [Set up your GitHub account](/contribute/get-started-setup-github) and [Set up Git repository locally for documentation](/contribute/get-started-setup-local) in the Docs Authoring Guide.

    > [!TIP]
    > You are not required to make your GitHub repos public. When you fork a public repo, you can specify whether the repo is public, private, or available only to specific GitHub accounts.

2. Install GitHub Desktop (optional) and clone your forked repo.

    GitHub Desktop makes is easy to work and collaborate with repos locally from your own desktop. Learn more at [GitHub Desktop](https://desktop.github.com/).  

3. Get hold of your favorite Markdown editor, and start making changes.

    The help content is stored in the *business-central* folder of the repo. Articles use a syntax for formatting text called [MarkDig](https://github.com/lunet-io/markdig) Flavored Markdown, which is [CommonMark](https://commonmark.org/) compliant. To learn more about working with Markdown, see [Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/).

    If you want to work locally, you can edit using any text editor. Just save the file as a .md type. Here are two good tools that provide you with some nice features, including a preview of how the content will be rendered in HTML:

    - [Visual Studio Code](https://code.visualstudio.com/)

        Add the [Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack), which gives you spell checker, Markdown validation, and many other productivity features  
    - [Atom](https://atom.io/)

        Atom has spell check and is good for managing many files

Internally at Microsoft, some authors use Code, others use Atom, and for light-weight work, we tend to just edit the content in the browser. You can find more guidance for how to get started with Markdown in the [Docs Contributor Guide](/contribute/). This guide is published by the team that built the learn.microsoft.com site where the Business Central team publishes their docs.

## Get the content without a GitHub account

If you do not want to collaborate with Microsoft on the content, you can get the latest version of the content from GitHub without a GitHub account. For example, if you want content that is newer than the content on the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] installation media, you can get the latest by simply downloading the content of the relevant GitHub repo, which you can do without a GitHub account - the Microsoft repos are public so that anyone can always get to them. Use a tool that can generate HTML files, create your own scripts, or follow this process to fork a repo manually.  

### To get files without a GitHub account

1. Go to the relevant GitHub repo, such as this one: [https://github.com/MicrosoftDocs/dynamics365smb-docs/](https://github.com/MicrosoftDocs/dynamics365smb-docs/).  

    The browser will indicate when the content was last updated. Alternatively, go to the [releases](https://github.com/MicrosoftDocs/dynamics365smb-docs/releases) tab and choose the package that you need for your solution. Learn more at [What the GitHub repos contain](#what-the-github-repos-contain).  
2. Choose the green **Code** button, and then choose **Download ZIP**.
3. Open the downloaded *dynamics365smb-docs-main.zip* file and extract to a relevant location.

    Now you have a copy of Microsoft's content. Next, you can generate HTML files for use on your website as described in the [Build HTML files](#build-html-files) section.

## Build HTML files

For publishing to your own website, use any third-party tool that can clone a repo and generate the corresponding HTML files.  

Alternatively, you can create your own tooling and processes around [DocFx](https://dotnet.github.io/docfx/), which is an open-source tool for converting Markdown files. This section provides some guidance on how you can use DocFx to publish HTML files from your fork of one of the Microsoft repos.  

> [!TIP]
> You can also use DocFx to generate content for the legacy Dynamics NAV Help Server. In that case, use the NAV docfx.json file from [dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs).

1. Install [DocFx](https://dotnet.github.io/docfx/) on your computer.

    DocFx is a command line tool, but you can also run it from a PowerShell script.  

    You must provide a .JSON file that defines certain build settings, including the output folder in which to store the generated HTML files. We suggest that you use the docfx.json configuration file from the [dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs) repo. Learn more at [Getting Started with DocFX](https://dotnet.github.io/docfx/tutorial/docfx_getting_started.html).

2. To change settings in the docfx.json file, open the docfx.json file from the folder containing your local clone in your preferred editor.  

    The following table describes key parameters for you to customize.

    |Property  |Description  |
    |----------|-------------|
    |**dest**  | Specifies the output folder of the generated HTML files, such as `c:\Working\output\`. |
    |**template**     | Specifies the templates that the HTML files will be generated after. The default for Microsoft is blank, but the value can be a string or an array.|
    |**globalMetadata**  | Contains metadata that will be applied to every file, in key-value pair format.  You can also add other global metadata, or metadata that applies to specific subfolders.  |
    |**fileMetadata**|Contains metadata that will be applied to specific files, based on the specified parameters, in key-value pair format. The default is currently blank.|
    |**markdownEngineName**|Specifies the "flavor" of Markdown to use to build the HTML files. The default is `markdig`.|

    Learn more at [Properties for build](https://dotnet.github.io/docfx/tutorial/docfx.exe_user_manual.html#32-properties-for-build) section in the DocFx user manual.

    The docfx.json files in the Microsoft repos have additional settings for the learn.microsoft.com site. If you build the HTML files based on the docfx.json in the Microsoft repos, make sure that you have configured it for your needs.  

    For example, in the globalMetadata section, set the ROBOTS property. [!INCLUDE [ua-robots](../includes/ua-robots.md)]

3. Go to your desktop and open a command prompt.

4. Go to the docfx installation folder.

5. Run the equivalent of the following command:

    ```powershell
    docfx "c:\GitHub\MSFT\dynamics365smb-docs\business-central\docfx.json"
    ```

The files are generated as .html files and stored in the output location that is specified in the docfx.json file.

> [!IMPORTANT]
> [DocFx](https://dotnet.github.io/docfx/) is no longer used internally in Microsoft and does not support YAML and other changes that we're making to our content. Depending on the website that the HTML files will be deployed to, you might not be able to use the table of contents file (TOC.html) that is generated in this process. That file is structured based on the configuration of the [https://learn.microsoft.com](https://learn.microsoft.com) site. If you use the legacy Dynamics NAV Help Server, then you must use the ToC.xml file instead.

The root of the MicrosoftDocs repos contain files that are related to internal Microsoft processes, such as `.openpublishing.build.ps1`. These scripts are used to validate and preview content, but they rely on internal Microsoft resources that are not publicly available. The `.openpublishing.redirection.json` file lists files that were published to the learn.microsoft.com site but have been deprecated later. As part of standard website practices, the learn.microsoft.com site uses redirection to avoid broken links when a page is deleted, and the `.openpublishing.redirection.json` file provides the mapping for redirection.  

For inspiration for how to build your own help website, go to [How-to: Customize DFM Engine](https://dotnet.github.io/docfx/tutorial/howto_customize_docfx_flavored_markdown.html) in the DocFx user manual and the [Azure App Service](/azure/app-service/) documentation.

For tips and tricks about writing in Markdown, go to the [Authoring Guide](writing-guide.md).  

### <a name="anchorlink"></a>Links to anchors across languages

[!INCLUDE [docslinkanchor](../developer/includes/docslinkanchor.md)]

Alternatively, you can add a post-processing step to the script that you use to run DocFx to change the equivalent of ```<h3 id=da-DK-anchor-name>``` with ```<h3 id=en-US-anchor-name>```. In this example, the step would change ```<h3 id=min-oversatte-overskrift'>``` to ```<h3 id=my-translated-subheading'>```.  

## Known issues with Microsoft's content

Microsoft's content in the various GitHub repos is optimized for the learn.microsoft.com site and the tools that are used for this site. It is not intended to be customized directly but to be supplemented by articles on your local website. If you reuse Microsoft's content, you may experience a number of known issues, depending on how you publish your content. This section describes recommended steps to work around these issues.  

### Docs are not available for a specific version

Microsoft's public GitHub repos reflect the latest version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. If you want to deploy help for an earlier version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises, then you can use the HTML files on the installation media. If you find that that particular version is missing content, then please check the following sections for suggested workarounds.  

### Broken links

If you deploy Microsoft's content to a website, your tools or your users will report that some links do not work. The links result in a 404 error or similar. These errors are caused by Microsoft having deleted the target files due to rework of the content. On the learn.microsoft.com site, we have tools that automatically handle links to deleted files through redirection. But if you deploy Microsoft's content to your own website, you will not have the same redirection.  

We run periodic tests to catch these errors, but if you do see an error that is caused by a file not existing anymore, check the `.openpublishing.redirection.json` file in the root of the [source repo](https://github.com/MicrosoftDocs/dynamics365smb-docs). This file is used by the learn.microsoft.com site to manage redirection when a file is deprecated. For example, if you get an error that *"finance-how-to-set-up-sepa-direct-debit.md does not exist"*, then you can see in the `.openpublishing.redirection.json` file that the article has been deprecated and replaced by *finance-collect-payments-with-sepa-direct-debit.md*. You can replace the link in the file that is looking for *finance-how-to-set-up-sepa-direct-debit.md* to link to *finance-collect-payments-with-sepa-direct-debit.md* instead.  

### ToC.xml for Help Server is different from the TOC.md file

Microsoft does not currently maintain the ToC.xml file and does not add new features to it. While the Help Server component is still supported, [it was deprecated in 2021 release wave 1](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/deprecation-legacy-dynamics-nav-help-server-component-). As a result, it contains links that are broken, as described in the [Broken links](#broken-links) section.  

## Translate the content

You can use the [Dynamics 365 Translation Service](/dynamics365/fin-ops-core/dev-itpro/lifecycle-services/translation-service-overview) (DTS) to translate your own or the Microsoft-provided content into other languages. The service is hosted in Lifecycle Services and currently supports translation of content in Word documents and HTML files. Learn more at [Translate documentation files](/dynamics365/fin-ops-core/dev-itpro/lifecycle-services/use-translation-service-ua).  

To translate content for either [!INCLUDE [prod_short](../developer/includes/prod_short.md)] or [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)], choose [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] as the product as shown in the following illustration:

> [!div class="mx-imgBorder"]
> ![Shows translation project for NAV or Business Central.](../developer/media/admin/lcs_translation_navhelp.png)

## Contributing

A benefit of GitHub is the ability for you to contribute to the core content that the Microsoft team provides for [!INCLUDE [prod_short](../includes/prod_short.md)]. There is a lot of good advice and best practices published in the [Microsoft Docs contributor guide](/contribute/). But this section provides information about how to apply that advice to the [!INCLUDE [prod_short](../includes/prod_short.md)] content.

We have two public GitHub repos that you can contribute to:

- [MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs)

    This repo contains a copy of the source files for the business functionality content that publishes at `https://learn.microsoft.com/en-us/dynamics365/business-central`  

- [MicrosoftDocs/dynamics365smb-devitpro-pb](https://github.com/MicrosoftDocs/dynamics365smb-devitpro-pb)  

    This repo contains a copy of the source files for the developer and admin content that publishes at `https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro`  

For example, you might have a new article that you think would be beneficial, or you might have a correction to an existing article. If you would like to contribute to the [!INCLUDE [prod_short](../includes/prod_short.md)] content on the Microsoft Docs website, you create a *pull request* from your repo to the target repo. The Microsoft team will then review the request and include the changes as appropriate.

### Get started

If you want to suggest a minor (or major) change to an existing article, follow these steps:

1. Find the published article, such as [Using OData to Return or Obtain a JSON Document](../webservices/return-obtain-json-document.md).  
2. In the top right corner of the article, choose the **Edit** button.

    Choosing the button takes you to the source file on GitHub. In this example, that's [https://github.com/MicrosoftDocs/dynamics365smb-devitpro/blob/main/dev-itpro/webservices/return-obtain-json-document.md](https://github.com/MicrosoftDocs/dynamics365smb-devitpro/blob/main/dev-itpro/webservices/return-obtain-json-document.md).  

    > [!NOTE]
    > If you're not already signed in with a GitHub account, you'll be prompted to sign in or create a new account. You cannot contribute to the [!INCLUDE [prod_short](../includes/prod_short.md)] content without a GitHub account.
3. In the top right corner of the Markdown file, choose the pencil icon. Depending on who you are, you'll be taken to a fork of Microsoft's repo, or you'll be able to work in a branch in Microsoft's repo.
4. Make the relevant changes (and remember to save the changes!).
5. Submit a *pull request* to the source repo.

    You'll have something like this configuration in a browser:

    :::image type="content" source="../media/contributor-guide-contribute.png" alt-text="The start of a pull request with fork on the right and target to the left.":::

Learn more at [Quick edits to existing documents](/contribute/#quick-edits-to-existing-documents).

### Get thorough

If you're going to contribute at a greater scale, for example as part of a community project that adds code examples to a bunch of technical walkthroughs, you'll probably prefer to work locally on your device, based on a clone of your fork. Go to [Install content authoring tools](/contribute/get-started-setup-tools) in the Microsoft Docs Contributor Guide for recommended tools and processes. The Microsoft team typically follows that workflow.  

To create a pull request to the *MicrosoftDocs/dynamics365smb-docs* repo by using GitHub Desktop, do the following:

1. Commit the changes to your fork that you want to include in the pull request.
2. Choose **Sync** to push the changes up to your repo on GitHub.
3. When the sync is completed, choose **Pull Request**, make sure that the pull request points at the *origin/main* branch, and then choose **Pull Request**.  

    You'll have something like this configuration in a browser:

    :::image type="content" source="../media/contributor-guide-contribute.png" alt-text="The start of a pull request with fork on the right and target to the left.":::

> [!TIP]
> If you want to request brand new content, as opposed to contributing, we ask you to submit a request of type *Documentation* at [https://aka.ms/bcideas](https://aka.ms/bcideas).

## See also

[Business Central User Assistance Model](../user-assistance.md)  
[Configuring the Help Experience](../deployment/configure-help.md)  
[Custom Help Toolkit](custom-help-toolkit.md)  
[Custom Help Toolkit: The FieldTopicTextExtractor tool](custom-help-toolkit-FieldTopicTextExtractor.md)  
[Authoring Guide](writing-guide.md)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
[Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/)  
[Visual Studio Code](https://code.visualstudio.com/)  
[Atom](https://atom.io/)  
[DocFx](https://dotnet.github.io/docfx/)  
[Blog post: Extending and customizing the Help](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/extending-and-customizing-the-help-in-dynamics-365-business-central)  
[Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
