---
title: Connect to the Intelligent Cloud from on-premises | Microsoft Docs
description: Get a cloud copy of your data so you are connected to the intelligent cloud also when you have an on-premises solution based on Business Central, Dynamics GP, Dynamics SL, or Dynamics NAV.
author: bmeier94
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, edge
ms.date: 11/20/2019
ms.author: bmeier

---

# Connect to the Intelligent Cloud from On-Premises with [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

Customers running their workloads on-premises can get access to the same intelligent cloud scenarios that customers using [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online have. Each on-premises solution that connects to the intelligent cloud through [!INCLUDE[prodshort](../developer/includes/prodshort.md)] will be able to replicate data from on-premises to the cloud tenant. In this way, users can access intelligent cloud scenarios of Machine Learning, Power BI, Power Automate, and others to drive suggested actions.  

For the list of currently supported on-premises solutions, see [Which products and versions are supported for connecting to the intelligent cloud?](/dynamics365/business-central/dev-itpro/administration/faq-intelligent-cloud#which-products-and-versions-are-supported-for-connecting-to-the-intelligent-cloud) in the FAQ.

## Setting up your connection to the intelligent cloud

This section provides the steps required to get intelligent insights through a connection to [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online. This can simply be done by following the instructions in the **Intelligent Cloud Setup** assisted setup wizard in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online tenant.  

There are a few key points that need to be understood before proceeding with the setup:

- It is always a best practice to test this configuration in your Sandbox environment before making changes to a production tenant. For more information see [Choosing Your Dynamics 365 Business Central Development Sandbox Environment](../developer/devenv-sandbox-overview.md).
- Any existing data in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant will be overwritten with data from your on-premises solution, or source, once the data replication process is run. If you do not want data in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant to be overwritten, do not configure the connection.
- All users that do not have *SUPER* permissions will be automatically reassigned to the intelligent cloud user group. This will limit them to read-only access within the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. See more below.
- If your data source is [!INCLUDE[prodshort](../developer/includes/prodshort.md)] (on-premises), several stored procedures will be added to the SQL server you define. These stored procedures are required to replicate data from your SQL server to the Azure SQL server associated with your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant.
- In the current version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the amount of data that can be replicated for any tenant is limited to 150GB. If your database is larger than 150GB, try reducing the number of companies you are replicating data for. This can done using the company selection within the assisted setup guide. Additional options for databases exceeding 150GB will be available in future updates.  
- Before setting up the connection to the intelligent cloud, ensure that at least one user in the system that has *SUPER* permissions. This is the only user that will be allowed to make changes in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant.  
- Configuring the intelligent cloud environment will have no impact on any users or data in your on-premises solution.

To begin configuring the connection, navigate to the assisted setup page and launch the **Intelligent Cloud Setup** assisted setup guide. If you are using [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, the same setup guide is also available in your on-premises solution. You will automatically be redirected to your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant to continue the configuration process.  

### The assisted setup guide

The assisted setup guide consists of up to 6 pages that take you through the process of connecting your solution to the intelligent cloud.  

1. Welcome and Consent page

    This page provides an overview of what the wizard will do. You must agree to the displayed warning message before you can continue to the next step.

2. Product selection

    On this page, specify the on-premises solution that you want to replicate data from. All supported sources will appear in the list. If you don’t see your product, navigate to the **Manage Extensions** page, and then verify that the intelligent cloud extension for your on-premises solution is installed.

3. SQL Connection

    If the product you selected requires a SQL connection, this page will be presented. Other source applications may require different information to connect to them. This page will display the connection information based on the product that you specified in the previous page. This is defined from the installed extensions for the product you have selected.  

    |Field  |Description  |
    |---------|---------|
    |*SQL Connection* |**SQL Server**, which is your locally installed SQL Server instance, or **Azure SQL**.|
    |*SQL Connection string*|You must specify the connection string to your SQL Server. For more information, see [the SQL Server blog](https://blogs.msdn.microsoft.com/sqlforum/2010/12/20/faq-how-do-i-find-the-correct-server-or-data-source-value-for-an-sql-server-instance-in-a-connection-string/). The following snippets illustrate a couple connection strings with different formats: </br>`Server={SQL Server Name};Initial Catalog={Database Name};UserID={SQL Authenticated UserName};Password={SQL Authenticated Password};`</br></br>`Server={SQL Server Name};Database={Database Name};User Id={SQL Server Authenticated UserName};Password={SQL Server Authenticated Password};`</br></br>The SQL connection string is passed to Azure Data Factory (ADF), where it is encrypted and delivered to your Self-Hosted Integration Runtime and used to communicate with your SQL Server instance during the data replication process.|
    |*Integration runtime name*|If your SQL connection is **SQL Server**, you must specify the runtime service that will be used to replicate the data from the defined source to your Business Central online tenant. </br></br>If you are a hosting partner, you may have multiple tenants running on the same Integration runtime service. Each tenant will be isolated in their own data pipeline. To add tenants to an existing integration runtime service, enter the name of the existing integration runtime service into this field. The integration runtime name can be found in the Microsoft Integration Runtime Manager. To create a new runtime service, leave the field empty, and then choose the Next button. Once you choose Next, a new replication pipeline will be created in the Azure service. This should take less than a minute to complete.|

4. Self-Hosted Integration Runtime (SHIR)

    This is the service will allow access to the Azure replication services to your on-premises SQL Database during the replication process. Follow the instructions on this page to install the Self-Hosted Integration Service (SHIR) to a local machine.  

5. Company Selection

    You will be provided with a list of companies from your on-premises solution, or source. Select the companies you would like to replicate data for. If the company does not exist in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant, it will be automatically created for you. This process may take several minutes depending on the number of companies that need to be created.

6. Enable & Scheduling Replication

    The final page in the wizard allows you to enable the replication process and create a schedule for when the data replication should occur. These settings are also available within your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant on the **Intelligent Cloud Management** page. You have the option to schedule replication daily or weekly. We recommend that you schedule your data replication for off-peak business hours.

> [!NOTE]  
> Depending on the amount of data, your SQL configuration and your connection speed, a full replication could take several hours to complete. Subsequent replications will complete more quickly as only changed data is replicating.  

## Adding a tenant to an existing runtime service, or updating companies

There are some scenarios where it will be necessary for you to run the intelligent cloud assisted setup wizard more than once.  

One example is if you want to change the companies you replicate data for. If the companies in your on-premises solution have changed, either added or deleted, or you want to change the companies to replicate, simply run the assisted setup wizard again.  

Another example of why you would want to run the wizard again is you may be a hosting partner and want to add tenants to your existing runtime service.  

In both examples, you will be making updates to an existing runtime service. When you get to the point of the wizard where you can specify an existing runtime services name, open the Microsoft Integration Runtime Service Manager and enter the runtime name in the field in the wizard; you will not be allowed to copy/paste. The runtime service will identify that you are making updates to an existing service and will not create a new one.  

Complete the steps in the wizard to update the runtime service. If the change was related to adding tenants to an existing service, a new data pipeline will be created for that tenant. Changing your replication schedule or regenerating an Azure Data Factory (ADF) key may be done using the **Intelligent Cloud Management** page in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. For more information, see [Managing your Intelligent Cloud environment](manage-intelligent-edge.md).  

## User groups and permission sets

When running as connected with an on-premises solution, the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant will be, with very few exceptions, read-only. Because the on-premises solution is your primary application for running your business activities such as data entry, tax reporting, and sending invoices, these tasks will need to be completed in the on-premises solution. We limit the amount of data you can enter into your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant to data that is not replicated, otherwise any data that was written to the tenant database would be continuously overwritten during the replication process.  

To make setting up this read-only tenant more efficient, we created a new *Intelligent Cloud* user group and an *Intelligent Cloud* permission set. Once the intelligent cloud environment is configured, all users without SUPER permissions will be automatically assigned to the *Intelligent Cloud* user group. Only users with SUPER permissions will be allowed to make modifications to the system at this point.  

> [!NOTE]  
> Before you configure the a connection from on-premises to [!INCLUDE [prodshort](../developer/includes/prodshort.md)], make sure that at least one user in each company is assigned SUPER permissions.  

Users that are reassigned to the Intelligent Cloud user group will have access to read ALL data by default. If you need to further restrict what data a user should be able to read, the SUPER user may create new user groups and permissions sets and assign users accordingly. It is highly recommended to create any new permissions sets from a copy of the Intelligent Cloud permission set and then take away permissions you do not want users to have.  

> [!WARNING]
> If you grant insert, modify or delete permissions to any resource in the application that was set to read-only, it could have a negative impact on the data in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. If this occurs, you may have to clear all your data and rerun a full replication to correct this.  

### Extensions

When an intelligent cloud environment is configured, it is highly recommended that you test the impact of any extension in a sandbox environment before having it installed in your production [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant to help avoid any data failures or untended consequences.  

## System requirements

To connect to the intelligent cloud through [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the on-premises solution must use SQL Server 2016 or a later version, and the database must have compatibility level 130 or higher. The on-premises solution must also be one of the supported versions. For more information, see [Which products and versions are supported for connecting to the intelligent cloud?](/dynamics365/business-central/dev-itpro/administration/faq-intelligent-cloud#which-products-and-versions-are-supported-for-connecting-to-the-intelligent-cloud) in the FAQ.  

## See Also

[Managing your intelligent cloud environment](manage-intelligent-edge.md)  
[Replicating on-premises data](data-replication-intelligent-cloud.md)  
[Frequently Asked Questions about connecting to the intelligent cloud](faq-intelligent-cloud.md)  
[Your Access to the Intelligent Cloud](/dynamics365/business-central/about-intelligent-cloud)  
