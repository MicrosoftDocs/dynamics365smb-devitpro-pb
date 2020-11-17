---
title: Running the Cloud Migration Tool
description: Get a cloud tenant so you can migrate to the cloud when you have an on-premises solution based on Business Central, Dynamics GP, Dynamics SL.

author: bmeier94
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, migration
ms.date: 10/22/2020
ms.author: edupont

---

# Running the Cloud Migration Tool

Organizations that run their workloads on-premises but are looking to move to the cloud can easily migrate to [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online by running the **Set up Cloud Migration** assisted setup that runs the cloud migration tool.  

The cloud migration tool supports migration from specific versions of specific software. For more information, see the following articles:

* [Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
* [Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
* [Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)

Use the same assisted setup to set up a connection to the intelligent cloud but still remain on-premises. For the list of on-premises solutions that currently supported for connecting to the intelligent cloud, see [Which products and versions are supported for connecting to the intelligent cloud?](/dynamics365/business-central/dev-itpro/administration/faq-intelligent-cloud#which-products-and-versions-are-supported-for-connecting-to-the-intelligent-cloud) in the FAQ.  

In the following sections, you're working in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online tenant and connecting it to your on-premises database. Either because you are migrating from on-premises to online, or because you are connecting to the intelligent cloud.  

> [!TIP]
> In migration scenarios, we recommend that you start the migration by running the assisted setup from a company other than the company that you are migrating data to. For example, you can log into the demonstration company, CRONUS, and start the process there. This way, you can make sure that all users are logged out of the original company and the target company.

## Setting up your connection using the cloud migration tool

This section provides the steps required to get the cloud migration setup through a connection to [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online. This can simply be done by following the instructions in the **Data Migration Setup** assisted setup wizard in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online tenant.  

There are a few key points that need to be understood before you start the process:

* As a best practice, test this configuration in your sandbox environment before making changes to a production tenant.  

    For more information, see [Managing Environments](tenant-admin-center-environments.md).
* Any existing data in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant will be overwritten with data from your on-premises solution, or source, once the data migration process is run.  

    If you do not want data in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant to be overwritten, do not configure the connection.
* All users that do not have *SUPER* permissions will be automatically reassigned to the intelligent cloud user group. This will limit them to read-only access within the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. See more below.
* If your data source is [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, several stored procedures will be added to the SQL Server instance that you define. These stored procedures are required to migrate data from your SQL Server database to the Azure SQL server associated with your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant.
* In the current version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the amount of data the migration tool can move to the online environment is limited to 80 GB.  
    If your database is larger than 80 GB, we recommend that you reduce the number of companies that you are migrating data for or delete outdated data in tables that contain log entries and archived records. Also make sure to review [how the database capacity is managed](../dev-itpro/administration/tenant-admin-center-capacity) in a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online environment. 
        
    You can specify which companies to include in the migration in the assisted setup wizard, and you can view the migration status of each company in the [Cloud Migration Management](migration-management.md) page.  

    If you want to add more companies after the first selection of companies, you can add additional companies in the **Cloud Migration Management** page in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant. For more information, see [Adding a tenant to an existing runtime service, or updating companies](#adding-a-tenant-to-an-existing-runtime-service-or-updating-companies).  

    If you are looking at migrating a larger database, we recommend that you contact the support team and work with them to make sure that the migration is successful. We are continually working on improving and optimizing the migration tool for larger database sizes, and starting with [2020 release wave 2](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/support-unlimited-number-production-sandbox-environments), customers can buy additional environments.

* Before setting up the connection to the cloud migration, ensure that at least one user in the system that has *SUPER* permissions. This is the only user that will be allowed to make changes in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant.  
* Configuring the cloud environment will have no impact on any users or data in your on-premises solution.

To begin configuring the connection, navigate to the assisted setup page and launch the **Set up Cloud Migration** assisted setup guide. If you are using [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, the same setup guide is also available in your on-premises solution. You will automatically be redirected to your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant to continue the configuration process.  

### The "Set up Cloud Migration" assisted setup guide

When you choose the **Set up Cloud Migration** assisted setup, it launches the **Data Migration Setup** guide, which consists of up to six pages that take you through the process of connecting your solution to the Business Central online tenant.  

1. Welcome and Consent page

    This page provides an overview of what the wizard will do. You must agree to the displayed warning message before you can continue to the next step.

2. Product selection

    On this page, specify the on-premises solution that you want to replicate data from. All supported sources will appear in the list. If you don't see your product, navigate to the **Manage Extensions** page, and then verify that the intelligent cloud extension for your on-premises solution is installed.
    
    To set up migration from previous versions of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], in the **Data Migration Setup** dialog, choose *Dynamics 365 Business Central (Previous Version)* as the product.

3. SQL Connection

    If the product you selected requires a SQL connection, this page will be presented. Other source applications may require different information to connect to them. This page will display the connection information based on the product that you specified in the previous page. This is defined from the installed extensions for the product you have selected.  

    |Field  |Description  |
    |---------|---------|
    |*SQL Connection* |**SQL Server**, which is your locally installed SQL Server instance, or **Azure SQL**.|
    |*SQL Connection string*|You must specify the connection string to your SQL Server, including the name of the server that SQL Server is running on, and the name of the instance, the database, and the relevant user account. For example, `Server=MyServer\BCDEMO;Database=BC170;UID=MySQLAccount;PWD=MyPassWord;`, if you're migrating from [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises, version 17. For more information, see [the SQL Server blog](https://docs.microsoft.com/archive/blogs/sqlforum/faq-how-do-i-find-the-correct-server-or-data-source-value-for-an-sql-server-instance-in-a-connection-string). The following snippets illustrate a couple of connection strings with different formats: </br>`Server={Server Name\Instance Name};Initial Catalog={Database Name};UserID={SQL Authenticated UserName};Password={SQL Authenticated Password};`</br></br>`Server={Server Name\Instance Name};Database={Database Name};User Id={SQL Server Authenticated UserName};Password={SQL Server Authenticated Password};`</br></br>The SQL connection string is passed to Azure Data Factory (ADF), where it is encrypted and delivered to your Self-Hosted Integration Runtime and used to communicate with your SQL Server instance during the data migration process.|
    |*Integration runtime name*|If your SQL connection is **SQL Server**, you must specify the runtime service that will be used to replicate the data from the defined source to your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online tenant. The integration runtime must be running on the machine that holds the SQL Server database. If you don't already have a runtime service, leave the field empty, and then choose the **Next** button. Once you choose **Next**, a new pipeline will be created in the Azure service. This takes less than a minute to complete, in most cases. If you want to test your SQL string, open the **Microsoft Integration Runtime Configuration Manager**, and then choose the **Diagnostics** menu option. From there, you can test to see if the connection is good. </br></br>If you are a hosting partner, you may have multiple tenants running on the same integration runtime service. Each tenant will be isolated in their own data pipeline. To add tenants to an existing integration runtime service, enter the name of the existing integration runtime service into this field. The integration runtime name can be found in the Microsoft Integration Runtime Manager. </br></br>For more information, see [Create and configure a self-hosted integration runtime](/azure/data-factory/create-self-hosted-integration-runtime).|

    If you left the *Integration runtime name* field empty, a new page appears from where you can download the self-hosted integration runtime that you must install. Follow the instructions on the page.

4. Company Selection

    You will be provided with a list of companies from your on-premises solution, the source of the migration. Select the companies you want to migrate data for. If the company does not exist in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant, it will be automatically created for you.  

    > [!NOTE]
    > This process may take several minutes depending on the number of companies that need to be created.

5. Enable & Scheduling Migration

    The final page in the wizard allows you to enable the migration process and create a schedule for when the data migration should occur. These settings are also available within your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant on the **Cloud Migration Management** page. You have the option to schedule migrations daily or weekly.  

    > [!TIP]
    > We recommend that you schedule your data migration for off-peak business hours since it can take many hours to run, depending on the amount of data.
    >
    > We also recommend that you make sure that all users are logged out of both the source company and the target company.

If you are migrating data, you end the migration by disabling cloud migration in the **Cloud Migration Setup** page. This is an important step, because each time someone runs the migration, outstanding documents for vendors and customers, general ledger account numbers, inventory items, and any other changes made in the target company in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online are overwritten. If you are connecting to the intelligent cloud, you can adjust the migration schedule.  

> [!NOTE]  
> The amount of time the migration will take to complete is dependent on the amount of data, your SQL configuration, and your connection speed. Subsequent migrations will complete more quickly as only changed data is migrating.  

## Adding a tenant to an existing runtime service, or updating companies

There are some scenarios where it will be necessary for you to run the cloud migration setup wizard more than once.  

One example is if you want to change the companies you replicate data for. If the companies in your on-premises solution have changed, either added or deleted, or you want to change the companies to migrate, run the assisted setup wizard again. Alternatively, choose the additional companies in the **Cloud Migration Management** page.  

Another example is that if you are a hosting partner and want to add tenants to your existing runtime service.  

In both examples, you will be making updates to an existing runtime service. When you get to the point of the wizard where you can specify an existing runtime services name, open the Microsoft Integration Runtime Service Manager and enter the runtime name in the field in the wizard; you will not be allowed to copy/paste. The runtime service will identify that you are making updates to an existing service and will not create a new one.  

Complete the steps in the wizard to update the runtime service. If the change was related to adding tenants to an existing service, a new data pipeline will be created for that tenant. Changing your migration schedule or regenerating an Azure Data Factory (ADF) key may be done using the **Cloud Migration Management** page in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. For more information, see [Managing your Intelligent Cloud environment](manage-intelligent-edge.md).  

## User groups and permission sets

When running as connected with an on-premises solution, the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant will be read-only with few exceptions. Because the on-premises solution is your primary application for running your business, including activities such as data entry, tax reporting, and sending invoices, these tasks must be completed in the on-premises solution. We limit the amount of data that you can enter in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant to data that is not migrated. Otherwise any data that was written to the tenant database would be continuously overwritten during the migration process.  

To make setting up this read-only tenant more efficient, we created a new *Intelligent Cloud* user group and an *Intelligent Cloud* permission set. Once the cloud migration environment is configured, all users without SUPER permissions will be automatically assigned to the *Intelligent Cloud* user group. Only users with SUPER permissions will be allowed to make modifications to the system at this point.  

> [!NOTE]  
> Before you configure the a connection from on-premises to [!INCLUDE [prodshort](../developer/includes/prodshort.md)], make sure that at least one user in each company is assigned SUPER permissions.  

Users that are reassigned to the Intelligent Cloud user group will have access to read ALL data by default. If you need to further restrict what data a user should be able to read, the SUPER user may create new user groups and permissions sets and assign users accordingly. It is highly recommended to create any new permissions sets from a copy of the Intelligent Cloud permission set and then take away permissions you do not want users to have.  

> [!WARNING]
> If you grant insert, modify or delete permissions to any resource in the application that was set to read-only, it could have a negative impact on the data in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. If this occurs, you may have to clear all your data and rerun a full migration to correct this.  

### Extensions

It is highly recommended that you test the impact of any extension in a sandbox environment before having it installed in your production [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant to help avoid any data failures or untended consequences.  

## See Also

[Managing the Migration to the Cloud](migration-management.md)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
[Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
[Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
[Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)  
[FAQ about connecting to the intelligent cloud](faq-intelligent-cloud.md)  
[Your Access to the Intelligent Cloud](/dynamics365/business-central/about-intelligent-cloud)  
[Managing your intelligent cloud environment](manage-intelligent-edge.md)  
