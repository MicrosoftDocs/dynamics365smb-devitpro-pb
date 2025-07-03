---
title: FAQ for Developing in AL
description: Overview of frequently asked questions for development using the AL language.
author: SusanneWindfeldPedersen
ms.date: 06/16/2025
ms.topic: faq
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# FAQ for developing in AL

[!INCLUDE [getstarted-contributions](includes/getstarted-contributions.md)]

This article contains frequently asked questions and answers to these questions. 

## How do I get started?

For an overview of developing apps for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], see [aka.ms/GetStartedWithApps](./readiness/get-started.md)

Next, follow the [Get started with AL](devenv-get-started.md) to set up the tools.

## Which version of the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] should I use?

For [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] cloud sandboxes you *must* use the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] official release available in the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/vscode).

## How do I enable the debugger?

To read about enabling debugging in AL, see here [Debugging](devenv-debugging.md). To read about snapshot debugging, see [Snapshot Debugging](devenv-snapshot-debugging.md).

## Why do the symbols downloaded to Visual Studio Code have different versions from the apps that are installed on my tenant?

We always download the highest published version of symbols. This means that if one of your dependencies has a higher version published, that version is downloaded even if it's not installed for your environment.

## Where do I find help regarding AppSource validation and submission?

When submitting an app for AppSource, you must make sure that it validates against the [Technical Validation Checklist](devenv-checklist-submission.md). For frequently asked questions, see [Technical Validation Checklist FAQ](devenv-checklist-submission-faq.md).

## What constitutes the identity of an app?

To read about app identity and why it's important to keep certain settings for an app unchanged, see [App Identity](devenv-app-identity.md).

## Extensions published from Visual Studio Code or created Use Designer disappeared from a sandbox environment. Why?

Extensions that are published to a sandbox environment from Visual Studio Code or created Use Designer are removed when the sandbox environment is updated or relocated within our service. However, the data of an app isn't removed, so you only have to republish and install the app to make it available.

If you have per-tenant extensions (PTEs) installed that depend on extensions published from Visual Studio Code, the per-tenant extensions are removed too.

If you have partner telemetry enabled, search for event ID `LC0105`, which includes a short description of the reason for your environment update or relocation.

In order to enable partner telemetry in your extension, you must specify the `applicationInsightsConnectionString` property in the manifest (app.json) of your extension. Learn more this property in [JSON files](devenv-json-files.md).

Learn more in [Sandbox environments](../administration/environment-types.md).

## Can I create something similar to Menusuites?

In the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], the concept of Menusuites isn't supported. The two primary purposes of Menusuites are:

- Making pages searchable
- Making pages accessible through a navigation structure

The first purpose can be achieved in Extensions by using the new properties added to Pages and Reports. Learn more in [Adding pages and reports to Search](devenv-al-menusuite-functionality.md).

The second purpose can be achieved by extending the Navigation Pane page and/or by adding Actions to other existing pages that can serve as a navigation starting point. Learn more in [Adding Menus to the Navigation Pane](devenv-adding-menus-to-navigation-pane.md).

## Related information

[Get started with AL](devenv-get-started.md)  
[Keyboard shortcuts](devenv-keyboard-shortcuts.md)    
[AL development environment](devenv-reference-overview.md)
