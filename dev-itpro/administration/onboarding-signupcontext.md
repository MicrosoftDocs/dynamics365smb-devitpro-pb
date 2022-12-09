---
title: Pivot onboarding based on sign-up context
description: Learn what the sign-up context is for and what it can be used for.
ms.date: 06/09/2022
ms.topic: conceptual
author: sorenfriisalexandersen
ms.author: soalex
ms.reviewer: edupont
---

# Pivot onboarding based on sign-up context

You can create onboarding experiences that depend on where the [!INCLUDE [prod_short](../includes/prod_short.md)] sign-up originated. This origin is defined as the **sign-up context**, which is available in version 20.3 and later.  

[!INCLUDE [prod_short](../includes/prod_short.md)] passes this sign-up context from the browser URL to the application where it can be processed by AL code. The sign-up context is visible to apps that want to react to the sign-up context to vary the functionality according to the context.  

Let's look at an example where a sign-up is triggered by a user on the Shopify administration page. Shopify users can choose to sign up to [!INCLUDE [prod_short](../includes/prod_short.md)] after they installed the [!INCLUDE [prod_short](../includes/prod_short.md)] app on Shopify. The [!INCLUDE [prod_short](../includes/prod_short.md)] sign-up flow is triggered, and the sign-up context is passed along to [!INCLUDE [prod_short](../includes/prod_short.md)] by the client and exposed to AL for apps to consume.

## How the sign-up context works

A URL string is added to the sign-up URL that contains a `signupContext` parameter and a payload of key-value pairs. Let's look at the example where a user has signed up from Shopify:

```
_%3D1%26signupContext%3D%7B%22name%22%3A%22shopify%22%7D_
```

The encoded characters will end up resolving to a URL such as the this one:

```
https://businesscentral.dynamics.com/?redirectedFromSignup=1&ScenarioId=signup&signupContext={name:shopify}
```

[!INCLUDE [prod_short](../includes/prod_short.md)] recognizes the sign-up context parameter and stores the key-value pairs in a system table. The key-value pairs are then parsed by the [!INCLUDE [prod_short](../includes/prod_short.md)] application and added to a database table, **Signup Context Values**, for consumption.

During the sign-in process, an event is triggered that allows subscribing apps to read the **Signup Context Values** table at an appropriate moment to run code that modifies the user experience where needed based on the context.

> [!IMPORTANT]
> Only sign-up contexts that are known to the [!INCLUDE [prod_short](../includes/prod_short.md)] application, created by Microsoft, will be parsed and transferred from the system table to the app table. At this moment we do **not** recommend partners to attempt to use the sign-up context.

## Which sign-up contexts exists

Currently, two sign-up contexts exist:

- **viral**

  This context is provided when users sign up to [!INCLUDE [prod_short](../includes/prod_short.md)] from the Microsoft marketing web pages.

- **shopify**

  This context is provided when users sign up to [!INCLUDE [prod_short](../includes/prod_short.md)] via the Shopify administration web site.

## Can partners add more sign-up Contexts?

Not at the moment. However, we're considering how to enable partner-driven scenarios by the use of other sign-up contexts.

## See also

[Onboarding experiences in Business Central](onboarding-experiences.md)  
