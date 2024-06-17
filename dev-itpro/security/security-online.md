---
title: "Security in Business Central"
description: "Learn about the main aspects of security in your online deployment of Dynamics 365 Business Central."
author: jswymer

ms.topic: conceptual
ms.author: jswymer
ms.date: 04/01/2021
ms.reviewer: jswymer
---

# Business Central Security 

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

This section helps you understand and improve the security of your Dynamics 365 Business Central tenant. In the links below you'll find information, guidance, and recommended practices related to authentication, data encryption, and safely integrating with other services. You'll also find information on Business Central certifications and regulatory compliance.

## Authentication
 
Business Central uses Microsoft Entra ID as the authentication method, which is automatically set up and managed for you.

## Data isolation and encryption

Data belonging to a single tenant is stored in an isolated database and is never mixed with data from other tenants. This ensures complete isolation of data in day-to-day use and in backup/restore scenarios. Furthermore, Business Central uses encryption to help protect tenant data in the following ways:

- Data at rest is encrypted by using Transparent Data Encryption (TDE) and backup encryption.
- Data backups are always encrypted.
- All network traffic inside the service is encrypted by using industry-standard encryption protocols.

## Service integration

We recommend that you use encrypted network protocols to connect to the Power BI server and Business Central web services. For more information, see the following articles:

[Connect to Business Central with Power BI](/power-bi/service-connect-to-microsoft-dynamics-nav) 

[Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md) 

## Customer Lockbox
Most operations, support, and troubleshooting performed by Microsoft personnel (including subprocessors) don't require access to customer data. With Customer Lockbox, we provide an interface for the customers to review and approve (or reject) data access requests in the rare occasion when data access to customer data is needed. It's used in cases where a Microsoft engineer needs to access customer data, whether in response to a customer-initiated support ticket or a problem identified by Microsoft.

Customer Lockbox for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is administered in the Power Platform Admin Center and requires the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to be [linked to a Power Platform environment](../administration/tenant-admin-center-environments.md#linked-power-platform-environment). Learn more about administering Customer Lockbox in the Power Platform Admin Center [here](~/power-platform/admin/about-lockbox.md). If the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is linked to a Power Platform for which Lockbox is enabled, Lockbox will automatically also be enabled for the linked [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment. Lockbox requests for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment can only be approved or rejected in the Power Platform Admin Center by users with a Global Administrator or Power Platform Administrator Entra role assigned.

## See Also  

[Microsoft Trust Center (what we do to make the service secure)](https://www.microsoft.com/trustcenter/security/default.aspx)  
[Microsoft Dynamics 365 Cloud Services Compliance](https://aka.ms/d365-compliance-list)  
[Security and Protection](security-and-protection.md)  
[Security Tips for Business Users](security-users.md)  
