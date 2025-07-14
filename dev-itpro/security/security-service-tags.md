---
title: Use Azure security service tags
description: "List of Azure service tags for Dynamics 365 Business Central"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: article
ms.date: 01/30/2025
ms.reviewer: solsen
---

# Use Azure security service tags to restrict network access from/to Business Central

An Azure service tag represents a group of IP addresses from/to which traffic from a specific service may come, which allows you to set up firewalls for a specific service to allow only traffic from certain services. The **Dynamics365BusinessCentral** service tag enables administrators to restrict access from/to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] using firewall and network security group rules. The **Dynamics365BusinessCentral** service tag is automatically updated as this group of IP addresses changes over time, so administrators can avoid frequent updates to network security rules to keep up with those changes.

> [!NOTE]  
> The IP addresses included in the service tag are used by all [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environments. It's not possible to control traffic on a more granular scale, for example, using a dedicated IP address for a single environment or by filtering them to a specific region.

The group of IP addresses making up the service tag are available through the [Azure Management API](/rest/api/virtualnetwork/service-tags/list?tabs=HTTP) and as [downloadable JSON files](/azure/virtual-network/service-tags-overview#discover-service-tags-by-using-downloadable-json-files) to use for any systems that don't support service tags.

## Restrict Traffic from Business Central
Scenario: App Source app or PTE calling out to external services, either in Azure or behind a Customer Firewall

### Destination Service supports network access rules with Service Tags
Create a rule allowing traffic from the `Dynamics365BusinessCentral` service tag

### Destination Service is an Azure Storage Account in the same or a paired Azure region as the Business Central Environment
Create a Proxy Azure Function and restrict Storage Account network access to the Azure Function via Virtual network or Private endpoint. On the Azure Function, set up an [App Service service tag-based access restriction rule](/azure/app-service/app-service-ip-restrictions) allowing traffic from the `Dynamics365BusinessCentral` service tag.
This workaround is necessary due to a restriction of IP network rules for Storage Accounts, where requests to the storage account will originate from an internal IP address and not be affected by service tags applied to the storage account. Learn more [here](/azure/storage/common/storage-network-security?tabs=azure-portal#grant-access-from-an-internet-ip-range).

### Destination Service supports network access rules with IP Ranges
Obtain the list of Business Central's IPv4/IPv6 ranges, via Azure Powershell or [Azure Management API](/rest/api/virtualnetwork/service-tags/list?tabs=HTTP) or as [downloadable JSON files](/azure/virtual-network/service-tags-overview#discover-service-tags-by-using-downloadable-json-files)
``` powershell
$serviceTags = Get-AzNetworkServiceTag -Location eastus2
$serviceTag = $serviceTags.Values | Where-Object { $_.Name -eq "Dynamics365BusinessCentral" }
Write-Host "Change Number: $($serviceTag.properties.ChangeNumber)"
$serviceTag.Properties.AddressPrefixes | Format-List
```
Create rules to allow the IP ranges on the Destination Service network access rules

> [!TIP]
> The ChangeNumber property reflects the most recent update to a Service Tag's IP address ranges and could be used in automations to determine if the IP ranges have changed

## Restrict Traffic to Business Central
- A Network Security Group rule that allows 443 to the `AzureFrontDoor.Frontend` service tag
- A Network Security Group rule that allows 443 to the `Dynamics365BusinessCentral` service tag

Learn more about [service tags](/azure/virtual-network/service-tags-overview).

## Related information

[Security and protection](Security-and-Protection.md)  
