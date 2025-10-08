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

This article addresses some of the most frequently asked questions around maintaining apps for AppSource submission.

## Questions about developing and maintaining AppSource apps

This section contains frequently asked questions regarding developing apps (in Docker or SaaS). Learn more about maintaining apps after they've reached the AppSource marketplace in [Update lifecycle for AppSource apps FAQ](devenv-update-app-life-cycle-faq.md).

### What does it mean if I have an app in development that needs another dependency loaded, but I can't get the dependency's codeunits to load in my BC docker instance because it says the dependency's range is outside my range?

It means that your license doesn't allow you to publish that application. A recommendation would be to either get a runtime package from the developer of that AppSource app, which will allow you to bypass the licensing check or to try to test it on an online sandbox environment where that AppSource app is already installed. 

## Questions about code-signing validation

This section contains frequently asked questions related to the code-signing requirement from the [Technical Validation Checklist](devenv-checklist-submission.md). Learn more about code-signing in [Sign an APP Package File](devenv-sign-extension.md).

### Can I use any computer to sign my apps?

No, you need to use a Microsoft Windows computer that has [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] installed.

If [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] isn't installed, you get an error similar to: "This file format can't be signed because it isn't recognized".

### Can I use a self-signed certificate to sign my apps targeting AppSource?

No, it isn't allowed to use a self-signed certificate. The .app package file must be signed using a certificate purchased from a Certification Authority that has its root certificates in Microsoft Windows. You can obtain a certificate from a range of certificate providers, including but not limited to GoDaddy, DigiCert, and Symantec.

### Do I need to use an EV code-signing certificate to pass the technical validation?

No, it isn't required to use an EV code-signing certificate. Standard code-signing certificates can be used to satisfy the code-signing requirement.

### Can I reuse the same code-signing certificate to sign multiple apps?

Yes, you can reuse the same code-signing certificate for multiple extensions. Code-signing certificates have a validity period defined over time.

### Which certificate format is accepted?

Currently we only accept `.pfx` certificates. However, if you have a different certificate format, check with your certificate provider to provide you a `.pfx` file or convert your certificate to `.pfx`. There are resources online, which can help you convert a certificate to `.pfx` format.

## Questions about names, affixes, and ID ranges

In the following, you can read about how affixes and ID ranges are assigned.

### Do I need to register different affixes for each of my extensions?

No, you don't need to register affixes for each of your extensions.

The object affixes are registered per publisher so if your apps all have the same publisher, they can share the same affixes. The automated validation verifies that you're using the three letters affix registered by Microsoft in your extension, but this still allows you to create longer affixes per extension. For example, if you registered ABC as your affix, you can use ABCD as the prefix in Extension 1 and ABCE as the prefix in Extension 2. Learn more in [Prefix and suffix for naming in extensions](../compliance/apptest-prefix-suffix.md).

### Do I need to request a different ID range for each of my extensions?

No, you don't need to request a new ID range for each of your extensions.

The object IDs are registered per partner, not per extension. You can then use a subset of this range for each of your extensions. It is your responsibility to ensure that you aren't defining objects with the same IDs in different extensions. If you're doing so, the extensions defining these objects can't be installed together on the same environment. Learn more in [Get started building apps](readiness/get-started.md#requesting-an-object-range).

### Will there be any changes made to the object names character limitation (30 characters) within the near future? 

We would like longer names as well. Introducing namespaces could be one investment. However, such a change has down-stream breaking impact (any caller needs to qualify calls) and there are SQL constraints on name lengths for tables, which currently include company name, table name, app ID and needs to be maximum 255. This is on our long term backlog, but haven't any changes planned soon.

## Related information

[Technical Validation Checklist](devenv-checklist-submission.md)
