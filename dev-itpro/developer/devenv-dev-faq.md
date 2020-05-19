---
title: "FAQ for Developing in AL"
description: "Overview of frequently asked questions for development using the AL language."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# FAQ for Developing in AL
This topic contains a number of frequently asked questions and answers to these questions. 

<br>
<details><summary><b>How do I get started?</b></summary>
<p>
For an overview of developing apps for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], see [aka.ms/GetStartedWithApps](https://aka.ms/GetStartedWithApps)

Next, follow the [Getting Started with AL](devenv-get-started.md) to set up the tools.
</p>
</details>
<br>
<details><summary><b>Which version of the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] should I use?</b></summary>
<p>
1) For [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] cloud sandboxes you must use the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] available in the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/vscode).
2) For the latest Developer Preview releases you must use the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] that is available on the Docker images.
</p>
</details>
<br>
<details><summary>How do I enable the debugger?</summary>
<p>
To read about enabling the Visual Studio Code Debugger, see here [Debugging](devenv-debugging.md).
</p>
</details>
<br>
<details><summary>Can I create something similar to Menusuites?</summary>
<p>
In the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], the concept of Menusuites is not supported. The two primary purposes of Menusuites are:

- Making pages searchable
- Making pages accessible through a navigation structure

The first purpose can be achieved in Extensions by using the new properties added to Pages and Reports. For more information, see [Adding Pages and Reports to Search](devenv-al-menusuite-functionality.md).

The second purpose can be achieved by extending the Navigation Pane page and/or by adding Actions to other existing pages that can serve as a navigation starting point. For more information, see [Adding Menus to the Navigation Pane](devenv-adding-menus-to-navigation-pane.md).
</p>
</details>
<br>
<details><summary>File APIs are not available in Extensions V2. What do I do?</summary>
<p>
Code that relies on temporary files must be rewritten to rely on `InStream` and `OutStream` types. Code that relies on permanent files must be rewritten to use another form of permanent storage.
</p>
</details>
<br>
<details><summary>DotNet types are not available in Extensions V2. What now?</summary>
<p>
For cloud solutions .NET interop is not available due to safety issues in running arbitrary .NET code on cloud servers. 

With the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], you can find AL types that replace the most typical usages of .NET like HTTP, JSON, XML, StringBuilder, Dictionaries and Lists. Many .NET usages can be replaced directly by the AL types resulting in much cleaner code. For more information, see [HTTP, JSON, TextBuilder, and XML API Overview](devenv-restapi-overview.md).

For things that are not possible to achieve in AL code, the recommendation is to use Azure Functions to host the DLL or C# code previously embedded and call that service from AL.
</p>
</details>