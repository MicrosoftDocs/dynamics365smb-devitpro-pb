---
title: Run the Cloud Migration Tool
description: Get a cloud tenant so you can migrate to the cloud when you have an on-premises solution based on Business Central, Dynamics GP, Dynamics NAV.

author: bmeier94
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, migration
ms.date: 12/22/2021
ms.author: edupont

---

# Run the Cloud Migration Tool

The **Set up Cloud Migration** assisted setup guide helps administrators migrate data from supported on-premises solutions to [!INCLUDE [prod_short](../includes/prod_short.md)] online as part of the migration to the cloud.  

[!INCLUDE [bc-cloud-products](../includes/bc-cloud-products.md)]

Before you open the **Set up Cloud Migration** assisted setup guide, make sure that you understand the principles and the best practices for cloud migration. For more information, see [Migrate On-Premises Data to Business Central Online](migrate-data.md).  

In the following sections, you're working in [!INCLUDE [prod_short](../includes/prod_short.md)] online and connecting it to your on-premises database as part of migrating from on-premises to online.  

> [!TIP]
> We recommend that you start the migration by running the assisted setup from a company other than the company that you are migrating data to. For example, sign into the demonstration company, CRONUS, and start the process there. This way, you can make sure that all users are logged out of the original company and the target company. This is especially important when you migrate from [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises current version because you can run the migration tool multiple times.

> [!IMPORTANT]
> [!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)]

## The Set up Cloud Migration assisted setup guide

When you choose the **Set up Cloud Migration** assisted setup, it launches the **Data Migration Setup** guide, which consists of up to six pages that take you through the process of connecting your solution to [!INCLUDE [prod_short](../includes/prod_short.md)] online.  

1. Welcome and Consent page

    This page provides an overview of what the wizard will do. You must agree to the displayed warning message before you can continue to the next step.

2. Product selection

    On this page, specify the on-premises solution that you want to replicate data from. All supported sources will appear in the list. If you don't see your product, navigate to the **Manage Extensions** page, and then verify that the intelligent cloud extension for your on-premises solution is installed.

    Specifically to set up migration from earlier versions of [!INCLUDE [prod_short](../developer/includes/prod_short.md)], in the **Data Migration Setup** dialog, choose *Dynamics 365 Business Central earlier versions* as the product.

    > [!TIP]
    > Use the migration tool to migrate from the latest version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] or supported earlier versions. [!INCLUDE [bc-cloud-versions](../includes/bc-cloud-versions.md)] If your on-premises solution is a version that is older than the supported versions, including versions of [!INCLUDE [nav2018_md](../developer/includes/nav2018_md.md)] and older, then you must upgrade your on-premises solution. For more information, see [Supported Upgrade Paths to [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Releases](../upgrade/upgrade-paths.md).  

3. SQL Connection

    If the product you selected requires a SQL connection, this page will be presented. Other source applications may require different information to connect to them. This page will display the connection information based on the product that you specified in the previous page. This is defined from the installed extensions for the product you have selected.  

    |Field  |Description  |
    |---------|---------|
    |*SQL Connection* |**SQL Server**, which is your locally installed SQL Server instance, or **Azure SQL**.|
    |*SQL Connection string*|You must specify the connection string to your SQL Server, including the name of the server that SQL Server is running on, and the name of the instance, the database, and the relevant user account. For example, `Server=MyServer\BCDEMO;Database=BC170;UID=MySQLAccount;PWD=MyPassWord;`, if you're migrating from [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises, version 17. For more information, see [the SQL Server blog](/archive/blogs/sqlforum/faq-how-do-i-find-the-correct-server-or-data-source-value-for-an-sql-server-instance-in-a-connection-string). The following snippets illustrate a couple of connection strings with different formats: </br>`Server={Server Name\Instance Name};Initial Catalog={Database Name};UserID={SQL Authenticated UserName};Password={SQL Authenticated Password};`</br></br>`Server={Server Name\Instance Name};Database={Database Name};User Id={SQL Server Authenticated UserName};Password={SQL Server Authenticated Password};`</br></br>The SQL connection string is passed to Azure Data Factory (ADF), where it is encrypted and delivered to your Self-Hosted Integration Runtime and used to communicate with your SQL Server instance during the data migration process.|
    |*Integration runtime name*|If your SQL connection is **SQL Server**, you must specify the runtime service that will be used to replicate the data from the defined source to [!INCLUDE [prod_short](../includes/prod_short.md)] online. The integration runtime must be running on the machine that holds the SQL Server database. If you don't already have a runtime service, leave the field empty, and then choose the **Next** button. Once you choose **Next**, a new pipeline will be created in the Azure service. This takes less than a minute to complete, in most cases. If you want to test your SQL string, open the **Microsoft Integration Runtime Configuration Manager**, and then choose the **Diagnostics** menu option. From there, you can test to see if the connection is good. </br></br>If you are a hosting partner, you may have multiple tenants running on the same integration runtime service. Each tenant will be isolated in their own data pipeline. To add tenants to an existing integration runtime service, enter the name of the existing integration runtime service into this field. The integration runtime name can be found in the Microsoft Integration Runtime Manager. </br></br>For more information, see [Create and configure a self-hosted integration runtime](/azure/data-factory/create-self-hosted-integration-runtime).|

    If you left the *Integration runtime name* field empty, a new page appears from where you can download the self-hosted integration runtime that you must install. Follow the instructions on the page.

4. Company Selection

    From the list of companies from your on-premises solution, the source of the migration, select the companies you want to migrate data for. If the company does not exist in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, it will be automatically created for you. This process may take several minutes depending on the number of companies that need to be created.
    
    > [!Important]
    > [!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)] You can run the cloud migration tool many times, and you can migrate companies one by one. But once you disable cloud migration and go live with the migrated companies, you cannot migrate more companies into the same environment. Make sure that you migrate all required companies into the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online environment, before you disable the migration and allow users to access and actively use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online.

5. Choose finish to close the wizard. 
    
Once you have migrated the data that you want to migrate to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, you end the migration by disabling cloud migration in the **Cloud Migration Setup** page. This is an important step, because each time someone runs the migration, outstanding documents for vendors and customers, general ledger account numbers, inventory items, and any other changes made in the target company in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online are overwritten.  

> [!NOTE]  
> The amount of time the migration will take to complete depends on the amount of data, your SQL configuration, and your connection speed. Subsequent migrations will complete more quickly because only changed data is migrating.  

> [!IMPORTANT]
> [!INCLUDE [bc-cloud-migrate-upgrade](../includes/bc-cloud-migrate-upgrade.md)]

## See Also

[Managing the Migration to the Cloud](migration-management.md)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
[Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
[Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
[Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)  
[FAQ about Connecting to Business Central Online from On-Premises Solutions](faq-migrate-data.md)  
[Intelligent Insights with Business Central Online](/dynamics365/business-central/about-intelligent-cloud)
