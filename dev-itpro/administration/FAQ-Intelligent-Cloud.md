---
title: Frequently Asked Questions | Microsoft Docs
description: Get answers to your questions about connecting to the intelligent cloud from an on-premises solution through Business Central.
author: bmeier94
manager: edupont

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: cloud, edge
ms.date: 09/10/2018
ms.author: bmeier

---

# Frequently Asked Questions about Connecting to the Intelligent Cloud

This section contains answers to frequently asked questions about connecting on-premises solutions to the intelligent cloud through [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  

## Which products and versions are supported for connecting to the intelligent cloud?

The current version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] can connect the following products to the intelligent cloud:

- Dynamics GP 2018 R2
- [!INCLUDE[prodshort](../developer/includes/prodshort.md)] (on-premises)

Support for additional products will become available later.  

## How is my on-premises data replicated to my [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant?

Data is replicated using an Azure service called Azure Data Factory (ADF). The Azure Data Factory is a service that is always running within the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud service manager. When the intelligent cloud is configured for your on-premises solution, a data pipeline is created within the ADF service that enable data to flow from your on-premises solution to your Business Central cloud tenant. If your data source is a local SQL Server instance, you will also be asked to configure a self-hosted integration runtime (SHIR). The runtime is installed locally and enables the communication between the cloud services and your on-premise data to communicate without opening any ports or firewalls.  

## Are there any limits on the amount or type of data will replicate?

Data replication for the initial release will have a limit of 150GB.  There are no restrictions on the type of data that can be replicated.  

## Is my SQL connection string required to setup Intelligent Cloud?

Yes. The SQL connection string is passed to Azure Data Factory, where it is encrypted and delivered to your Self-Hosted Integration Runtime, and used to communication with your SQL Server instance during the data replication process.

## I am a hosting partner - do I need to configure the Self-Hosted Runtime Service for each tenant?

No, there is no limit on the number for tenants that can be added to your Self-Hosted Integration Runtime. Each added tenant will have a dedicated pipeline created.

## Will data from tables with code customizations replicate?

No, only tables that are available in both your on-premises solution and your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant will replicate. Any customization would need to be made into an extension and installed on both your on-premises solution and your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant to replicate.  

## Why are my Business Central tenant permissions restricted?

Once your on-premises solution is connected to the intelligent cloud, all existing users without Super permission be automatically assigned to the *Intelligent Cloud* user group. In this configuration, your on-premises solution is the master where all business transactions take place. The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant is read-only, and the data is used to generate business insights in the cloud for you. We restrict permissions to avoid users from accidentally entering transactions or updating master records only to have that information overwritten and lost when data replication takes place.  

## Can I ‘turn off’ my intelligent cloud?

You can discontinue your intelligent cloud environment at any point. Once you disable your intelligent cloud configuration, your on-premises solution and the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant will become completely independent of one another. If you discontinued your intelligent cloud and want to use your[!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant as your primary solution to run and manage your business, you must  reassign permissions to provide read/write access to the relevant users.  

## Will my on-premises users and permissions replicate?

No. Since you are not required to configure your on-premises solution with Azure Active Directory (Azure AD), we cannot guarantee a mapping between on-premises users and users in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online requires Azure AD accounts, and users must be manually added. All permissions must be granted in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant, independent from your on-premises permissions.  

## Can I view insights from cloud services in my on-premises solution?

Yes, the **Intelligent Cloud Insights** page can be hosted within your on-premises solution if that is one of [the currently supported solutions](#which-products-and-versions-are-supported-for-connecting-to-the-intelligent-cloud). Each user will need to have a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] license to view the data.  

## Can you export to Excel, modify the contents, and import the data back in?

You can export the list to Excel from the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant, but since the data is read only you cannot make changes and import it again.  

## Is the data replication only one-way?

Yes, data is only replicated from the on-premises solution to your Business Central tenant.  

## Is there a cost to configure the Intelligent Cloud?

Currently, the only costs associated with the intelligent cloud are your named user license costs.  

## Why did my Role Center change after configuring the intelligent cloud?

To keep the Role Center experience as clean as possible and avoid permission errors, we automatically hide actions that would generate a permission error for the user.  

## Should I uninstall all my Business Central tenant extensions?

Not necessarily, most Extensions will run without issues in the intelligent cloud environment. You may want to consider uninstalling extensions that send data to an external service to avoid potential duplicated calls to that service. It is a best practice to test any extension in a sandbox tenant configured for the intelligent cloud.  

## How do I build an extension that enables data replication?

The extension should be created in the same manner as any other extension. For data to replicate, you must add a **ReplicateData** property to your table and set the value to *Yes*. If your extension connects with an external service and you want to restrict any service calls from your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant, a good practice would be to store the connection information in a separate table and set the **ReplicateData** property to *No*. This would enable you to keep the extension installed but prevent it from making any type of service calls from the read-only [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. Once the extension is installed in both on-premises and [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the data will begin to replicate.  

## How do I find my SQL connection string?

A connection string to your SQL database can be found in SQL Management Studio or using Visual Studio. The user name and password defined in the connection requires a SQL Authenticated user name/password. Your connection string should look something like this:

*Server=tcp:{ServerName},1433;Initial Catalog={DatabaseName};Persist Security Info=False; User ID={UserName};Password={Password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Connection Timeout=30;*

## How do I find the Integration Runtime name?

The Integration Runtime name can be found in the Microsoft Integration Runtime Manager. You can find this application in your Windows system tray or by searching for the program. You will not be able to copy and paste the name. You must manually type the name.  

## Can I connect my Microsoft Invoicing data to the intelligent cloud?

No. Microsoft Invoicing currently does not support connecting to the intelligent cloud through [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. If your organization has an existing Invoicing tenant and want to create a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant, you must contact Support to have them delete your existing Invoicing tenant.  

## See also

[Connect to the intelligent cloud with Business Central](about-intelligent-edge.md)  
[Managing your intelligent cloud environment](manage-intelligent-edge.md)  
[Replicating on-premises data](data-replication-intelligent-cloud.md)  
[ReplicateData Property](../developer/properties/devenv-replicatedata-property.md)  
