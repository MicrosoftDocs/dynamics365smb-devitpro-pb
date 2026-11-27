---
title: Develop and Maintain Marketplace Apps FAQ
description: Describes the most common questions you might have when developing and maintaining Marketplace apps for Business Central.
author: SusanneWindfeldPedersen
ms.date: 11/27/2026
ms.reviewer: solsen
ms.topic: faq
ai-usage: ai-assisted
ms.author: solsen
ms.custom: sfi-ropc-nochange
---

# Develop and maintain Marketplace apps FAQ

This article answers questions about developing apps in Docker containers or online sandboxes. Learn more about maintaining apps after they reach the Marketplace in [Update lifecycle for Marketplace apps FAQ](devenv-update-app-life-cycle-faq.md).

## What does it mean if I have an app in development that needs another dependency loaded, but I can't get the dependency's codeunits to load in my BC docker instance because it says the dependency's range is outside my range?

The error means that your developer license doesn't allow you to publish objects in the dependency's ID range. You have two options:

- Ask the Marketplace app's developer for a runtime package. This package avoids the developer-license object-range check during publishing. The container's license must still allow you to run the objects, and the package must be compatible with the platform and dependencies in the container. Learn more in [Creating runtime packages](devenv-creating-runtime-packages.md).
- Develop and test in an online sandbox where the Marketplace app is already installed.

## Related information

[Technical validation checklist](devenv-checklist-submission.md)  
