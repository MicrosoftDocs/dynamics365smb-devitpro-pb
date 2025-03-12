---
title: Feature: Disable SOAP web services on Microsoft UI pages feature key
description: Learn about the HttpServerCertificateValidation feature key.
ms.custom: bap-template
ms.date: 03/10/2025
ms.reviewer: jswymer
ms.topic: conceptual
author: jswymer
ms.author: jswymer
---

# Disable SOAP web services on Microsoft UI pages feature key

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

The `Disable SOAP web services on Microsoft UI pages` feature key controls whether Microsoft pages can be published as SOAP web services. By default, this key is enabled for all users, preventing the publishing of Microsoft UI pages as SOAP web services. To enable this capability, disable the key for all users. Learn more about enabling and disabling features in [Enabling upcoming features ahead of time](../administration/feature-management.md).

## Purpose

Support for publishing Microsoft UI pages as SOAP web services will be removed in [!INCLUDE [prod_short](includes/prod_short.md)] version 29.0. This feature key lets integrations that rely on SOAP endpoints for Microsoft pages continue working while developers and partners transition solutions to one of these options:

- Use the [!INCLUDE [prod_short](includes/prod_short.md)] built-in APIs
- Use OData V4
- Replicate the Microsoft UI pages as page objects in per-tenant extensions, and publish the extension pages as SOAP web services

The `Disable SOAP web services on Microsoft UI pages` feature key will be removed in [!INCLUDE [prod_short](includes/prod_short.md)] version 29.0, when support for exposing Microsoft UI pages as SOAP web services is removed.

> [!TIP]
> When the feature key is disabled, telemetry for calls to SOAP endpoints can be gathered and monitored. Learn more in [Analyzing server certificate validation errors with telemetry](../administration/telemetry-webservices-outgoing-certificate-validation-errors.md)

## Related information

[Enabling upcoming features ahead of time](/dynamics365/business-central/dev-itpro/administration/feature-management)  