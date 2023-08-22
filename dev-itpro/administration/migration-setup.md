---
title: Run Cloud Migration Setup
description: This article explains how to run the Cloud Migration Setup assisted setup guide to configure the components and connection for migrating data from a Business Central on-premises database to Business Central online environment.
author: jswymer
ms.author: jswymer #Required; your Microsoft alias; optional team alias.
ms.reviewer: jswymer #Required; Microsoft alias of content publishing team member.
ms.service: dynamics365-business-central
ms.topic: how-to 
ms.date: 07/05/2023
ms.custom: bap-template
---
# Run cloud migration setup

This article explains how to run the **Cloud Migration Setup** assisted setup guide to configure the components and connection for migrating data from a Business Central on-premises database to Business Central online environment. To learn more about the mechanics behind the **Cloud Migration Setup**, go to [Cloud migration setup overview](migration-setup-overview.md).

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process.md)]

<!-- To migrate data, in the target company in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, run the **Cloud Migration Setup** assisted setup guide.  


> [!IMPORTANT]
> You must be signed in as an administrator of the Microsoft 365 tenant as well as [!INCLUDE [prod_short](../includes/prod_short.md)] online.  -->

## About delegated administrators

Any user running the cloud migration setup flow as delegated administrator must receive approval from a licensed user in order to run the cloud migration. The licensed user must have the *Essentials* or the *Premium* license and SUPER permissions. In this case, the **Cloud Migration Setup** assisted setup guide displays an extra step, where the delegated administrator can copy the autogenerated approval link and send it to the licensed user for approval. Once the licensed user has approved the request, the delegated administrator can continue with the setup of the cloud migration and perform all other steps required to complete that process. The licensed user can always revoke the permission to run the migration by choosing the same approval link that was shared by the delegated administrator, or from the **Cloud Migration Approval** page.  

<!--

Once the setup guide is complete and data migration is activated, the initial data migration ready to be run from the **Cloud Migration Management** page whenever you want. Go to [Manage the Migration](#manage-the-migration).-->

## Prepare

- Review [Check Prerequisites](cloud-migration-prerequisites.md) and make sure the environments meet the requirements.

   > [!IMPORTANT]
   > [!INCLUDE [bc-cloud-migrate-prod](../includes/bc-cloud-migrate-prod.md)]

- Create table mappings if you need to rename a table during the cloud migration or to move a subset of fields to a different table or table extension. For more information, see [Define migration table mappings](migration-table-mapping.md).
<!-- - Get the SQL connection string for the Business Central on-premises database. For more information, go to [SQL connection string](#define-your-sql-database-connection).-->

> [!TIP]
> We recommend that you start the migration by running the assisted setup from a company other than the company that you are migrating data to. For example, sign into the demonstration company, CRONUS, and start the process there. This way, you can make sure that all users are logged out of the original company and the target company. This is especially important when you migrate from [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises current version because you can run the migration tool multiple times.

> [!TIP]
> [!INCLUDE [migrate-limits](../developer/includes/migrate-limits.md)]

## Run the cloud migration setup

<!--Does it matter what machine you run the setup, repl, from? If this is the first time running cloud setup should you run it on the machine where SQL db is so IR install?-->

1. [Sign in to the Microsoft 365 tenant](https://admin.microsoft.com) used by [!INCLUDE [prod_short](../includes/prod_short.md)] online.

   The person who sets up and runs the cloud migration must be signed in as an administrator of the Microsoft Entra (Microsoft 365) tenant and [!INCLUDE [prod_short](../includes/prod_short.md)] online.
1. [Sign in to Business Central online](https://businesscentral.dynamics.com) and open environment want to migrate the data to.
1. Use search to find and open the **Cloud Migration Setup** assisted setup.
1. Read the information on the page and provided links. If you consent, switch on **I accept warning & privacy notice**, then select **Next**.
1. Set **Product** option to the version that matches the on-premises product that you're migrating, then select **Next**.
1. On the **Define your SQL database connection** page, fill in the information about the SQL database connection and integration runtime.

   For more information about this step, see [Define your SQL database connection](#define-sql-database-connection-and-integration-runtime).

   Select **Next** when done. Once you choose **Next**, a new pipeline is created in the Azure service. When completed successfully, the **Select companies to migrate** page appears.


 <!--For example, Server=jswymer-vm-2\bcdemo;Database="Demo Database BC (21-0)";User Id=bclogin2;Password=1234;-->

   <!--1. Do one of the following tasks:

   - If you already have an Microsoft integration runtime service instance, you can use the instance by entering its name in the **Integration Runtime Name** box. Then select **Next** and go to step 9. 
   - If you don't already have an integration runtime, leave **Integration Runtime Name** blank, select **Next**, then go to the next step.-->

<!--
8. Select **Download the Self-hosted Integration Runtime**, the do these steps to install the integration runtime:
    1. On the Download Center page that opens, select **Download** > **IntegrationRuntime_<latestversion>.msi** > **Next**. The file is downloaded to your computer.
    2. Select **Open** file to start the installation. When completed, the **Register Integration Runtime (Self-Hosted)** page opens.
    3. Go back to the **Cloud Migration Setup** page copy the **Authentication key**.
    4. Go back to the **Register Integration Runtime (Self-Hosted)** page and paste the key value in authentication key box, then select **Finish**. 
    5. Go back to **Cloud Migration Setup** and select **Next**.-->

1. On the **Select companies to migrate** page, select one or more companies from the list or switch on **All Companies**, then select **Next**.
1. Select **Finish** to complete the cloud migration setup.

  If you want to open **Cloud Migration Management**, where you can run the migration, select **Yes**.

<a name="sql"></a>

[!INCLUDE[cloud-migration-sql-connection-ir](../developer/includes/cloud-migration-sql-connection-ir.md)]

## Rerunning cloud migration setup guide

There are some scenarios where it may be necessary for you to run the cloud migration setup guide more than once.  

> [!TIP]
> We recommend that you take a backup of the target environment so that you can easily restore the environment to a specific state and time, should you want to.

The following list highlights a few examples:

- Multiple companies in [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises

  One example is if you want to add more companies to the migration, or if you want to change the companies to migrate, run the assisted setup guide again. A more efficient option, though, is to use the **Select Companies to Migrate** action from the **Cloud Migration Management** page.  

- Add tenants to an existing runtime service  

  If you're a hosting partner, you may have multiple tenants running on the same integration runtime service. Each tenant is isolated in their own data pipeline. To add tenants to an existing integration runtime service, enter the name of the existing integration runtime service into this field. The integration runtime name can be found in the Microsoft Integration Runtime Manager. For more information, see [Create and configure a self-hosted integration runtime](/azure/data-factory/create-self-hosted-integration-runtime) in the Azure docs.

In both examples, you're making updates to an existing runtime service. When you get to the point of the assisted setup guide where you can specify an existing runtime services name, open the Microsoft Integration Runtime Service Manager. Then enter the runtime name in the field; you aren't allowed to copy and paste. The runtime service identifies that you're making updates to an existing service and doesn't create a new one.  

Complete the steps in the wizard to update the runtime service. If the change was related to adding tenants to an existing service, a new data pipeline is created for that tenant. Regenerating an Azure Data Factory (ADF) key may be done using the **Cloud Migration Management** page in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. For more information, see [Run the assisted setup guide](migration-setup.md#rerunning-cloud-migration-setup-guide).  

> [!TIP]
> If you are using [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, the same setup guide is also available in your on-premises solution. You will automatically be redirected to your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online to continue the configuration process.

> [!CAUTION]
> If you have mapped users in the first run of the cloud migration setup guide, then do not choose the **Define User Mappings** action again in subsequent runs.

## Next steps

- If you run into problems with the setup, go to [Cloud migration setup troubleshooting](migration-setup-troubleshooting.md).
- Once the setup guide is complete and data migration is activated, the initial data migration ready to be run from the **Cloud Migration Management** page whenever you want. Go to [Run Data Migration](migration-data-replication.md).
