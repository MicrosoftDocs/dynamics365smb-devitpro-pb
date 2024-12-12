---
title: FAQ for Developing in AL
description: Overview of frequently asked questions for development using the AL language.
author: SusanneWindfeldPedersen
ms.date: 03/01/2024
ms.topic: conceptual
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# FAQ for developing in AL

[!INCLUDE [getstarted-contributions](includes/getstarted-contributions.md)]

This topic contains a number of frequently asked questions and answers to these questions. 

## How do I get started?

For an overview of developing apps for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], see [aka.ms/GetStartedWithApps](./readiness/get-started.md)

Next, follow the [Get Started with AL](devenv-get-started.md) to set up the tools.

## Which version of the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] should I use?

For [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] cloud sandboxes you *must* use the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] official release available in the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/vscode).

For the latest developer preview releases, you can use the latest pre-release available in the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/vscode) or the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], which is available in the *next major* artifact through the "Ready! for Dynamics 365 Business Central" program on [Microsoft Collaborate](https://aka.ms/collaborate).

## How do I enable the debugger?

To read about enabling debugging in AL, see here [Debugging](devenv-debugging.md). To read about snapshot debugging, see [Snapshot Debugging](devenv-snapshot-debugging.md).

## Why do the symbols downloaded to Visual Studio Code have different versions from the apps that are installed on my tenant?

We always download the highest published version of symbols. This means that if one of your dependencies has a higher version published, that version will be downloaded even if it's not installed for your environment.

## Where do I find help regarding AppSource validation and submission?

When submitting an app for AppSource, you must make sure that it validates against the [Technical Validation Checklist](devenv-checklist-submission.md). For frequently asked questions, see [Technical Validation Checklist FAQ](devenv-checklist-submission-faq.md).

## What constitutes the identity of an app?

To read about app identity and why it is important to keep certain settings for an app unchanged, see [App Identity](devenv-app-identity.md).

<!--
## File APIs aren't available in Extensions V2. What do I do?

Code that relies on temporary files must be rewritten to rely on `InStream` and `OutStream` types. Code that relies on permanent files must be rewritten to use another form of permanent storage.

## DotNet types are not available in Extensions V2. What now?

For cloud solutions .NET interop is not available due to safety issues in running arbitrary .NET code on cloud servers. 

With the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], you can find AL types that replace the most typical usages of .NET like HTTP, JSON, XML, StringBuilder, Dictionaries, and Lists. Many .NET usages can be replaced directly by the AL types resulting in much cleaner code. For more information, see [HTTP, JSON, TextBuilder, and XML API Overview](devenv-restapi-overview.md).

For things that are not possible to achieve in AL code, the recommendation is to use Azure Functions to host the DLL or C# code previously embedded and call that service from AL. -->

## Extensions published from Visual Studio Code or created Use Designer have disappeared from a sandbox environment. Why?

Extensions that have been published to a sandbox environment from Visual Studio Code or created Use Designer are removed when the sandbox environment is updated or relocated within our service. However, the data of an app is not removed, so you only have to re-publish and install the app to make it available.

If you have per-tenant extensions (PTEs) installed that depend on extensions published from Visual Studio Code, the per-tenant extensions will be removed too.

If you have partner telemetry enabled, search for event id `LC0105`, which includes a short description of the reason for your environment update or relocation.

In order to enable partner telemetry in your extension, you must specify the `applicationInsightsConnectionString` property in the manifest (app.json) of your extension. For more information about this property, see [JSON files](devenv-json-files.md).

For more information, see [Sandbox Environments](../administration/environment-types.md).

## Can I create something similar to Menusuites?

In the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], the concept of Menusuites is not supported. The two primary purposes of Menusuites are:

- Making pages searchable
- Making pages accessible through a navigation structure

The first purpose can be achieved in Extensions by using the new properties added to Pages and Reports. For more information, see [Adding Pages and Reports to Search](devenv-al-menusuite-functionality.md).

The second purpose can be achieved by extending the Navigation Pane page and/or by adding Actions to other existing pages that can serve as a navigation starting point. For more information, see [Adding Menus to the Navigation Pane](devenv-adding-menus-to-navigation-pane.md).

<!--
## How do I upgrade Extensions V1 to Extensions V2?

For information on upgrading, see the following topics:
[Upgrading Extensions v2](devenv-upgrading-extensions.md) and [Converting from Extensions v1 to Extensions v2](devenv-upgrade-v1-to-v2-overview.md). -->


## Related information

[Get started with AL](devenv-get-started.md)  
[Keyboard shortcuts](devenv-keyboard-shortcuts.md)    
[AL development environment](devenv-reference-overview.md)
