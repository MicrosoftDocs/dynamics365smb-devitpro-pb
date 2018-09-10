---
title: Data Replication | Microsoft Docs
description: Learn how to set up data replication from on-premises to your Business Central tenant so you can connect to the intelligent cloud.
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
# Replicating on-premises data to your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant

Data replication is the process of securely migrating data from your on-premises SQL Server instance to your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. The process uses the Azure Data Factory (ADF) to migrate the data between databases directly, meaning it does not look at any permissions within the applications you are transferring data between, only SQL permissions.  

In order for the data migration to take place, you must successfully complete the **Intelligent Cloud Setup** assisted setup wizard in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. Once the wizard is complete and data replication is activated, an initial data replication will happen at the scheduled time. Alternatively, you can trigger the data replication process manually.  

Data is replicated between the two systems on a per table bases and success and failures are tracked for each table. If a table fails to replicate, the error will be captured, and the replications moves on to the next table until completed. Tables will fail to replicate if they cannot be found, or if the schema does not match between the cloud and the on-premises tables.  

If a table fails to replicate, a blocker is placed on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant table. It is meant as a way for the service to inform you that the data you are viewing has not replicated to prevent you from viewing data that may be out of date. At no point will there be an impact on your on-premises SQL Server data.  

The initial data replication time can vary depending factors such as the amount of data to replicate, your SQL Server configuration, and your connection speeds. The initial replication will take the longest amount of time to complete because all data is replicating. After the initial replication, only changes in data will be replicated so they should run more quickly.  

## Replicating data from extensions

When your on-premises solution is connected to the intelligent cloud, it is highly recommended that you test the impact of any extension in a sandbox environment before you install the extensions in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] production tenant to help avoid any data failures or unintended consequences.  

In order to support data replication, tables and table extensions must specify if data from that table must be replicated or not. By default, the **ReplicateData** property is set to *Yes* so that, by default, any extension that is installed in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant will have all its tables replicated.  

In certain circumstances, you may want to not replicate all data. Here are a few examples:

- The extension is installed in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant but not in the on-premises solution

    In this case, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] will attempt to replicate the data but fail. Since the extension is not installed on-premises, any table related to that extension table will fail to replicate, and blocker notifications will appear on pages that are associated with those tables.

    If you own the extension, we recommend that you set the **ReplicateData** property to *No* on the extension tables. If you do not, and if you want data to replicate, install the extension in both your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant and your on-premises solution. If you do not want data to replicate, uninstall the extension from your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant.  

- The extension references a base table

    This can cause your base table to appear empty when you view data in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. If that happens, uninstall the extension from your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant, and then run the data replication process again.

### Data that is not replicated

During the data replication process, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] does not replicate most system tables, users, and permissions.  

## See also

[Connect to the Intelligent Cloud with Business Central](about-intelligent-edge.md)  
[Managing your Intelligent Cloud Environment](manage-intelligent-edge.md)  
[ReplicateData Property](../developer/properties/devenv-replicatedata-property.md)  
