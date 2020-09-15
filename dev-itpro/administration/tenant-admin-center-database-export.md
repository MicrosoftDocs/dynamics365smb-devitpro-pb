---
title: Exporting Databases
description: Use the Business Central administration center to export tenant databases per environment.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, database, export
ms.date: 04/01/2020
ms.author: edupont

---
# Exporting Databases

[!INCLUDE[2019_releasewave2](../includes/2019_releasewave2.md)]

From the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], you can export the database for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online environments as .bacpac files to an Azure storage container.

> [!IMPORTANT]
> You can only request a database export for production environments. If you want to export data from a sandbox environment, you can use Excel or RapidStart.
>
> Also, you must have explicit permission to export databases. For more information, see the [Users who can export databases](#users-who-can-export-databases) section.

## Setting up Azure storage

Before you can export the file, you must first set up the Azure storage account container that the .bacpac file will be exported to.  

### Creating the storage account

The first step of creating the storage account container is to create the Azure storage account. To set up the export, you must first have a subscription to Microsoft Azure and access to the [Azure Portal](https://portal.azure.com). 

For more information setting up an Azure storage account, see [Create a storage account](/azure/storage/common/storage-quickstart-create-account?tabs=azure-portal).

### Generating a shared access signature (SAS)

The next step is to generate a shared access signature (SAS) that provides secure delegated access to your storage account. [!INCLUDE[prodshort](../developer/includes/prodshort.md)] uses this to write the .bacpac file to your storage account.

#### To generate a shared access signature (SAS)

1. On the Azure storage account, choose **Shared access signature** in the navigation pane.
2. In the **Allowed services** section of the shared access signature pane, select **Blob**, and clear the other options.
3. In the **Allowed resource types** section, select **Container** and **Object**, and clear the other options.
4. In the **Allowed permissions** section, mark **Read**, **Write**, **Delete**, and **Create**, and clear the other options.
5. Select a start and end date and time for the SAS. A minimum expiration window of 24 hours from the initiation of the export is required.

    > [!TIP]
    > It is a best practice to use near-term expiration for the account's SAS. To reduce risk of a compromised storage account, set the end date and time no later than what is needed for you to complete the database export operation. However, the SAS must be valid for a minimum of 24 hours.

6. In the **Allowed protocols** section, select **HTTPS only**.
7. Select **Generate SAS and connection string**.
8. Copy the **Blob service SAS URL**.

For more information on generating and using a SAS, see [Grant limited access to Azure Storage resources using shared access signatures (SAS)](/azure/storage/common/storage-sas-overview).

## Creating the database export

When you have created the Azure storage account and generated the SAS URI, you can then create the export file from the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].

1. On the Environments list page, choose the relevant production environment to view the environment details.
2. On the action ribbon of the environment details, choose **Database**, and then choose **Create Database Export**.
3. In the **File Name** field, specify a name for the export file, or leave the default value.
4. In the **SAS URI** field, specify the **Blob service SAS URL** value that you copied in the previous section.
5. In the **Container Name** field, enter the name of the container in the Azure storage account to which you want the .bacpac file exported. If you have already created a container in your Azure storage account, you can enter the name of that container here. Otherwise, if the name that is specified in the **Container Name** field does not already exist in the Azure storage account, it will be created for you.

Once the export operation begins, the .bacpac file is generated and exported to the indicated Azure storage account. The operation may take several minutes to several hours depending on the size of the database. You can close the browser window with the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] during the export. When the export completes, you can access the export file in the defined container in your Azure storage account. Optionally, you can import the data into a new database such as Azure SQL Database or SQL Server for further processing. For more information, see [Quickstart: Import a BACPAC file to a database in Azure SQL Database](/azure/sql-database/sql-database-import).  

> [!NOTE]
> There is a limit to the number of times you can export the database for each environment in any given month. The **Create Database Export** pane includes information about the number of exports still remaining that month.

## Viewing the export history

All database export activity is logged for auditing purposes. To view the history, choose **Database**, and then choose **View Export History** on the action ribbon of the environment details page of the environment.

## Users who can export databases

Permission to export databases is limited to specific types of users, typically internal and delegated administrators. This is not a task that a typical [!INCLUDE [prodshort](../developer/includes/prodshort.md)] user should be able to do, but an administrator can grant permission to a user to export databases, should this be necessary.

- Users from reselling partners

  - Employees who have the **Admin agent** role for this customer in the Partner Center

    In contrast, employees who have the **Helpdesk agent** role *cannot* export databases.

- Users from the organization that subscribes to [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online

  - Users who are internal administrators and have the **Global admin** role in the Office 365 tenant
  - Users who are members of the *D365 BACKUP/RESTORE* user group

    To add a user to this user group, go to the **User Groups** page in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]. For more information, see [To manage permissions through user groups](/dynamics365/business-central/ui-define-granular-permissions#to-manage-permissions-through-user-groups).  

## Using the exported data

The .bacpac file contains data that is customer-specific business data. Technically, [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online is a multitenant deployment, which means that each customer tenant has their own business database while the data that defines the application is in a shared application database.  

This means that if you want to export the data in order to change the customer's [!INCLUDE [prodshort](../developer/includes/prodshort.md)] from an online deployment to an on-premises deployment, you must also get the application data from the installation media from the same version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] that the online tenant is using. You can see the version number in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] or the **Help and Support** page in the customer's [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

[!IMPORTANT] While you can import the downloaded .bacpac into your own SQL Server instance, Microsoft does not provide support for creating a working on-premises environment from the the .bacpac downloaded from [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online. 

For more information, see [Quickstart: Import a BACPAC file to a database in Azure SQL Database](/azure/sql-database/sql-database-import), [Migrating to Single-Tenancy From Multitenancy](../deployment/Merging-an-Application-Database-with-a-Tenant-Database.md), and [When to choose on-premises deployment](../deployment/Deployment.md#when-to-choose-on-premises-deployment).  



## See also

[SQL Server technical documentation](/sql/sql-server/)  
[Quickstart: Import a BACPAC file to a database in Azure SQL Database](/azure/sql-database/sql-database-import)  
[Delegated Administrator Access to Business Central Online](delegated-admin.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
