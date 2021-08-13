---
title: Service Overview for Business Central Online
description: Find links to information about the underlying service's maintenance schedule, and the systems that make Business Central online a reliable platform to run your business on.
author: edupont04
ms.reviewer: na
ms.topic: overview
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 04/01/2021
---

# Service Overview for Business Central Online

[!INCLUDE [prod_long](includes/prod_long.md)] is a complete enterprise resource planning (ERP) software solution for mid-sized organizations that is fast to implement, easy to configure, and simple to use, both on-premises and online. [Sign up for a trial](/dynamics365/business-central/across-preview) before you decide to move to the cloud, and read this article to learn about the systems that make [!INCLUDE [prod_short](includes/prod_short.md)] online run as a service that you can bet your business on.  

## Lifecycle policy

[!INCLUDE [prod_short](includes/prod_short.md)] online is governed by [Microsoft's Modern Lifecycle Policy](https://support.microsoft.com/help/30881), which means continuous [service updates](#service-updates) and a major update every six months. For more information, see [Dynamics 365 Business Central Service Compliance](/dynamics365/business-central/compliance/compliance-service-compliance) and [Dynamics 365 release schedule and early access](/dynamics365/get-started/release-schedule).  

Get an overview of new and upcoming changes in the [Dynamics 365 release plans](/dynamics365/release-plans/).  

## Global availability

[!INCLUDE[prod_short](includes/prod_short.md)] online is available in a number of markets, and new countries go live on a quarterly basis. For more information, see [Countries and Translations Supported](compliance/apptest-countries-and-translations.md).  

## Built upon a foundation of trust, security, and compliance

On the [Service Trust](https://servicetrust.microsoft.com/) site, review the available independent audit reports for Microsoft's Cloud services. Find information about compliance with data protection standards and regulatory requirements, such as International Organization for Standardization (ISO), Service Organization Controls (SOC), National Institute of Standards and Technology (NIST), Federal Risk and Authorization Management Program (FedRAMP), and the General Data Protection Regulation (GDPR).  

For example, you can find audit reports and certifications for ISO27001, ISO27018, ISO27017, ISO 27701, or the SOC 2 Type II reports at [https://servicetrust.microsoft.com/](https://servicetrust.microsoft.com/).  

### Databases and backups

[!INCLUDE [prod_short](includes/prod_short.md)] online runs on Azure and uses [Azure SQL Database](/azure/azure-sql/azure-sql-iaas-vs-paas-what-is-overview) as the database that stores your data. A tenant's data is stored at rest in the Azure region that is closest to their geographical location. Administrators can always find the exact Azure region that hosts their environments in the [!INCLUDE [prod_short](includes/prod_short.md)] administration center. For an overview of Azure geographies and regions, see the [Azure global infrastructure](https://azure.microsoft.com/global-infrastructure) site.  

[!INCLUDE [database-backup](includes/database-backup.md)]

Your data is safe with us. Should anything go wrong, different resources within Microsoft take action. If an Azure region is temporarily unavailable, for example, the customers' data is preserved using automatic geo-redundant backups, so your data becomes available again once the Azure region is back online. All these steps are triggered automatically. Read a general description of how Azure maintains their service level agreements at [High availability for Azure SQL Database and SQL Managed Instance](/azure/azure-sql/database/high-availability-sla). In extreme cases, such as if the region would be expected to be offline longer, we would start the process of restoring the data from the various [!INCLUDE [prod_short](includes/prod_short.md)] environments geo-redundant backups into another region within the same geography. Although such cases happen rarely, recovering data into another Azure region is a standard, well-described internal procedure, which we practice regularly as a part of our audits and internal drills.  

Similarly, we apply automated tasks for performance tuning, high availability, disaster recovery, and backups. For more information about these types of task, see the [Azure SQL docs](/azure/azure-sql/azure-sql-iaas-vs-paas-what-is-overview).  

## Service level agreements (SLA)

[!INCLUDE [service-terms](includes/service-terms.md)]

For more information about Azure SQL, see [High availability for Azure SQL Database and SQL Managed Instance](/azure/azure-sql/database/high-availability-sla).  

## Service updates

[!INCLUDE [service-updates](includes/service-updates.md)]

For each environment, administrators can set a maintenance window for when Microsoft is allowed to update that environment. For more information, see [Managing Updates in the Business Central Admin Center](administration/tenant-admin-center-update-management.md). Microsoft then schedules updates of the business functionality to be applied during these maintenance windows.  

An exception to this type of schedule is the continuous updates to the underlying service. The service components apply to multiple environments, such as all tenants in a region. So Microsoft schedules those updates to a time when traffic is lower in each region, typically during the evening or night. Typically, these service updates are transparent to any users, as the service is designed to manage traffic in a way that any users still working in [!INCLUDE [prod_short](includes/prod_short.md)] are not affected by these service updates.  

## Service operations

[!INCLUDE[prod_short](includes/prod_short.md)]  runs globally in many Microsoft Azure datacenters. All parts of the infrastructure and services are continually monitored and optimized to deliver the best possible experience. Most service operations and optimizations happen without users being aware of them. In some situations, user interaction is needed, like reconnecting to [!INCLUDE[prod_short](includes/prod_short.md)] or refreshing the browser. Users will be notified directly in the browser if any action is required on their part. Service operations happen all day, every day, to always provide best experience.

## See also

[FAQ for Dynamics 365 Business Central](faq.yml)  
[Administration of Business Central Online](administration/tenant-administration.md)  
[Technical Support for Business Central](technical-support.md)  
[Escalating support issues to Microsoft](administration/manage-technical-support.md#escalating-support-issues-to-microsoft)  
[Data and access when a trial or subscription ends](administration/tenant-administration.md#expire)  
[Azure global infrastructure](https://azure.microsoft.com/global-infrastructure)  
[Azure reliability](https://azure.microsoft.com/features/reliability/)  
[Microsoft Service Trust](https://servicetrust.microsoft.com/)  
