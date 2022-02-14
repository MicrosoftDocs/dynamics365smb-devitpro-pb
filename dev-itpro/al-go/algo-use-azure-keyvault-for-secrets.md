---
title: "Use Azure KeyVault for secrets with AL-Go"
description: "Using Azure key vault for storing secrets on AL-Go projects for Business Central."
author: freddyk
ms.custom: na
ms.date: 01/21/2022
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Use Azure KeyVault for secrets with AL-Go

> *The prerequisites for this how to is that you have completed the [Update AL-Go System Files](algo-update-system-files.md) instructions, that you have an Azure KeyVault and that you follow the guidelines on how to connect to an Azure KeyVault as specified [here](/azure/developer/github/github-key-vault.md). Add your KeyVault name to the JSON construct from this walkthrough (using “keyVaultName” : “{your keyvault name}”) and add this JSON construct as a repository secret called AZURE_CREDENTIALS. You can also specify the KeyVault name in the AL-Go settings file if you do not wait to update the JSON construct.*

1. Add the `authContext` secret, see [Register a customer sandbox environment for Continuous Deployment using Service-to-Service Authentication](algo-register-sandbox-env.md) and the `ghTokenWorkflow` secret, [Update AL-Go System Files](algo-update-system-files.md) as secrets in your KeyVault. Remove the secrets from repository secrets and environment secrets.
1. Run the CI/CD pipeline to see that the deployment still works, reading the `authContext` secret from the KeyVault.
1. Run the [Update AL-Go System Files](algo-update-system-files.md) flow to see that updating the AL-Go system files still works.

## See also