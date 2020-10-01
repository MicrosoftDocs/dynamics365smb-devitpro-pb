---
title: "DataClassification Property"
description: Data classification property is used for security, compliance, privacy and process of collecting, storing and using user personal information. 
ms.author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# DataClassification Property
Sets the classification of the data in the table or field. The data classification can be used to adhere to security, compliance, and privacy requirements and processes for collecting, storing, and using user personal information.  

## Applies to  

-   Table objects
-   Table field controls that are not specified as FlowFields or FlowFilters

## Property Values  
|Value|Description|Example| 
|-----|-----------|-------|
|ToBeClassified|Content that has not yet been given a classification. This is the initial value when table or field is created.||
|CustomerContent|Content directly provided/created by admins and users. CustomerContent is the default value.|<ul><li>Customer generated BLOB or structured storage data</li><li>Customer-owned/provided secrets (passwords, certificates, encryption keys, storage keys)</li></ul>|
|EndUserIdentifiableInformation|(EUII) Data that identifies or could be used to identify the user of a Microsoft service. EUII does not contain Customer content.|<ul><li>User name or display name (DOMAIN\UserName)</li><li>User principle name (name@company.com)</li><li>User-specific IP address</li></ul>| 
|AccountData|Customer billing information and payment instrument information, including administrator contact information, such as tenant administrator’s name, address, or phone number.|<ul><li>Tenant administrator contact information (for example, tenant administrator’s name, address, e-mail address, phone number)</li><li>Customer’s provisioning information</li></ul>|  
|EndUsePseudonymousIdentifiers|EUPI) An identifier created by Microsoft tied to the user of a Microsoft service. When EUPI is combined with other information, such as a mapping table, it identifies the end user. EUPI does not contain information uploaded or created by the customer (Customer content or EUII)|<ul><li>User GUIDs, PUIDs, or SIDs</li><li>Session IDs</li></ul>|
|OrganizationIdentifiableInformation|(OII) Data that can be used to identify a tenant, generally config or usage data. This data is not linkable to a user and does not contain Customer content.|<ul><li>Tenant ID (non-GUID)</li><li>Domain name in e-mail address (xxx@contoso.com) or other tenant-specific domain information</li></ul>| 
|SystemMetadata|Data generated while running the service or program that is not linkable to a user or tenant. |<ul><li>Database table names, database column names, entity names</li></ul>| 


## Remarks  
FlowField and FlowFilter fields are automatically set to the **SystemMetadata** data classification.  
  
## See Also
[Table Properties](devenv-table-properties.md)  
<!-- [Classifying Data](../../classifying-data.md)  
[View All Current Field Data Classifications](../../classifying-data.md#ViewDataClassifications)  -->