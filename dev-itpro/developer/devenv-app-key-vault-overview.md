---
title: Azure Key Vaults with Business Central
description: Provides an overview of Azure key vaults with Business Central extensions.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Using App Key Vaults with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Extensions

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

Some [!INCLUDE[prod_short](../developer/includes/prod_short.md)] extensions make web service calls to non-[!INCLUDE[prod_short](../developer/includes/prod_short.md)] services. For example, one extension might call Azure Storage to read/write blobs. Another extension might call the extension publisher's web service to do an operation. 

These web service calls are typically authenticated, which means the extension must provide a credential in the call. The credentials enable the other service to accept or reject the call. You can consider the credentials as a kind of secret to the extension. A secret shouldn't be leaked to customers, partners, or anybody else. So where can the extension get the secret from? Here is where Azure Key Vault is used. Azure Key Vault is a cloud service that works as a secure secrets store. It provides centralized storage for secrets, enabling you to control access and distribution of the secrets.

> [!NOTE]
> For [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, the app key vault feature is only supported for AppSource extensions.

## Getting started

Getting extensions to use secrets from Azure Key Vault involves two areas of work: setting up and configuring Azure Key Vaults and developing the extensions to use secrets from Azure Key Vault.

### Setting up and configuring Azure Key Vaults

An extension can retrieve secrets from one or two different Azure Key Vaults. These key vaults must be created in Azure, and the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service configured to access key vaults. The setup process is different for online and on-premises. For more information, see:

- [Setting up App Key Vaults for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online](../administration/setup-app-key-vault.md)
- [Setting up App Key Vaults for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises](../administration/setup-app-key-vault-onprem.md)

### Developing the extensions to use secrets from Azure Key Vault

Once you have an Azure Key Vault, you can develop [!INCLUDE[prod_short](../developer/includes/prod_short.md)] extensions to retrieve secrets from the key vault. In short, this work involves specifying the key vault's URL and adding code to retrieve a secret from the key vault.

For more information, see [Using App Key Vault Secrets in Extensions](../developer/devenv-app-key-vault.md).

## See Also  

[Security Considerations With App Key Vaults](../developer/devenv-app-key-vault.md#security)  
[Monitoring and Troubleshooting App Key Vaults](../developer/devenv-app-key-vault.md#troubleshooting)  
[Configuring Business Central Server - Azure Key Vault Extensions](../administration/configure-server-instance.md#keyvault)  