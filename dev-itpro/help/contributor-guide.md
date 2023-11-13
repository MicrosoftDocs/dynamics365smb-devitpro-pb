---
title: Contribute to the Help
description: Tips and tricks for working with the GitHub repos and Markdown files for Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.date: 11/13/2023
ms.author: solsen
---

# Contribute to the Help for [!INCLUDE[prod_long](../developer/includes/prod_long.md)]

This article describes how to work with our GitHub repos and contribute to the Help for [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. You can also find guidance in the [Docs Contributor Guide](/contribute/).  

## Get started with GitHub

To join Microsoft in the world of GitHub and Markdown, there are terminology and tools to get used to. The following list outlines the main steps, but you can find more content, tools, and ideas in the [GitHub documentation](https://help.github.com/en/github) and other forums.

We have two GitHub repos that you can contribute to:

- [MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs)  
  This repo contains the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] business functionality content that is published [here](/dynamics365/business-central/welcome).

- [MicrosoftDocs/dynamics365smb-devitpro-pb](https://github.com/MicrosoftDocs/dynamics365smb-devitpro-pb)  
  This repo contains the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] developer and IT Pro content that is published [here](/dynamics365/business-central/dev-itpro/).

In the following, we'll use the *MicrosoftDocs/dynamics365smb-docs* repo as an example.

1. Fork the repo you want to contribute to.

    You can't work directly in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] repos in the MicrosoftDocs GitHub org. The first thing you need to do is create a fork of the MicrosoftDocs/dynamics365smb-docs repo under your GitHub account. A fork is a copy of this repo that lets you work freely on the content without affecting the MicrosoftDocs/dynamics365smb-docs repo.  

    Alternatively, you can *clone* the Microsoft repo. This is useful if you don't intend to customize Microsoft's content, for example. But in many cases, *forking* the repo is more preferable.  

    Learn more at [Set up your GitHub account](/contribute/get-started-setup-github) and [Set up Git repository locally for documentation](/contribute/get-started-setup-local) in the Docs Authoring Guide.

    > [!TIP]  
    > You aren't required to make your GitHub repos public. When you fork a public repo, you can specify whether the repo is public, private, or available only to specific GitHub accounts.

2. Install GitHub Desktop (optional) and clone your forked MicrosoftDocs/dynamics365smb-docs repo.

    GitHub Desktop makes is easy to work and collaborate with repos locally from your own desktop. Learn more at [GitHub Desktop](https://desktop.github.com/).  

3. Get hold of your favorite Markdown editor, and start making changes.

    The help content is stored in the *business-central* folder of the repo. Articles use a syntax for formatting text called [MarkDig](https://github.com/lunet-io/markdig) Flavored Markdown, which is [CommonMark](https://commonmark.org/) compliant. To learn more about working with Markdown, see [Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/).

    If you want to work locally, you can edit using any text editor. Just save the file as an .md type. Here are two good tools that provide you with some nice features, including a preview of how the content will render in HTML:

    - [Visual Studio Code](https://code.visualstudio.com/)

        Add the [Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack), which gives you spell checker, Markdown validation, and many other productivity features  
    - [Atom](https://atom.io/)

        Atom has spell check and is good for managing many files

Internally at Microsoft, some authors use Visual Studio Code, others use Atom, and for light-weight work, we tend to just edit the content in the browser. You can find more guidance for how to get started with Markdown in the [Docs Contributor Guide](/contribute/). This guide is published by the team that built the learn.microsoft.com site where the Business Central team publishes their docs.

For inspiration for how to build your own help website, go to [Quick Start](https://dotnet.github.io/docfx/) in the DocFx user assistance, or visit the [Azure App Service](/azure/app-service/) documentation.

For tips and tricks about writing in markdown, go to the [Authoring Guide](writing-guide.md).  

## Translate the content

You can use the [Dynamics 365 Translation Service](/dynamics365/fin-ops-core/dev-itpro/lifecycle-services/translation-service-overview) (DTS) to translate your content into other languages. The service is hosted in Lifecycle Services and currently supports translation of content in Word documents and HTML files. Learn more at [Translate documentation files](/dynamics365/fin-ops-core/dev-itpro/lifecycle-services/use-translation-service-ua).  

## Contributing

A benefit of GitHub is the ability for you to contribute to the core content that the Microsoft team provides for [!INCLUDE [prod_short](../includes/prod_short.md)]. There's good advice and best practices published in the [Microsoft Docs contributor guide](/contribute/). But this section provides information about how to apply that advice to the [!INCLUDE [prod_short](../includes/prod_short.md)] content.

For example, you might have a new article that you think would be beneficial, or you might have a correction to an existing article. If you would like to contribute to the [!INCLUDE [prod_short](../includes/prod_short.md)] content on the Microsoft Docs website, you create a *pull request* from your repo to the target repo. The Microsoft team will then review the request and include the changes as appropriate.

### Get started

If you want to suggest a minor (or major) change to an existing article, follow these steps:

1. Find the published article, such as [Using OData to Return or Obtain a JSON Document](../webservices/return-obtain-json-document.md).  
2. In the top right corner of the article, choose the **Edit** button.

    Choosing the button takes you to the source file on GitHub. In this example, that's [https://github.com/MicrosoftDocs/dynamics365smb-devitpro/blob/main/dev-itpro/webservices/return-obtain-json-document.md](https://github.com/MicrosoftDocs/dynamics365smb-devitpro/blob/main/dev-itpro/webservices/return-obtain-json-document.md).  

    > [!NOTE]  
    > If you aren't signed in with a GitHub account, you'll be prompted to sign in or create a new account. You can't contribute to the [!INCLUDE [prod_short](../includes/prod_short.md)] content without a GitHub account.
3. In the top right corner of the Markdown file, choose the pencil icon. Depending on who you are, you're taken to a fork of Microsoft's repo, or you're able to work in a branch at Microsoft's repo.
4. Make the relevant changes (and remember to save them!).
5. Submit a *pull request* to the source repo.

    You'll have something like this configuration in a browser:

    :::image type="content" source="../media/contributor-guide-contribute.png" alt-text="The start of a pull request with fork on the right and target to the left.":::

Learn more at [Quick edits to existing documents](/contribute/#quick-edits-to-existing-documents).

### Get thorough

If you're going to contribute at a greater scale, for example as part of a community project that adds code examples to a bunch of technical walkthroughs, you'll probably prefer to work locally on your device, based on a clone of your fork. Go to [Install content authoring tools](/contribute/get-started-setup-tools) in the Microsoft Docs Contributor Guide for recommended tools and processes. The Microsoft team typically follows that workflow.  

To create a pull request to the *MicrosoftDocs/dynamics365smb-docs* repo by using GitHub Desktop, perform the following steps:

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
[Authoring Guide](writing-guide.md)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
[Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/)  
[Visual Studio Code](https://code.visualstudio.com/)  
[Atom](https://atom.io/)  
[DocFX](https://dotnet.github.io/docfx/)  
[Blog post: Extending and customizing the Help](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/extending-and-customizing-the-help-in-dynamics-365-business-central)  
[Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
