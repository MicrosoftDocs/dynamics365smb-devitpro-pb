---
title: Delegated admin access to Business Central online
description: As the reselling partner, help customers manage their Business Central online, and provide them with technical support.  
author: edupont04

ms.topic: conceptual
ms.workload: na
ms.reviewer: na
ms.search.keywords: administration, tenant, admin, environment
ms.date: 10/18/2022
ms.author: edupont
---

# Delegated Administrator Access to Business Central Online

As a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] reselling partner, you must set up your employees to work in Partner Center, and you must assign employees to support your customers. When you request a reseller relationship with a customer, you can choose to include *delegated administration* privileges for Azure Active Directory (Azure AD) and Microsoft 365 in the request email that you send to the customer.  

> [!TIP]
> Since February 2022, you can request access to your customer's tenant with *granular delegated admin privileges*. This way, you [set up security groups](/partner-center/gdap-assign-azure-ad-roles) to specify which users in your own organization must have access to a specific customer as *Dynamics 365 administrator* or any other role you prefer. For more information, see [Introduction to granular delegated admin privileges (GDAP)](/partner-center/gdap-introduction) in the Partner Center content. We recommend that you switch off any existing relationship and [request granular delegated admin privileges](/partner-center/gdap-assign-azure-ad-roles) instead. For more information, see the [GDAP FAQ](/partner-center/gdap-faq#dap-and-gdap).  

When a customer accepts a partner's request for *granular delegated administration privileges*, the relevant members of the specified security group in the partner's Azure AD tenant get access as indicated in the following list:

- The *[Dynamics 365 Administrator](/azure/active-directory/roles/permissions-reference?branch=main#dynamics-365-administrator)* role gives access to manage Dynamics 365 for the customer, including support requests  
- The *[Service Support Administrator](/azure/active-directory/roles/permissions-reference#service-support-administrator)* role gives access to manage support requests on the customer's behalf
- The *[Helpdesk Administrator](/azure/active-directory/roles/permissions-reference#helpdesk-administrator)* role gives access to the customer's Azure AD tenant.  

For more information, see [Least-privileged roles](/partner-center/gdap-least-privileged-roles-by-task) in the GDAP section of the Partner Center content.  

The members of the security group have either the *Admin agent* or *Helpdesk agent* role in your own Azure AD tenant. For more information, see [Assign roles and permissions to users](/partner-center/permissions-overview).  

For certain tasks, you can access the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], which is a powerful tool for you to manage your customers' tenants. From the administration center, you can manage upgrades and access the tenants as the delegated administrator. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

> [!TIP]
> Always include the domain or the Azure Active Directory ID of the customer in the URL when you log in as a *delegated admin*, such as in `https://businesscentral.dynamics.com/contoso.com/admin`. This way, you always know exactly which customer you are trying to access.

> [!CAUTION]
> [!INCLUDE [admin-partneruser](../developer/includes/admin-partneruser.md)]

## Managing delegated permissions as a partner

[!INCLUDE [admin-gdap-user](../includes/admin-gdap-user.md)]

At the partner company, we encourage you to keep track of which user names your technicians and consultants have in your customers' Business Central tenants. For example, you have a consultant who is an admin with GDAP in your partner company's five customers' Business Central. Your consultant can see which customers they have GDAP access to in the **Granular administration** list in the **Administer** page in Partner Center. But as an organization, you can also maintain a list of names and IDs. 

If a customer removes delegated permissions from you, you can still manage their subscription from the Partner Center, such as adding or removing licenses for their subscription, but you'll no longer be able to log into and manage their Business Central environment, Azure AD, and other services. You'll also not be able to manage their users (add/remove/assign licenses) from the **Customer** page in the Partner Center.  

### Restricted access to Business Central as delegated administrator

When you sign in to your customers' [!INCLUDE [prod_short](../developer/includes/prod_short.md)] as the *delegated administrator* from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], you have access to all areas of their [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. However, because you aren't registered as a regular user, there are certain tasks that you can't do.

The following tasks aren't available to the delegated administrator:

- Run scheduled tasks in the job queue.  

    However, <!--starting with 2021 release wave 1 (version 18),--> delegated administrators can test that the job queue can run without issues, before asking their customer to start it, by using the **Run once (foreground)** action on the **Job Queue Entry** card. This action creates a temporary non-recurrent copy of this job and runs it once in the foreground. You can then call it as many times as you need before you hand it over to your customer so that they can start it as a recurrent job. After the job queue completes, it will be put in the on-hold status and can't be rescheduled.  

- Trigger a web hook or any other application action that relies on the job queue functionality, except by using the **Run once (foreground)** action.

- Use the **Invite External Accountant** assisted setup guide

    Instead, you can add the external user in the Azure portal and assign this user the **External Accountant** license.

<!--- Use the **Cloud Migration Setup** assisted setup guide to migrate data from [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online

    Instead, a licensed user who is assigned the SUPER permission set in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] can run the assisted setup guide.-->

- Access a web service by using a Web Service Access key.

    Usage of Web Service Access key was deprecated in 2022 release wave 1. Find out more [here](../upgrade/deprecated-features-platform.md#accesskeys).

> [!NOTE]
> [!INCLUDE [admin-conditional-access-policies](../includes/admin-conditional-access-policies.md)]

## Managing delegated permissions as an internal administrator

As a Microsoft customer organization, you can have multiple partners registered as your resellers. It isn't unusual for a single organization to use one partner as the delegated admin for their Microsoft 365 subscription and another for [!INCLUDE [prod_short](../developer/includes/prod_short.md)], for example. However, as soon as the delegated administration right is granted in the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/about-the-admin-center), you can't restrict partner access to a specific service only. The delegated admin access applies to all Microsoft services that your organization subscribes to.  

> [!TIP]
> If the partner has requested access to your tenant using *granular delegated admin privileges*, then you can see the relevant users in the **Users** list in [!INCLUDE [prod_short](../includes/prod_short.md)], and you can see them in the **Sign in** log in your Microsoft 365 admin center. With granular delegated admin privileges, the partner typically does not have global admin access to your tenant but only access to Dynamics 365. You will not be able to see the name of the partner user, but you can see an ID and the name of their company.

[!INCLUDE [admin-gdap-user](../includes/admin-gdap-user.md)]

[!INCLUDE [admin-conditional-access-policies](../includes/admin-conditional-access-policies.md)]

If you don't need delegated admin help continuously, you can restrict access for the partner users into your environment. There are two approaches that you can use to restrict delegated admin access to a Business Center environment:  

- Disable a specific delegated admin user within the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environment. For more information, see [How to remove a user's access](/dynamics365/business-central/ui-how-users-permissions#to-remove-a-users-access-to-the-system).  
- Revoke delegated administration rights from all partner users at once in the Microsoft 365 admin center, without breaking the reseller relationship with the partner.  

In the Microsoft 365 admin center, internal administrators can find information about their partner relationships in the Settings/Partner Relationship menu. On the same page, you can remove delegated permissions from the partner, to restrict their access to Business Central and other services, while still keeping the reseller relationship with them.  

If you then want to allow access to your environment again, you can ask the partner to share the "Request a reseller relationship" invitation link with you again.  

For more information, see [Customers delegate administration privileges to partners](/partner-center/customers_revoke_admin_privileges) in the Partner Center content.

> [!NOTE]
> [!INCLUDE [admin-partneruser](../developer/includes/admin-partneruser.md)]

## See also

[Administration of Business Central Online](tenant-administration.md)  
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Exporting Databases](tenant-admin-center-database-export.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
