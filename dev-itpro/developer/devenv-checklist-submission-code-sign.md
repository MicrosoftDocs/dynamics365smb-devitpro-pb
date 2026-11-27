---
title: Marketplace Code-Signing Validation FAQ
description: Find answers about signing Business Central apps for Marketplace, including certificate requirements, Azure Key Vault, and PFX signing.
author: SusanneWindfeldPedersen
ms.date: 11/27/2026
ms.reviewer: solsen
ms.topic: faq
ms.author: solsen
ms.custom: sfi-ropc-nochange
ai-usage: ai-assisted
---

# Marketplace code-signing validation FAQ

This article addresses some of the most frequently asked questions around code-signing validation of apps for Marketplace submission. Learn more in [Sign an app package file](devenv-sign-extension.md).

## Can I use any computer to sign my apps?

Use an environment configured to sign Business Central `.app` packages. For the documented Windows PFX procedure, use a computer with [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] installed or a Business Central Docker environment. For Azure Key Vault signing, follow the prerequisites in [Sign an app package file](devenv-sign-extension.md#sign-an-app-package-file-with-azure-key-vault).

If the signing tool doesn't recognize the app package format, you might get an error similar to: "This file format can't be signed because it isn't recognized".

## Can I use a self-signed certificate to sign my apps targeting Marketplace?

No, the Marketplace doesn't accept self-signed certificates. You must sign the `.app` package file with a code-signing certificate that you purchase from a certificate authority with root certificates in Microsoft Windows. Choose a provider that meets these requirements and supports your signing method.

## Do I need to use an EV code-signing certificate to pass the technical validation?

No, it isn't required to use an EV code-signing certificate. Standard code-signing certificates can be used to satisfy the code-signing requirement.

## Can I reuse the same code-signing certificate to sign multiple apps?

Yes, you can reuse the same code-signing certificate for multiple extensions. Code-signing certificates have a validity period defined over time.

## Which certificate format is accepted?

You don't need a `.pfx` file for every signing method. You can sign an app package by using a code-signing certificate in Azure Key Vault. Publicly trusted code-signing certificates issued after June 1, 2023, require hardware-protected private keys, so don't assume that your provider can supply an exportable `.pfx` file.

Follow the signing method supported by your certificate provider. Learn more in [Sign an app package file](devenv-sign-extension.md).

## Related information

[Technical validation checklist](devenv-checklist-submission.md)
