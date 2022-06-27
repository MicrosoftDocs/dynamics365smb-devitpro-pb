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

For AppSource apps, if you want to enable key vault access for your app as described in [Using App Key Vaults with Business Central Extensions](../developer/devenv-app-key-vault-overview.md), you can add the access to this key vault in your local development environment or your pipelines (for running tests) by adding three secrets to either the GitHub repo or your key vault. Based on the walkthrough [Setting up App Key Vaults for Business Central On-premises](../administration/setup-app-key-vault-onprem.md) you'll need to create three secrets:

- A `KeyVaultClientId`, which is the Client ID for the Azure AD App with access to the key vault.
- A `KeyVaultCertificateUrl`, pointing to a certificate, which gives you access to the Azure AD App.
- A `KeyVaultCertificatePassword`, which is the password for this certificate.

If you enable key vault access for apps, it isn't enough to just add the secrets, you'll also have to add information in the `.AL-Go\settings.json` file that this app uses this key vault. Add these three settings:

```json
"KeyVaultCertificateUrlSecretName": "KeyVaultCertificateUrl",
"KeyVaultCertificatePasswordSecretName": "KeyVaultCertificatePassword",
"KeyVaultClientIdSecretName": "KeyVaultClientId",
```

With this set up, containers set up for build pipelines or development environments will have access to this key vault.

## Next step

Now, you can [Create Online Development Environment from Visual Studio Code](algo-create-online-dev-env-vscode.md).

## See also

[AL-Go Overview](algo-overview.md)  