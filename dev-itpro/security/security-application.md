---
title: "Layered security model in Business Central"
description: Helps you understand and improve the security of your Business Central application regardless of where it's hosted.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: jswymer
---

# Layered security model in Business Central

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

This section helps you understand and improve the security of your Business Central installation regardless of where it's hosted. In the sections listed below, you'll find guidance and recommended practices related to authentication, authorization, and auditing, in addition to data encryption and secure development practices that can be applied to any Business Central environment.

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses a layered approach to application security, as outlined in the following diagram.

![Security overview.](../developer/media/security-overview.png "Security overview")

## Authentication

Before users can sign in to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application, they must be authenticated as a valid user in the system. Business Central (on-premises) supports several authentication methods, such as Windows and Microsoft Entra ID . Business Central online deployments use Microsoft Entra ID only. For more information, see the following articles:

[Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions)

<!-- [User Authentication](user-security.md#user-authentication)  -->

[Authentication and Credential Types](../administration/users-credential-types.md)

[Multifactor Authentication](multifactor-authentication.md)<!--note from editor: "Multifactor" is never hyphenated, via Microsoft Writing Style Guide.-->

The authentication method configured for Business Central Server is also used to access web services. For more information, see [Web Services Authentication](../webservices/web-services-authentication.md).

## Authorization

After a user is authenticated, authorization determines which areas the user can access, such as the pages and reports they can open and the permissions they have on associated data. For more information, see the following articles:

[User Permissions in the Application](user-security.md#user-permissions-in-the-application)

[Analyzing Permission Changes Trace Telemetry](../administration/telemetry-permission-changes-trace.md)

[Data Security](data-security.md?tabs=database-level)

<!--[Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions) redundant -->

[Removing Elements from the User Interface According to Permissions](../administration/hide-ui-elements.md)  

[Analyzing Authorization Telemetry](../administration/telemetry-authorization-trace.md)

[Using OAuth to Authorize Business Central Web Services](../webservices/authenticate-web-services-using-oauth.md)

## Auditing

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes several auditing features that help you track information about who is signing in, what their permissions are, what data they've changed, and more. For more information, see the following articles:

[Authorization Assessment](/dynamics365/business-central/ui-how-users-permissions#to-get-an-overview-of-a-users-permissions)
  
[Data Auditing](/dynamics365/business-central/across-log-changes)
  
[Security Auditing](security-auditing.md)

[Data Classification](/dynamics365/business-central/admin-classifying-data-sensitivity)

> [!TIP]  
> Before [!INCLUDE[prod_short](../includes/prod_short.md)] online logs authorization attempts to telemetry, a successful authentication (login) must happen against Microsoft Entra ID (formerly Azure Active Directory). With the information in the Microsoft Entra sign-in log, you can figure out what happened if a user sign-in failed. For more information, see [Analyze sign-ins with the Microsoft Entra sign-in log](/entra/identity/monitoring-health/quickstart-analyze-sign-in)
> 
> If you want to track, monitor, or alert on successful and failed login attempts against Microsoft Entra ID, configure integration to Azure Monitor on Microsoft Entra and analyze further with KQL. For more information, see [Integrate Microsoft Entra logs with Azure Monitor](/entra/identity/monitoring-health/howto-access-activity-logs#integrate-logs-with-azure-monitor-logs).



## Data encryption

You can encrypt data on the Business Central server by generating new encryption keys&mdash;or importing existing ones&mdash;that you enable on the Business Central server instance that connects to the database. For more information, see [Encrypting Data in Dynamics 365 Business Central](../developer/devenv-encrypting-data.md).

<!-- [Data encryption](/dynamics365/business-central/admin-manage-data-encryption)-->  

## Security development lifecycle

The Microsoft Security Development Lifecycle (SDL) is a software development process that helps developers build more secure software and address security compliance requirements while reducing development cost. For more information, see [Security Development Lifecycle](https://www.microsoft.com/sdl).  

## See Also  

[Security and Protection](security-and-protection.md)  
[Security Tips for Business Users](security-users.md)  
[Online Security](security-online.md)  
[On-Premises Security](security-onpremises.md)  
