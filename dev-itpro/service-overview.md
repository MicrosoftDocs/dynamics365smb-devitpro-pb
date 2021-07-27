---
title: Service Overview for Business Central Online
description: Find links to information about the underlying service's maintenance schedule, and the systems that make Business Central online a reliable platform to run your business on.
author: edupont04
ms.reviewer: na
ms.topic: overview
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 07/27/2021
---

# Service Overview for Business Central Online

[!INCLUDE [prod_long](includes/prod_long.md)] is a complete enterprise resource planning (ERP) software solution for mid-sized organizations that is fast to implement, easy to configure, and simple to use, both on-premises and online. [Sign up for a trial](/dynamics365/business-central/across-preview) before you decide to move to the cloud, and read this article to learn about the systems that make [!INCLUDE [prod_short](includes/prod_short.md)] online run as a service that you can bet your business on.  

## Lifecycle policy

[!INCLUDE [prod_short](includes/prod_short.md)] online is governed by [Microsoft's Modern Lifecycle Policy](https://support.microsoft.com/help/30881), which means continuous [service updates](#service-updates) and a major update every six months. For more information, see [Dynamics 365 Business Central Service Compliance](/dynamics365/business-central/compliance/compliance-service-compliance) and [Dynamics 365 release schedule and early access](/dynamics365/get-started/release-schedule).  

Get an overview of new and upcoming changes in the [Dynamics 365 release plans](/dynamics365/release-plans/).  

## Global availability

[!INCLUDE[prod_short](includes/prod_short.md)] online is available in a number of markets, and new countries go live on a quarterly basis. For more information, see [Countries and Translations Supported](compliance/apptest-countries-and-translations.md).  

## Built upon a foundation of trust, security, and compliance

On the [Service Trust](https://servicetrust.microsoft.com/) site, review the available independent audit reports for Microsoft's Cloud services. Find information about compliance with data protection standards and regulatory requirements, such as International Organization for Standardization (ISO), Service Organization Controls (SOC), and and international privacy standards.  

For example, you can find audit reports and certifications for ISO27001, ISO27018, or the SOC 2 Type II reports at [https://servicetrust.microsoft.com/](https://servicetrust.microsoft.com/).  

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

## Service Reliability Engineering (SRE)

<!--Why incidents occur and how to live with them -->

Microsoft ships weekly feature updates to the underlying service as well as targeted on-demand fixes to address service quality issues. The release process includes a comprehensive set of quality gates, including comprehensive code reviews, ad-hoc testing, automated component-based and scenario-based tests, feature flighting, and regional safe deployment. However, even with these safeguards, live site incidents can and do happen.  

Live site incidents can be divided into several categories:

* Dependent-service issues, such as Azure Active Directory (Azure AD), Azure SQL, Storage, virtual machine scale set, Service Fabric, and so on  

* Infrastructure outage, such as a hardware failure or data center failure  

* Configuration issues for [!INCLUDE [prod_short](includes/prod_short.md)] environments, such as insufficient capacity  

* Code regressions in [!INCLUDE [prod_short](includes/prod_short.md)] online  

* Customer-specific misconfiguration, such as bad queries or reports, or other types of problematic AL code  

Reducing the incident volume is one way to decrease live site burden and to improve customer satisfaction. However, doing so isn't always possible given that some of the incident categories are outside the [!INCLUDE [prod_short](includes/prod_short.md)] team's direct control. Furthermore, as the service footprint expands to support rapid growth in usage, the probability of an incident occurring due to external factors increases. High incident counts can occur even in cases where the [!INCLUDE [prod_short](includes/prod_short.md)] service has minimal service code regressions, and where the service has met or exceeded its Service Level Objective (SLO) for overall reliability of 99.95%, which has led the [!INCLUDE [prod_short](includes/prod_short.md)] team to devote significant resources to reducing incident costs to a level that is sustainable, by both financial and engineering measures.  

### Live site incident process

When investigating live site incidents, the [!INCLUDE [prod_short](includes/prod_short.md)] team follows a standard operational process that's common across Microsoft and the industry.  

The following image summarizes the standard live site incident handling lifecycle.  

:::image type="content" source="media/service-admin-site-reliability-engineering-model-04.png" alt-text="Visual showing the live site incident process handling lifecycle.":::

In the first phase, which is the **service monitoring** phase, the SRE team works with engineers, program managers, and the Senior Leadership Team to define Service Level Indicators (SLIs) and Service Level Objectives (SLOs) for both major scenarios and minor scenarios. These objectives apply to different metrics of the service, including scenario/component reliability, scenario/component performance (latency), and resource consumption. The live site team and product team then craft alerts that monitor Service Level Indicators (SLIs) against agreed upon targets. When violations are detected, an alert is triggered for investigation.  

In the second phase, which is the **incident response** phase, processes are structured to facilitate the following results:

* Prompt and targeted notification to customers of any relevant impact  
* Analysis of affected service components and workflows  
* Targeted mitigation of incident impact  

In the final phase, which is the **continuous improvement** phase, the team focuses on completion of relevant post-mortem analysis and resolution of any identified process, monitoring, or configuration or code fixes. The fixes are then prioritized against the team's general engineering backlog based on overall severity and risk of reoccurrence.  

## Our practices for service monitoring

The [!INCLUDE [prod_short](includes/prod_short.md)] team emphasizes a consistent, data-driven, and customer-centric approach to its live site operations. Defining Service Level Indicators (SLIs) and implementing corresponding live site monitoring alerts is part of the approval criteria for enabling any new [!INCLUDE [prod_short](includes/prod_short.md)] feature in production. Product group engineers also include steps for investigation and mitigation of alerts when they occur using a template Troubleshooting Guide (TSG).  

One way in which the [!INCLUDE [prod_short](includes/prod_short.md)] team enables exponential service growth is by using a Site Reliability Engineering (SRE) team. These individuals are skilled with service architecture, automation and incident management practices, and are embedded within incidents to drive end-to-end resolution. The approach contrasts with the rotational model where engineering leaders from the product group take on an incident manager role for only a few weeks per year. The SRE team ensures that a consistent group of individuals are responsible for driving live site improvements and ensuring that learnings from previous incidents are incorporated into future escalations. The SRE team also assists with large-scale drills that test Business Continuity and Disaster Recovery (BCDR) capabilities of the service.  

SRE practices also enforce alert quality in several ways, including the following:  

* Ensuring that TSGs include impact analysis and escalation policy  

* Ensuring that alerts execute for the absolute smallest time window possible for faster detection  

* Ensuring that alerts use reliability thresholds instead of absolute limits to scale clusters of different size  

### Our practices for incident response

When an automated live site incident is created for [!INCLUDE [prod_short](includes/prod_short.md)], one of the first priorities is to notify customers of potential impact. Azure has a target notification time of 15 minutes, which is difficult to achieve when notifications are manually posted by incident managers after joining a call. Communications in such cases are at risk of being late or inaccurate due to required manual analysis. Azure Monitoring offers centralized monitoring and alerting solutions that can detect impact to certain metrics within this time window.  

The [!INCLUDE [prod_short](includes/prod_short.md)] live site philosophy emphasizes automated resolution of incidents to improve overall scalability and sustainability of the service. The emphasis on automation enables mitigation at scale and can potentially avoid costly rollbacks or risky expedited fixes to production systems. When manual investigation is required, [!INCLUDE [prod_short](includes/prod_short.md)] adopts a tiered approach with initial investigation done by a dedicated SRE team. SRE team members are experienced in managing live site incidents, facilitating cross-team communication, and driving mitigation. In cases where the acting SRE team member requires more context on an impacted scenario/component, they may engage the Subject Matter Expert (SME) of that area for guidance. Finally, the SME team conducts simulations of system component failures to understand and to mitigate issues in advance of an active live site incident.  

Once the affected component/scenario of the service is determined, the [!INCLUDE [prod_short](includes/prod_short.md)] team has multiple techniques for quickly mitigating impact. Some of them are the following:

* **Activate side-by-side deployment infrastructure:** [!INCLUDE [prod_short](includes/prod_short.md)] supports running different versioned workloads in the same cluster, allowing the team to run a new (or previous) version of a specific workload for certain customers without triggering a full-scale deployment (or rollback). The approach can reduce mitigation time to 15 minutes and lower overall deployment risk.
* **Execute Business Continuity/Disaster Recovery (BCDR) process:** Allows the team to fail over primary workloads to this alternate environment in three minutes if a serious issue is found in a new service version. BCDR can also be used when environmental factors or dependent services prevent the primary cluster/region from operating normally.
* **Leverage resiliency of dependent services:** [!INCLUDE [prod_short](includes/prod_short.md)] proactively evaluates and invests in resiliency and redundancy efforts for all dependent services (such as SQL, Redis Cache, Key Vault). Resiliency includes sufficient component monitoring to detect upstream/downstream regressions as well as local, zonal, and regional redundancy (where applicable). Investing in these capabilities ensures that tooling exists for automatic or manual triggering of recovery operations to mitigate impact from an affected dependency.

### Our practices for continuous improvement

The [!INCLUDE [prod_short](includes/prod_short.md)] team reviews all customer-impacting incidents during a Weekly Service Review with representation from all engineering groups that contribute to the [!INCLUDE [prod_short](includes/prod_short.md)] service. The review disseminates key learnings from the incident to leaders across the organization and provides an opportunity to adapt our processes to close gaps and address inefficiencies.  

Prior to review, the SRE team prepares post-mortem content and identifies preliminary repair items for the live site team and product development team. Items may include code fixes, augmented telemetry, or updated alerts/TSGs. [!INCLUDE [prod_short](includes/prod_short.md)] SREs are familiar with many of these areas and often proactively make the adjustments in real time while responding to an active incident. Doing so helps to ensure that changes are incorporated into the system in time to detect reoccurrence of a similar issue. The detailed analysis by the live site team helps the product development team to design a more resilient, scalable, and supportable product.  

Beyond review of specific postmortems, the [!INCLUDE [prod_short](includes/prod_short.md)] team also generates reports on aggregate incident data to identify opportunities for service improvement such as future automation of incident mitigation or product fixes. The reporting combines data from multiple sources, including the customer support team, automated alerting, and service telemetry. The consolidated view provides visibility into those issues that are most negatively impacting service and team health, and the [!INCLUDE [prod_short](includes/prod_short.md)] team then prioritizes potential improvements based on overall ROI.  

### Release management and deployment process

[!INCLUDE [prod_short](includes/prod_short.md)] releases weekly feature updates to the service and on-demand targeted fixes to address service quality issues. The approach is intended to balance speed and safety. Any code change in [!INCLUDE [prod_short](includes/prod_short.md)] passes through various validation stages before being deployed broadly to external customers.  

Every change to the [!INCLUDE [prod_short](includes/prod_short.md)] code base passes through automated component and end-to-end tests that validate common scenarios and ensure that interactions yield expected results. In addition, [!INCLUDE [prod_short](includes/prod_short.md)] uses a Continuous Integration/Continuous Deployment (**CI/CD**) pipeline on main development branches to detect other issues that are cost-prohibitive to identify on a per-change basis. The CI/CD process triggers a full cluster build out and various synthetic tests that must pass before a change can enter the next stage in the release process. Approved CI/CD builds are deployed to internal test environments for more automated and manual validation before being included in each weekly feature update. The process means that a change will be incorporated into a candidate release within 1 to 7 days after it is completed by the developer.  

A feature update then passes through various official deployment rings of [!INCLUDE [prod_short](includes/prod_short.md)]'s safe deployment process. The updated product build is applied first to an internal cluster that hosts content for the [!INCLUDE [prod_short](includes/prod_short.md)] team followed by the internal cluster that is used by all employees across Microsoft. The changes wait in each of these environments prior to moving to the final step: production deployment. Here, the deployment team adopts a gradual rollout process that selectively applies the new build by region to allow for validation in certain regions prior to broad application.  

Scaling this deployment model to handle exponential service growth is accomplished in several ways, as the following bullets describe:  

* **Automation**: [!INCLUDE [prod_short](includes/prod_short.md)] deployments are essentially *zero-touch* with little to no interaction required by the deployment team. Prebuilt rollout specifications exist for multiple deployment scenarios. Deployment configuration is validated at build-time to avoid unexpected errors during live deployment roll-outs.  

* **Incident Response Process**: Deployment issues are handled like other live site incidents using techniques that are discussed in more detail in the other sections of this article. Engineers analyze issues with a focus on immediate mitigation and then follow up with relevant manual or automated process changes to prevent future reoccurrence.  

* **Feature Management/Exposure Control**: [!INCLUDE [prod_short](includes/prod_short.md)] applies a comprehensive framework for selectively exposing new features to customers. Feature exposure is independent of deployment cadences and allows code for new scenario code to be deployed in a disabled state until it has passed all relevant quality bars. In addition, new features can be exposed to a subset of the overall [!INCLUDE [prod_short](includes/prod_short.md)] population as an extra validation step prior to enabling globally. If an issue is detected, the [!INCLUDE [prod_short](includes/prod_short.md)] feature management service provides the ability to disable an offending feature in seconds without waiting for more time-consuming deployment rollback operations.  

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
