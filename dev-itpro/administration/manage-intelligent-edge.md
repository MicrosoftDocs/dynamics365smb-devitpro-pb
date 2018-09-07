---
title: Administration of the Intelligent Edge for on-premises | Microsoft Docs
description: Get a cloud copy of your data so you are connected to the intelligent cloud also when you have an on-premises solution based on Business Central, Dynamics GP, Dynamics SL, or Dynamics NAV.
author: edupont04
manager: edupont

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: cloud, edge
ms.date: 08/30/2018
ms.author: bmeier

---

# Managing your Intelligent Cloud Environment

You can connect your on-premises solution to the Intelligent Cloud through a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. Once you have set up this connection, you have access to the **Intelligent Cloud Management** page in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant, from where you can manage the connection.  

## Intelligent Cloud Management

The **Intelligent Cloud Management** page provides information about your data replication runs over the past 30 days, and you can manage your replication services, for example, as described in the following table:  

|Task   |Description|
|---------|---------|
|Viewing Replication History    |The page provides a view of the status of all replications that happened in the past 30 days. You will be able to view the time the replication ran, the status of each replication and when your next replication is scheduled to run.|
|Replication Statistics    |Tiles that will display the number of tables replicated and the number of tables that did not replicate due to errors that occurred during the replication process. You may select either tile to drill into additional details regarding the replication status of each table as well as any messaging to assist you in correcting any errors.|
|Manage Schedule     |Enables you to set the replication schedule without having to run the assisted setup wizard again.|
|Run Replication Now    |You can disable automatic data migration and trigger data replication manually. Ideally, this would be used only when you received errors in the scheduled data replication, you corrected any errors, and want to push updated data to the cloud outside of a normally scheduled run. |
|Reset Cloud Data   |You may run into instances where you need to reset your cloud data. This option will clear all data in your cloud tenant and enable you to start over with data replication. If you need to clear data in your cloud tenant and are have connectivity issues that persist for more than 7 days, you will need to contact customer support. They will create a ticket to have your tenant data cleared. |
|Reset Runtime Key    |If at any time you feel that your Self Hosted Integration Runtime key is no longer secure, you may select this option to regenerate a new key. A new key will be generated for you and automatically be updated in the Self Host Integration Runtime service.|
|Get Runtime Key    |Returns the existing Runtime key.|
|Disable Intelligent Cloud    |You can launch a guide that helps you through a checklist of instructions to disable the Intelligent Cloud configuration. Once this steps in this process are complete, data replication will be discontinued, and your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant may become your primary solution.|

## See Also

[Connect to the Intelligent Cloud with [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](about-intelligent-edge.md)  
[Your Access to the Intelligent Cloud](/dynamics365/business-central/about-intelligent-cloud)
