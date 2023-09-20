---
title: Service Overview for Business Central Online
description: Find links to information about the underlying service's maintenance schedule, and the systems that make Business Central online a reliable platform to run your business on.
author: jswymer
ms.reviewer: na
ms.topic: overview
ms.author: edupont
ms.date: 05/03/2023
---

# Service Overview for Business Central Online

[!INCLUDE [prod_long](includes/prod_long.md)] is a complete enterprise resource planning (ERP) software solution for mid-sized organizations that is fast to implement, easy to configure, and simple to use, both on-premises and online. [Sign up for a trial](/dynamics365/business-central/across-preview) before you decide to move to the cloud. Read this article to learn about the systems that make [!INCLUDE [prod_short](includes/prod_short.md)] online run as a service that you can bet your business on.  

## Lifecycle policy

[!INCLUDE [prod_short](includes/prod_short.md)] online is governed by [Microsoft's Modern Lifecycle Policy](https://support.microsoft.com/help/30881), which means continuous [service updates](#service-updates) and a major update every six months. For more information, see [Dynamics 365 Business Central Service Compliance](/dynamics365/business-central/compliance/compliance-service-compliance) and [Dynamics 365 release schedule and early access](/dynamics365/get-started/release-schedule).  

Get an overview of new and upcoming changes in the [Dynamics 365 release plans](/dynamics365/release-plans/).  

## Global availability

[!INCLUDE[prod_short](includes/prod_short.md)] online is available in many markets, and new countries/regions go live on a quarterly basis. For more information, see [Countries/regions and Translations Supported](compliance/apptest-countries-and-translations.md).  

For a visual overview of where [!INCLUDE [prod_short](includes/prod_short.md)] online is deployed, see the [Geographical availability](https://dynamics.microsoft.com/availability-reports/georeport/) site.  

## Built upon a foundation of trust, security, and compliance

On the [Service Trust](https://servicetrust.microsoft.com/) site, review the available independent audit reports for Microsoft's Cloud services. Find information about compliance with data protection standards and regulatory requirements:

* International Organization for Standardization (ISO)
* Service Organization Controls (SOC)
* International privacy standards  

For example, you can find audit reports and certifications for ISO27001, ISO27018, or the SOC 2 Type II reports.  

## Business continuity and disaster recovery (BCDR)

[!INCLUDE [prod_short](includes/prod_short.md)] online architecture and administration capabilities ensure uninterrupted access to your critical business data and processes. Automatic backups, built-in redundancy, and high availability protect your data and keep it accessible during and after a disruptive event. [!INCLUDE [prod_short](includes/prod_short.md)] has proactive BCDR strategies, processes, and technologies that minimize downtime and preserve important assets.

[!INCLUDE [prod_short](includes/prod_short.md)] uses the Azure cloud computing platform for its robust business continuity options that protect your critical workloads against disruptions. Azure's global network of regions keeps your data close to your geographic location, and provides options for recovering data in another region. Your data is available despite regional outages or disruptions. To learn more about Azure regions, go to [Azure Geographies](https://azure.microsoft.com/explore/global-infrastructure/geographies/#overview).

Administrators can use the [!INCLUDE [prod_short](includes/prod_short.md)] admin center to find the Azure region that their environments are in.

### Database and backups

[!INCLUDE [prod_short](includes/prod_short.md)] uses Azure SQL Database as the database technology for its environments. Azure SQL Database is a fully managed relational database service with built-in high availability, backups, and local and regional redundancy. To learn more about how Azure SQL Database keeps workloads running smoothly, go to [High availability for Azure SQL Database](/azure/azure-sql/database/high-availability-sla).

Azure SQL Database protects [!INCLUDE [prod_short](includes/prod_short.md)] production and sandbox environments by taking automatic backups that it keeps for 28 days. Administrators can use the [!INCLUDE [prod_short](includes/prod_short.md)] admin center to restore the environment to any specific point in time in the past 28 days. To learn more about restoring an environment, go to [Restoring an Environment in the Admin Center](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-backup-restore).

Administrators can also use the [!INCLUDE [prod_short](includes/prod_short.md)] admin center to recover deleted production or sandbox environments within seven days of their deletion. To learn more about recovering deleted environments, go to [Recover an environment](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments-delete#recover-an-environment).

### High availability through geographical redundancy

Each [!INCLUDE [prod_short](includes/prod_short.md)] environment is also protected by automatic geo-redundant backups. If a region experiences a full outage, Azure restores your data from the backup in another Azure region within the same Azure geography. Although it's rare, recovering data into another Azure region is a fully automated internal procedure that we practice regularly. It's a standard part of our internal audits and disaster recovery drills. To learn more about backups, go to [Automated backups in Azure SQL Database](/azure/azure-sql/database/automated-backups-overview).

[Azure availability zones](/azure/reliability/availability-zones-overview) provide extra resilience by offering physically separate data centers within an Azure region. Distributing resources across multiple availability zones achieves high availability for the compute and storage resources for [!INCLUDE [prod_short](includes/prod_short.md)]. During local failures or planned maintenance in one or more zones, tenants in the available zones aren't affected. Other tenants are automatically redirected to resources in the available zones in the same region. This option is enabled for all [!INCLUDE [prod_short](includes/prod_short.md)] production environments with paid [!INCLUDE [prod_short](includes/prod_short.md)] subscriptions.  

[!INCLUDE [prod_short](includes/prod_short.md)] is also designed with built-in redundancy, auto-scaling, and automatic load-balancing capabilities for its compute resources. To remain available if one or more of its compute instances fail, [!INCLUDE [prod_short](includes/prod_short.md)] runs on other instances. [!INCLUDE [prod_short](includes/prod_short.md)] supports rolling upgrades and automated OS image updates to apply patches, security updates, or new platform versions without downtime. Compute instances are always up to date and secure, which reduces vulnerability to threats and service interruptions.

## Service level agreements (SLA)

[!INCLUDE [service-terms](includes/service-terms.md)]

For more information about Azure SQL, see [High availability for Azure SQL Database and SQL Managed Instance](/azure/azure-sql/database/high-availability-sla).  

## Service updates

[!INCLUDE [service-updates](includes/service-updates.md)]

Administrators can set a maintenance window in which Microsoft can update each environment. For more information, see [Managing Updates in the Business Central Admin Center](administration/tenant-admin-center-update-management.md). Microsoft then schedules updates of the business functionality to be applied during these maintenance windows.  

An exception to this type of schedule is the continuous updates to the underlying service. The service components apply to multiple environments, such as all tenants in a region. So Microsoft schedules those updates to a time when traffic is lower in each region, typically during the evening or night. Typically, users don't notice service updates. [!INCLUDE [prod_short](includes/prod_short.md)] manages traffic so that people working in [!INCLUDE [prod_short](includes/prod_short.md)] aren't affected.  

## Service operations

[!INCLUDE[prod_short](includes/prod_short.md)] runs globally in many Microsoft Azure datacenters. All parts of the infrastructure and services are continually monitored and optimized to deliver the best possible experience. Most service operations and optimizations happen without users being aware of them. In some situations, user interaction is needed, like reconnecting to [!INCLUDE[prod_short](includes/prod_short.md)] or refreshing the browser. Users will be notified directly in the browser if any action is required on their part. Users are asked to take action before the optimizations are applied on the service. This way, they can continue to work without further interruptions. Service operations happen all day, every day, to always provide best experience.

## Service reliability engineering

Microsoft regularly ships feature updates to the underlying service and targeted on-demand fixes to address service quality issues. The release process includes a comprehensive set of quality gates:

* Thorough code reviews
* Ad-hoc testing
* Automated component-based and scenario-based tests
* Feature flighting
* Regional safe deployment

However, even with these safeguards, live site incidents can and do happen. Live site incidents can be divided into several categories:

* Dependent-service issues, such as Azure Active Directory (Azure AD), Azure SQL, Storage, virtual machine scale set, Service Fabric, and so on  

* Infrastructure outage, such as a hardware failure or data center failure  

* Configuration issues for [!INCLUDE [prod_short](includes/prod_short.md)] environments, such as insufficient capacity  

* Code regressions in [!INCLUDE [prod_short](includes/prod_short.md)] online  

* Customer-specific misconfiguration, such as bad queries or reports, or other types of problematic AL code  

Reducing the incident volume is one way to decrease live site burden and to improve customer satisfaction. However, it isn't always possible to so. For example, when incident categories are outside the [!INCLUDE [prod_short](includes/prod_short.md)] team's direct control. Also, as the service footprint expands to support rapid growth in usage, the probability of an incident occurring due to external factors increases. High incident counts can happen, even in cases where the [!INCLUDE [prod_short](includes/prod_short.md)] service has minimal service code regressions, and where the service has met or exceeded its Service Level Objective (SLO) for an overall reliability of 99.95%. The [!INCLUDE [prod_short](includes/prod_short.md)] team devotes significant resources to reducing incident costs to a level that is sustainable, by both financial and engineering measures.  

### Live site incident process

When investigating live site incidents, the [!INCLUDE [prod_short](includes/prod_short.md)] team follows a standard operational process that's common across Microsoft and the industry.  

The following diagram illustrates the main steps in the lifecycle of standard live site incident management.  

:::image type="content" source="media/service-overview-livesite.png" alt-text="Visual showing the live site incident process handling lifecycle.":::

In the first phase, which is the **service monitoring** phase, the development and operations (DevOps) team works with engineers, program managers, and the Senior Leadership Team to define Service Level Indicators (SLIs) and Service Level Objectives (SLOs) for both major scenarios and minor scenarios. These objectives apply to different metrics of the service, including scenario/component reliability, scenario/component performance (latency), and resource consumption. The live site team and product team then craft alerts that monitor Service Level Indicators (SLIs) against agreed upon targets. When violations are detected, an alert is triggered for investigation.  

In the second phase, which is the **incident response** phase, processes are structured to facilitate the following results:

* Prompt and targeted notification to customers  
* Analysis of affected service components and workflows  
* Targeted mitigation of incident impact  

In the final phase, which is the **continuous improvement** phase, the team focuses on completing a post-mortem analysis and resolution of any identified process, monitoring, or configuration or code fixes. Based on overall severity and risk of reoccurrence, the fixes are then prioritized against the team's general engineering backlog.  

### Our practices for service monitoring

The [!INCLUDE [prod_short](includes/prod_short.md)] team emphasizes a consistent, data-driven, and customer-centric approach to its live site operations. Defining Service Level Indicators (SLIs) and implementing live site monitoring alerts are part of the approval criteria for enabling any new [!INCLUDE [prod_short](includes/prod_short.md)] feature in production. Product group engineers also include steps for investigation and mitigation of alerts when they occur using a template Troubleshooting Guide (TSG).  

One way in which the [!INCLUDE [prod_short](includes/prod_short.md)] team enables exponential service growth is by using a DevOps team. These individuals are skilled with service architecture, automation and incident management practices, and are embedded within incidents to drive end-to-end resolution. The DevOps team uses a rotational model, where engineering leaders from the product group assume an incident manager role for a scheduled number of days. The DevOps team ensures that a consistent group of individuals drive live site improvements and incorporate learnings from previous incidents in future escalations. The DevOps team also assists with large-scale drills that test Business Continuity and Disaster Recovery (BCDR) capabilities of the service.  

DevOps practices also enforce alert quality in several ways:  

* TSGs include impact analysis and escalation policy  

* Alerts execute for the shortest time possible for faster detection  

* Alerts use reliability thresholds instead of absolute limits to scale clusters of different sizes  

### Our practices for incident response

When an automated live site incident is created for [!INCLUDE [prod_short](includes/prod_short.md)], one of the first priorities is to notify customers of potential impact. Azure's target notification time is 15 minutes. That target can be difficult to achieve, depending on the number of teams that are involved and the complexity of the incident. Communications in such cases are at risk of being late or inaccurate due to required manual analysis. Azure Monitoring offers centralized monitoring and alerting solutions that can detect impact to certain metrics within this time window.  

The [!INCLUDE [prod_short](includes/prod_short.md)] live site philosophy emphasizes automated resolution of incidents to improve overall scalability and sustainability of the service. The emphasis on automation enables mitigation at scale and can potentially avoid costly rollbacks or risky expedited fixes to production systems. When manual investigation is required, [!INCLUDE [prod_short](includes/prod_short.md)] adopts a tiered approach with initial investigation done by a dedicated DevOps team. DevOps team members are experienced in managing live site incidents, facilitating cross-team communication, and driving mitigation. In cases where the acting DevOps team member requires more context on an impacted scenario/component, they may engage the Subject Matter Expert (SME) of that area for guidance. Finally, the SME team conducts simulations of system component failures to understand and to mitigate issues in advance of an active live site incident.  

Once the affected component/scenario of the service is determined, the [!INCLUDE [prod_short](includes/prod_short.md)] team has multiple techniques for quickly mitigating impact. The following are some of the techniques:

* **Activate side-by-side deployment infrastructure:** [!INCLUDE [prod_short](includes/prod_short.md)] supports running different versioned workloads in the same cluster. That allows the team to run a new (or previous) version of a specific workload for certain customers without triggering a full-scale deployment (or rollback). The approach can reduce mitigation time and lower overall deployment risk.
* **Execute Business Continuity/Disaster Recovery (BCDR) process:** Allows the team to failover primary workloads to this alternate environment, typically within minutes, if there's a serious issue in a new service version. BCDR can also be used when environmental factors or dependent services prevent the primary cluster/region from operating normally.
* **Leverage resiliency of dependent services:** [!INCLUDE [prod_short](includes/prod_short.md)] proactively evaluates and invests in resiliency and redundancy efforts for all dependent services (such as SQL and Key Vault). Resiliency includes sufficient component monitoring to detect upstream/downstream regressions and local, zonal, and regional redundancy (where applicable). Investing in these capabilities ensures that tooling exists for automatic or manual triggering of recovery operations to mitigate impact from an affected dependency.

### Our practices for continuous improvement

The [!INCLUDE [prod_short](includes/prod_short.md)] team reviews all customer-impacting incidents during a Weekly Service Review. All engineering groups that contribute to the [!INCLUDE [prod_short](includes/prod_short.md)] service participate in the reviews. The review disseminates key learnings from the incident to leaders across the organization and provides an opportunity to adapt our processes to close gaps and address inefficiencies.  

Prior to review, the DevOps team prepares post-mortem content and identifies preliminary repair items for the live site team and product development team. Items may include code fixes, augmented telemetry, or updated alerts/TSGs. [!INCLUDE [prod_short](includes/prod_short.md)] DevOps teams are familiar with many of these areas. Typically, they'll make the adjustments in real time while they respond to an active incident. Doing so helps to ensure that changes are incorporated into the system in time to detect reoccurrence of a similar issue. The detailed analysis by the live site team helps the product development team to design a more resilient, scalable, and supportable product.  

Beyond review of specific postmortems, the [!INCLUDE [prod_short](includes/prod_short.md)] team also generates reports on aggregate incident data to identify opportunities for service improvement, For example, future automation of incident mitigation or product fixes. The reporting combines data from multiple sources, including the customer support team, automated alerting, and service telemetry. The consolidated view provides visibility into those issues that are most negatively impacting service and team health. The [!INCLUDE [prod_short](includes/prod_short.md)] team uses overall ROI to prioritize improvements.  

### Release management and deployment process

[!INCLUDE [prod_short](includes/prod_short.md)] releases weekly feature updates to the service and on-demand targeted fixes to address service quality issues. The approach is intended to balance speed and safety. Any code change in [!INCLUDE [prod_short](includes/prod_short.md)] passes through various validation stages before being deployed broadly to external customers.  

Every change to the [!INCLUDE [prod_short](includes/prod_short.md)] code base passes through automated component and end-to-end tests. These tests validate common scenarios and ensure that interactions yield expected results. In addition, [!INCLUDE [prod_short](includes/prod_short.md)] uses a Continuous Integration/Continuous Deployment (**CI/CD**) pipeline on main development branches to detect other issues that are cost-prohibitive to identify on a per-change basis. The CI/CD process triggers a full cluster build out and various synthetic tests that must pass before a change can enter the next stage in the release process. Approved CI/CD builds are deployed to internal test environments for more automated and manual validation before they're included in weekly feature updates. The process means that a change will be incorporated into a candidate release within 1 to 7 days after it's complete.  

A feature update then passes through various official deployment rings of [!INCLUDE [prod_short](includes/prod_short.md)]'s safe deployment process. The updated product build is applied first to an internal cluster that hosts content for the [!INCLUDE [prod_short](includes/prod_short.md)] team, followed by the internal cluster that all employees across Microsoft use. The changes wait in each of these environments prior to moving to the final step: production deployment. Here, the deployment team adopts a gradual rollout process. The process selectively applies the new build by region to allow for validation in one region prior to broad application.  

Scaling this deployment model to handle exponential service growth is accomplished in several ways, as the following bullets describe:  

* **Automation**: [!INCLUDE [prod_short](includes/prod_short.md)] deployments are essentially *zero-touch* with little to no interaction required by the deployment team. Prebuilt rollout specifications exist for multiple deployment scenarios. Deployment configuration is validated at build-time to avoid unexpected errors during live deployment roll-outs.  

* **Incident Response Process**: Deployment issues are handled like other live site incidents using techniques that are discussed in more detail in the other sections of this article. Engineers analyze issues with a focus on immediate mitigation. They then follow up with manual or automated process changes to prevent reoccurrence.  

* **Feature Management/Exposure Control**: [!INCLUDE [prod_short](includes/prod_short.md)] applies a comprehensive framework for selectively exposing new features to customers. Feature exposure is independent of deployment cadences. It allows code for new scenarios to be deployed in a disabled state until it has passed all quality bars. Also, new features can be exposed to a subset of the overall [!INCLUDE [prod_short](includes/prod_short.md)] population as an extra validation step prior to enabling them globally. If an issue is detected, the [!INCLUDE [prod_short](includes/prod_short.md)] feature management service lets you disable features in seconds, without waiting for more time-consuming deployment rollback operations.  

These features have enabled the [!INCLUDE [prod_short](includes/prod_short.md)] team to improve the success rate of deployments while absorbing a high year-over-year growth in monthly deployments.  

## See also

[FAQ for Dynamics 365 Business Central](faq.yml)  
[Administration of Business Central Online](administration/tenant-administration.md)  
[Technical Support for Business Central](technical-support.md)  
[Escalating support issues to Microsoft](administration/manage-technical-support.md#escalating-support-issues-to-microsoft)  
[Data and access when a trial or subscription ends](administration/tenant-administration.md#expire)  
[Azure global infrastructure](https://azure.microsoft.com/global-infrastructure)  
[Azure reliability](https://azure.microsoft.com/features/reliability/)  
[Microsoft Service Trust](https://servicetrust.microsoft.com/)  

[!INCLUDE [footer-banner](includes/footer-banner.md)]
