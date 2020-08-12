---
title: "Power Apps portals with Business Central"
ms.custom: na
ms.date: 08/12/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---

# Power Apps portals with Business Central

[!include[banner](../includes/banner.md)]

> [!IMPORTANT]
> This functionality requires version 10.0.12 for Business Central apps, while service update 189 is required for Common Data Service. The release information for Common Data Service is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

Power Apps portals will enable create, update, and delete (CRUD) operations to Business Central entities that are available as virtual entities in Common Data Service. This topic explains the scenarios that are implemented in Power Apps portals for Business Central apps.

## Anonymous access from Power Apps portals

Collaboration scenarios in business processes such as bidding or onboarding of prospects in Business Central require that external users participate from the Power Apps portal, even though they aren't users in Business Central apps. The simplicity of anonymous access is appealing in these types of scenarios because the users, who might not be Business Central apps users, don't have to sign in. However, they are expected to perform CRUD operations in Business Central to complete any meaningful tasks in the business processes.

To ensure that only the required entities are enabled for anonymous access, a user in Business Central must be designated as the user who is used for anonymous access. This designation is configured in the **Anonymous portal access user ID** field on the **Virtual entity** tab on the **System parameters** page (**System administration \> System parameters**). The designated user can then be assigned to duties and security roles to control access to specific data that must be made available to all users who will interact anonymously from the Power Portal.

Note that because this scenario involves anonymous access, the only user context that matters, from a security perspective, is the user who is designated in the **Anonymous portal access user ID** field.

## Authenticated access from Power Apps portals

Fully authenticated user access from Power Apps portals to Business Central lets users in Business Central also interact from Power Apps portals. A user who signs in to the Power Apps portal is also a known user in Business Central who has appropriate security roles based on job requirements. These roles govern the security access to data for the authenticated user in Power Portal. In addition, any Business Central user that is expected to also use Power Apps portal to access Business Central data must also belong to the **CDSVirtualEntityAuthenticatedPortalUser** security role. This provides an additional layer of security and also provides a way to know the total users that are authorized to access from Power Apps portals. 

Because Power Apps portals authentication is linked to the Contacts entity in Common Data Service, a mapping must be established between the Common Data Service contact and the corresponding user in Business Central. This mapping can be done by adding entries to the **msdyn\_externalportalusermapping** entity. From a security perspective, the scope of virtual entities that are made available to authenticated users must be configured as **Global** in the Power Apps portal.

When authenticated users from a different tenant need to be added to Business Central as users, you must use the [Create new user](../sysadmin/tasks/create-new-users.md) process in Business Central. This process adds cross-tenant users as Microsoft Azure Active Directory (Azure AD) business-to-business (B2B) guest users.
