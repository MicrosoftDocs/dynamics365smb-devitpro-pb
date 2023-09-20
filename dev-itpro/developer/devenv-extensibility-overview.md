---
title: "Extensibility overview"
description: "How you can extend functionality in Dynamics 365 Business Central."
ms.author: kepontop
ms.custom: na
ms.date: 10/09/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: KennieNP
---

# Extensibility overview
AL developers can extend the functionality of Business Central in several ways. They can extend tables, enumerations, application areas, pages, reports, code flows and the security model. They can also contribute directly to the base application in the open source projects for the system application modules. 

This article provides an overview of the extensibility options available to AL developers in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] including examples on how to extend various features, such as extending item charges, best price calculations, and data archiving. 

## Extending AL objects and artifacts
The AL object model in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports many different ways for developers to extend objects and artifacts in an app. 

1. **Extending Tables**: AL developers can add new fields to existing tables or modify the properties of existing fields. This allows for customization of data structures to fit specific business needs. See [Extending AL objects: tables](devenv-table-ext-object.md).

2. **Extending Enumerations**: Enumerations, or Enums, are lists of constants that represent a set of values. Developers can extend existing Enums or create new ones to cater to unique business requirements. See [Extending AL objects: enumerations](devenv-extensible-enums.md).

3. **Extending Application Areas**: Application areas help control the visibility of UI elements based on licensing and configuration. Developers can extend these areas to tailor the user interface according to business needs. See [Extending AL objects: application areas](devenv-extending-application-areas.md).

4. **Extending Pages**: Pages are the main way to display data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Developers can add or modify fields, actions, and layout of existing pages or create new ones. See [Extending AL objects: pages](devenv-page-ext-object.md).

5. **Extending Reports**: Reports provide a structured view of data and are essential for analysis and decision-making. Developers can extend existing reports by adding data items or columns, modifying request pages, or adding new layouts. See [Extending AL objects: reports](devenv-report-ext-object.md).

6. **Extending Code Flows**: Codeunits contain AL code that can be reused across the application. Developers can subscribe to events in base app codeunits and write custom logic to extend the application's functionality. See [Extending AL code flows: events](devenv-event-types.md).

7. **Extending the Security Model**: Permission sets define what actions a user can perform in Business Central. Developers can create new permission sets or extend existing ones to ensure users have appropriate access rights. See [Extending AL objects: security model](devenv-permissionset-ext-object.md).

> [!NOTE]  
> Extending API pages and queries is not currently possible in Business Central.


## Extending the Business Central application

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application consists of multiple layers
* The System Application, which is a set of open source modules that make it easier to build, maintain, and easily upgrade on-premises and online apps. These modules let you focus on the business logic, and the needs of your users or customers.
* The Base Application, which is the business logic for the functionality in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

### Contributing to the Business Central open source System Application

If you want to contribute code to the Business Central open source System Application, you need to determine the type of contribution: 
1. Small bug fixes, product improvements, or customer conveniences; or
2. New capabilities or larger changes to the existing application platform.

For more information about making contributions, go to [Contributing to the Business Central open source System Application](https://github.com/microsoft/ALAppExtensions/blob/main/CONTRIBUTING.md).

To learn more about the System Application, its module architecture, and how to modify or create new modules, go to [Creating new modules in the system application](devenv-blueprint.md). 

### Extending the Business Central base application

For more information on how to get started on extending functionality in the base application by extending AL objects and using events, see:
* [Application reference for Dynamics 365 Business Central](/dynamics365/business-central/application/)
* [The Microsoft_Application.app file](devenv-application-app-file.md)
* [Publishing a code-customized base application](devenv-publish-code-customization.md)
* [Extending application areas](devenv-extending-application-areas.md)

## Examples
There are numerous examples available that demonstrate how to extend various features in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]:

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


## See Also
Extending AL objects
* [Extending AL objects: application areas](devenv-extending-application-areas.md)
* [Extending AL objects: enumerations](devenv-extensible-enums.md)
* [Extending AL code flows: events](devenv-event-types.md)
* [Extending AL objects: pages](devenv-page-ext-object.md)
* [Extending AL objects: reports](devenv-report-ext-object.md)
* [Extending AL objects: security model](devenv-permissionset-ext-object.md)
* [Extending AL objects: tables](devenv-table-ext-object.md)

Extending the base application
* [Contributing to the Business Central open source System Application](https://github.com/microsoft/ALAppExtensions/blob/main/CONTRIBUTING.md)
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