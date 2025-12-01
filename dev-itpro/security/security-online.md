---
title: Security in Business Central
description: Learn about the main aspects of security in your online deployment of Dynamics 365 Business Central.
author: jswymer
ms.topic: article
ms.author: jswymer
ms.date: 11/17/2025
ms.reviewer: solsen
---

# Business Central security 

This section helps you understand and improve the security of your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant. In the links below you find information, guidance, and recommended practices related to authentication, data encryption, and safely integrating with other services. You can also find information on [!INCLUDE[prod_short](../developer/includes/prod_short.md)] certifications and regulatory compliance.

## Authentication and identity

### Authentication with Microsoft Entra ID

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses Microsoft Entra ID as the authentication method, which is automatically set up and managed for you.

- It's possible to configure Microsoft Entra ID to allow or deny authentications to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] only if certain extra conditions are met using Conditional Access to further improve security of your environments. Administrators can apply Microsoft Entra ID Conditional Access policies to enforce conditions like MFA on every sign in, restrict sign-ins to trusted locations or compliant devices, for [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For example, you might apply the 'Require MFA for all users' policy template to [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Learn more in [Conditional Access](/entra/identity/conditional-access/overview).

    > [!NOTE]
    > Introducing new CA policies prompts users to reauthenticate; plan such changes to minimize disruption (for example, inform users, update background job credentials if needed).

- Always require MFA for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] sign-in. We recommend using modern authentication options (such as Authenticator apps or FIDO2 keys) and disabling basic auth methods. Learn more in [Setting up Multifactor Authentication (MFA)l](multifactor-authentication.md).

### Monitor sign-in attempts to detect threats

Admins can monitor failed sign-in attempts to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] through [Microsoft Entra sign-in logs](/entra/identity/conditional-access/troubleshoot-conditional-access#microsoft-entra-sign-in-events) or [[!INCLUDE[prod_short](../developer/includes/prod_short.md)] authorization trace telemetry](../administration/telemetry-authorization-trace.md). Frequent authentication failures might indicate an attacker trying to guess passwords or an integration using incorrect credentials, so active monitoring is important.

## Access control

### Per-environment access restrictions

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] allows environment-specific access control for partners. An internal administrator can configure an allowlist of external Microsoft Entra tenant IDs (such as partners or ISVs) that are permitted to access a given environment (via Delegated Admin or OAuth apps). This practice adds an extra layer on top of tenant-wide delegation (GDAP) and app consent – if an environment is restricted, only the specified partner tenants can gain access with their accounts or apps. You can configure up to 10 allowed tenants per environment in the Admin Center. Learn more in [Manage access](../administration/tenant-admin-center-manage-access.md).

### Manage environment access

Access can be controlled per [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment for internal users, delegated administrators, and multitenant applications. Learn more in [Manage Access to Environments](../administration/tenant-admin-center-manage-access.md).

## Privileged access management

### Use Privileged Identity Management

Consider using Microsoft Entra ID Privileged Identity Management (PIM) for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] administrators. PIM ensures that high-privilege roles (like Dynamics 365 [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Administrator) are only activated when needed, reducing the risk of always-on admin accounts. This incorporation emphasizes best practice for cloud admins: don't leave admin privileges permanent – require on-demand activation. Learn more in [What is Microsoft Entra Privileged Identity Management?](/entra/id-governance/privileged-identity-management/pim-configure).

In addition to using PIM, physical device security is crucial for administrator access.

### Use secure admin devices

Perform [!INCLUDE[prod_short](../developer/includes/prod_short.md)] administration from a highly secure, isolated workstation. For example, have a dedicated PC (or Azure Virtual Desktop/Cloud PC) for admin use only, with hardened configuration (up-to-date OS, limited software, full disk encryption, and mandatory MFA). Avoid doing daily work or general browsing on the same machine used for privileged access.

### Enforce separation of duties for sensitive operations

In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], use built-in features like [Approval Workflows](/dynamics365/business-central/across-set-up-workflows) to ensure critical transactions (like large payments, purchase orders, or journal postings) require approval by a second person. This practice reduces the risk of fraud or mistakes by a single user.

## Data protection

### Data isolation and encryption

Data belonging to a single tenant is stored in an isolated database and is never mixed with data from other tenants. This setup ensures complete isolation of data in day-to-day use and in backup/restore scenarios. Furthermore, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses encryption to help protect tenant data in the following ways:

- Data at rest is encrypted by using Transparent Data Encryption (TDE) and backup encryption.
- Data backups are always encrypted.
- All network traffic inside the service is encrypted by using industry-standard encryption protocols.

### Customer-managed encryption key

All customer data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is encrypted at-rest with strong Microsoft-managed encryption keys. Microsoft stores and manages the database encryption key for all your data so you don't have to. However, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] provides customer-managed encryption key (CMK) functionality to self-manage the database encryption key associated with your environment. This capability allows you to rotate or swap the encryption key on demand. It also allows you to prevent Microsoft's access to your customer data when you revoke the key access to our services at any time.

The customer-managed encryption key used to encrypt your customer data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] at rest is administered in the Power Platform Admin Center and requires the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to be [linked to a Power Platform environment](../administration/tenant-admin-center-environments.md#linked-power-platform-environment). If the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is linked to a Power Platform environment to which a customer-managed encryption key is applied, this key also automatically applies to the linked [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment. Unlinking an environment encrypted with a customer-managed encryption key or removing the customer-managed encryption key from the linked Power Platform environment automatically reverts encryption of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to the Microsoft-managed encryption key. Learn more about administering customer-managed encryption keys in [Power Platform admin center documentation](/power-platform/admin/customer-managed-key).

Sometimes a new [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is created from an environment that's encrypted with a customer-managed encryption key using a copy or restore operation. In this case, the newly created environment is encrypted using the Microsoft-managed encryption key. To encrypt the newly created environment using a customer-managed encryption key, link it to a Power Platform environment that has the desired customer-managed encryption key applied. 

Similarly, bacpac files created during an environment export operation are encrypted differently. When you export an environment that's encrypted with a customer-managed encryption key, the resulting bacpac files in the storage account use the [encryption key applied to the storage account](/azure/storage/common/customer-managed-keys-overview) rather than the environment's encryption key.

### Customer Lockbox

Most of the operations, support, and troubleshooting performed by Microsoft personnel (including subprocessors) don't require access to customer data. Customer Lockbox provides an interface for the customers to review and approve (or reject) data access requests in rare occasions that require access to customer data. It's used in cases where a Microsoft engineer needs to access customer data, whether in response to a customer-initiated support ticket or a problem identified by Microsoft. Customer Lockbox approvals expire after 8 hours, so any needed support access beyond that would require a new request.

Customer Lockbox for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is administered in the Power Platform Admin Center and requires the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to be [linked to a Power Platform environment](../administration/tenant-admin-center-environments.md#linked-power-platform-environment). Learn more about administering Customer Lockbox in the Power Platform Admin Center [here](/power-platform/admin/about-lockbox). If the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is linked to a Power Platform for which Lockbox is enabled, Lockbox is also automatically enabled for the linked [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment. Lockbox requests for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment can only be approved or rejected in the Power Platform Admin Center by users with at least the [Power Platform Administrator](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) role.

## Service integration

We recommend that you use encrypted network protocols to connect to the Power BI server and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services. Learn more in the following articles:

[Connect to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with Power BI](/power-bi/service-connect-to-microsoft-dynamics-nav) 

[Using Security Certificates with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises](../deployment/implement-security-certificates-production-environment.md) 

## Auditing administrative actions

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] Online automatically logs various administrative and high-level events to your Microsoft Purview audit log, such as:

- Creating or deleting an environment
- Installing an app extension
- Changing a user's permissions or settings
- Changing tenant-level or system configurations

By default, audit logs are kept for 180 days or longer, if your organization purchased extended retention.

Admins can search [!INCLUDE[prod_short](../developer/includes/prod_short.md)] audit events in the Microsoft Purview portal just as they would for Exchange or SharePoint audit data. You can also use PowerShell or the Graph API (Management Activity API) to retrieve and filter these logs programmatically for analysis.

Learn more in [Auditing in Microsoft Purview](../auditing/audit-events-in-purview.md)

## Related information  

[Microsoft Trust Center (what we do to make the service secure)](https://www.microsoft.com/trustcenter/security/default.aspx)  
[Microsoft Dynamics 365 Cloud Services Compliance](https://aka.ms/d365-compliance-list)  
[Security and protection](security-and-protection.md)  
[Security tips for business users](security-users.md)  
