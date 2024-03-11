---
title: Service scalability for Business Central online
description: Learn about Business Central online ability to provide resource elasticity through real-time data driven autoscaling and dynamic load distribution to support these needs.
author: dmc-dk
ms.author: dmitrych 
ms.reviewer: jswymer
ms.topic: conceptual 
ms.collection: 
ms.date: 02/22/2024
ms.custom: bap-template
---
# Service scalability for Business Central online

Microsoft Dynamics 365 Business Central online is a modern, global, robust, and scalable solution for small and mid-sized organizations, providing resource elasticity to support current and future demands of modern businesses.

Business Central online manages diverse customers of different sizes and complexity, with load patterns fluctuating based on the time of the day, seasonality, the number of active users, active external integrations, and various other factors. One of the key strengths of Business Central online is its ability to provide resource elasticity through real-time data driven autoscaling and dynamic load distribution to support these needs.

Telemetry shows that 99.81% of the execution time (measured by the user session minutes) is performed on the compute nodes with ample resources.  

To contextualize a figure such as 99.81%, let’s consider an example.  

Assume a user works with Business Central for 4 hours daily, Monday through Friday, resulting in 20 hours of work weekly, which is equivalent to 1,200 minutes.

During only 0.19% (or 2 minutes and 20 seconds) of these 1,200 minutes, the user's session might potentially encounter some slowdowns when running on a compute node that exceeds the expected threshold of available resources.

Historical data also shows a very high degree of database scaling efficiency. 99.85% of all databases had enough resources and never exceeded safe thresholds. Only 0.05% of databases were running above the safe thresholds for longer than 1% of the time. Business Central team is constantly monitoring these metrics and tuning the scaling and balancing algorithms to get even better results.  

<!--
## Business continuity and disaster recovery (BCDR)

Business Central online financially guarantees 99,9% up-time for its paid production environments, where customers are entitled to financial compensation if the service does not deliver on this promise. Built-in redundancy implemented on many levels of the service, automated failover and rollback mechanisms, rigid and granular backup policy, as well as historical data, show that it has been able to consistently maintain this level of availability. Read how Business Central online supports business continuity here.  -->

## Throughput  

Within a typical working week, the service manages over 2B API calls, close to 1B UI interactions, and nearly 4B server sessions.

ERP processes are typically complex and varied, employing diverse configurations, data distribution, extensions, and other parameters. To gauge an online service's capability in handling such workloads, it’s most effective to consider data from similar customers already utilizing the service. Business Central facilitates this by collecting telemetry data in a manner that prioritizes customer privacy—customer information is fully anonymized, and no specific customer data is disclosed. Nevertheless, the collected data offers insights into the statistics and counts of scenarios exercised. It reveals the frequency and scale of various processes and the number of records involved, without possibility of tracing these results to specific customers. This approach allows for a comprehensive understanding of the service's performance without compromising the confidentiality of individual customer data.

In the context of Business Central, these needs might, for example, involve creating and posting documents, handling web service calls, managing UI interactions, overseeing scheduled tasks, and many other activities. Business Central helps customers and partners get even higher throughput, by following the best practices described in the online documentation at <https://aka.ms/bcperformance> and supported by a broad range of tools and telemetry.

The following are real-life examples of such workloads measured per single environment, for a selection of customers already running in Business Central online.

> [!NOTE]
> The volumes presented in this document should be considered as a sample selection of what the service handles today. They're not the highest measurements observed in the service or the limits of what the service can handle.

### Create sales or purchase orders

Customers in Business Central generate sales and purchase orders through a range of methods, including manual input, automated processes such as synchronization with e-commerce portals, and various other methods like import/export functionalities or integration with Microsoft or non-Microsoft applications.

For more information, see [Posting Documents and Journals](/dynamics365/business-central/ui-post-documents-journals).

#### Real-life, per-environment measurements (telemetry for a selection of customers)

- 8,000 sales orders created in 1 hour, with a total of 60,000 lines
- 4,000 sales orders created in 1 hour, with a total of 150,000 lines
- 200 purchase orders created in 1 hour, with a total of 250 lines
- 1,440 purchase orders created in 8 hours, with a total of 10,000 lines

### Post sales invoices

In Dynamics 365 Business Central, posting sales documents refers to the formal confirmation and updating of financial records (ledgers) associated with completed sales transactions, reflecting accurate accounting and inventory adjustments. 

For more information, see [Posting Documents and Journals](/dynamics365/business-central/ui-post-documents-journals).

#### Real-life, per-environment measurements (telemetry for a selection of customers): 

- 5,000 sales invoices posted in 1 hour 
- 2,500 sales invoices posted in 1 hour, with a total of 120,000 lines of Type: Item 
- 52,500 invoices posted in one day, with a total of 2.6-M lines of Type: Item 
- 2,880 sales orders shipped and invoiced in one day, with a total of 14,500 lines of Type: Item 
- 256,000 General Journal lines posted in one day

## Users  

Business Central customers exhibit considerable variability in the number of users working with the product. Business Central online doesn't have a fixed operational limit on the number of users.  

While the average Business Central online customer has 20-30 full users, there are thousands of online customers with more than 100 users, including customers running with well over 1,000 users, underscoring the system's adaptability to diverse user demands and organizational sizes. In 2023, Business Central online experienced 105% YoY growth of the number of customers with more than 100 paid users. 

Multi-country or international SMB organizations, with representative branches and offices running in different countries/regions around the world, might have many thousands of users registered in their Microsoft Entra tenant. However, Business Central's geographically distributed multitenant service deploys database and compute resources in the Azure region close to or directly within the country/region selected by the administrators for a specific Business Central environment. Therefore, users of these organizations working with one environment don't compete for resources with users working in another environment (in another or the same country/region). It's therefore common for larger organizations to scale their operations by adding more Business Central environments.

In addition to resource governance benefits, organizing different business branches into separate environments has multiple operational advantages. Some examples include independent update cadence, more granular user access and security, using a different set of apps, more granular data backup and restore scope, copying an environment to another one for troubleshooting, and many other advantages.  

## Web Services  

The operational limits for an online service refer to predefined thresholds or constraints that govern various aspects of the system's functionality. These limits are set to keep a balance between system efficiency and user experience. They guide users, administrators, and developers in optimizing their use of the online service while ensuring its overall stability and performance. 

Operational limits for web services encompass various aspects such as the maximum payload size, number of concurrent requests per user, and the frequency of API calls allowed within a specific time frame.  

Business Central applies the following operational limits to the web service requests:  

|Measurement|Limit|
|-|-|
|Speed rate |6,000 requests per 5-minute sliding window per user |
|Concurrency|5 concurrent requests, plus 95 queued per user |
|Payload size|350 MB per request|

For more information, see [Operational limits](administration/operational-limits-online.md#ODataServicesUser).

In January 2024, telemetry shows that only a small fraction of customers’ API calls (0.32%) are being affected (throttled) by our rate limits.  

In such cases, customers can increase throughput by distributing their web services workloads across multiple users, either named users or Microsoft Entra Applications (depending on the licensing requirements).  
For example, if a customer's e-commerce portal needs to make 42,000 requests per 5-minute window, this could be accomplished by distributing these requests across 7 Microsoft Entra Applications (7 * 6,000 = 42,000 web service requests).

### Web service calls 

Business Central APIs facilitate integration and extend the functionality of the system, allowing businesses to interact with different aspects of the solution programmatically. Businesses often leverage Business Central APIs to integrate the system with other applications, like e-commerce platforms, business intelligence tools, automated workflows, and so on. 

For more information, see [SOAP and ODATA web services](webservices/web-services.md).

#### Real-life, per-environment measurements (telemetry for a selection of customers)

- 10,000,000 calls in one day  
- 1,000,000 calls in one hour (277 per second on average)  
- 25,000 calls in one minute (416 per second on average) 

## Scheduled tasks (Job Queues)  

Operational limits for scheduled tasks (also referred to as Job Queues) provide customers with an option to increase throughput by engaging more users while keeping controlled execution of automated processes. Business Central allows a maximum of five scheduled tasks that can be concurrently run by a single user. The more users configured to run the scheduled tasks, the more tasks they can concurrently execute.  

### Scheduled tasks (real-life measurements, per environment) 

Job queues in Business Central serve as a mechanism for automating and scheduling recurring processes within the system. These tasks are designed to periodically execute specific operations, such as data calculations, processing, report generation, and many others, at predetermined intervals without requiring manual intervention. 

|Measurement|Limit|
|-|-|
|Concurrency|5 concurrent requests per user |

For more information, see [Schedule jobs to run automatically](/dynamics365/business-central/admin-job-queues-schedule-tasks).

#### Real-life, per-environment measurements (telemetry for a selection of customers): 

- 350,000 in one day  
- 15,000 in one hour (4 per second on average)   
- 300 in one minute (5 per second on average) 

## Storage  

In Business Central online, customers are provided with a default storage quota that is shared by all environments associated with a customer's Microsoft Entra ID, with per-user quota added to it. There's a possibility of buying more capacity if needed, however, there's no operational limit for database size. While most databases in Business Central online fleet are less than 100 GB, many databases exceed the 100-GB mark, and some databases are notably larger, going above 1 TB of compressed data. Many of the large databases come from the customers migrating from on-premises solutions to Business Central online. In January 2024 alone, telemetry shows many cases of customers migrating databases of >250 GB, with some measuring up to 500-600 GB of data.

[Learn more about storage](administration/tenant-admin-center-capacity.md).

## See also

[Service overview](service-overview.md)
[Service operations](service-operations.md)
