---
title: Migrating Business Central companies into live tenants
description: Learn about the risks when moving companies to live online tenants.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: conceptual 
ms.collection: 
ms.date: 03/01/2024
ms.custom: bap-template
---

# Migrating Business Central on-premises companies to live tenants

Migrating Business Central companies from on-premises to an online tenant after [completing cloud migration and going live](migration-finish.md) isn't officially supported. We advise that you move all companies to the tenant before going live. Moving companies into a live tenant can lead to data loss in the live companies. You're not prevented from setting up cloud migration and migrating one or companies to a live tenant. There might be special cases when it's necessary. However, the operation is done at your own risk because we can't necessarily solve data loss problems, so you have to manage them.

The following sections discuss potential problems when migrating a company to a live tenant and how you can minimize the risks.

## Permissions are replaced with Intelligent Cloud permissions set

By default, whenever you set up the cloud migration, the migration process replaces the permission sets of all users, except those users with the SUPER permission set, with the Intelligent Cloud permission set. This permissions set prevents users from making any data modifications.

Before setting up the cloud migration, ensure that user permissions retained. [Learn how to retain user permissions](migration-retain-permissions.md). 

## Losing per-database data created or modified in Business Central online  

If a per-database table in the online tenant is replaced with the data from on-premises database, the risk is that the changes made online can be lost. To mitigate this risk, ensure that you don't replicate the per-database data. Exclude all per-database tables except the **Tenant Media** table before you schedule a replication run.

Upgrade tags must not be replaced. If they are, open a support ticket immediately and ask for quick assistance.

**Tenant Media** table data should be safe to migrate, however check that the migration process only did an incremental update. If the**Tenant Media** table data gets replaced, restore the environment from the backup to a new instance. Then move the missing **Tenant Media** records by using the script and per-tenant extension (PTE) that you can find at [Business Central Tech Samples](https://github.com/microsoft/BCTech/tree/master/samples/CloudMigration/MoveTenantMediaBetweenTenantsWithAPI) repo on GitHub.

## Upgrading the data twice or running into business hours 

Running upgrade twice on cloud migration should be avoided at any cost as it can update the data twice. Per-Database data is at risk, but also the Per-Company data. With large upgrades, it can spill over into business hours. If you want to move the company into a live tenant, do the upgrade on-premises and then only replicate the data that belongs to the company.

## Number sequences

Cloud migration automatically copies the number sequences from the on-premises database that belong only to the companies that are under replicate. After the migration, check the number sequences to make sure that the data wasn't replaced.

## Modification of data in replicated companies

Because the system is live, users can incidentally sign in to the companies that are under migration and change the data. There could be cross company jobs that are running on the company, or the external parties could be accessing the system through APIs or other means.

Make sure that you analyze the integrations that are enabled and communicate with the organization that more companies are moved to Business Central online.

Test changes in sandbox environments also.

## Changing schema or installing extensions

Make sure that there are no changes done by installing extensions or copying/deleting/renaming companies while the replication is running. 

## External integrations 

After migration, be sure to configure the Dataverse mapping and API integrations on the migrated companies again.

## See also

[Prepare and plan for cloud migration](cloud-migration-plan-prepare.md)  
[Run cloud migration setup](migration-setup.md)  
[Business Central migration overview](migrate-business-central-on-premises.md)  
