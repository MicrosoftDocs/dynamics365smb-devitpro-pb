---
title: Contribute a change yourself
description: Learn how to contribute to Microsoft's AL codebase and expand extensibility points to meet your business needs. Explore collaboration opportunities today. 
author: AleksandricMarko
ms.topic: article
ms.author: maleksandric
ms.date: 04/02/2025
ms.reviewer: bholtorf
ms.custom: bap-template
---

# Contribute a change yourself

Our AL codebase contains many scenarios that you can extend to cover the diverse needs of different businesses. However, you might have a business scenario that our extensibility offerings don't cover. For example, we might not have the event or interface you need, or you might want to add new functionality to one of our features.

To get what you're missing, you can submit an extensibility request. Or, rather than wait for us to process your request, to unblock yourself you can contribute to our codebase. We very much encourage the latter. We want our codebase close to our partners, so that we can achieve more through joint efforts. To facilitate collaboration, part of our application code is available for improvements through contributions.

## Contribute a change

The [BCApps](https://github.com/microsoft/BCApps) repository is the first truly open source component in our AL codebase. To learn more about contributing, go to [Readme](https://github.com/microsoft/BCApps/blob/main/README.md) and the [Contributing](https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md.) guidelines.

To explore examples of previous contributions from our community, go to [history of our repository](https://github.com/microsoft/BCApps/pulls?q=is%3Apr+is%3Aclosed+is%3Amerged+-author%3Abcbuild-github-agent).

We welcome contributions to Microsoft's application add-ons.

- If you're looking to contribute to the **System Application** or **Developer Tools**, you can do so in the [BCApps](https://github.com/microsoft/BCapps) repository.
- If you want to contribute to the **Base Application**, you can do so in the [BusinessCentralApps](https://github.com/microsoft/BusinessCentralApps/) repository.

    > [!NOTE]
    > The BusinessCentralApps repository is private, so to get started you must request access to our contribution program. To request access, just fill out and submit this [form](https://forms.office.com/pages/responsepage.aspx?id=v4j5cvGGr0GRqy180BHbR_Qj5hjzNeNOhBcvBoRIOltUOVBVTklZN1hBOTZJUU40OE5CUzNWNk1FQy4u).

## Create an extensibility request

[ALAppExtensions](https://github.com/microsoft/ALAppExtensions/) is a repository where Microsoft and our vibrant community can work together to develop add-on apps in the AL language, and expand the general extensibility of [!INCLUDE [prod_short](includes/prod_short.md)].

Before you create a request, review these guidelines:

- [Extensibility requests](https://github.com/microsoft/ALAppExtensions/blob/main/README.md#extensibility-requests)
- [Create an extensibility request](create-extensibility-request.md)
- [Types of events for extensibility](types-of-events-for-extensibility.md)

> [!NOTE]
>
> - We add new events in the main branch and the latest release branch. In most cases, we make other types of requests in the main branch available in an upcoming major release.
> - We don't accept requests that contain anything marked as `Obsolete` or surrounded by `CLEAN` tags.
> - We don't accept requests that target apps in BCApps. Instead, we encourage you to contribute it yourself.

To create an extensibility request, go to the ALAppExtensions repository and create a [new issue](https://github.com/microsoft/ALAppExtensions/issues) using the **Create an extensibility request** template.

> [!NOTE]
> Don't submit requests for adding features as extensibility requests. Instead, engage with our partner community and create an idea in the [BC Ideas website](https://aka.ms/BCIdeas). Popular ideas get considered by our product team.

## Related information

[Create an extensibility request](create-extensibility-request.md)  
[Types of events for extensibility](types-of-events-for-extensibility.md)
