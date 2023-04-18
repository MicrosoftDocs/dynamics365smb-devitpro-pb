---
title: Deprecated features in the client, server, database
description: Describes the features that have been removed or replaced in the platform components of Business Central.
author: brentholtorf
ms.author: bholtorf
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 03/17/2023
ms.custom: bap-template
---

# Deprecated Features in the Platform - Clients, Server, and Database

This article describes the features that are up for removal or that have been removed or replaced in the platform that [!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses across languages and base app.  

[!INCLUDE [feature-deprecation](../includes/feature-deprecation.md)]

## Changes in 2025 release wave 1 (version 26.0)

### Direct cloud migration and data upgrade from version Dynamics NAV 2019 (v.14.x) (removed)

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | Direct cloud migration and data upgrade from version NAV 2019 (v.14.x) is no longer supported. In order to upgrade (or cloud-migrate) data to v.26 or higher, follow one of these paths:<br><ul><li>Pre-v.14 customers > upgrade to v.14 > upgrade to v.25 > upgrade or cloud migrate to v.26</li><li>V.14 to v.24 customers > upgrade to v.25 > upgrade or cloud migrate to v.26 </li></ul>`ObsoleteState = Removed` fields will be regularly cleaned up with a cadence of once every five major releases (referred to as the *stepping-stone* release). So after v.25, the next stepping-stone release will be v.30, and so on. |

## Changes in 2024 release wave 2 (version 25.0)

### Direct cloud migration and data upgrade from version Dynamics NAV 2019 (v.14.x) (warning)

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | Cloud migration tool and on-premises data upgrade toolkit supports one-step upgrade path from any version starting from Dynamics NAV 2019 (v.14) to the latest version of Business Central.<br><br>This is possible because none of the schema elements (tables and fields) deprecated over 11 major updates (from v.14 to v.25) were removed from the released databases to preserve backwards compatibility and enable more seamless transition for our customers to the latest versions on-premises and online. <br><br>Over these releases, we've accumulated a significant number of such obsolete schema elements, which increases complexity of working with the application code. This condition blocks the reuse of the long obsolete objects and field IDs, affecting our work of moving common functionality from local versions of Business Central to W1 version. <br><br>At the same time, much has changed in the area of upgradeability since v.14 like: the move to extensions, the transition to Universal Code, introduction of AL Go for GitHub for tracking apps compatibility and more. These improvements make it simpler to follow Business Central update cadence more closely.<br><br>So in the next release (that is, 2025 release wave 1 (v.26)), we're going to clean up all schemas that have been marked as `ObsoleteState = Removed` since Dynamics NAV 2019 (v.14). <br><br>As a result, data upgrade or cloud migration to v.26 or higher will have to be done via v.25 (referred to as the *stepping-stone* release) following one of the paths:<br><ul><li>Pre-v.14 customers > upgrade to v.14 > upgrade to v.25 > upgrade or cloud migrate to v.26 </li><li>V.14 to v.24 customers > upgrade to v.25 > upgrade or cloud migrate to v.26</li></ul>`ObsoleteState = Removed` fields will then be regularly cleaned up with a cadence of once every five major releases. So after v.25, the next stepping-stone release will be v.30, and so on. | 

## Changes in 2024 release wave 1 (version 24.0)

### <a name="schemaversion"></a>Schema version for custom APIs (changed default)

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | The API capability in Business Central is used many places, for example, in the APIs that come out-of-the-box. For these APIs, $schemaversion is always set to 2.0 to get the latest features in the Business Central OData stack. For custom APIs, it's possible to get these new features by simply calling the API with $schemaversion=2.0. Starting in version 24, the default value of $schemaversion is set to 2.0, also for custom APIs.|

### <a name="odata_delta"></a>Support for Delta Links with APIs (removed)

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | Delta links are opaque, service-generated links that a web service client can use to retrieve subsequent changes to a result (see [Using Delta Links with APIs](../developer/devenv-connect-apps-delta.md)). This feature was introduced in Business Central (online version only) to support the Microsoft Invoicing product, which hasn't been available for years. Starting in version 24, ChangeTrackingAllowed will be set to "false" for all APIs provided by Microsoft and support for delta links will be removed from the server. Since the delta links feature was first introduced, the webhooks functionality in Business Central has been added and improved, making it the preferred approach to change tracking. For more information about the use of webhooks, see [Working with Webhooks in Dynamics 365 Business Central](../api-reference/v2.0/dynamics-subscriptions.md).|

### <a name="databasehints"></a>Server settings for database hints FORCEORDER and LOOPJOIN (removed)

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | For Business Central installations on-premises, it's possible to control many server settings. Two of these control the way the Business Central server add hints to SQL statements: DisableQueryHintForceOrder and DisableQueryHintLoopJoin. Starting in version 24, these server settings will no longer be available.|

### <a name="writetoappdb"></a>Remove write access to app database tables from AL (removal)

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | For Business Central on-premises, the main difference between running in single tenancy mode or multi tenancy mode is that in the former, it's possible to write to the app database tables from AL. Starting in version 24, this is no longer possible. |


## Changes in 2023 release wave 2 (version 23.0)

### <a name="databasehints"></a>Server settings for database hints FORCEORDER and LOOPJOIN (warning)

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | For Business Central installations on-premises, it's possible to control many server settings. Two of these control the way the Business Central server add hints to SQL statements: DisableQueryHintForceOrder and DisableQueryHintLoopJoin. Starting in version 24, these server settings will no longer be available.|


### <a name="schemaversion"></a>Schema version for custom APIs (warning)

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | The API capability in Business Central is used many places, for example, in the APIs that come out-of-the-box. For these APIs, $schemaversion is always set to 2.0 to get the latest features in the Business Central OData stack. For custom APIs, it's possible to get these new features by simply calling the API with $schemaversion=2.0. Starting in version 24, the default value of $schemaversion is set to 2.0, also for custom APIs.|

### <a name="odata_delta"></a>Support for Delta Links with APIs (warning)

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | Delta links are opaque, service-generated links that a web service client can use to retrieve subsequent changes to a result (see [Using Delta Links with APIs](../developer/devenv-connect-apps-delta.md)). This feature was introduced in Business Central (online version only) to support the Microsoft Invoicing product, which hasn't been available for years. In version 23, the ChangeTrackingAllowed property on API pages/queries will be marked as deprecated. Starting in version 24, ChangeTrackingAllowed will be set to "false" for all APIs provided by Microsoft and support for delta links will be removed from the server. Since the delta links feature was first introduced, the webhooks functionality in Business Central has been added and improved, making it the preferred approach to change tracking. For more information about the use of webhooks, see [Working with Webhooks in Dynamics 365 Business Central](../api-reference/v2.0/dynamics-subscriptions.md). |

### <a name="writetoappdb"></a>Remove write access to app database tables from AL (warning)

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | For Business Central on-premises, the main difference between running in single tenancy mode or multi tenancy mode is that in the former, it's possible to write to the app database tables from AL. Starting in version 24, this is no longer possible. |

### <a name="views"></a>Legacy views on list pages (removal)

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | Legacy views are list views that were created by developers in previous releases by placing them on the Role Center page object. In April 2019 release wave, we introduced a new, modern way of creating views. Starting in version 23, views must be created using the modern way. Legacy views will no longer be supported and won't display on list pages. Learn more at [Migrating from Legacy Views to Modern Views](../developer/devenv-views-legacy.md).|


### <a name="ropc"></a>Resource Owner Password Credentials (ROPC) flow in OAuth 2.0 for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online (removal)

The following feature will be **Removed** in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 2.  

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | [ROPC flow in OAuth 2.0](/azure/active-directory/develop/v2-oauth-ropc) allows apps to sign in users by directly handling their password. This behavior goes against the principles of modern authentication and isn't recommended. Starting in 2023 release wave 2 (v23.0), ROPC will no longer be supported. Instead, when connecting to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, use an alternative and more secure authentication flows supported by the [Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-authentication-flows), such as authorization code flow. |

## Changes in 2023 release wave 1 (version 22.0)

### Integration records

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | Apps that integrate with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] should be based on [System Fields](../developer/devenv-table-system-fields.md) instead of integration records. Using system fields improves overall performance, reduces the size of table data, and improves the ability to audit changes. If you haven't already refactored your app and want to learn more, go to [Refactor Integration Management](../developer/devenv-integration-record-refactoring.md). |

### WS-Federation with Azure Active Directory authentication

The following feature will be **Replaced** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1.

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | For Azure Active Directory (AD) authentication, Business Central supports the OpenID Connect protocol instead of WS-Federation. Support for OpenID Connect was introduced as the default configuration in version 20.0. Until version 22.0, you could choose to opt out of using OpenID Connect and still configure WS-Federation. As a consequence of removing WS-Federation support, we've also removed the Business Central Server setting `ClientServicesFederationMetadataLocation` and replaced it with the setting `ADOpenIdMetadataLocation`. For more information about setting up Azure AD authentication with OpenID Connect, go to [Configure Azure Active Directory Authentication with OpenID Connect](../administration/authenticating-users-with-azure-ad-openid-connect.md).|

### .NET add-ins not using .NET Standard (removal)

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1.

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced| .NET Framework has been superseded by .NET Standard. .NET add-ins compiled with .NET Framework won't work in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1. For more information, see [Migrating from .NET Framework to .NET Standard](../developer/devenv-migrate-from-dotnet-framework-to-dotnet-standard.md). |

### Business Central Telemetry: using an instrumentation key (removal)

On 31 March 2025, technical support for instrumentation key–based global ingestion in the Application Insights feature of Azure Monitor will end. After that date, your Azure Applications Insights resources will continue to receive data, but we'll no longer provide updates or customer support for instrumentation key–based global ingestion. 

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | Support for using an instrumentation key to setup telemetry for Business Central environments or apps will be removed in the 2023 release wave 1 (version 22.0). Use the Azure Applications Insights connection string instead. |

<!-- removed from deprecated list for now
### Running the Business Central web server on a different machine than the Business Central server

The following configuration option will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | Support for running the Business Central web server on a different machine than the Business Central server is no longer a supported configuration. This capability was sometimes needed for a deployment using the Business Central Windows client. |
-->

### <a name="flfformat"></a>License files in the .flf format for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises (removal)

The following feature will be **Removed** in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | Importing license files in the .flf format will be unsupported in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1. The format remains supported in older versions. Transition to using the newer \.bclicense format instead. |

## Changes in 2022 release wave 2 (version 21.0)

### Azure Active Directory (Azure AD) Authentication Library (ADAL) and Azure AD Graph API

The Azure Active Directory (Azure AD) Authentication Library (ADAL) and Azure AD Graph API makes it easy for developers to add identity capabilities to their applications, including integrating to [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Replaced| To help developers take advantage of all the identity features available in Azure Active Directory, we’re now recommending that all developers use the Microsoft Authentication Library (MSAL) and the Microsoft Graph API in their application development. Moving forward, all new identity capabilities will only be available in MSAL and Microsoft Graph. We’re also providing guidance on end of support timelines for Azure Active Directory (Azure AD) Authentication Library (ADAL) and Azure AD Graph API, so that you can plan to update any applications that are still using either one of them. **Starting June 30th, 2022**, Microsoft will end support for ADAL and Azure AD Graph and will no longer provide technical support or security updates. Apps using Azure AD Graph after this time will no longer receive responses from the Azure AD Graph endpoint. Apps using ADAL on existing OS versions will continue to work after this time but will not get any technical support or security updates. For more information, see [Update your applications to use Microsoft Authentication Library and Microsoft Graph API](https://techcommunity.microsoft.com/t5/azure-active-directory-identity/update-your-applications-to-use-microsoft-authentication-library/ba-p/1257363)|


### Business Central Server Administration tool (removal)

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 release wave 2.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | The Business Central Server Administration tool for configuring the [!INCLUDE[server](../developer/includes/server.md)] in on-premises installations will be removed in the 2022 release wave 2 (version 21.0). Please use the [Windows PowerShell cmdlets](/powershell/business-central/overview) that we make available in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] instead. |


### Behavior of promoted action groups

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 release wave 2.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed  | When the **Modern Action Bar** on the **Feature Management** page is set to *Enabled*, promoted actions, which are defined inside a group whose visibility is set to `false` will no longer be visible on the promoted side of the action bar. A dedicated code analysis rule in the UICop analyzer (AW0013) helps detect this pattern in your apps. For more information, see [UICop Warning AW0013](../developer/analyzers/uicop-aw0013.md). For more information about the `actionref` syntax, see [Promoted Actions](../developer/devenv-promoted-actions.md).|


### <a name="ropc"></a>Resource Owner Password Credentials (ROPC) flow in OAuth 2.0 for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online (warning)

The following feature will eventually be **Removed** in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 2.  

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | [ROPC flow in OAuth 2.0](/azure/active-directory/develop/v2-oauth-ropc) allows apps to sign in users by directly handling their password. This behavior goes against the principles of modern authentication and isn't recommended. Starting in 2023 release wave 2 (v23.0), ROPC will no longer be supported. Instead, when connecting to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, use an alternative and more secure authentication flows supported by the [Microsoft Authentication Library (MSAL)](/azure/active-directory/develop/msal-authentication-flows), such as authorization code flow.|

<!---
These changes are not confirmed yet

### Expose UI pages as SOAP endpoints (removal)
The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 release wave 2.

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | SOAP has been superseded by OData V4. SOAP endpoints are deprecated in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 but not removed yet. We recommend that integrations are migrated to OData V4 as soon as possible.|
--->

## Changes in 2022 release wave 1 (version 20.0)

### <a name="flfformat"></a>License files in the .flf format for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises (warning)

The following feature will be **Removed** in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1.  

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | Importing license files in the .flf format will be unsupported in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1. It will remain supported in older versions. Please transition to using the newer .bclicense format instead. |

### <a name="accesskeys"></a>Web Service Access Keys (Basic Auth) for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Online

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 release wave 1.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed (online only)| The capability to access web services in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] using Web Service Access Key (Basic Auth) is deprecated for SaaS. Any integrations/solutions that connect to Business Central online using Web Service Access Key (Basic Auth) **will stop working after October 1, 2022**. OAuth2 will be the only authentication option for SaaS. OAuth samples are published in the [BCTech repo](https://github.com/microsoft/BCTech/tree/master/samples/PSOAuthBCAccess). For more information, see [Using OAuth to Authorize Business Central Web Services (OData and SOAP)](../webservices/authenticate-web-services-using-oauth.md).  For on-premises, Web Service Access Key (Basic Auth) will remain an option for the time being. This change has no impact on how [!INCLUDE[prod_short](../developer/includes/prod_short.md)] connects to external services. |

### <a name="permissions"></a>Permissions defined as data

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 release wave 1.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | With releases of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] prior to 2021 release wave 1 (v.18.0), System and Extension permissions and entitlements were defined as data in the application database. This has changed with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] v.18.0. With [!INCLUDE [prod_short](../developer/includes/prod_short.md)] 2022 release wave 1, the support for defining permissions and entitlements as data in the application database will be removed. For more information, see [Entitlements and Permissions Overview](../developer/devenv-entitlements-and-permissionsets-overview.md).|

### <a name="deprecate legacy v1 endpoints"></a>Deprecate legacy V1 endpoints for Power Automate, Power Apps and Logic Apps in favour of newer technology

The legacy V1 endpoints served by our Power Automate, Power Apps and Logic Apps connector are being **replaced** later in Business Central online in 2022 and as a consequence we encourage everyone to switch to the most up-to-date V3 endpoints.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Replaced | Introduced back in 2018 and replaced with new endpoints several releases ago the legacy V1 endpoints served by our Power Automate, Power Apps and Logic Apps connector are being finally discontinued. Since more than a year ago, actions based on these endpoints aren't exposed in the Power Automate or Power Apps UI in any form. Partners are also educated and encouraged to use actions based on current V3 endpoints, so in 2022 we'll be completely removing access to V1 endpoints in our connector. Any partners and customers who had in the past created a flow or app based on these older endpoints and haven't moved to the new ones needs to update their Power Automate flows or Power Apps now and switch to V3 actions. |

### <a name="invoicingapi"></a>Deprecating nativeInvoicing APIs

The following feature will be deprecated with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 release wave 1 and **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 2.

|Moved, Removed, or Replaced? |	Why?|
|-----------------------------|-----|
|Removed| The nativeInvoicing API will be deprecated with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 release wave 1 and **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 2. Use the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] standard APIs instead. For more information, see [API(V2.0) for Dynamics 365 Business Central](../api-reference/v2.0/index.md).|

## Changes in 2021 release wave 2 (version 19.0)

### Business Central app for Windows

The Business Central app that's available from the [Microsoft Store](https://go.microsoft.com/fwlink/?LinkId=734848) is no longer supported with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2.

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced| The legacy app for Windows was based on Universal Windows Platform (UWP). In its place, we offer an app that's based on Progressive Web Application (PWA) technology, which is a more modern technology that provides a better user experience going forward. The legacy app will still be available on the Windows Store for users running Business Central 2021 release wave 1 or earlier.|

### Removal of the Business Central Server Administration tool (warning)

The following feature will be **Removed** in a later release.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | The Business Central Server Administration tool for configuring the [!INCLUDE[server](../developer/includes/server.md)] in on-premises installations will be removed in a later release. Please transition to using the provided PowerShell cmdlets in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] instead. |

### SOAP endpoints (warning)

The capability of exposing SOAP endpoints will be removed in a later release.

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | SOAP has been superseded by OData V4. It's recommended that integrations are migrated to OData V4 as soon as possible.|


### StartSession calls in upgrade/install context will fail

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2.

|Removed or Replaced? |    Why?|
|-----------------------------|-----|
|Removed | A new session created with AL StartSession has no link to the session that created it. This implementation can cause problems, for example, in cases where the creating session is an upgrade codeunit. If an error occurs later in the process, which requires a rollback, the server can't roll back any transactions done in the session created by the AL StartSession. This condition can leave data in the system in a bad state. Starting with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2, any StartSession call in upgrade/install context will fail immediately. |

### Standard APIs, Beta version

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2.

|Removed or Replaced? |    Why?|
|-----------------------------|-----|
|Removed | Beta version of the standard APIs will be removed by 2021 release wave 2. At this point, Beta APIs won't be available in new releases of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. There are many improvements to v1.0 and v2.0 of the standard APIs. Improvements include more APIs, better performance and improved OData capabilities. It's recommended that integrations move to v2.0 of the standard APIs.|

### Automation APIs, Beta version

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2.


|Removed or Replaced?|    Why?|
|----------------------------|------|
|Removed | Beta version of the Automation APIs will be removed by 2021 release wave 2. At this point, Automation Beta APIs won't be available in new releases of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. It's recommended that integrations move to v2.0 of the Automation APIs.|

### Client secret authentication in integrations between Microsoft-hosted Business Central online and Microsoft Dataverse

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | The ability to connect [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with Dataverse using the client secret Service-to-Service authentication will be removed for online tenants hosted by Microsoft in March  2022. To further strengthen security, we introduced the ability to use certificate-based authentication in Business Central 2021 release wave 1 (version 18 and later). Existing users can easily switch to certificate-based authentication. For more information, see [Upgrade Connections from Business Central Online to Use Certificate-Based Authentication](https://go.microsoft.com/fwlink/?linkid=2167233). On-premises customers, and online tenants that are hosted by ISVs, can continue using client secret authentication for their connections to Dataverse.|

### Legacy Outlook add-in for synchronizing data

The legacy Outlook add-in for synchronizing data, such as to-dos, contacts, and tasks, between Business Central and Outlook will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | This add-in used Business Central web services based on outdated technology.|

> [!NOTE]
> The feature is separate from and has no affect on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)]add-in for Outlook, which is described at [Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/work-outlook-addin).

## Changes in 2021 release wave 1 (version 18.0)

### .NET add-ins not using .NET Standard (warning)

In [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1, a warning shows if you include .NET add-ins that are compiled with .NET Framework and not with .NET Standard. The capability of using .NET add-ins compiled with .NET Framework will be removed in a later release. 

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | .NET Framework has been superseded by .NET Standard. .NET add-ins compiled with .NET Framework are deprecated as of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1, but the feature won't be removed in this release. It's recommended that .NET add-ins are migrated to .NET Standard as soon as possible. For more information, see [Migrating from .NET Framework to .NET Standard](../developer/devenv-migrate-from-dotnet-framework-to-dotnet-standard.md). |


### Expose UI pages as SOAP endpoints (warning)

In [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1, a warning shows if you expose UI pages as SOAP endpoints. The capability of exposing UI pages as SOAP endpoints will be removed in a later release.

|Removed or Replaced? |Why?|
|---------|---------|
|Replaced | SOAP has been superseded by OData V4. SOAP endpoints are deprecated as of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1, but the feature won't be removed in this release. It's recommended that integrations are migrated to OData V4 as soon as possible.|

### OData V3

The following feature is **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed | OData V3 has been superseded by OData v4. OData V3 is deprecated, and is removed as of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1. It's recommended that integrations are migrated to OData v4 as soon as possible.  |

### The Help Server component

The following component is **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1.

|Removed or Replaced? |Why?|
|---------|---------|
|Removed |In 2021 release wave 1, the Help Server component is removed from the product media for deployment on-premises. If a customer is on a version between Dynamics NAV 2016 and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2 on-premises, and they rely on Help Server to provide access to Help, then nothing changes. When they upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1, they must host their custom Help on another type of website. We recommend that new solutions do not rely on the Help Server component due to the deprecation.|

#### What does this mean?

<!--BDM-->
We have simplified the story for how to deploy Help for a customer-specific solution of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], and for deploying Help for an AppSource app. No matter what your solution is, deploy your solution-specific or customized Help to any website that you prefer. Out of the box, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses the [learn.microsoft.com](/dynamics365/business-central/) site for the Learn more-links and contextual Help. Each customer and each partner can override this with their own Help. It's now the same for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online and on-premises, so any investment on-premises carries forward if you migrate to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online.

## Changes in 2020 release wave 1 (version 16.0)

The following sections describe the features that were deprecated in 2020 release wave 1.

### Azure Active Directory (Azure AD) Authentication Library (ADAL) and Azure AD Graph API

The Azure Active Directory (Azure AD) Authentication Library (ADAL) and Azure AD Graph API makes it easy for developers to add identity capabilities to their applications, including integrating to [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Replaced| To help developers take advantage of all the identity features available in Azure Active Directory, we’re now recommending that all developers to use the Microsoft Authentication Library (MSAL) and the Microsoft Graph API in their application development. Moving forward, all new identity capabilities will only be available in MSAL and Microsoft Graph. We’re also providing guidance on end of support timelines for Azure Active Directory (Azure AD) Authentication Library (ADAL) and Azure AD Graph API, so you can plan to update any applications that are still using either one of them. **Starting, June 30th, 2020**, Microsoft will no longer add any new features to ADAL and Azure AD Graph. We'll continue to provide technical support and security updates but will no longer provide feature updates. For more information, see [Update your applications to use Microsoft Authentication Library and Microsoft Graph API](https://techcommunity.microsoft.com/t5/azure-active-directory-identity/update-your-applications-to-use-microsoft-authentication-library/ba-p/1257363)|


## Changes in 2019 release wave 2 (version 15.0)

The following sections describe the features that were deprecated in 2019 release wave 2.

### The Windows Client

You can use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in the Windows client that is installed on your computer.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Removed| Business Central continues to evolve the modern client experiences where users work with Business Central in the browser, Windows 10 desktop app, or mobile apps on Android and iOS. The legacy Dynamics NAV Windows client is no longer available for deployment. Instead, users can switch to the modern experience in the browser, the Android/iOS mobile apps, or the Windows 10 desktop app (available through the respective stores). |

### User Personalizations and Profile Configurations

You can personalize pages and configure profiles by adding or removing fields, and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will save your changes.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Replaced|The shift to AL caused the legacy personalization and profile configuration features to become outdated, so we have introduced new tooling. In this release, existing personalizations and configurations are discarded, and you must use the new tools to recreate them. Your new changes will be kept in future releases.|

### Excel COM add-In
You can export data to an Excel workbook.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Removed| The Excel COM add-in was installed along with the Windows client. Now that the Windows Client is no longer available, neither is the add-in. To export data to Excel, use the **Edit in Excel** action.|

### Printing Programmatically

You can print documents such as invoices automatically, without prompting the user or without the user choosing to do so.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Removed| This feature was tied to the Windows Client, which is no longer available. |

## Breaking Changes

When we move, remove, or replace an object, breaking changes can result in other apps or extensions that use the object. To help our partners identify and resolve breaking changes, we have created a [Breaking Changes](https://github.com/microsoft/ALAppExtensions/blob/master/BREAKINGCHANGES.md) document that lists known issues and suggestions for what to do about them.

## Features that are available only in the online version
<!--Should we include a section about this?-->
Some features are available only under specific circumstances, or not at all intended for use in on-premises versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For a list and descriptions of those features, see [Features not implemented in on-premises deployments](../features-not-implemented-on-premises.md).

## See Also

[Deprecated Features in the Base App](deprecated-features-w1.md)  
[Deprecated Features in the Austrian Version](deprecated-features-at.md)  
[Deprecated Features in the Belgian Version](deprecated-features-be.md)  
[Deprecated Features in the Canadian Version](deprecated-features-ca.md)  
[Deprecated Features in the Czech Version](deprecated-features-cz.md)  
[Deprecated Features in the Dutch Version](deprecated-features-nl.md)  
[Deprecated Features in the Finnish Version](deprecated-features-fi.md)  
[Deprecated Features in the German Version](deprecated-features-de.md)  
[Deprecated Features in the Icelandic Version](deprecated-features-is.md)  
[Deprecated Features in the Italian Version](deprecated-features-it.md)  
[Deprecated Features in the Mexican Version](deprecated-features-mx.md)  
[Deprecated Features in the Norwegian Version](deprecated-features-no.md)  
[Deprecated Features in the Russian Version](deprecated-features-ru.md)  
[Deprecated Features in the Swedish Version](deprecated-features-se.md)  
[Deprecated Features in the Swiss Version](deprecated-features-ch.md)  
[Deprecated Features in the UK Version](deprecated-features-uk.md)  
[Deprecated Features in the United States Version](deprecated-features-us.md)  
[Deprecated Fields, and Fields Marked as Obsolete in Local Functionality](deprecated-fields.md)
[Deprecated Tables](deprecated-tables.md)  
[AlAppExtensions repository](https://github.com/microsoft/ALAppExtensions)  
[Microsoft Timeline for Deprecating Code in Business Central](../developer/devenv-deprecation-timeline.md)  
