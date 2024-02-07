---
title: Integrating with Azure services
description: Learn how to integrate Business Central with Azure services
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
- [!INCLUDE[azure_key_vault](includes/azure-keyvault-name.md)]
- [!INCLUDE[azure_functions](includes/azure-functions-name.md)]


## [!INCLUDE[azure_key_vault](includes/azure-keyvault-name.md)]

If your app/extension need to store and use secrets such as certificates or credentials for external services, it is considered good security practices to store these secrets in [!INCLUDE[azure_key_vault](includes/azure-keyvault-name.md)] and not in the app source code or app package itself. For more information, see [Using Azure Key Vaults with apps/extensions](devenv-app-key-vault-overview.md).

When using [!INCLUDE[azure_key_vault](includes/azure-keyvault-name.md)] from your AL code, you get data about the success or failure of usage in telemetry. For more information, see [Azure Key Vault telemetry](../administration/telemetry-extension-key-vault-trace.md).


## [!INCLUDE[azure_functions](includes/azure-functions-name.md)]

The [!INCLUDE[azure_functions](includes/azure-functions-name.md)] service is commonly used when migrating on-premises [!INCLUDE[prod_short](includes/prod_short.md)] installations using .NET Interoperability to the online service. For more information, see [Using Azure Functions with Dynamics 365 Business Central](/learn/modules/use-azure-functions/).

To make it easy to use [!INCLUDE[azure_functions](includes/azure-functions-name.md)] from [!INCLUDE[prod_short](includes/prod_short.md)], the System Application includes the *Azure Function* codeunit with methods to connect to the service and call functions. For more information, see [Azure Function codeunit](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Function)  

When using the *Azure Function* codeunit from the System Application, you get data about the success or failure of function calls in telemetry. For more information, see [Azure Function telemetry](administration/telemetry-azure-function-integration-trace.md).


## See also

[Using Azure Key Vault with apps/extensions](devenv-app-key-vault-overview.md)  
[Azure Key Vault telemetry](../administration/telemetry-extension-key-vault-trace.md)  
[Using Azure Functions with Dynamics 365 Business Central](/learn/modules/use-azure-functions/)  
[Azure Function codeunit](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Azure%20Function)  
[Azure Function telemetry](../administration/telemetry-azure-function-integration-trace.md)  