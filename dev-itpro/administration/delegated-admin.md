---
title: Delegated admin access to Business Central online
description: As the reselling partner, help customers manage their Business Central online, and provide them with technical support.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: conceptual
ms.workload: na
ms.reviewer: na
ms.search.keywords: administration, tenant, admin, environment
ms.date: 10/28/2020
ms.author: edupont
---

# Delegated Administrator Access to Business Central Online

As a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] reselling partner, you must set up your employees to work in Partner Center, and you must assign employees to support your customers. When you request a reseller relationship with a customer, you can choose to include *delegated administration* privileges for Azure Active Directory (Azure AD) and Office 365 in the request email that you send to the customer.  

You must already have set up users in your own tenant in Partner Center so that the **Assists your customers as** field specifies the relevant role for this user to be able to login in to your customers' [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environments as either *Admin agent* or *Helpdesk agent*. These roles are used when the customer accepts the relationship, so you can assign the right people to the customer's Azure AD tenant.  

When a customer grants the delegated administration privilege to a partner:

- The **Admin Agent** group is assigned to the **Global Administrator** role in the customer's Azure AD tenant.  
- The **Helpdesk Agent** group is assigned to the **Helpdesk Administrator** role in the customer's Azure AD tenant.  

Based on the roles assigned, members of both groups can sign in to the customer's Azure AD tenant, Microsoft 365 services, [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenants by using their partner credentials. For more information, see [Delegated admin privileges in Azure AD](/partner-center/customers_revoke_admin_privileges#delegated-admin-privileges-in-azure-ad) in the Partner Center documentation.  

For certain tasks, you can access the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], which is a powerful tool for you to manage your customers' tenants. From the administration center, you can manage upgrades and access the tenants as the delegated administrator. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

> [!TIP]
> Always include the domain or the Azure Active Directory ID of the customer in the URL when you log in as a *delegated admin*, such as in `https://businesscentral.dynamics.com/contoso.com/admin`. This way, you always know exactly which customer you are trying to access.

[!INCLUDE [admin-partneruser](../developer/includes/admin-partneruser.md)]

## Restricted access to Business Central as delegated administrator

When you sign in to your customers' [!INCLUDE [prod_short](../developer/includes/prod_short.md)] as the *delegated administrator* from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], you have access to all areas of their [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. However, because you are not registered as a regular user, there are certain tasks that you cannot do.

The following tasks are *not* available to the delegated administrator:

- Run scheduled tasks in the job queue. 

    However, starting with 2021 release wave 1 (version 18), delegated administrators can test that the job queue can run without issues, before asking the customer to start it, by using **Run once (forground)** action on the Job Queue Entry card. This will create a temporary non-recurrent copy of this job and will run it once in the foreground. You can then call it as many times as you need before you hand it over to your customer so that they can start it as a recurrent job. After the job queue completes, it will be put in the on-hold status and can't be rescheduled.  

- Use the **Edit in Excel** action or interact with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] data in Excel using the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] add-in for Excel.

    You can still use the **Open in Excel** action to view data in Excel.

- Use the **Invite External Accountant** assisted setup guide

    Instead, you can add the external user in the Azure portal and assign this user the **External Accountant** license.

- Use the **Cloud Migration Setup** assisted setup guide to migrate data from [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online

    Instead, a licensed user who is assigned the SUPER permission set in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] can run the assisted setup guide.

- Access a web service by using a Web Service Access key.
   
    Usage of Web Service Access key is being deprecated. Find out more [here](../upgrade/deprecated-features-w1.md#accesskeys).

## Managing delegated permissions as a partner

Delegated administrators are not visible in the customer's Azure AD user list and cannot be managed by the customer's internal admin. However, when a delegated admin logs into a Business Center environment on behalf of a customer, they are automatically created as a user inside the Business Central environment. This means that the actions performed by a delegated admin are logged in Business Central, such as posting documents and, associated with their user ID.  

If a customer removes delegated permissions from you, you can still manage their subscription from the Partner Center, such as adding or removing licenses for their subscription, but you will no longer be able to log into and manage their Business Central environment, Azure AD, and other services. You will also not be able to manage their users (add/remove/assign licenses) from the **Customer** page in the Partner Center.  

## Managing delegated permissions as an internal administrator

As a Microsoft customer organization, you can have multiple partners registered as your resellers. It is not unusual for a single organization to use one partner as the delegated admin for their Microsoft 365 subscription and another for [!INCLUDE [prod_short](../developer/includes/prod_short.md)], for example. However, as soon as the delegated administration right is granted in the [Microsoft 365 admin center](/office365/admin/admin-overview/about-the-admin-center), you cannot restrict partner access to a specific service only. The delegated admin access applies to all Microsoft services that your organization subscribes to.  

If you do not need delegated admin help continuously, you can restrict access for the partner users into your environment. There are two approaches that you can use to restrict delegated admin access to a Business Center environment:  

- Disable a specific delegated admin user within the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environment. For more information, see [How to remove a user's access](/dynamics365/business-central/ui-how-users-permissions#to-remove-a-users-access-to-the-system).  
- Revoke delegated administration rights from all partner users at once in the Microsoft 365 admin center, without breaking the reseller relationship with the partner.  

In the Microsoft 365 admin center, internal administrators can find information about their partner relationships in the Settings/Partner Relationship menu. On the same page, you can remove delegated permissions from the partner, to restrict their access to Business Central and other services, while still keeping the reseller relationship with them.  

If you then want to allow access to your environment again, you can ask the partner to share the "Request a reseller relationship" invitation link with you again.  

For more information, see [Customers delegate administration privileges to partners](/partner-center/customers_revoke_admin_privileges).

## See also

[Administration of Business Central Online](tenant-administration.md)  
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Exporting Databases](tenant-admin-center-database-export.md)  
