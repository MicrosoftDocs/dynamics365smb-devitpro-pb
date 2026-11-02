---
title: "Publish a Web Service in Business Central"
description: Publish OData V4 and SOAP web services in Business Central. Choose supported objects, set permissions, verify service URLs, and unpublish services.
ms.custom: bap-template
author: jswymer
ms.date: 10/29/2026
ms.reviewer: jswymer
ms.topic: how-to
translation.priority.ht:
  - da-dk
  - de-at
  - de-ch
  - de-de
  - en-au
  - en-ca
  - en-gb
  - en-in
  - en-nz
  - es-es
  - es-mx
  - fi-fi
  - fr-be
  - fr-ca
  - fr-ch
  - fr-fr
  - is-is
  - it-ch
  - it-it
  - nb-no
  - nl-be
  - nl-nl
  - ru-ru
  - sv-se
---

# Publishing a web service in Business Central

Publish a page, query, or codeunit on the **Web Services** page so that integrations can access it through a supported endpoint. Publishing registers the service. It doesn't grant permission to read data, change data, or execute code.

For new integrations, use API pages and API queries. These objects don't require manual publication on the **Web Services** page.

> [!NOTE]
> SOAP web services are deprecated. Use API pages and API queries for new integrations. Publishing Microsoft UI pages as SOAP web services is restricted. Check [Deprecated features in the platform](../upgrade/deprecated-features-platform.md) for the applicable restrictions and removal timeline.

## Choose the object and protocol

The object type determines which endpoints are available:

| Object type | OData V4 | SOAP |
|-------------|----------|------|
| Page | Data endpoint | Supported page types, subject to Microsoft-page restrictions. |
| Query | Read-only data endpoint | Not supported. |
| Codeunit | Unbound actions | Operations. |

For codeunit OData V4 services, clients call public procedures through unbound actions. Learn more in [Create and call an OData V4 unbound action](../developer/devenv-creating-and-interacting-with-odatav4-unbound-action.md).

### Make API objects available

Custom API pages and API queries become available when their extension is installed and API services are enabled. Don't add these objects to the **Web Services** page.

APIs are enabled by default in [!INCLUDE[prod_short](../includes/prod_short.md)] online. For on-premises environments, verify the API and OData service settings, network access, and authentication. Learn more in [Enabling the APIs for Dynamics 365 Business Central](../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Prepare access to the service

Before publishing, check the following prerequisites:

- The page, query, or codeunit is installed in the environment.
- You have permission to publish web services.
- The calling user or application has the permissions needed to execute the object and access its data.
- The environment has the required service endpoints enabled and reachable.
- The client uses the endpoint's authentication method. For Business Central online, use OAuth access tokens. For on-premises environments, use the configured supported authentication method and HTTPS endpoint.

Metadata discovery doesn't demonstrate permission to read or change data. Learn more about authentication in [Web service authentication](web-services-authentication.md) and [Using OAuth to authorize Business Central web services](authenticate-web-services-using-oauth.md).

## Create and publish the service

1. Open Business Central.
1. Use **Search** to find and open the **Web Services** page.
1. Select **New**.
1. In **Object Type**, select **Page**, **Query**, or **Codeunit**.
1. In **Object ID**, select the installed object to expose. For the OData V4 example in this article, select page **21**, **Customer Card**.
1. In **Service Name**, enter a name that clients can use to identify the service. For this example, enter `Customers`.
1. Select **Published**.
1. Copy the applicable URL from **OData V4 URL** or **SOAP URL**.

Select the URL for the protocol and object type you intend to use. For codeunits, **OData V4 URL** can link to instructions for calling unbound actions rather than to an invocation URL. Unsupported combinations don't provide a usable endpoint.

Publication applies to the relevant tenant or application database, not to an individual company or every instance on the same physical computer. Access also depends on service configuration, endpoint routing, authentication, and permissions.

### Configure eTag field exclusions for supported pages

For OData V4 services based on `List`, `ListPart`, or `Worksheet` pages, two optional settings control which fields contribute to eTag calculations:

- **Exclude Non-Editable FlowFields** excludes noneditable FlowFields.
- **Exclude Fields Outside of the Repeater** excludes fields outside the repeater. Key fields remain included.

These exclusions can help avoid eTag conflicts when users edit multiple rows, such as in Excel.

These settings affect eTag calculation, not the fields returned in the response. Both settings are hidden by default. To show them on the **Web Services** page, use [personalization](/dynamics365/business-central/ui-personalization-user).

## Verify the published service

Use a client configured for the endpoint's authentication method. Being signed in to the Business Central web client doesn't by itself authenticate a separate service request.

For a page or query published as OData V4, send a GET request to its data URL. For a codeunit, invoke an unbound action with POST and the parameters its procedure requires. For an existing supported SOAP service, use a SOAP client to test its operations.

### Identify the OData V4 service root

Use the copied URL to identify your environment's OData V4 service root. Business Central online uses this format:

```text
https://api.businesscentral.dynamics.com/v2.0/<TenantId>/<EnvironmentName>/ODataV4
```

Replace `<TenantId>` and `<EnvironmentName>` with your tenant ID and environment name.

A configured on-premises endpoint can use this format:

```text
https://<Host>:<ODataPort>/<ServerInstance>/ODataV4
```

Use your deployment's configured public URL, port, server instance, and HTTPS settings. The copied URL or your administrator's configuration is authoritative; don't assume a default port or local server address.

In the following examples, `<ODataRoot>` includes `/ODataV4`. The service document is at `<ODataRoot>`, and the metadata document is at `<ODataRoot>/$metadata`. These documents describe available services and their structure; they aren't the `Customers` data endpoint.

### Request data from the published page

For requests that operate on company data, explicitly specify the company for both reads and writes. The company ID in this example is illustrative. Replace it with an ID from your environment. For OAuth authentication, replace `<AccessToken>` with an access token for your environment.

Use the company ID to identify the company because you can't change the ID. An administrator can rename the company.

```http
GET <ODataRoot>/Company(Id=00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/Customers
Authorization: Bearer <AccessToken>
Accept: application/json
```

Verify that the response contains the expected customer data, not just a service listing or metadata. Some deployments can resolve an omitted company from configuration. Discovery and metadata requests don't universally require company context.

You can also address the company by name. Preserve the exact company-name casing, URL-encode the name, and escape any apostrophes as required by OData. For a company named `CRONUS International Ltd.`, these are equivalent data URLs:

```text
<ODataRoot>/Company('CRONUS%20International%20Ltd.')/Customers
```

```text
<ODataRoot>/Customers?company='CRONUS%20International%20Ltd.'
```

For API URLs, use the API endpoint structure rather than these published-page paths. Learn more in [Endpoints for the APIs for Dynamics 365 Business Central](../api-reference/v2.0/endpoints-apis-for-dynamics.md).

## Unpublish a service

On the **Web Services** page, clear **Published** for the registration you want to disable.

> [!IMPORTANT]
> Clearing **Published** on an **All Tenants** registration blocks other registrations for the same object type and object ID, even when their **Published** checkboxes remain selected. Those registrations aren't automatically changed to unpublished.

## Design endpoints for integrations

Use API pages or API queries rather than standard UI pages for new integrations. The Customer Card example illustrates publication; it isn't a recommendation to base a new integration on a UI page. Learn more in [Web services performance](web-service-performance.md).

If a page endpoint needs a unique row identifier, consider exposing `SystemId`. It identifies a record uniquely within its table and can't be changed after insertion. Learn more in [System fields](../developer/devenv-table-system-fields.md).

## Related information

[Web services overview](web-services.md)  
[Create and call an OData V4 unbound action](../developer/devenv-creating-and-interacting-with-odatav4-unbound-action.md)  
[Using OAuth to authorize Business Central web services](authenticate-web-services-using-oauth.md)  
[API endpoint structure](api-endpoint-structure.md)  
[Web service publish failure telemetry](web-service-telemetry.md#web-service-publish-failure-telemetry)  
