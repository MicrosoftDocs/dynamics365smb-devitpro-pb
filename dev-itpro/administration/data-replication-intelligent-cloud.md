---
title: Data Replication | Microsoft Docs
description: Get a cloud copy of your data so you are connected to the intelligent cloud also when you have an on-premises solution based on Business Central or Dynamics GP.
author: edupont04
manager: edupont

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: cloud, edge
ms.date: 09/07/2018
ms.author: bmeier

---
# Replicating on-premises data to your Business Central cloud tenant

Data replication is the process of securely migrating data from your SQL Server instance to your Business Central cloud tenant.

The process uses the Azure Data Factory (ADF) to migrate the data between databases directly, meaning it does not look at any permissions within the applications you are transferring data between, only SQL permissions.

In order for the data migration to take place, you must successfully complete the Intelligent Cloud Set Up assisted set up wizard in your Business Central cloud tenant. Once the wizard is complete and data replication is activated, you initial data replication will happen at the scheduled time, or you may manually trigger the data replication process.

Data is replicated between the two systems on a per table bases and success and failures are tracked for each table. 
If a table fails to replicate, the error will be captured, and the replications moves on to the next table until completed.  Tables will fail to replicate if they cannot be found or if the schema does not match between the Business Central cloud table and the on-premises table.

If a table fails to replicate, a blocker is placed on the Business Central cloud tenant table.  It is meant as a way for the service to inform you that the data you are viewing has not replicated to prevent you from viewing data that may be out of date. At no point will there be an impact on your on-premises SQL Service data.

The initial data replication time can vary depending factors such as the amount of data to replicate, your SQL configuration or your connection speeds.  The initial replication will take the longest amount of time to complete because all data is replicating. After the initial replication, only changes in data will be replicated so they should run more quickly.

**Replicaing Extensions Data**

When an Intelligent Cloud environment is configured, it is highly recommended that you test the impact of any Extension in a Sandbox environment before having them installed in your product Business Central Intelligent Cloud tenant to help avoid any data failures or untended consequences.

In order to support data replication a couple changes have been made with the October 2018 release.  First, a new table property was added to define whether or not data from a table should be replicated or not.  The ‘ReplicateData’ property is set to ‘yes’ by default.  This means that, by default, any extension that is installed in the Business Central cloud tenant will have all its tables replicated. This could result in some unwanted results.  Here are a few examples:

If the extension is installed in the Business Central cloud tenant, but not on-premise, data will attempt to replicate by default.  The data that will be replicated is always determined by the Business Central cloud tenant.  Since the extension is not installed on-premises, any table related to that extension companion table will fail to replicate and blocker notifications will appear on pages that are associated with those tables. 

In this scenario, we recommend to set the ‘ReplicateData’ property to ‘No’ on the extension tables if you own the extension. If you want data to replicate, install the extension on both your Business Central cloud tenant and on-premise solution.  If you do not want data to replicate, unistall the extension from your Business Central cloud tenant.

If your extension is referencing a base table, this could cause your base table to appear empty when viewing data in your Business Central cloud tenant. If that happens, unistall the extension from your Business Central cloud tenant and run the data replication process again.

**Non Replicatated Data**

During the data replication process, we do not replicate most system tables, users or permissions.
