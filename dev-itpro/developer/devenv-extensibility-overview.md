---
title: Extensibility overview
description: How you can extend functionality in Dynamics 365 Business Central.
ms.author: kepontop
ms.date: 10/29/2026
ms.reviewer: solsen
ms.topic: article
author: KennieNP
---

# Extensibility overview

AL developers can extend the functionality of Business Central in several ways. They can extend tables, enumerations, application areas, pages, reports, code flows, and the security model. They can also request missing extensibility points or contribute application changes through the open-source BCApps repository.

This article provides an overview of the extensibility options available to AL developers in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] including examples on how to extend various features, such as extending item charges, best price calculations, and data archiving.

## Extending AL objects and artifacts

The AL object model in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports many different ways for developers to extend objects and artifacts in an app.

| Action | Description | Learn more |
|---|---|---|
| **Extending Code Flows** | Codeunits contain AL code that you can reuse across the application. Developers can subscribe to events in base app codeunits and write custom logic to extend the application's functionality. | [Extending AL code flows: events](devenv-event-types.md) |
| **Extending Tables** | AL developers can add new fields to existing tables or modify the properties of existing fields. This capability allows customization of data structures to fit specific business needs. | [Extending AL objects: tables](devenv-table-ext-object.md) |
| **Extending Pages** | Pages are the main way to display data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Developers can add or modify fields, actions, and the layout of existing pages or create new ones. | [Extending AL objects: pages](devenv-page-ext-object.md) |
| **Extending Reports** | Reports provide a structured view of data and are essential for analysis and decision-making. Developers can extend existing reports by adding data items or columns, modifying request pages, or adding new layouts. | [Extending AL objects: reports](devenv-report-ext-object.md) |
| **Extending the Security Model** | Permission sets define what actions a user can perform in [!INCLUDE [prod_short](../includes/prod_short.md)]. Developers can create new permission sets or extend existing ones to ensure users have appropriate access rights. | [Extending AL objects: security model](devenv-permissionset-ext-object.md) |
| **Extending Enumerations** | Enumerations, or Enums, are lists of constants that represent a set of values. Developers can extend existing Enums or create new ones to cater to unique business requirements. | [Extending AL objects: enumerations](devenv-extensible-enums.md) |
| **Extending Application Areas** | Application areas help control the visibility of UI elements based on licensing and configuration. Developers can extend these areas to tailor the user interface according to business needs. | [Extending AL objects: application areas](devenv-extending-application-areas.md) |

[!INCLUDE[extending_APIs_is_not_supported_note](includes/include-extending-APIs-is-not-supported-note.md)]

## Extending the Business Central application

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application consists of multiple layers:

- The System Application, which is a set of open-source modules that make it easier to build, maintain, and upgrade on-premises and online apps. These modules let you focus on the business logic and the needs of your users or customers.
- The Base Application, which is the business logic for the functionality in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

### Contributing to Business Central applications

The [BCApps repository](https://github.com/microsoft/BCApps) includes the Base Application, Business Foundation, System Application, Microsoft's first-party apps, and developer tools. If you want to contribute code, determine the type of contribution:

1. Small bug fixes, product improvements, or customer conveniences; or
1. New capabilities or larger changes to the existing application platform.

Before opening a pull request (PR), Microsoft must approve the related GitHub issue. Learn more in [Contribute a change yourself](devenv-contribute-extensibility.md) and the [BCApps contribution guidelines](https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md).

If you need a missing event, public procedure, or another extensibility point, [create an extensibility request](create-extensibility-request.md).

Learn more about the System Application, its module architecture, and how to modify or create new modules in [Creating new modules in the system application](devenv-blueprint.md).

### Extending the Business Central base application

For more information on how to get started on extending functionality in the base application by extending AL objects and using events, see:

* [Application reference for Dynamics 365 Business Central](/dynamics365/business-central/application/)
* [The Microsoft_Application.app file](devenv-application-app-file.md)
* [Publishing a code-customized base application](devenv-publish-code-customization.md)
* [Extending application areas](devenv-extending-application-areas.md)

### Extension objects in the same app

[!INCLUDE [extension-obj-same-app](includes/extension-obj-same-app.md)]

## Examples

Numerous examples demonstrate how to extend various features in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]:

- Extending item charges
- Extending best price calculations
- Extending pages based on date virtual table
- Data archive extension
- Extending document sharing with OneDrive
- Extending templates
- Extending email


These resources provide a comprehensive overview of the extensibility options available to AL developers in Business Central.

* [Extending item charge distribution methods](devenv-extending-item-charges.md)
* [Extending price calculations](devenv-extending-best-price-calculations.md)
* [Extending pages previously based on the Date virtual table](devenv-extend-pages-based-on-date-virtual-table.md)
* [Extending data archiving](devenv-data-archive-extension.md)
* [Extending document sharing and OneDrive integration](devenv-extending-document-sharing-onedrive.md)
* [Extending customer, vendor, and item templates](devenv-extending-templates.md)
* [Extending email capabilities](devenv-extending-email.md)
* [Extending G/L entry aggregations when posting invoices](devenv-invoice-posting-example.md)
* [Extending the Shopify Connector](devenv-extending-shopify.md)

## Related information

Extending AL objects and artifacts

* [Extending application areas](devenv-extending-application-areas.md)
* [Extending enumerations](devenv-extensible-enums.md)
* [Extending AL code flows: events](devenv-event-types.md)
* [Extending pages](devenv-page-ext-object.md)
* [Extending reports](devenv-report-ext-object.md)
* [Extending the security model](devenv-permissionset-ext-object.md)
* [Extending tables](devenv-table-ext-object.md)

Extending the base application

* [Contribute a change yourself](devenv-contribute-extensibility.md)
* [Create an extensibility request](create-extensibility-request.md)
* [BCApps contribution guidelines](https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md)
* [Application reference for Dynamics 365 Business Central](/dynamics365/business-central/application/)
* [The Microsoft_Application.app file](devenv-application-app-file.md)
* [Publishing a code-customized base application](devenv-publish-code-customization.md)

Examples

* [Example: extending item charge distribution methods](devenv-extending-item-charges.md)
* [Example: extending price calculations](devenv-extending-best-price-calculations.md)
* [Example: extending pages previously based on the Date virtual table](devenv-extend-pages-based-on-date-virtual-table.md)
* [Example: extending data archiving](devenv-data-archive-extension.md)
* [Example: extending document sharing and OneDrive integration](devenv-extending-document-sharing-onedrive.md)
* [Example: extending customer, vendor, and item templates](devenv-extending-templates.md)
* [Example: extending email capabilities](devenv-extending-email.md)
* [Example: extending G/L entry aggregations when posting invoices](devenv-invoice-posting-example.md)
* [Example: extending the Shopify Connector](devenv-extending-shopify.md)
