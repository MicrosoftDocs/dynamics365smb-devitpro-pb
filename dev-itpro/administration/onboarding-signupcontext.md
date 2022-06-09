---
title: Pivoting experiences with a signupContext
description: Learn what the signupContext is for and what it can be used for.
ms.date: 06/09/2022
ms.topic: conceptual
author: sorenfriisalexandersen
ms.author: soalex
ms.reviewer: edupont
---

# Pivoting experiences with a signupContext

It can be valuable to create user experiences that depends on the context of where the [!INCLUDE [prod_short](../includes/prod_short.md)] signup originated. This origin is defined as the **signupContext**.

[!INCLUDE [prod_short](../includes/prod_short.md)] passes this signupContext through the stack from browser URL through AL. This means that the signupContext is visible to apps that want to react to the signupContext to vary the functionality according to the context. One example in [!INCLUDE [prod_short](../includes/prod_short.md)] is when a signup is triggered by a user on the Shopify administration page, where a Shopify user can choose to sign up to [!INCLUDE [prod_short](../includes/prod_short.md)] if they have installed the [!INCLUDE [prod_short](../includes/prod_short.md)] app on Shopify. The [!INCLUDE [prod_short](../includes/prod_short.md)] signup flow is triggered and the signupContext is passed along to [!INCLUDE [prod_short](../includes/prod_short.md)] by the client and exposed to AL for apps to consume.

## How the singupContext works

A URL string is added to the signup URL that contains a **signupContext** parameter and a payload of **key-value** pairs. Example:
_%3D1%26**signupContext**%3D%7B%22**name**%22%3A%22**shopify**%22%7D_

[!INCLUDE [prod_short](../includes/prod_short.md)] recognizes the signupContext parameter and stores the key-value pairs in a system table.

The key-value pairs are then parsed by the [!INCLUDE [prod_short](../includes/prod_short.md)] application and added to an application table, **Signup Context Values**, for consumption.

During the signin process, an event is triggered that allows subscribing apps to read the **Signup Context Values** at an appropriate moment to run code that modifies the user experience where needed based on the context.

> [!NOTE]
> Only signupContexts that are known to the [!INCLUDE [prod_short](../includes/prod_short.md)] application, created by Microsoft, will be parsed and transferred from the system table to the app table. At this moment we do not recommend partners to attempt to use the signupContext.


## Which signupContext exists
Currently, two signupContexts exists:

- **viral**

  This context is provided when users sign up to [!INCLUDE [prod_short](../includes/prod_short.md)] from the Microsoft marketing web pages.

- **shopify**

  This context is provided when users sign up to [!INCLUDE [prod_short](../includes/prod_short.md)] via the Shopify administration web site.

## Can partners add more signupContexts?
Not at the moment. However, we are considering how to enable partner-driven scenarios by the use of other signupContexts.

## See also

[Teaching tips and in-app tours for onboarding users](onboarding-teaching-tips-tours.md)  
[Onboarding experiences in Business Central](onboarding-experiences.md)  
