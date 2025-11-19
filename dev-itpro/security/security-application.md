---
title: Layered security model in Business Central
description: Helps you understand and improve the security of your Business Central application regardless of where it's hosted.
ms.date: 11/19/2025
ms.topic: article
author: jswymer
---

# Layered security model in Business Central

This article helps you understand and improve the security of your Business Central installation regardless of where it's hosted. It includes guidance and recommended practices related to authentication, authorization, and auditing. It also touches on data encryption and secure development practices that can be applied to any Business Central environment.

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses a layered approach to application security, as outlined in the following diagram.

![Security overview.](../developer/media/security-overview.png "Security overview")

## Authentication

Before users can sign in to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application, they must be authenticated as a valid user in the system. Business Central (on-premises) supports several authentication methods, such as Windows and Microsoft Entra ID. Business Central online deployments use Microsoft Entra ID only. Learn more in the following articles:

[Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions)

[Audit user administration events in Microsoft Purview](../auditing/audit-events-in-purview.md#administered-user-activities)

<!-- [User Authentication](user-security.md#user-authentication)  -->

[Set up Business Central Access with Microsoft 365 Licenses](/dynamics365/business-central/admin-access-with-m365-license)

[Authentication and Credential Types (on-premises only)](../administration/users-credential-types.md)

[Set up Multifactor Authentication (MFA)](multifactor-authentication.md)<!--note from editor: "Multifactor" is never hyphenated, via Microsoft Writing Style Guide.-->

The authentication method configured for Business Central Server is also used to access web services. Learn more in [Web Services Authentication](../webservices/web-services-authentication.md).

## Authorization

After a user is authenticated, authorization determines which areas the user can access. For example, it determines the pages and reports a user can open and the permissions they have on associated data. Learn more in the following articles:

[User Permissions in the Application](user-security.md#user-permissions-in-the-application)

[Audit permission administration events in Microsoft Purview](../auditing/audit-events-in-purview.md#administered-user-activities)

[Analyzing Permission Changes Trace Telemetry](../administration/telemetry-permission-changes-trace.md)

[Data Security](data-security.md?tabs=database-level)

<!--[Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions) redundant -->

[Removing Elements from the User Interface According to Permissions](../administration/hide-ui-elements.md)  

[Analyzing Authorization Telemetry](../administration/telemetry-authorization-trace.md)

[Using OAuth to Authorize Business Central Web Services](../webservices/authenticate-web-services-using-oauth.md)

> [!NOTE]
> After successful authentication, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] allows a user in only if they exist in the environment and have permission to the company or data they're trying to access. In other words, being a licensed in Microsoft Entra ID isn't enough&mdash;the user must also be set up inside [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with appropriate access.

## Data encryption

You can encrypt data on the Business Central server by generating new encryption keys&mdash;or importing existing ones&mdash;that you enable on the Business Central server instance that connects to the database. Learn more in [Encrypting Data in Dynamics 365 Business Central](../developer/devenv-encrypting-data.md).

<!-- [Data encryption](/dynamics365/business-central/admin-manage-data-encryption)-->  

## Security development lifecycle

The Microsoft Security Development Lifecycle (SDL) is a software development process that helps developers build more secure software. SDL addresses security compliance requirements while reducing development cost. Learn more in [Security Development Lifecycle](https://www.microsoft.com/sdl).  

## Auditing

For a comprehensive audit trail of data changes, Business Central offers a change log feature. When the change log is enabled enabled for specific tables/fields, it records every insertion, modification, or deletion (including the old and new values, user, and timestamp).

This information is useful for compliance and investigations. However, be mindful of performance. Enable it only on the records that truly need detailed tracking. For instance, avoid logging every change on large ledger entry tables, because these changes are append-only by nature.

Learn more about the change log in [Audit changes](/dynamics365/business-central/across-log-changes).

> [!TIP]
> Instead of the change log, you can use Business Central's analysis mode on any list page. Add the system fields (Created/Modified date and user) to the list (they can be hidden), then turn on analysis mode. With these fields present, the analysis mode (and Copilot) can help summarize recent changes to the data in that list&mdash;giving you a lightweight audit view.

## Related information  

[Security and Protection](security-and-protection.md)  
[Security Tips for Business Users](security-users.md)  
[Online Security](security-online.md)  
[on-premises Security](security-onpremises.md)  
