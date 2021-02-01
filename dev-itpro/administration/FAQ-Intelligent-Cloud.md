---
title: FAQ about Connecting to Business Central Online
description: Get answers to your questions about migrating to the cloud or connecting to the cloud through Business Central online from an on-premises solution.
author: bmeier94

ms.reviewer: edupont
ms.service: dynamics365-business-central
ms.topic: article
ms. search.keywords: cloud, edge
ms.date: 01/26/2021
ms.author: edupont
---

# FAQ about Connecting to Business Central Online from On-Premises Solutions

This section contains answers to frequently asked questions about connecting on-premises solutions to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online.  

> [!TIP]
> Check the tips in this article if your organization is not yet ready to migrate to [!INCLUDE [prod_short](../includes/prod_short.md)] online but still wants to enjoy some of the benefits of the cloud. The same tips apply to when you are migrating to the cloud and are running the migration tool. For more information, see [Running the Cloud Migration Tool](migration-tool.md).  

## Which products and versions are supported for this connection?

The current version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] can connect the following products in order to provide intelligent insights:

- Dynamics GP (supported major versions)
- [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises (current version + the two previous major versions)

  This means that if the current version is version 17, then you can connect to [!INCLUDE [prod_short](../includes/prod_short.md)] online if you are on version 17, 16, or 15.  

If you are currently on a version of Dynamics NAV, you must upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, and then switch to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. For more information, see [Upgrading from Dynamics NAV to Business Central online](../upgrade/upgrade-considerations.md#online).

<!-- - Dynamics SL 2018 CU 1-->

### System requirements

To connect to the cloud through [!INCLUDE[prod_short](../developer/includes/prod_short.md)], the on-premises solution must use SQL Server 2016 or a later version, and the database must have compatibility level 130 or higher. The on-premises solution must also be one of the supported versions.  

## How is my on-premises data replicated to my [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant?

Data is replicated using an Azure service called Azure Data Factory (ADF). ADF is a service that is always running within the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online service manager. When you have connected to the intelligent cloud, a data pipeline is created in the ADF service so that data can flow from your on-premises solution to your Business Central online tenant. If your data source is a local SQL Server instance, you will also be asked to configure a self-hosted integration runtime (SHIR). The runtime is installed locally and manages the communication between the cloud services and your on-premises data without opening any ports or firewalls.  

## Are there any limits on the amount or type of data will replicate?

There are no restrictions on the type of data that can be replicated. In the current version of Business Central, the migration tool is by default limited to migrate databases up to 80 GB. If your database is larger than 80 GB, we recommend that you reduce the number of companies that you are migrating data for. You can specify which companies to include in the migration in the assisted setup wizard.

If you want to add more companies after the first selection of companies, you can add additional companies in the **Cloud Migration Management** page in Business Central online. For more information, see [Adding a tenant to an existing runtime service, or updating companies](migration-tool.md#adding-a-tenant-to-an-existing-runtime-service-or-updating-companies).

If you are looking at migrating databases larger than 80 GB, we recommend that you contact the support team and work with them to make sure that the migration is successful.  

## Is my SQL connection string required to set up the connection?

Yes. The SQL connection string is passed to Azure Data Factory, where it is encrypted and delivered to your Self-Hosted Integration Runtime. The connection string is used to communicate with your SQL Server instance during the data replication process. For more information, see [How do I find my SQL connection string?](#how-do-i-find-my-sql-connection-string).  

## I am a hosting partner - do I need to configure the Self-Hosted Runtime Service for each tenant?

No, there is no limit on the number of tenants that can be added to your Self-Hosted Integration Runtime. Each added tenant will have a dedicated pipeline created.

## Will data from tables with code customizations replicate?

No, only tables that are available in both your on-premises solution and your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant will replicate. Any customization must be made into an extension and installed on both your on-premises solution and your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant to replicate.  

## Why are my permissions restricted in the Business Central online tenant?

When you connect your on-premises solution to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online for intelligent insights, all existing users are automatically added to the *Intelligent Cloud* user group, unless they have the SUPER permission set. In this configuration, your on-premises solution is the master where all business transactions take place. The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online environment is read-only, and the data is used to generate intelligent business insights based on your on-premises data for you. We restrict permissions to prevent users from accidentally entering transactions or updating master records only to have that information overwritten and lost when data replication takes place.  

## Can I 'turn off' my intelligent cloud?

You can switch off your connection to the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online environment at any point. Once you disable your intelligent cloud configuration, your on-premises solution and the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant will become independent of one another. If you switch off the connection, and you want to use your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online environment as your primary solution to run and manage your business, you must reassign permissions to provide read/write access to the relevant users.  

For more information, see [Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions).  

## Will my on-premises users and permissions replicate?

No. Since you are not required to configure your on-premises solution with Azure Active Directory (Azure AD), we cannot guarantee a mapping between on-premises users and users in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online requires Azure AD accounts, and users must be manually added. All permissions must be granted in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant, independent from your on-premises permissions.  

For more information, see [Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions).  

## Can I view insights from cloud services in my on-premises solution?

Yes, the **Intelligent Cloud Insights** page can be hosted within your on-premises solution if that is one of [the currently supported solutions](#which-products-and-versions-are-supported-for-this-connection). Each user will need to have a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] license to view the data.  

## Can you export to Excel, modify the contents, and import the data back in?

You can export the list to Excel from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant, but since the data is read-only you cannot make changes and import it again.  

## Is the data replication only one way?

Yes, data is only replicated from the on-premises solution to your Business Central online tenant.  

## Is there a cost to connect to the intelligent cloud?

Currently, the only costs associated with the intelligent cloud are your named user license costs. For more information, see the [Business Central Licensing Guide (download)](https://go.microsoft.com/fwlink/?LinkId=871590).  

## Why did my Role Center change after configuring the intelligent cloud?

To keep the Role Center experience as clean as possible and avoid permission errors, we automatically hide actions that would generate a permission error for the user.  

## Should I uninstall all my Business Central extensions?

Not necessarily. Most extensions will run without issues in the online environment. You may want to consider uninstalling extensions that send data to an external service to avoid potential duplicated calls to that service. It is a best practice to test any extension in a sandbox tenant configured for the Business Central online environment that you are connecting to.  

## How do I build an extension that enables data replication?

The extension must be created in the same manner as any other extension. For data to replicate, you must add a **ReplicateData** property to your table and set the value to *True*. If your extension connects with an external service and you want to restrict any service calls from your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant, a good practice would be to store the connection information in a separate table and set the **ReplicateData** property to *False*. This would enable you to keep the extension installed but prevent it from making any type of service calls from the read-only [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant. Once the extension is installed in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online and on-premises, the data will begin to replicate.  

## How do I find my SQL connection string?

Find the connection string to your SQL database in SQL Management Studio or Visual Studio. The user name and password defined in the connection requires a SQL Authenticated user name/password. Your connection string will look something like this:

*Server=tcp:{ServerName},1433;Initial Catalog={DatabaseName};Persist Security Info=False; User ID={UserName};Password={Password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Connection Timeout=30;*

## How do I find the Integration Runtime name?

Find the Integration Runtime name in the Microsoft Integration Runtime Manager, which you can find in your Windows system tray or by searching for the program. You must type the name. You will not be able to copy and paste the name.  

## See also

[Running the Cloud Migration Tool](migration-tool.md)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
