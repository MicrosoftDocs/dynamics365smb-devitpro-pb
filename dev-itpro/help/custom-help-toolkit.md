---
title: Custom Help Toolkit
description: This article describes the components in the custom help toolkit for Business Central. 
author: edupont04

ms.topic: conceptual
ms.reviewer: jowilco
ms.date: 11/03/2022
ms.author: edupont
---

# Custom Help Toolkit

Microsoft has published a GitHub repository with scripts and tools that can help you prepare customized Help for your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] solution. This Help content can then be accessed from the user interface through the *Learn more* links as described in [Configure Context-Sensitive Help](context-sensitive-help.md). You are welcome to use any tools or processes to build and deploy content; this toolkit is intended to help you in some of the steps that are required.  

[!INCLUDE [ua-toolkit-tip](../includes/ua-toolkit-tip.md)]

[!INCLUDE [ua-toolkit-onprem](../includes/ua-toolkit-onprem.md)]

[!INCLUDE [ua-toolkit-online](../includes/ua-toolkit-online.md)]

The GitHub repository includes source code for the tools, and we welcome contributions and feedback to collaborate on improving the toolkit.  

## Tools in the toolkit

[!INCLUDE [help-toolkit-deprecate](../includes/help-toolkit-deprecate.md)]

The toolkit is available at [https://github.com/microsoft/dynamics365smb-custom-help](https://github.com/microsoft/dynamics365smb-custom-help). The repo contains the following tools as well as the source code for the tools:

- HtmlFromRepoGenerator tool

    For more information, see [Custom Help Toolkit: The HtmlFromRepoGenerator tool](custom-help-toolkit-HtmlFromRepoGenerator.md)
- Dynamics NAV field Help conversion scripts

    For more information, see [Custom Help Toolkit: The FieldTopicTextExtractor tool](custom-help-toolkit-FieldTopicTextExtractor.md)
- HtmlLocaleChanger tool

    For more information, see [Custom Help Toolkit: The HtmlLocaleChanger tool](custom-help-toolkit-HtmlLocaleChanger.md)

## Custom Help

Depending on your solution, you are expected to deploy Help to a website that can be accessed by users of your solution to supplement or replace Microsoft's content. For more information, see [User Assistance Model](../user-assistance.md) and [Configuring the Help Experience](../deployment/configure-help.md). The toolkit is especially useful if you deploy a customer-specific solution that is based on Microsoft's base application. [!INCLUDE [ua-toolkit-online](../includes/ua-toolkit-online.md)]

> [!TIP]
> Microsoft's content in the various GitHub repos is optimized for the learn.microsoft.com site and the tools that are used for this site. We encourage you to supplement our content with solution-specific content as opposed to attempting to customize our content to fit your needs. But we acknowledge that there are situations when customizations are required, and the toolkit's tools can help you achieve that.

## See also

[Configure Context-Sensitive Help](context-sensitive-help.md)  
[User Assistance Model](../user-assistance.md)  
[Migrate Legacy Help to the [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Format](../upgrade/migrate-help.md)  
[Extend and Collaborate on the Help for [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](contributor-guide.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
