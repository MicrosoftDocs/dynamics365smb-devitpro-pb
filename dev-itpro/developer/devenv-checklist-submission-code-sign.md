---
title: Code-signing Validation FAQ
description: Describes the most common questions when about code-signing your AppSource app for Business Central.
author: qutreson
ms.date: 10/08/2025
ms.reviewer: solsen
ms.topic: faq
ms.author: qutreson
ms.custom: sfi-ropc-nochange
---

# Code-signing validation FAQ

This article addresses some of the most frequently asked questions around code-signing validation of apps for AppSource submission. Learn more in [Sign an app package file](devenv-sign-extension.md).

## Can I use any computer to sign my apps?

No, you need to use a Microsoft Windows computer that has [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] installed.

If [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] isn't installed, you get an error similar to: "This file format can't be signed because it isn't recognized".

## Can I use a self-signed certificate to sign my apps targeting AppSource?

No, it isn't allowed to use a self-signed certificate. The .app package file must be signed using a certificate purchased from a Certification Authority that has its root certificates in Microsoft Windows. You can obtain a certificate from a range of certificate providers, including but not limited to GoDaddy, DigiCert, and Symantec.

## Do I need to use an EV code-signing certificate to pass the technical validation?

No, it isn't required to use an EV code-signing certificate. Standard code-signing certificates can be used to satisfy the code-signing requirement.

## Can I reuse the same code-signing certificate to sign multiple apps?

Yes, you can reuse the same code-signing certificate for multiple extensions. Code-signing certificates have a validity period defined over time.

## Which certificate format is accepted?

Currently we only accept `.pfx` certificates. However, if you have a different certificate format, check with your certificate provider to provide you a `.pfx` file or convert your certificate to `.pfx`. There are resources online, which can help you convert a certificate to `.pfx` format.

## Related information

[Technical validation checklist](devenv-checklist-submission.md)
