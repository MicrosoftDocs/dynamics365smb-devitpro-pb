---
title: Exporting Databases | Microsoft Docs
description: Use the Business Central administration center to export environment databases.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, database, export
ms.date: 12/06/2019
ms.author: edupont

---
# Exporting Databases

[!INCLUDE[2019_releasewave2](../includes/2019_releasewave2.md)]

From the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], you can export the database for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online environments as .bacpac files to an Azure storage container.

> [!IMPORTANT]
> You can only request a database export for production environments. If you want to export data from a sandbox environment, you can use Excel or RapidStart.

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
5. Select a start and end date and time for the SAS. A minimum expiration window of six hours from the initiation of the export is required.

    > [!TIP]
    > It is a best practice to use near-term expiration for the account's SAS. To reduce risk of a compromised storage account, set the end date and time no later than what is needed for you to complete the database export operation.

6. In the **Allowed protocols** section, select **HTTPS only**.
7. Select **Generate SAS and connection string**.
8. Copy the **Blob service SAS URL**.

For more information on generating and using a SAS, see [Grant limited access to Azure Storage resources using shared access signatures (SAS)](/azure/storage/common/storage-sas-overview).

## Creating the database export

When you have created the Azure storage account and generated the SAS URI, you can then create the export file from the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].

1. On the Environments list page, select the relevant production enviroment to view the environment details.
2. On the action ribbon of the environment details, choose **Database**, and then choose **Create Database Export**.
3. In the **File Name** field, specify a name for the export file, or leave the default value.
4. In the **SAS URI** field, specify the **Blob service SAS URL** value that you copied in the previous section.
5. In the **Container Name** field, enter the name of the container in the Azure storage account to which you want the .bacpac file exported. If you have already created a container in your Azure storage account, you can enter the name of that container here. Otherwise, if the name that is specified in the **Container Name** field does not already exist in the Azure storage account, it will be created for you.

Once the export operation begins, the .bacpac file is generated and exported to the indicated Azure storage account. The operation may take several minutes to several hours depending on the size of the database. You can close the browser window with the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] during the export. When the export completes, you can access the export file in the defined container in your Azure storage account. 

## Viewing the export history

All database export activity is logged for auditing purposes. To view the history, choose **Database**, and then choose **View Export History** on the action ribbon of the environment details page of the environment.


## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)
