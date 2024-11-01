---
title: Delegated admin access to Business Central online
description: As the reselling partner, help customers manage their Business Central online, and provide them with technical support.  
author: jswymer

ms.topic: conceptual
ms.search.keywords: administration, tenant, admin, environment
ms.date: 11/01/2024
ms.author: jswymer
ms.reviewer: jswymer
---

# Delegated administrator access to Business Central Online

As a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] reselling partner, you must set up your employees to work in Partner Center, and you must assign employees to support your customers. There are two types of relationships reselling partners can set up with their customers. [*Reseller* relationships](/partner-center/customers/request-a-relationship-with-a-customer) enable the reseller to sell customers [!INCLUDE[prod_short](../developer/includes/prod_short.md)] licenses. [*Granular delegated administration privileges (GDAP)* relationships](/partner-center/customers/gdap-introduction) enable users in the reseller's tenant to access and administer the customer's [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments as delegated administrator.

For each relationship type, the partner generates a link in Partner Center that internal Global Administrators in the customer tenant can navigate to accept the relationship. After a customer accepts a partner's request for a GDAP relationship, the partner can assign security groups in their own tenant to one or multiple Microsoft Entra roles that the customer accepted as part of the GDAP relationship.

To administer [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as delegated administrator, the recommended [least-privileged](/partner-center/gdap-least-privileged-roles-by-task) role to include in your relationship is [Dynamics 365 Business Central Administrator](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-business-central-administrator), which grants access to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] and environments in the customer tenant. Find more information about roles supported by [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and products and services that integrate with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in [Supported Microsoft Entra roles for access](tenant-admin-center.md#supported-microsoft-entra-roles-for-access).

> [!TIP]
> Always include the domain or the Microsoft Entra ID of the customer in the URL when you log in as a *delegated admin*, such as in `https://businesscentral.dynamics.com/contoso.com/admin`. This way, you always know exactly which customer you are trying to access.

## Managing delegated permissions as a partner

[!INCLUDE [admin-gdap-user](../includes/admin-gdap-user.md)]

At the partner company, we encourage you to keep track of which user names your technicians and consultants have in your customers' Business Central tenants. For example, you have a consultant who is an admin with GDAP in your partner company's five customers' [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Your consultant can see which customers they have GDAP access to in the **Granular administration** list in the **Administer** page in Partner Center. But as an organization, you can also maintain a list of names and IDs. 

If a customer removes delegated permissions from you, you can still manage their subscription from the Partner Center, such as adding or removing licenses for their subscription, but you're no longer be able to log into and manage their Business Central environment, Microsoft Entra ID, and other services. You're'also not able to manage their users (add/remove/assign licenses) from the **Customer** page in the Partner Center.  

### Limitations for delegated administrators

When you sign in to your customers' [!INCLUDE [prod_short](../developer/includes/prod_short.md)] as the *delegated administrator* from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], you have access to all areas of their [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. However, because you aren't registered as a regular user, there are certain tasks that you can't do.

The following tasks aren't available to the delegated administrator:

- Run scheduled tasks in the job queue.  

   However, delegated administrators can create job queue entries and set them as ready to run. Then, a licensed user from the customer can start the job queue entry. Delegated administrators can also test that the job queue can run without issues, before asking their customer to start it, by using the **Run once (foreground)** action on the **Job Queue Entry** card. This action creates a temporary non-recurrent copy of this job and runs it once in the foreground. You can then call it as many times as you need before you hand it over to your customer so that they can start it as a recurrent job. After the job queue completes, it will be put in the on-hold status and can't be rescheduled.  

- Trigger a web hook or any other application action that relies on the job queue functionality, except by using the **Run once (foreground)** action.

- Use the **Invite External Accountant** assisted setup guide

    Instead, you can add the external user in the Azure portal and assign this user the **External Accountant** license.

<!--- Use the **Cloud Migration Setup** assisted setup guide to migrate data from [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online

    Instead, a licensed user who is assigned the SUPER permission set in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] can run the assisted setup guide.-->

## Managing delegated permissions as an internal administrator

As a Microsoft customer organization, you can have multiple partners registered as your resellers. It isn't unusual for a single organization to use one partner as the delegated admin for their Microsoft 365 subscription and another for their [!INCLUDE [prod_short](../developer/includes/prod_short.md)] subscription, for example. The services each partner can administer are determined by the Entra roles that are included in the GDAP relationship. For partners managing [!INCLUDE [prod_short](../developer/includes/prod_short.md)], the [Dynamics 365 Business Central Administrator](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-business-central-administrator) role is recommended as the [least-privileged](/partner-center/gdap-least-privileged-roles-by-task) role that allows for administration of and access to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environments.

It also isn't unusual for a single organization to have multiple [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environments, each managed by a different partner. In this case, the customer would have to accept a GDAP relationship including at least the [Dynamics 365 Business Central Administrator](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-business-central-administrator) role with each partner organization. Internal administrators can use the **Partner access** settings in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to enable or disable delegated administrators from administering and accessing each environment, or to only allow delegated administrators from specific partner Entra tenants to administer and access an environment. Learn more in [Manage Access to Environments](tenant-admin-center-manage-access.md).

[!INCLUDE [admin-gdap-user](../includes/admin-gdap-user.md)]

[!INCLUDE [admin-conditional-access-policies](../includes/admin-conditional-access-policies.md)]

If you don't need delegated admin help continuously, you can (temporarily) restrict access for the partner users into your environment. There are several approaches you could take to limit partner access:

- Disable a specific delegated admin user within the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environment. Learn more in [How to remove a user's access](/dynamics365/business-central/ui-how-users-permissions#to-remove-a-users-access-to-the-system).
- Remove some or all permissions from the license configurations for delegated administrators to prevent any new delegated administrator users from being assigned those permissions when they first sign in to an environment. Learn more in [Configure permissions based on licenses](/dynamics365/business-central/ui-how-users-permissions#licensespermissions).
- Disable all partners from accessing and administering specific environments in your tenant, or allowlist only specific partners for access if you have GDAP relationships with multiple partners. Learn more in [Manage Access to Environments](tenant-admin-center-manage-access.md).
- Accept only short-lived GDAP relationships that don't auto-extend whenever a partner has a specific temporary need to access or administer your environments. Internal Global Administrators can view and disable GDAP relationships in the Microsoft 365 Admin Center. Learn more at [Customers delegate administration privileges to partners](/partner-center/customers_revoke_admin_privileges) in the Partner Center content.

If your organization decides to terminate a GDAP relationship with a partner or to switch to another partner, you must make sure that some settings that your current partner might have set up in your [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] are removed. Learn more in [Cleaning up settings](tenant-admin-center.md#cleaning-up-settings).

## See also

[Administration of Business Central Online](tenant-administration.md)  
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Exporting Databases](tenant-admin-center-database-export.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
