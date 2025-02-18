---
title: Contribute your extensibility scenarios
description: Learn about how to contribute to the different repositories that contain the business application.
author: 
ms.topic: conceptual
ms.author: 
ms.date: 18/02/2025
ms.reviewer: 
---

# Contribute your extensibility scenarios

Our AL codebase contains many scenarios that you can extend that cover a diverse set of needs for several kinds of businesses. However, if you have found a scenario that is not covered in our extensibility offerings, either by missing events or interfaces, you can contribute yourself to our codebase.

Our business application is open source, and the code can be accessed in three different places:
* [BCApps](https://github.com/microsoft/BCapps) This repository contains modules for the System Application and the Business Foundation.
* [ALAppExtensions](https://github.com/microsoft/ALAppExtensions) This repository contains the rest of the 1st party applications.
* [BusinessCentralApps](https://github.com/microsoft/BusinessCentralApps) This repository contains the Base Application of Business Central. It requires access through the contribution program.

Your contribution can be part of the next release of our product. All your contributions have to meet our quality standards to be incorporated into future releases, we will review the pull request and get back to you with feedback or merge it into the next release of Business Central.

## Contribute to BCApps
 
The BCApps repository is being used directly in our builds, it is our first truly open source component in the Business Central's AL codebase. Read the guidelines to contribute in [https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md.](https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md.).


## Contribute to ALAppExtensions

The ALAppExtensions repository is not being used directly in our builds, but we have a process to accept pull requests made to the master branch of this repository. You can provide contributions to first party apps for all of our localizations. You can see some examples of contributions [here](https://github.com/microsoft/ALAppExtensions/pulls?q=is%3Apr+is%3Aclosed+is%3Amerged).

## Contribute to BusinessCentralApps

To contribute to change to the Base Application, you can request access to our contribution program.

 JESPER PLEASE HELP HERE :D


# Extensibility requests

We encourage improving the product directly. However, it's possible that your extensibility scenario is outside of the repositories listed above. For example, contributions to localizations of BaseApp which can't be found in BusinessCentralApps. For such scenarios, we also allow extensibility requests. 

If the extensibility scenario you are missing is for an AL application in BCApps, the only supported way of requesting changes is through direct contributions in the GitHub repository. If your extensibility scenario is targeting AL applications in the ALAppExtensions or BusinessCentralApps repositories, we can help with your extensibility scenario by creating a extensibility request.

Be aware that extensibility requests processed manually may have longer processing times, so we greatly encourage you to contribute directly as pull requests if possible.

Extensibility requests are tracked as issues in the [ALAppExtensions](https://github.com/microsoft/ALAppExtensions/issues) repository. You can see more guidance in [here](https://github.com/microsoft/ALAppExtensions/blob/main/README.md#extensibility-requests).

> [!NOTE]
>
> * We're adding new events in main and the latest release branch. At the time of this writing, the latest release branch is 25.x. In most cases, we'll make other types of requests, again, only in the main branch, available in upcoming major releases.
> * If the procedure, field, object or any part of it are marked as `Obsolete` or surrounded by `CLEAN` tags, we won't add or update the events.

## Guidelines for an extensibility request

Each request should at least contain the following information:

* Title
* A description of why the change is needed.
* A description of the request

### Write a clear title

The title should contain information about the specific objects to change. For example "**[Country Code] [Application] [Missing Scenario]**". 

Examples:
* [W1][BaseApp][Sales Posting scenarios]
* [DK][DKCore][Changes in Nemhandle]


### Describe why the change is needed

Provide a brief description of why you need us to change the app, and what the change allows you to do. Good explanations help us make the changes without contacting you with additional questions, which decreases the time to complete the request.

> [!TIP]
> Be specific. Don't be vague. Provide enough information to help us understand your need. For example, avoid sentences such as:
>
> * *"We would like to use our function instead of standard."*
>
> Instead, explain why. For example, maybe it makes sense to change our standard code because many of you have the same process.
>
> * *"We want to avoid displaying testfield() errors to the user."*
>
> Explain why. Maybe something can be done differently. It might cause an issue in a part of the system that you aren't aware of. Maybe it makes sense to remove it in general.

### Describe the requests

Explain the scenarios that you can't solve with our current extensibility offerings. If you already have in mind a specific implementation that would solve your scenario add it so that we can process your request faster. Good contributions will help not only a single scenario but hopefully enable other users with a similar extensibility requirement to hook to the events or interfaces you provide. Think of this when designing and requesting for changes in our extensibility model.
