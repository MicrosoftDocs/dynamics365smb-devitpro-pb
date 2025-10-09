---
title: Develop and Maintain AppSource Apps FAQ
description: Describes the most common questions when submitting your app to AppSource for Business Central.
author: qutreson
ms.date: 02/19/2025
ms.reviewer: solsen
ms.topic: faq
ms.author: qutreson
ms.custom: sfi-ropc-nochange
---

# Develop and maintain AppSource apps FAQ

This article contains frequently asked questions regarding developing apps (in Docker or SaaS). Learn more about maintaining apps after they've reached the AppSource marketplace in [Update lifecycle for AppSource apps FAQ](devenv-update-app-life-cycle-faq.md).

## What does it mean if I have an app in development that needs another dependency loaded, but I can't get the dependency's codeunits to load in my BC docker instance because it says the dependency's range is outside my range?

It means that your license doesn't allow you to publish that application. A recommendation would be to either get a runtime package from the developer of that AppSource app, which will allow you to bypass the licensing check or to try to test it on an online sandbox environment where that AppSource app is already installed. 

## Related information

[Technical Validation Checklist](devenv-checklist-submission.md)
