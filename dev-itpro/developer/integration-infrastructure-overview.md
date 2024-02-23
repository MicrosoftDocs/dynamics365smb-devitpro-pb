---
title: Integrating with infrastructure services
description: Learn how Business Central integrates with infrastructure services.
author: kennienp
ms.reviewer: solsen
ms.topic: overview
ms.author: kepontop
ms.date: 02/20/2024
---

# Integrating Business Central with infrastructure services

[!INCLUDE[prod_short](../includes/prod_short.md)] integrate to a few fundamental infrastructure services for operations such as authentication, authoriation, auditing, telemetry, and printing.

Here are some supported integrations between Business Central and fundamental services:

- [!INCLUDE[microsoft_entra_name](includes/m365-entra-name.md)]
- [!INCLUDE[azure_security_service_tags_name](includes/azure-security-service-tags-name.md)]
- [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)]
- [!INCLUDE[m365_universal_print](../includes/universal-print-name.md)]


## Manage authentication and authorization with [!INCLUDE[microsoft_entra_name](includes/m365-entra-name.md)]

[!INCLUDE[microsoft_entra_name](includes/m365-entra-name.md)] is used for authenticating users for [!INCLUDE[prod_short](../includes/prod_short.md)].

You can use [!INCLUDE[microsoft_entra_name](includes/m365-entra-name.md)] to do the following tasks:

- [Manage users and licenses in online tenants](/dynamics365/business-central/ui-how-users-permissions#manage-users-and-licenses-in-online-tenants) 
- [Setup Multi-Factor Authentication (MFA)](../security/multifactor-authentication.md)  
- Manage authorization across Microsoft services. For more information, see [Control Access to Business Central Using Security Groups](/dynamics365/business-central/ui-security-groups).


## Restrict network access from/to [!INCLUDE [prod_short](includes/prod_short.md)] with [!INCLUDE[azure_security_service_tags_name](includes/azure-security-service-tags-name.md)]

An Azure service tag represents a group of IP addresses from/to which traffic from a specific service may come, which allows you to set up firewalls for a specific service to allow only traffic from certain services. The **Dynamics365BusinessCentral** service tag enables administrators to restrict access from/to [!INCLUDE [prod_short](includes/prod_short.md)] using firewall and network security group rules.

For more information, see [Use Azure security service tags to restrict network access from/to Business Central](../security/security-service-tags.md).


## Get usage, error, and performance telemetry with [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)]

You can integrate [!INCLUDE[prod_short](includes/prod_short.md)] with [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] by enabling the telemetry feature. With telemetry, system owners can look at usage and lifecycle operations of environments/apps, diagnose problems, and analyze operations that affect performance.

:::image type="content" source="media/telemetry-architecture.svg" alt-text="Shows how Environment-level telemetry and App/extension-level telemetry works in Business Central AL" lightbox="media/telemetry-architecture.svg":::

For more information, see [Monitoring and Analyzing Telemetry in Azure Application Insights](../administration/telemetry-overview.md).


## Print to local printers with [!INCLUDE[m365_universal_print](../includes/universal-print-name.md)]

Universal Print is a Microsoft 365 subscription-based service that runs entirely on Microsoft Azure. It gives you centralized printer management for local printers through the Universal Print portal. Business Central makes printers set up in Universal Print available to client users through the Universal Print Integration extension.

:::image type="content" source="/dynamics365/business-central/media/Universal-Print-arch.png" alt-text="Shows how Microsoft 365 Universal Print works with Business Central" lightbox="/dynamics365/business-central/media/Universal-Print-arch.png":::

For more information, see [Set Up Universal Print Printers](/dynamics365/business-central/admin-printer-setup-universal-print).



<!-- Purview goes here when live in docs -->


## See also

[Manage users and licenses with Microsoft Entra](/dynamics365/business-central/ui-how-users-permissions#manage-users-and-licenses-in-online-tenants)  
[Setup Multi-Factor Authentication (MFA) with Microsoft Entra](../security/multifactor-authentication.md)  
[Control Access to Business Central Using with Microsoft Entra Security Groups](/dynamics365/business-central/ui-security-groups)  
[Restrict network access from/to Business Central Azure security service tags](../security/security-service-tags.md)  
[Integrating Business Central with Azure Application Insights](../administration/telemetry-overview.md)   
[Integrating Business Central with Microsoft 365 Universal Print](/dynamics365/business-central/admin-printer-setup-universal-print)  
[Integration overview for Business Central online](integration-overview.md)  