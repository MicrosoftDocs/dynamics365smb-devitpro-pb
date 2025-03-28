---
title: If the standard code does not meet your needs, adjust it yourself
description: Learn about how you can expand extensibility points in Business Central so your customizations can pass smooth. 
author: mynjj, AleksandricMarko
ms.topic: conceptual
ms.author: diegojoshuam, maleksandric
ms.date: 02/18/2025
ms.reviewer: bholtorf
---

# If the standard code does not meet your needs, adjust it yourself

Our AL codebase contains many scenarios that you can extend to cover the diverse needs of different businesses. However, you might have a business scenario that our extensibility offerings don't cover. For example, we might not have the event or interface you need, or you want to add new functionality to one of our features. 

To get it, you can make an extensibility request or, rather than to wait for us, we would like to encourage you to unblock yourself by contributing to our codebase.

We strive to bring our codebase closer to our partners so that through joint efforts we can achieve the desired results, so, currently, part of the application is available for improvements through the contribution model.

## Contributing

[BCApps](https://github.com/microsoft/BCApps) is the first truly open source component in Business Central's AL codebase. To learn more about the guidelines for contributing, see the [readme](https://github.com/microsoft/BCApps/blob/main/README.md) and the [contributing](https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md.) guidelines.

You can also see examples of previous contributions from our community in the [history of our repository](https://github.com/microsoft/BCApps/pulls?q=is%3Apr+is%3Aclosed+is%3Amerged+-author%3Abcbuild-github-agent).

We welcome contributions to Microsoft's application add-ons.
* If you are looking to contribute to the System Application or Developer Tools you can do so in the [BCApps](https://github.com/microsoft/BCapps) repository.
* If you are looking to contribute to the Base Application you can do so in the [BusinessCentralApps](https://github.com/microsoft/BusinessCentralApps/) repository. 
    * Please note, that this repository is private but you can request access to our contribution program by filling out this [form](https://forms.office.com/pages/responsepage.aspx?id=v4j5cvGGr0GRqy180BHbR_Qj5hjzNeNOhBcvBoRIOltUOVBVTklZN1hBOTZJUU40OE5CUzNWNk1FQy4u). 

## Requesting 

[ALAppExtensions](https://github.com/microsoft/ALAppExtensions/) is a repository for Microsoft and our vibrant partner channel and community to work together to develop add-on apps in the AL language and to enable the general extensibility of [!INCLUDE [prod_short](includes/prod_short.md)].

To create an extensibility request open a [new issue](https://github.com/microsoft/ALAppExtensions/issues) with the template **"Create an extensibility request"**. 

Before creating a new request, please check these guidelines:
- [Extensibility requests](https://github.com/microsoft/ALAppExtensions/blob/main/README.md#extensibility-requests)
- [How to create an extensibility request](https://review.learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/create-extensibility-request)
- [Types of events](https://review.learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/types-of-events-for-extensibility) 

> [!NOTE]
>
> * We're adding new events in main and the latest release branch. At the time of this writing, the latest release branch is 26.x. In most cases, we make other types of requests, again, only in the main branch, available in upcoming major releases.
> * If anything in the request is marked as `Obsolete` or surrounded by `CLEAN` tags, we won't accept the request.
> * Extensibility requests that are targetting apps in BCApps will not be accepted. We invite you to contribute it yourself instead.
> * 

Requests for adding functionality should not be done as an extensibility requests, we invite to engage with the partner community and create an idea in the [BC Ideas website](https://aka.ms/BCIdeas). Popular ideas get considered by our product team.
