---
title: Security in Business Central
description: Learn about the main aspects of security in your online deployment of Dynamics 365 Business Central.
author: jswymer
ms.topic: article
ms.author: jswymer
ms.date: 01/13/2025
ms.reviewer: solsen
---

# Business Central security 

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

This section helps you understand and improve the security of your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant. In the links below you find information, guidance, and recommended practices related to authentication, data encryption, and safely integrating with other services. You'll also find information on [!INCLUDE[prod_short](../developer/includes/prod_short.md)] certifications and regulatory compliance.

## Authentication
 
[!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses Microsoft Entra ID as the authentication method, which is automatically set up and managed for you. It's possible to configure Microsoft Entra ID to allow or deny authentications to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] only if certain extra conditions are met using Conditional Access to further improve security of your environments. For more information, see [Conditional Access](/entra/identity/conditional-access/overview).

Access can be controlled per [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment for internal users, delegated administrators, and multitenant applications. For more information, see [Manage Access to Environments](../administration/tenant-admin-center-manage-access.md).

## Data isolation and encryption

Data belonging to a single tenant is stored in an isolated database and is never mixed with data from other tenants. This ensures complete isolation of data in day-to-day use and in backup/restore scenarios. Furthermore, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses encryption to help protect tenant data in the following ways:

- Data at rest is encrypted by using Transparent Data Encryption (TDE) and backup encryption.
- Data backups are always encrypted.
- All network traffic inside the service is encrypted by using industry-standard encryption protocols.

## Service integration

We recommend that you use encrypted network protocols to connect to the Power BI server and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services. For more information, see the following articles:

[Connect to Business Central with Power BI](/power-bi/service-connect-to-microsoft-dynamics-nav) 

[Using Security Certificates with Business Central on-premises](../deployment/implement-security-certificates-production-environment.md) 

## Customer Lockbox

Most operations, support, and troubleshooting performed by Microsoft personnel (including subprocessors) don't require access to customer data. With Customer Lockbox, we provide an interface for the customers to review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed. It's used in cases where a Microsoft engineer needs to access customer data, whether in response to a customer-initiated support ticket or a problem identified by Microsoft.

Customer Lockbox for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is administered in the Power Platform Admin Center and requires the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to be [linked to a Power Platform environment](../administration/tenant-admin-center-environments.md#linked-power-platform-environment). Learn more about administering Customer Lockbox in the Power Platform Admin Center [here](/power-platform/admin/about-lockbox). If the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is linked to a Power Platform for which Lockbox is enabled, Lockbox will automatically also be enabled for the linked [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment. Lockbox requests for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment can only be approved or rejected in the Power Platform Admin Center by users with at least the [Power Platform Administrator](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) role.

## Customer-managed encryption key

All customer data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is encrypted at-rest with strong Microsoft-managed encryption keys. Microsoft stores and manages the database encryption key for all your data so you don't have to. However, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] provides customer-managed encryption key (CMK) functionality to self-manage the database encryption key that's associated with your environment. This allows you to rotate or swap the encryption key on demand, and it also allows you to prevent Microsoft's access to your customer data when you revoke the key access to our services at any time.

The customer-managed encryption key used to encrypt your customer data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] at rest is administered in the Power Platform Admin Center and requires the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to be [linked to a Power Platform environment](../administration/tenant-admin-center-environments.md#linked-power-platform-environment). If the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is linked to a Power Platform environment to which a customer-managed encryption key is applied, this key will also automatically apply to the linked [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment. Unlinking an environment encrypted with a customer-managed encryption key or removing the customer-managed encryption key from the linked Power Platform environment automatically reverts encryption of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to the Microsoft-managed encryption key. Learn more about administering customer-managed encryption keys in the Power Platform Admin Center [here](/power-platform/admin/customer-managed-key).

When a new [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is created from an environment that's encrypted with a customer-managed encryption key using a copy or restore operation, the newly created environment is encrypted using the Microsoft-managed encryption key. To encrypt the newly created environment using a customer-managed encryption key, link it to a Power Platform environment that has the desired customer-managed encryption key applied. Similarly, .bacpac files created in a storage account as part of an environment export operation for an environment that's encrypted with a customer-managed encryption key are encrypted using the [encryption key applied to the storage account](/azure/storage/common/customer-managed-keys-overview) rather than the encryption key applied to the environment.

## Related information  

[Microsoft Trust Center (what we do to make the service secure)](https://www.microsoft.com/trustcenter/security/default.aspx)  
[Microsoft Dynamics 365 Cloud Services Compliance](https://aka.ms/d365-compliance-list)  
[Security and protection](security-and-protection.md)  
[Security tips for business users](security-users.md)  
