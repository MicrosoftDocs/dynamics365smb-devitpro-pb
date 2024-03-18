---
title: "Integration Concepts and Terminology"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# Integration Concepts and Terminology
The integration of [!INCLUDE[crm_md](includes/crm_md.md)] and [!INCLUDE[navnow_md](includes/navnow_md.md)] involves the integration between entities in [!INCLUDE[crm_md](includes/crm_md.md)], such as accounts, and equivalent record types \(tables\) in [!INCLUDE[navnow_md](includes/navnow_md.md)], such as customers. Integrating [!INCLUDE[crm_md](includes/crm_md.md)] involves several components and objects, along with business logic, working together. This article describes some of the main participants in integration.

##  <a name="CouplingOverview"></a> Record Couplings
A coupling provides the basis for integrating records in [!INCLUDE[crm_md](includes/crm_md.md)] with records in  [!INCLUDE[navnow_md](includes/navnow_md.md)]. Essentially a coupling associates or links a [!INCLUDE[crm_md](includes/crm_md.md)] record to a [!INCLUDE[navnow_md](includes/navnow_md.md)] record. For example a specific account is coupled to a specific customer. A coupling enables users to open records in [!INCLUDE[crm_md](includes/crm_md.md)] from the  [!INCLUDE[navnow_md](includes/navnow_md.md)] client, and vice versa \(if the [!INCLUDE[navnow_md](includes/navnow_md.md)] integration solution is installed in [!INCLUDE[crm_md](includes/crm_md.md)]\). It is also used when synchronizing data between the records.

Couplings can be set up automatically by using the synchronization jobs or manually by editing the record in the [!INCLUDE[navnow_md](includes/navnow_md.md)]  client. For more information, see [Synchronizing Microsoft Dynamics NAV and Dynamics 365 for Sales](Synchronizing-Dynamics-NAV-and-Dynamics-CRM.md) and [How to: Couple and Synchronize Records Manually](How-to-Couple-and-Synchronize-Records-Manually.md).

##  <a name="IntegrationTableOverview"></a> Integration Tables
 An integration table is a table in the [!INCLUDE[navnow_md](includes/navnow_md.md)] database that represents an entity in [!INCLUDE[crm_md](includes/crm_md.md)]. The integration table includes fields that correspond to fields in the entity. The integration table acts as a link or connector between the [!INCLUDE[navnow_md](includes/navnow_md.md)] table and the [!INCLUDE[crm_md](includes/crm_md.md)] entity. For example, for integrating the [!INCLUDE[crm_md](includes/crm_md.md)] accounts entity, the [!INCLUDE[navnow_md](includes/navnow_md.md)] database includes the integration table **5341 CRM Accounts**.

##  <a name="IntegTblMappingsOverview"></a> Integration Table Mappings
 An integration table mapping links the [!INCLUDE[navnow_md](includes/navnow_md.md)] table to the integration table for the [!INCLUDE[crm_md](includes/crm_md.md)] entity. For each entity in [!INCLUDE[crm_md](includes/crm_md.md)] that you want to synchronize with corresponding data in [!INCLUDE[navnow_md](includes/navnow_md.md)], there must be a corresponding integration table mapping. Integration table mappings are stored in table **5335 Integration Table Mappings** and can be viewed and modified from page **5335 Integration Table Mappings**. Complex mappings and synchronization rules are defined in codeunit **5341**.

##  <a name="IntegFieldMappingsOverview"></a> Integration Field Mappings
 A field mapping associates a field in a [!INCLUDE[crm_md](includes/crm_md.md)] entity record with a field in a [!INCLUDE[navnow_md](includes/navnow_md.md)] record. The mapping is used to determine which data to synchronize between [!INCLUDE[crm_md](includes/crm_md.md)] and [!INCLUDE[navnow_md](includes/navnow_md.md)] records. The field mappings define which field in [!INCLUDE[navnow_md](includes/navnow_md.md)] corresponds to which field in [!INCLUDE[crm_md](includes/crm_md.md)]. For example a [!INCLUDE[navnow_md](includes/navnow_md.md)] customer includes some fields that are either not supported in [!INCLUDE[crm_md](includes/crm_md.md)] accounts, or you just do not want the data to be synchronized. Integration field mappings are defined in table **5336 Integration Field Map**.

## See Also
[Integrating Dynamics 365 for Sales in Dynamics NAV](Integrating-Dynamics-CRM-in-Dynamics-NAV.md)  
[Setting Up Dynamics 365 for Sales Integration in Dynamics NAV](Setting-Up-Dynamics-CRM-Integration.md)  
[How to: Set Up a Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md)  
[How to: Enable Default Dynamics 365 for Sales Synchronization Setup](How-to-Enable-Default-Dynamics-CRM-Synchronization-Setup.md)  
