---
title: "Enable key vault access for your AppSource App during development and/or test"
description: "Set up key vault access for an AppSource app for AL-Go for Business Central."
author: freddyk
ms.custom: na
ms.date: 01/27/2022
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Enable Key Vault Access for your AppSource App during Development and/or Test

For AppSource apps, if you want to enable key vault access for your app (as described here https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-app-key-vault-overview) you can add the access to this key vault in your local development environment or your pipelines (for running tests) by adding 3 secrets to either the GitHub repo or your key vault. Based on this walkthrough https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/setup-app-key-vault-onprem you will need to create 3 secrets:

- A `KeyVaultClientId`, which is the Client ID for the Azure AD App with access to the key vault.
- A `KeyVaultCertificateUrl`, pointing to a certificate which gives you access to the Azure AD App.
- A `KeyVaultCertificatePassword`, which is the password for this certificate.

In the case of key vault access for apps, it is not enough to just add the secrets, you will also have to add information in the `.AL-Go\settings.json` file that this app uses this key vault. Add these three settings:

```json
"KeyVaultCertificateUrlSecretName": "KeyVaultCertificateUrl",
"KeyVaultCertificatePasswordSecretName": "KeyVaultCertificatePassword",
"KeyVaultClientIdSecretName": "KeyVaultClientId",
```

With this, containers set up for build pipelines or development environments will have access to this key vault.

## Next step

Now, you can go and [Create Online Development Environment from Visual Studio Code](algo-create-online-dev-env-vscode.md).

## See also