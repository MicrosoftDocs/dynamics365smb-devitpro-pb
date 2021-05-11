---
title: Rename Environments in the Admin Center
description: Use the Business Central administration center to rename environments. 
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, rename
ms.date: 04/01/2021
ms.author: jswymer
---

# Rename Environments in the Admin Center

**APPLIES TO:** Business Central 2020 release wave 2 and later

> [!NOTE]
> This feature is in preview. It might change or be removed in the future updates.

You can change the name of any environment. The name uniquely identifies the environment from your other environments. Before you change a name, you must consider that the name also is part of the environment's URL. The URL is used in links to the environment in various ways. So changing the name can have significant impact.

The renaming of an environment is logged and shown in the [operations log](tenant-admin-center-environments.md#opslog).

## Before you rename an environment

- Read the [Environment rename considerations](#consider) section to understand the consequences of renaming an environment.
- Make sure you notify all your users, including any external service integrations you may have, about the upcoming URL change. It will let them prepare to update their references. 
- Determine the best time to do the renaming. Renaming an environment requires a restart to the environment. We recommend doing this operation when no users are active in Business Central.  

## To rename an environment

1. Select **Environments**, then select the environment you want to rename.
2. On the **Environment Details** page, select **Rename**.
3. On **Rename environment** page, read the information.
4. Enter the new name, and then select **Rename**.
5. Confirm your intent to rename the environment.

At this point, the environment state will first change to **Preparing | Rename Scheduled**, then to **Active** again when the rename has been completed. The new name will be available immediately. The environment will no longer be accessible using the old environment name.  

You can also review the log for the Rename operation on the **Operations** page afterwards.

## <a name="consider"></a>Environment rename considerations

Changing the environment name can affect many scenarios and integrations. In the early stages of a customer implementation, it may be a low risk operation. But renaming an environment that's been used by customers for a while or integrated with many external services and components is risky. So carefully plan for it.

Here are some areas where the environment name is used, which will be affected when you change the environment name. Consider these areas and plan your communication before attempting to rename an environment:  

- Web client URL, including links to web client bookmarked by users
- Deep links to specific pages within [!INCLUDE[prod_short](../developer/includes/prod_short.md)] created by users or shared by them via e-mails, internal documentation or training  portals, Teams channels, Word, and Excel documents. They're often exchanged among users in the same company, across companies, across environments, across tenants. Links created by users as desktop shortcuts. Links sent or created before the name change will no longer work after the name change.
- Integrations that embed the web client, for example, SharePoint apps composed of Business Central pages
- Integrations that launch the web client  
- Partner-developed mobile apps, web applications, and so on. These apps likely originate from partners outside the customer's organization where the admin can't update URLS. 
- Mobile apps, including Windows 10 store app for desktop/tablet. Affects only users who have modified the protocol handler to force the app to connect to environment with name other than "production". If the user keeps working with "production" on the mobile app (which is default now), and the admin renames the environment from "prod2" to "myprod", the mobile user isn't affected. Otherwise, the app would throw an error, and the user would have to exit using a newly created protocol handler link.
- Browser cache. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] stores the URL, including environment name, in some of its cached data. This data is cached browser-side, that is, in the user's browser and across devices. Admins typically don't have access or control this data cache. When users lose their cache, they lose the link modifications to all their pages and preferences. 
- Web services URL, potentially affecting external integrations that use OData or SOAP

- [!INCLUDE[prod_short](../developer/includes/prod_short.md)] add-ins and integrations with other Microsoft services
  - Outlook Add-in. The Add-In manifest that is saved to Exchange Server, either per-organization or per-user, includes the environment name.
  - Excel Add-in. Each user's Excel worksheet stores the environment name. 
  - Power BI. All reports, including the default reports deployed from the Role Center, built before the rename will be affected. Also, Power BI apps installed before the rename would be affected. There's no automatic way to repair these items. The partner or user would have to manually update the connections.
  - Power Apps/Automate. All apps and flows built before rename would be affected with no automatic way to repair. The partner or user would have to manually update the connections.  
  - CDS. CDS Virtual Entity setup stores environment name.
- Development scenarios  
  - Publish to sandbox environment from Visual Studio Code. The launch.json file of extensions might contain the sandbox name, if different from "default". The files require source code updates.
  - CI/CD pipelines for test and deployment could be impacted by environment renames.
- Azure Application Insights logs and metrics

## See also

[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Managing Apps](tenant-admin-center-manage-apps.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Rename Environments](tenant-admin-center-environments-rename.md)  
[Restoring an Environment](tenant-admin-center-backup-restore.md)  
[Move an Environment to another Azure Active Directory organization](tenant-admin-center-environments-move.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
