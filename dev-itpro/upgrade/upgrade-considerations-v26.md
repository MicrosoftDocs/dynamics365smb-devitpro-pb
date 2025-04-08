---
title: Important information and considerations when upgrading to Business Central
description: This article provides tips and considerations to prepare a solution when you're planning to upgrade to Business Central 2023 release wave 2 and later.
author: jswymer
ms.custom: bap-template
ms.topic: conceptual
ms.date: 04/07/2025
ms.author: jswymer
ms.reviewer: jswymer
---
# Important information and considerations when upgrading to Business Central

This article provides important information and tips for things to consider when you prepare to upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2025 release 1 (version 26) The information that's relevant for you depends on which version you're upgrading from, and how much your solution differs from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] base application.

## <a name="online"></a>Migrate to Business Central online

You can upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online from supported versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, as long as extensions handle your application customizations.

The process consists of two parts:

- Convert nonstandard functionality and customizations to apps and per-tenant extensions. Learn more in [Deploying a Tenant Customization](../developer/devenv-deploy-tenant-customization.md).
- Run the cloud migration tool, and then switch to use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online going forward. Learn more [Migrate on-premises data to Business Central online](../administration/migrate-data.md).

## New and changed application and platform features

There are several new and changed application features available in version 26 for users, administrators, and developers. For an overview of these features, consult:

- [What's new and planned for Business Central 2025 release wave 1](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/planned-features)

## Deprecated or redesigned functionality

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] occasionally deprecates features in application and platform. In most cases, features are replaced by more modern and sustainable features. If you're upgrading a solution that depends on the deprecated or changes functionality, you might have to change application code as part of the upgrade process. 

For example, sometimes code is refactored so that fields are no longer used. Or the functionality is moved from the base application to an extension. Typically, if you have custom extension code that depends on these fields, you have to create a new version of the extension to handle the change.

Learn more about the deprecated features in:

- [Deprecated Features in Application](deprecated-features-w1.md)
- [Deprecated Features in the Platform - Clients, Server, and Database](deprecated-features-platform.md)
- [Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)
- [Deleted objects in 2025 release wave 1](deleted-objects-25w1.md)

## Important deployment-related changes

This section includes important changes that you need to consider when upgrading from version 22 and earlier to version 26.0. These changes were introduced in version 23.0.

- The default port for client services port for [!INCLUDE[server](../developer/includes/server.md)] changed to 7085 instead of 7046. You can still use 7046, but you have to change the port number in the [!INCLUDE[server](../developer/includes/server.md)] instance configuration. Learn more in [Configuring Business Central Server](../administration/configure-server-instance.md).
- NET Core no longer supports Server principle names (SPN). This change affects the delegation from the [!INCLUDE[webserver](../developer/includes/webserver.md)] to the [!INCLUDE[server](../developer/includes/server.md)] when they're on different computers.

  The affected scenarios are described in [Deploying Business Central in a Two-Computer Topology](../deployment/deploy-two-computer-environment.md) and [Deploying Business Central in a Three-Computer Topology](../deployment/deploy-three-computer-environment.md).

  Learn more about setting up delegation in [Configuring Delegation for Business Central Web Server](../deployment/configure-delegation-web-server.md). You can do this task anytime, but after upgrade, users won't be able to sign in to the web client until you do.

## Permissions and permission sets

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 (v18) introduced a new model for permissions. In previous versions, permission sets and permissions are defined only as data, which means they're stored in the tables of the application and tenant databases. Permission sets and permissions can now be defined in AL code as objects and packaged in extensions. This new model is the recommended model. Learn more in [Entitlements and Permissions](../developer/devenv-entitlements-and-permissionsets-overview.md).

- If you've already made the transition to the new permissions model in your current solution, then there's no extra work related to permission sets required for upgrade.
- If you're upgrading a solution that hasn't transitioned to the new permissions model, we recommend that you do. However, you can continue using the legacy model. Whichever model you choose, there's permission-related tasks you have to complete as part of upgrade. Learn more in [Upgrading Permissions Sets and Permissions](upgrade-permissions.md)

## Report platform

Version 20 introduced a new report rendering model. Previously, report rendering was done by the application. Now, by default, report rendering is done by the platform. In support of this new model, various changes have been made that affect upgrade from version 19 and earlier. If you're upgrading from version 20 or later, the solution already includes the necessary changes.

Learn more in [Upgrading reports](upgrade-reports.md).

## Schema changes in subscription billing extension

Version 25.0 introduced the **Subscription & Recurring Billing** extension. In version 26, the extension is renamed to **Subscription Billing**. Several tables and fields in the extension are renamed, causing breaking changes when upgrading the extension from version 25.0 to 26.0 or later. To upgrade the extension, synchronize the extension's database schema with the tenant database schema using a force sync operation.

Force sync can cause data loss if custom code depends on the renamed tables and fields in the extension. To avoid data loss, refactor the custom code to match the extension's latest database schema before upgrading. For a list of renamed tables and fields, see [Renamed tables and fields](known-issues.md#renamed-tables-and-fields-in-susbscription-billing-extension-cause-synch-errors-on-upgrade).

<!--
### Renamed tables and fields

This section lists the new names for tables and fields. *(ff)* indicates a flow field.

#### Table 8051 "Service Contract Setup" → "Subscription Contract Setup"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Customer Contract Nos.                 | Cust. Sub. Contract Nos.               |
| 3        | Vendor Contract Nos.                   | Vend. Sub. Contract Nos.               |
| 4        | Service Object Nos.                    | Subscription Header No.                |
| 6        | Serv. Start Date for Inv. Pick         | Sub. Line Start Date Inv. Pick         |

#### Table 8004 "Contract Price Update Line" → "Sub. Contr. Price Update Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 3        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 7        | Contract No.                           | Subscription Contract No.              |
| 8        | Contract Description                   | Sub. Contract Description              |
| 9        | Service Object Description             | Subscription Description               |
| 10       | Service Commitment Description         | Subscription Line Description          |
| 13       | Additional Service Amount              | Additional Amount                      |
| 14       | Old Service Amount                     | Old Amount                             |
| 15       | New Service Amount                     | New Amount                             |

#### Table 8001 "Contract Renewal Line" → "Sub. Contract Renewal Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Service Object No.                     | Subscription Header No.                |
| 2        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 10       | Linked to Ser. Comm. Entry No.         | Linked to Sub. Line Entry No.          |
| 11       | Linked to Contract No.                 | Linked to Sub. Contract No.            |
| 12       | Linked to Contract Line No.            | Linked to Sub. Contr. Line No.         |
| 13       | Contract No.                           | Subscription Contract No.              |
| 14       | Contract Line No.                      | Subscription Contract Line No.         |
| (ff) 101 | Service Object Description             | Subscription Description               |
| (ff) 102 | Service Commitment Description         | Subscription Line Description          |
| (ff) 103 | Service Start Date                     | Subscription Line Start Date           |
| (ff) 104 | Service End Date                       | Subscription Line End Date             |
| (ff) 106 | Service Amount                         | Amount                                 |
| (ff) 108 | Planned Serv. Comm. exists             | Planned Sub. Line exists               |
| 201      | Agreed Serv. Comm. Start Date          | Agreed Sub. Line Start Date            |

#### Table 8002 "Planned Service Commitment" → "Planned Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Service Object No.                     | Subscription Header No.                |
| 3        | Package Code                           | Subscription Package Code              |
| 6        | Service Start Date                     | Subscription Line Start Date           |
| 7        | Service End Date                       | Subscription Line End Date             |
| 14       | Service Amount                         | Amount                                 |
| 19       | Contract No.                           | Subscription Contract No.              |
| 26       | Service Object Customer No.            | Subscription Customer No.              |
| 27       | Contract Line No.                      | Subscription Contract Line No.         |

#### Table 8019 "Contract Analysis Entry" → "Sub. Contr. Analysis Entry"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 3        | Package Code                           | Subscription Package Code              |
| 6        | Service Start Date                     | Subscription Line Start Date           |
| 7        | Service End Date                       | Subscription Line End Date             |
| 14       | Service Amount                         | Amount                                 |
| 19       | Contract No.                           | Subscription Contract No.              |
| 27       | Contract Line No.                      | Subscription Contract Line No.         |
| 33       | Service Amount (LCY)                   | Amount (LCY)                           |
| 39       | Quantity Decimal                       | Quantity                               |
| 1005     | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 8007     | Service Object Source Type             | Sub. Header Source Type                |
| 8008     | Service Object Source No.              | Sub. Header Source No.                 |
| 8010     | Service Object Description             | Subscription Description               |

#### Table 8062 "Customer Contract Line" → "Cust. Sub. Contract Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Contract No.                           | Subscription Contract No.              |
| 100      | Service Object No.                     | Subscription Header No.                |
| 101      | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 102      | Service Object Description             | Subscription Description               |
| 106      | Service Commitment Description         | Subscription Line Description          |
| (ff) 109 | Service Obj. Quantity Decimal          | Service Object Quantity                |
| (ff) 200 | Planned Serv. Comm. exists             | Planned Sub. Line exists               |

#### Table 8065 "Vendor Contract Line" → "Vend. Sub. Contract Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Contract No.                           | Subscription Contract No.              |
| 100      | Service Object No.                     | Subscription Header No.                |
| 101      | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 102      | Service Object Description             | Subscription Description               |
| 106      | Service Commitment Description         | Subscription Line Description          |
| (ff) 109 | Service Obj. Quantity Decimal          | Service Object Quantity                |
| (ff) 200 | Planned Serv. Comm. exists             | Planned Sub. Line exists               |

#### Table 8066 "Customer Contract Deferral" → "Cust. Sub. Contract Deferral"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Contract No.                           | Subscription Contract No.              |
| 5        | Contract Type                          | Subscription Contract Type             |
| 22       | Contract Line No.                      | Subscription Contract Line No.         |
| 23       | Service Object Description             | Subscription Description               |
| 24       | Service Commitment Description         | Subscription Line Description          |

#### Table 8072 "Vendor Contract Deferral" → "Vend. Sub. Contract Deferral"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Contract No.                           | Subscription Contract No.              |
| 5        | Contract Type                          | Subscription Contract Type             |
| 22       | Contract Line No.                      | Subscription Contract Line No.         |
| 23       | Service Object Description             | Subscription Description               |
| 24       | Service Commitment Description         | Subscription Line Description          |

#### Table 8010 "Imported Customer Contract" → "Imported Cust. Sub. Contract"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Contract No.                           | Subscription Contract No.              |
| 7        | Contract Type                          | Subscription Contract Type             |


#### Table 8008 "Imported Service Object" → "Imported Subscription Header"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 100      | Service Object created                 | Subscription Header created            |

#### Table 8009 "Imported Service Commitment" → "Imported Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 3        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 5        | Contract No.                           | Subscription Contract No.              |
| 6        | Contract Line No.                      | Subscription Contract Line No.         |
| 7        | Contract Line Type                     | Sub. Contract Line Type                |
| 8        | Package Code                           | Subscription Package Code              |
| 11       | Service Start Date                     | Subscription Line Start Date           |
| 12       | Service End Date                       | Subscription Line End Date             |
| 19       | Service Amount                         | Amount                                 |
| 28       | Service Amount (LCY)                   | Amount (LCY)                           |
| (ff) 37  | Quantity Decimal                       | Quantity                               |
| 100      | Service Commitment created             | Subscription Line created              |
| 104      | Contract Line created                  | Sub. Contract Line created             |

#### Table 8007 "Overdue Service Commitments" → "Overdue Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 4        | Contract No.                           | Subscription Contract No.              |
| 5        | Contract Description                   | Sub. Contract Description              |
| 6        | Service Commitment Description         | Subscription Line Description          |
| 10       | Service Amount                         | Amount                                 |
| 12       | Contract Type                          | Subscription Contract Type             |
| 14       | Service Start Date                     | Subscription Line Start Date           |
| 15       | Service End Date                       | Subscription Line End Date             |
| 16       | Service Object No.                     | Subscription Header No.                |
| 17       | Service Object Description             | Subscription Description               |
| 19       | Quantity Decimal                       | Quantity                               |

#### Table 8068 "Sales Service Commitment" → "Sales Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 20       | Service Amount                         | Amount                                 |
| 21       | Service Comm. Start Formula            | Sub. Line Start Formula                |
| 22       | Agreed Serv. Comm. Start Date          | Agreed Sub. Line Start Date            |
| 31       | Package Code                           | Subscription Package Code              |
| 50       | Service Object No.                     | Subscription Header No.                |
| 51       | Service Commitment Entry No.           | Subscription Line Entry No.            |

#### Table 8069 "Sales Service Comm. Archive" → "Sales Sub. Line Archive"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 20       | Service Amount                         | Amount                                 |
| 21       | Service Comm. Start Formula            | Sub. Line Start Formula                |
| 22       | Agreed Serv. Comm. Start Date          | Agreed Sub. Line Start Date            |

#### Table 8057 "Service Object" → "Subscription Header"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 28       | Quantity Decimal                       | Quantity                               |
| (ff) 95  | Archived Service Commitments           | Archived Sub. Lines exist              |
| (ff) 200 | Planned Serv. Comm. exists             | Planned Sub. Lines exist               |

#### Table 8059 "Service Commitment" → "Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Service Object No.                     | Subscription Header No.                |
| 3        | Package Code                           | Subscription Package Code              |
| 6        | Service Start Date                     | Subscription Line Start Date           |
| 7        | Service End Date                       | Subscription Line End Date             |
| 14       | Service Amount                         | Amount                                 |
| 19       | Contract No.                           | Subscription Contract No.              |
| (ff) 26  | Service Object Customer No.            | Sub. Header Customer No.               |
| 27       | Contract Line No.                      | Subscription Contract Line No.         |
| 33       | Service Amount (LCY)                   | Amount (LCY)                           |
| (ff) 39  | Quantity Decimal                       | Quantity                               |
| (ff) 200 | Planned Serv. Comm. exists             | Planned Sub. Line exists               |
| (ff) 8010| Service Object Description             | Subscription Description               |

#### Table 8073: Service Commitment Archive → Subscription Line Archive

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 5        | Package Code                           | Subscription Package Code              |
| 8        | Service Start Date                     | Subscription Line Start Date           |
| 9        | Service End Date                       | Subscription Line End Date             |
| 16       | Service Amount                         | Amount                                 |
| 21       | Contract No.                           | Subscription Contract No.              |
| (ff) 28  | Service Object Customer No.            | Sub. Header Customer No.               |
| 29       | Contract Line No.                      | Subscription Contract Line No.         |
| 35       | Service Amount (LCY)                   | Amount (LCY)                           |
| 41       | Serial No. (Service Object)            | Serial No. (Sub. Header)               |
| 42       | Quantity Decimal (Service Ob.)         | Quantity (Sub. Header)                 |
| 96       | Variant Code (Service Object)          | Variant Code (Sub. Header)             |

#### Table "Service Comm. Package Line" → "Subscription Package Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Package Code                           | Subscription Package Code              |
| 12       | Service Comm. Start Formula            | Sub. Line Start Formula                |

#### Table 8016 "Usage Data Subscription" → "Usage Data Supp. Subscription"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 6        | Service Object No.                     | Subscription Header No.                |
| 7        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 21       | Connect to Service Object No.          | Connect to Sub. Header No.             |
| 22       | Connect to SO Method                   | Connect to Sub. Header Method          |
| 23       | Connect to SO at Date                  | Connect to Sub. Header at Date         |

### Only fields renamed

#### Table 8070 "Subscription Billing Cue"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| (ff) 2   | Customer Contract Invoices             | Cust. Sub. Contr. Invoices             |
| (ff) 3   | Customer Contract Credit Memos         | Cust. Sub. Contr. Credit Memos         |
| (ff) 4   | Vendor Contract Invoices               | Vend. Sub. Contr. Invoices             |
| (ff) 5   | Vendor Contract Credit Memos           | Vend. Contr. Credit Memos              |
| (ff) 6   | Serv. Comm. wo Cust. Contract          | Sub. L. wo Cust. Sub. Contract         |
| (ff) 7   | Serv. Comm. wo Vend. Contract          | Sub. L. wo Vend. Sub. Contract         |

#### Table 8061 "Billing Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 20       | Contract No.                           | Subscription Contract No.              |
| 21       | Contract Line No.                      | Subscription Contract Line No.         |
| 30       | Service Object No.                     | Subscription Header No.                |
| 31       | Service Commitment Entry No.           | Subscription Line Entry No.            |
| (ff) 32  | Service Object Description             | Subscription Description               |
| 33       | Service Commitment Description         | Subscription Line Description          |
| 34       | Service Start Date                     | Subscription Line Start Date           |
| 35       | Service End Date                       | Subscription Line End Date             |
| 39       | Service Obj. Quantity Decimal          | Service Object Quantity                |
| 52       | Service Amount                         | Amount                                 |

#### Table 8064 "Billing Line Archive"

| Field no, | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 20       | Contract No.                           | Subscription Contract No.              |
| 21       | Contract Line No.                      | Subscription Contract Line No.         |
| 30       | Service Object No.                     | Subscription Header No.                |
| 31       | Service Commitment Entry No.           | Subscription Line Entry No.            |
| (ff) 32  | Service Object Description             | Subscription Description               |
| 33       | Service Commitment Description         | Subscription Line Description           |
| 34       | Service Start Date                     | Subscription Line Start Date           |
| 35       | Service End Date                       | Subscription Line End Date             |
| 39       | Service Obj. Quantity Decimal          | Service Object Quantity                |
| 52       | Service Amount                         | Amount                                 |

#### Table 8003 "Price Update Template"

| Field no, | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 4        | Contract Filter                        | Subscription Contract Filter           |
| 5        | Service Commitment Filter              | Subscription Line Filter               |
| 6        | Service Object Filter                  | Subscription Filter                    |

#### Table 8017 "Generic Import Settings"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 4        | Create Subscriptions                   | Create Supplier Subscriptions          |

#### Table 8006 "Usage Data Billing"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 5        | Contract No.                           | Subscription Contract No.              |
| 6        | Contract Line No.                      | Subscription Contract Line No.         |
| 7        | Service Object No.                     | Subscription Header No.                |
| (ff) 8   | Service Object Description             | Subscription Description               |
| 9        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 10       | Service Commitment Description         | Subscription Line Description           |

#### Table 8018 "Usage Data Generic Import"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 6        | Service Object No.                     | Subscription Header No.                |

#### Only tables renamed

| Original table name                     | New table name                     |
|-----------------------------------------|----------------------------------------|
| Contract Type                           | Subscription Contract Type             |
| Customer Contract                       | Customer Subscription Contract         |
| Vendor Contract                         | Vendor Subscription Contract           |
| Item Serv. Commitment Package           | Item Subscription Package              |
| Item Templ. Serv. Comm. Pack.           | Item Templ. Sub. Package               |
| Service Commitment Template             | Sub. Package Line Template             |
| Service Commitment Package              | Subscription Package                   |
| Usage Data Customer                     | Usage Data Supp. Customer              |

-->

## Related information  

[Upgrading the Application Code](Upgrading-the-Application-Code.md)  
[Upgrading the Data](Upgrading-the-Data.md)  
[Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)  
