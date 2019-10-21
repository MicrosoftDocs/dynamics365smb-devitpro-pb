---
title: Database Export | Microsoft Docs
description: Use the Business Central administration center to export environment databases.  
author: jaredha

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms.search.keywords: administration, tenant, admin, environment, sandbox, database, export
ms.date: 10/01/2019
ms.author: jaredha

---

# Database Export
The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides the ability to export the database for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environments. You are able to export the database as a .bacpac file to an Azure storage container.

## Set up Azure storage
Before creating the export file, you must first set up the Azure storage account container to which the .bacpac file will be exported.  

### Creating the storage account
The first step of creating the storage account container is to create the Azure storage account. To set up the export you must first have a subscription to Microsoft Azure and access to the [Azure Portal](https://portal.azure.com). 

For more information setting up an Azure storage account, see [Create a storage account](https://docs.microsoft.com/azure/storage/common/storage-quickstart-create-account?tabs=azure-portal).

### Generating a shared access signature (SAS)
The next step is to generate a shared access signature (SAS) that is used to provide secure delegated access to your storage account. This allows the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service to write the .bacpac file to your storage account.

1. On the Azure storage account, select **Shared access signature** in the navigation pane.
2. In the **Allowed services** section of the shared access signature pane, mark **Blob**, and unmark the other options.
3. In the **Allowed resource types** section, mark **Container** and **Object**, and unmark the other option(s).
4. In the **Allowed permissions** section, mark **Read**, **Write**, **Delete**, and **Create**, and unmark the other options.
5. Select a start and end date and time for the SAS. A minimum expiration window of six hours from the initiation of the export is required.

  > [!TIP]
  > It is a best practice to use near-term expiration for the account SAS. To reduce risk of a compromised storage account, set the end date and time no later than what is needed for you to complete the database export operation.

6. In the **Allowed protocols** section, select **HTTPS only**.
7. Select **Generate SAS and connection string**.
8. Copy the **Blob service SAS URL**.

See [Grant limited access to Azure Storage resources using shared access signatures (SAS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview) for more information on generating and using a SAS.

## Create the database export
After creating the Azure storage account, and generating the SAS URI, you can then create the export file from the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].

1. On the Environments list page, select the enviroment name of your environment to view the environment details.
2. On the action ribbon of the environment details, select **Database >> Create Database Export**.
3. In the **File Name** field, enter a name for the export file, or leave the default value.
4. In the **SAS URI** field, enter the **Blob service SAS URL** value copied in the previous section.
5. In the **Container Name** field, enter a name of the container in the Azure storage account to which you want the .bacpac file exported. If you have already created a container in your Azure storage account, you can enter the name of that container here. Otherwise, if the name entered in the Container Name field does not already exist in the Azure storage account, it will be created for you.

Once the export process begins, the .bacpac file is generated and exported to the indicated Azure storage account. The process may take several minutes to several hours depending on the size of database. The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] does not need to remain open for the export to complete. Upon successful completion, you will be able to access the export file in your Azure storage account. 

## View the export history
All database export activity is logged in export history for auditing purposes. To view the history, select **Database >> View Export History** on the action ribbon of the environment details page of the environment.


## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)
