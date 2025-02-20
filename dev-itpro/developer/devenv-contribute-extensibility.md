---
title: Contribute your extensibility scenarios
description: Learn about how to contribute to the different repositories that contain the business application.
author: diegojoshuam
ms.topic: conceptual
ms.author: diegojoshuam
ms.date: 02/18/2025
ms.reviewer: bholtorf
---

# Contribute your extensibility scenarios

Our AL codebase contains many scenarios that you can extend to cover the diverse needs of different businesses. However, you might have a business scenario that isn't covered by our extensibility offerings. For example, because we're missing the events or interfaces you need. In that case, rather than wait for us, we encourage you to unblock yourself by contributing to our codebase.

Our business application is open source, and you can access the code in three places:

* [BCApps](https://github.com/microsoft/BCapps): This repository contains modules for the System Application and the Business Foundation.
* [ALAppExtensions](https://github.com/microsoft/ALAppExtensions): This repository contains the rest of the Microsoft modules for [!INCLUDE [prod_short](includes/prod_short.md)].
* [BusinessCentralApps](https://github.com/microsoft/BusinessCentralApps): This repository contains the Base Application of Business Central. It requires access through the contribution program. To learn more, go to [Contribute to BusinessCentralApps](#contribute-to-businesscentralapps).

Your contributions can be part of the next release of our product if they meet our quality standards. We'll review your pull request and get back to you with feedback, or merge it into the next release of [!INCLUDE [prod_short](includes/prod_short.md)].

## Contribute to BCApps

The BCApps repository is used directly in our builds. It's our first truly open source component in Business Central's AL codebase. To learn more about the guidelines for contributing, go to [https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md.](https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md.).

## Contribute to ALAppExtensions

The ALAppExtensions repository isn't used directly in our builds. We have a process to accept pull requests made to the main branch of this repository. You can provide contributions to Microsoft apps for all of our localizations. To explore some examples of contributions, go to [ALAppExtensions](https://github.com/microsoft/ALAppExtensions/pulls?q=is%3Apr+is%3Aclosed+is%3Amerged).

## Contribute to BusinessCentralApps

To contribute to change to the Base Application, you can request access to our contribution program.

 JESPER PLEASE HELP HERE :D

### Extensibility requests

We encourage you to help us improve [!INCLUDE [prod_short](includes/prod_short.md)]. However, it's possible that your extensibility scenario is outside of our repositories. For example, contributions to localizations of BaseApp that aren't in BusinessCentralApps. For those scenarios, we allow extensibility requests.

If the extensibility scenario you're missing is for an AL application in BCApps, the best way to request changes is through a direct contribution to the GitHub repository. However, if your extensibility scenario targets AL applications in the ALAppExtensions or BusinessCentralApps repositories, you can create an extensibility request for us to review.

> [!NOTE]
> Extensibility requests that we process manually might take longer to complete. Therefore, if possible, we recommend that you contribute directly using a pull request.

We track extensibility requests as issues in the [ALAppExtensions](https://github.com/microsoft/ALAppExtensions/issues) repository. To learn more about extensibility requests, go to [ALAppExtensions ReadMe](https://github.com/microsoft/ALAppExtensions/blob/main/README.md#extensibility-requests).

> [!NOTE]
>
> * We're adding new events in main and the latest release branch. At the time of this writing, the latest release branch is 25.x. In most cases, we make other types of requests, again, only in the main branch, available in upcoming major releases.
> * If anything in the request is marked as `Obsolete` or surrounded by `CLEAN` tags, we won't accept the request.

### Guidelines for an extensibility request

Each request should contain the following information:

* A clear title.
* A description of why the change is needed.
* A description of the request.

#### Write a clear title

The title should contain information about the specific objects to change. For example, **[Country Code] [Application] [Missing Scenario]**.

Examples:

* [W1][BaseApp][Sales Posting scenarios]
* [DK][DKCore][Changes in Nemhandle]

#### Describe why the change is needed

Provide a brief description of why you need us to change the app, and what the change allows you to do. Good explanations help us make the changes without contacting you with questions, which means our review cycle goes faster.

> [!TIP]
> Be specific. Don't be vague. Provide enough information to help us understand your need. For example, avoid sentences such as:
>
> * *"We would like to use our function instead of the standard one."*
>
> Instead, explain why. For example, maybe it makes sense to change our standard code because many of you have the same process.
>
> * *"We want to avoid displaying testfield() errors to the user."*
>
> Explain why. Maybe something can be done differently. It might cause an issue in a part of the system that you aren't aware of. Maybe it makes sense to remove it in general.

#### Describe the requests

Explain the scenarios that you can't solve with our current extensibility offerings. If you have a specific implementation in mind that solves your scenario, add it so that we can process your request faster. Good contributions not only help a single scenario, but hopefully enable other users with a similar requirement to use the events or interfaces you provide. Keep that in mind when you design and request changes in our extensibility model.

## Related information

[Extensibility overview](devenv-extensibility-overview.md)  
[Extension objects overview](devenv-extension-object-overview.md)  
