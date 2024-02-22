---
title: Concept topic template #Required; page title displayed in search results. Don't enclose in quotation marks.
description: Concept description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: kfend #Required; Microsoft alias of content publishing team member.
ms.topic: conceptual #Required; don't change.
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 02/22/2024
ms.custom: bap-template #Required; don't change.
---

# Scalability

In the rapidly evolving landscape of technology-driven businesses, finding a business management solution that seamlessly adapts to your organization's growth is paramount. Modern SMBs are looking for a solution that doesn't just meet but anticipates the evolving needs of businesses in today's dynamic marketplace. 
Microsoft Dynamics 365 Business Central Online is a cloud-based ERP software solution for small and mid-sized organizations. It was launched in April 2018 and has since onboarded more than 30K customers working in professional services, consumer goods, manufacturing, retail, health, hospitality, transport and logistics, finance, and dozens more industries. It has become a mature, battle-tested solution that understands the intricacies of modern business operations in the areas of security, scalability, performance, resilience, and high availability. Business Central is running globally in 174 countries, out of 21 Microsoft Azure regions. 

The team that develops the Business Central product itself is the same team responsible for running and managing the Business Central Online service. It has first-hand knowledge of all its components. 

The service is built from the ground up as a multi-tenant service, comprised of multiple microservices running on the Microsoft Azure cloud ecosystem. It’s built on leading technologies such as React, TypeScript, .NET Core, Azure OpenAI, Microsoft Entra, Azure Functions, Containers, Load Balancers, Virtual Machine Scale Sets, Cosmos DBs, Key Vaults, Service Bus, Traffic Managers, SignalR, Web Sockets, and many more. 

Diagram schematically depicting scalability elements of BC serviceAzure SQL Database, Microsoft's cloud-based relational database service, is used as the best-of-breed service for transactional workloads of Business Central. Azure SQL Database is always running on the latest stable version of the SQL Server database engine and patched OS, with 99.99% availability. Working behind the scenes, it provides Business Central with the following benefits: high availability, rich business continuity and disaster recovery options, backup and restore options, advanced performance analyses and tuning capabilities, schema management, efficient resource utilization, dynamic scalability features to accommodate fluctuating workloads, robust security protocols to safeguard sensitive data, and much more.  

## Scalability 

Business Central Online manages diverse customers of different sizes and complexity, with load patterns fluctuating based on the time of the day, seasonality, the number of active users, active external integrations, and various other factors. One of the key strengths of Business Central Online is its ability to provide resource elasticity through real-time data driven auto-scaling and dynamic load distribution to support these needs. 

Telemetry shows that 99,81% of the execution time (measured by the user session minutes) is performed on the compute nodes with ample resources.  

To contextualize a figure such as 99.81%, let’s consider an example.  

Assume a user works with Business Central for 4 hours daily, Monday through Friday, resulting in 20 hours of work weekly, which is equivalent to 1,200 minutes. 

During only 0.19% (or 2 minutes and 20 seconds) of these 1,200 minutes, the user’s session may potentially encounter some slowdowns when running on a compute node that exceeds the expected threshold of available resources. 

Historical data also shows a very high degree of database scaling efficiency. 99.85% of all databases had enough resources and never exceeded safe thresholds. Only 0.05% of databases were running above the safe thresholds for longer than 1% of the time. Business Central team is constantly monitoring these metrics and tuning the scaling and balancing algorithms to get even better results.  

Business continuity and disaster recovery (BCDR) 

Business Central Online financially guarantees 99,9% up-time for its paid production environments, where customers are entitled to financial compensation if the service does not deliver on this promise. Built-in redundancy implemented on many levels of the service, automated failover and rollback mechanisms, rigid and granular backup policy, as well as historical data, show that it has been able to consistently maintain this level of availability. Read how Business Central Online supports business continuity here.  

Throughput  

Within a typical working week, the service manages over 2B API calls, close to 1B UI interactions and nearly 4B server sessions. 

ERP processes are typically complex and varied, employing diverse configurations, data distribution, extensions and other parameters. To gauge an online service's capability in handling such workloads, it’s most effective to consider data from similar customers already utilizing the service. Business Central facilitates this by collecting telemetry data in a manner that prioritizes customer privacy—customer information is fully anonymized, and no specific customer data is disclosed. Nevertheless, the collected data offers insights into the statistics and counts of scenarios exercised, revealing the frequency and scale of various processes and the number of records involved, without possibility of tracing these results to specific customers. This approach allows for a comprehensive understanding of the service's performance without compromising the confidentiality of individual customer data. 

In the context of Business Central, these needs may, for example, involve creating and posting documents, handling web service calls, managing UI interactions, overseeing scheduled tasks, and many other activities. Business Central helps customers and partners get even higher throughput, by following the best practices described in the online documentation at https://aka.ms/bcperformance and supported by a broad range of tools and telemetry.    

The following are real-life examples of such workloads measured per single environment, for a selection of customers already running in Business Central Online. 

Disclaimer: The volumes presented in this document should be seen as a sample selection of what the service handles today. They are neither the highest measurements observed in the service nor the limits of what the service can handle.  