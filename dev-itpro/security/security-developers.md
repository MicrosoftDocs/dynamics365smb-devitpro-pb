---
title: "Business Central security for AL developers"
description: Helps you understand and improve the security of your Business Central apps.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.topic: conceptual
author: kennienp
---

# Business Central security for AL developers

This section helps you understand and improve the security of your Business Central app regardless of where it's hosted. In the sections listed below, you'll find guidance and recommended security best practices related to your app development lifecycle, what you as an AL developer need to know about authentication, authorization, auditing, and data encryption and secrets management.


## Security development lifecycle

The Microsoft Security Development Lifecycle (SDL) is a software development process that helps developers build more secure software and address security compliance requirements while reducing development cost. 

For more information, see [Security Development Lifecycle](https://www.microsoft.com/sdl).  


## Layered security model in Business Central

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses a layered approach to application security, as outlined in the following diagram.

![Security overview.](../developer/media/security-overview.png "Security overview")

From AL, you can only impact the license and permission checks in the authorization layer. If you develop integrations with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] REST API, OData, or SOAP based webservice endpoints, you also need to know how to deal with authentication for webservice sessions.

## Authentication for AL developers

Before a session can be created for a user in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server, the session must be authenticated as a valid user in the system. Business Central (on-premises) supports several authentication methods, such as Windows and Microsoft Entra ID . Business Central online deployments use Microsoft Entra ID only. 

The following table includes links to help you understand authentication in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

|To      |See      | 
|--------|---------| 
| Learn about user session authentication in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. | [Authentication in Business Central](./security-application.md#authentication) |
| Learn about webservice session authentication in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] REST API, OData, or SOAP based webservice endpoints. | [Authentication with OAuth](../webservices/authenticate-web-services-using-oauth.md) <br><br> [Web Services Authentication (on-premises)](../webservices/web-services-authentication.md) <br><br> [Service-to-service authentication](../administration/automation-apis-using-s2s-authentication.md) |


## Authorization for AL developers

After a session is authenticated, the authorization step determines which areas the user of the session can access, such as code they can run, pages and reports they can open, and the permissions they have on associated data. 

The following table includes links to help you understand authorization in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] from the developer point of view.


|To      |See      | 
|--------|---------| 
| Learn how the entitlements are used to support the license part of authorization in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. | [Entitlement object](../developer/devenv-entitlement-object.md) |
| Learn how entitlements can be used to support transactability for AppSource apps | [Supporting transactability for AppSource apps](../developer/devenv-entitlement-object.md#supporting-transactability-for-appsource-apps)
| Learn how user permissions work in the application in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. | [User permissions in the application](./user-security.md#user-permissions-in-the-application) |
| Learn how to implement and extend permission sets in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. | [Permission sets and entitlements overview](../developer/devenv-entitlements-and-permissionsets-overview.md) |
| Learn how to control access to data on the database, company, table, or record level using permissions. | [Data Security](data-security.md?tabs=database-level) <br><br> [Permissions on database objects](../developer/devenv-permissions-on-database-objects.md)|
| Learn how to use permissions to control visibility of UI elements. | [Using permissions to hide  elements in the User Interface](../administration/hide-ui-elements.md) |


## Auditing for AL developers

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes several auditing features that help administrators track information about who is signing in, what their permissions are, what data they've changed, and more. As a developer, you can use some of these features to help you understand the security setup for your app and the stability of its permissions across customer installations. 

The following table includes links to help you understand auditing in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as seen from the developer point of view.

|To      |See      | 
|--------|---------| 
| See an overview of a users permissions. | [Authorization Assessment](/dynamics365/business-central/ui-how-users-permissions#to-get-an-overview-of-a-users-permissions)|
| Monitor permission changes and stability with telemetry. | [Permission changes telemetry](../administration/telemetry-permission-changes-trace.md) <br><br> [Permission dependency cycle telemetry](../administration/telemetry-permission-dependency-cycle-trace.md) <br><br> [Permission error telemetry](../administration/telemetry-permission-error-trace.md) |


## Encryption of data and secrets management for AL developers

Sensitive data in your application needs to be incrypted at rest, in transit, and in memory, and your app secrets should always be stored and processed in a safe manner.

The following table includes links to help you understand encryption in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as seen from the developer point of view.

|To      |See      | 
|--------|---------| 
| Understand encryption at rest for data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. | [Data isolation and encryption (online)](./security-online.md#data-isolation-and-encryption)  <br><br> [Data isolation and encryption (on-premises)](../developer/devenv-encrypting-data.md) |
| Learn how to encrypt data in transit when calling external services from AL. | [Supported cipher suites in HTTPS](../developer/devenv-supported-cipher-suites.md) |
| Learn how to encrypt data in transit when calling [!INCLUDE[prod_short](../developer/includes/prod_short.md)] REST API, OData, or SOAP based webservice endpoints. | [!INCLUDE[prod_short](../developer/includes/prod_short.md)] only supports HTTPS for webservice endpoints. <br><br> For on-premises installations, see [Configuring SSL (on-premises)](../deployment/configure-ssl-web-client-connection.md) |
| To learn how to use the Isolated Storage feature to provide data isolation between extensions. | [Isolated storage](../developer/devenv-isolated-storage.md) |
| To learn how to encrypt data in memory (to protect sensitive data from being exposed through the AL debugger when doing regular or snapshot debugging, or when an administrator takes a memory dump of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server process). |[Protecting sensitive values with the SecretText data type](../developer/devenv-secret-text.md)|
| To safely store secrets for your app and retrieve them from AL. | [Using Azure Key Vault for app secrets](../developer/devenv-app-key-vault-overview.md) |


## See Also  

[General security overview](security-and-protection.md)   