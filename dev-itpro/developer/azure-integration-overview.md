---
title: Integrating with Azure services
description: Learn how to integrate Business Central with Azure services.
author: kennienp
ms.reviewer: solsen
ms.topic: overview
ms.author: kepontop
ms.date: 02/07/2024
---

# Integrating Business Central with Azure services

[!INCLUDE[prod_short](../includes/prod_short.md)] supports multiple integrations to Azure services from AL apps/extensions, both build into the AL runtime and from codeunits in the System Application. All integrations from AL code are implemented using the HttpClient datatype.

:::image type="content" source="media/connect-to-azure-services.svg" alt-text="Shows how AL apps/extensions can call Azure services from Business Central" lightbox="media/connect-to-azure-services.svg":::

Here are some supported integrations between Business Central and Azure services:

- [!INCLUDE[azure_blob_services](includes/azure-blob-services-name.md)]
- [!INCLUDE[azure_file_services](includes/azure-file-services-name.md)]
- [!INCLUDE[azure_functions](includes/azure-functions-name.md)]
- [!INCLUDE[azure_key_vault](includes/azure-keyvault-name.md)]
- Azure Open AI Service

## [!INCLUDE[azure_blob_services](includes/azure-blob-services-name.md)]

Connect to and work with storage accounts, containers, and blobs from Azure Blob Storage in your AL code. The module works as a wrapper of the [!INCLUDE[azure_blob_services](includes/azure-blob-services-name.md)] REST API. 

As an AL developer, you can use the module to do the following tasks:

- Create, delete, and list containers in storage accounts.
- Build a tool for uploading and downloading BLOBs to and from Azure Blob Storage.
- Manipulate data stored in Azure Blob Storage.

For more information, see [Azure Blob Services API](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Blob%20Services%20API).  

## [!INCLUDE[azure_file_services](includes/azure-file-services-name.md)]

Use [!INCLUDE[azure_file_services](includes/azure-file-services-name.md)] to take advantage of a fully managed file share service in the cloud. The [!INCLUDE[azure_file_services](includes/azure-file-services-name.md)] API module provides you with all the procedures you need to manage your [!INCLUDE[azure_files](includes/azure-files-name.md)] in [!INCLUDE[prod_short](includes/prod_short.md)]. [!INCLUDE[azure_files](includes/azure-files-name.md)] offers fully managed file shares in the cloud that are accessible via the industry standard Server Message Block (SMB) protocol, Network File System (NFS) protocol, and [!INCLUDE[azure_files](includes/azure-files-name.md)] REST API.

The [!INCLUDE[azure_file_services](includes/azure-file-services-name.md)] API module uses the REST API to provide you with all the procedures you need to manage your [!INCLUDE[azure_files](includes/azure-files-name.md)] in [!INCLUDE[prod_short](includes/prod_short.md)]. Azure file shares can be mounted by cloud or on-premises deployments for easy access to your [!INCLUDE[prod_short](includes/prod_short.md)] files. For directories in Azure File Share Services, use AL to list, create, delete, and rename them. For files in the directories, use AL to create, delete, upload, download, copy, and rename them. 

For more information, see [Azure File Services API](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20File%20Services%20API).  

## [!INCLUDE[azure_functions](includes/azure-functions-name.md)]

The [!INCLUDE[azure_functions](includes/azure-functions-name.md)] service is commonly used when migrating on-premises [!INCLUDE[prod_short](includes/prod_short.md)] installations using .NET Interoperability to the online service. For more information, see [Using Azure Functions with Dynamics 365 Business Central](/learn/modules/use-azure-functions/).

To make it easy to use [!INCLUDE[azure_functions](includes/azure-functions-name.md)] from [!INCLUDE[prod_short](includes/prod_short.md)], the System Application includes the *Azure Function* codeunit with methods to connect to the service and call functions. For more information, see [Azure Function codeunit](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Function) . 

When using the *Azure Function* codeunit from the System Application, you get data about the success or failure of function calls in telemetry. For more information, see [Azure Function telemetry](../administration/telemetry-azure-function-integration-trace.md).

## [!INCLUDE[azure_key_vault](includes/azure-keyvault-name.md)]

If your app/extension needs to store and use secrets, such as certificates or credentials for external services, it's good security practice to store these secrets in [!INCLUDE[azure_key_vault](includes/azure-keyvault-name.md)] and not in the app source code or app package itself. For more information, see [Using Azure Key Vaults with apps/extensions](devenv-app-key-vault-overview.md).

When using [!INCLUDE[azure_key_vault](includes/azure-keyvault-name.md)] from your AL code, you get data about the success or failure of usage in telemetry. For more information, see [Azure Key Vault telemetry](../administration/telemetry-extension-key-vault-trace.md).

## Azure Open AI Service

You can integrate [!INCLUDE[prod_short](../includes/prod_short.md)] apps/extensions with the Azure Open AI Service to include copilot and generative AI experiences. For more information, see [Integrating AI using Developer Tools for Copilot](../developer/ai-integration-landing-page.yml).

## See also

[Azure Blob Services API](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Blob%20Services%20API)  
[Azure File Services API](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20File%20Services%20API)  
[Azure Function codeunit](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Function)  
[Azure Function telemetry](../administration/telemetry-azure-function-integration-trace.md)  
[Using Azure Key Vault with apps/extensions](devenv-app-key-vault-overview.md)  
[Azure Key Vault telemetry](../administration/telemetry-extension-key-vault-trace.md)  
[Using Azure Functions with Dynamics 365 Business Central](/learn/modules/use-azure-functions/)  
[Integrating AI using Developer Tools for Copilot](../developer/ai-integration-landing-page.yml)  
