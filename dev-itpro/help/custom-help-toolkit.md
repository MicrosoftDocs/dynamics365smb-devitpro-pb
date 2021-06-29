---
title: Custom Help Toolkit
description: This article describes the components in the custom help toolkit for Business Central. 
author: edupont04

ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.reviewer: jowilco
ms.date: 04/01/2021
ms.author: edupont
---

# Custom Help Toolkit

Microsoft has published a GitHub repository with scripts and tools that can help you prepare customized Help for your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] solution. This Help content can then be accessed from the user interface through the *Learn more* links as described in [Configure Context-Sensitive Help](context-sensitive-help.md). You are welcome to use any tools or processes to build and deploy content; this toolkit is intended to help you in some of the steps that are required.

The GitHub repository includes source code for the tools, and we welcome contributions and feedback to collaborate on improving the toolkit.  

## Tools in the toolkit

The toolkit is available at [https://github.com/microsoft/dynamics365smb-custom-help](https://github.com/microsoft/dynamics365smb-custom-help). The repo contains the following tools as well as the source code for the tools:

- HtmlFromRepoGenerator tool

    For more information, see [Custom Help Toolkit: The HtmlFromRepoGenerator tool](custom-help-toolkit-HtmlFromRepoGenerator.md)
- Dynamics NAV field Help conversion scripts

    For more information, see [Custom Help Toolkit: The FieldTopicTextExtractor tool](custom-help-toolkit-FieldTopicTextExtractor.md)
- HtmlLocaleChanger tool

    For more information, see [Custom Help Toolkit: The HtmlLocaleChanger tool](custom-help-toolkit-HtmlLocaleChanger.md)

## Custom Help

Depending on your solution, you are expected to deploy Help to a website that can be accessed by users of your solution. For more information, see [User Assistance Model](../user-assistance.md) and [Configuring the Help Experience for [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](../deployment/configure-help.md).

## See also

[Configure Context-Sensitive Help](context-sensitive-help.md)  
[User Assistance Model](../user-assistance.md)  
[Migrate Legacy Help to the [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Format](../upgrade/migrate-help.md)  
[Extend, Customize, and Collaborate on the Help for [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](contributor-guide.md)  
