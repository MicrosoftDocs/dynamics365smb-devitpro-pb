---
title: Contribute a change yourself
description: Learn how to contribute to Microsoft's AL codebase and expand extensibility points to meet your business needs. Explore collaboration opportunities today. 
author: AleksandricMarko
ms.topic: concept-article
ms.author: maleksandric
ms.date: 10/29/2026
ms.reviewer: bholtorf
ms.custom: bap-template
---

# Contribute a change yourself

Our AL codebase contains many scenarios that you can extend to cover the diverse needs of different businesses. However, you might have a business scenario that our extensibility offerings don't cover. For example, we might not have the event or interface you need, or you might want to add new functionality to one of our features.

To get a missing extensibility point, submit an extensibility request.

## Contribute a change

The [BCApps](https://github.com/microsoft/BCApps) repository is the open-source collaboration hub for Business Central application development. It includes the Base Application, Business Foundation, System Application, Microsoft's first-party apps, and developer tools. To learn more about contributing, go to [Readme](https://github.com/microsoft/BCApps/blob/main/README.md) and the [Contributing](https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md) guidelines.

To explore examples of previous contributions from our community, go to [history of our repository](https://github.com/microsoft/BCApps/pulls?q=is%3Apr+is%3Aclosed+is%3Amerged+-author%3Abcbuild-github-agent).

We welcome contributions across all application areas.

Help improve Business Central's extensibility by contributing the changes your solution needs. To learn more, go to [Contribute the implementation for an extensibility request](create-extensibility-request.md#contribute-the-implementation-for-an-extensibility-request).

## Create an extensibility request

Submit requests for missing extensibility points in any of these application areas through [BCApps](https://github.com/microsoft/BCApps/).

Before you create a request, review these guidelines:

- [Extensibility requests](https://github.com/microsoft/BCApps/blob/main/README.md#extensibility-requests)
- [Create an extensibility request](create-extensibility-request.md)
- [Types of events for extensibility](types-of-events-for-extensibility.md)

> [!NOTE]
>
> - We add new events in the main branch and the latest release branch. In most cases, we make other types of requests in the main branch available in an upcoming major release.
> - We don't accept requests that contain anything marked as `Obsolete` or surrounded by `CLEAN` tags.

To create an extensibility request, go to the BCApps repository and create a [new issue](https://github.com/microsoft/BCApps/issues/new?template=extensibility-request.yaml) by using the **Create an extensibility request** template.

For the supported request types, submission requirements, and examples, go to [Create an extensibility request](create-extensibility-request.md).

> [!NOTE]
> Don't submit requests for adding features as extensibility requests. Instead, engage with our partner community and create an idea in the [BC Ideas website](https://aka.ms/BCIdeas). Popular ideas get considered by our product team.

## Related information

[Create an extensibility request](create-extensibility-request.md)  
[Types of events for extensibility](types-of-events-for-extensibility.md)
