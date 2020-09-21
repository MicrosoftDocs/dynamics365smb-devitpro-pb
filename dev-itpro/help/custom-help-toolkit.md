---
title: Custom Help Toolkit
description: This article describes the components in the custom help toolkit for Business Central. 
author: edupont04

ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 08/28/2020
ms.author: edupont
---

# Custom Help Toolkit

Microsoft has published a GitHub repository with scripts and tools that can help you prepare context-sensitive Help for your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution. This context-sensitive Help can be accessed from the user interface through the *Learn more* links as described in [Configure Context-Sensitive Help](context-sensitive-help.md). You are welcome to use any other tool or process to help you build and deploy content, and the toolkit is simply intended to help you in some of the steps that are required.

The GitHub repository includes source code for the tools, and we welcome contributions and feedback as we collaborate on making the toolkit develop over time.  

## Tools in the toolkit

The toolkit is available at *TBD*. The repo contains the following tools and the source code for the tools:

- HtmlFromRepoGenerator tool

    For more information, see [Custom Help Toolkit: The HtmlFromRepoGenerator tool](custom-help-toolkit-HtmlFromRepoGenerator.md)
- Dynamics NAV field Help conversion scripts

    For more information, see [Custom Help Toolkit: The NavFieldsTooltips tool](custom-help-toolkit-NavFieldsTooltips.md)
- HtmlLocaleChanger tool

    For more information, see [Custom Help Toolkit: The HtmlLocaleChanger tool](custom-help-toolkit-HtmlLocaleChanger.md)

## Custom Help

Depending on your solution, you are expected to deploy Help to a website that can be accessed by users of your solution. For more information, see [User Assistance Model](../user-assistance.md) and [Configuring the Help Experience for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../deployment/configure-help.md). The tools in this toolkit can help you with some of the steps, either as a one-off conversion, or as a step that you repeat with new versions, or that you incorporate in your DevOps, for example.  



## See also

[Configure Context-Sensitive Help](context-sensitive-help.md)  
[User Assistance Model](../user-assistance.md)  
[Migrate Legacy Help to the [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Format](../upgrade/migrate-help.md)  
