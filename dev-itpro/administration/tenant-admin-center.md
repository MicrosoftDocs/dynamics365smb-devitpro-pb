---
title: Business Central Admin Center| Microsoft Docs
description: Learn about how a VAR or an internal administrator can set upgrade windows and other admin tasks.  
author: jaredha

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 09/11/2018
ms.author: jaredha

---
# The Business Central Administration Center

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides a portal for administrators to perform administrative tasks for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. Here, administrators can view and work with production and sandbox environments for the tenant, set up upgrade notifications, and view telemetry for events on the tenant.  

![Business Central Admin Center](../developer/media/admin/business_central_admin_center.png)

## Accessing the administration center

The following users are authorized to access the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] :

- Internal tenant administrators
- Delegated administrators, typically the partner associated with the tenant

As a partner, you can access the center from the Partner Dashboard in the Microsoft Partner Center:

1. Log into the [Partner Dashboard](https://partnercenter.microsoft.com/dashboard).
2. Select the Customers link in the navigation pane.
3. Select the customer tenant for which you want to perform administrative tasks.
4. Select Service Management.
5. Under the Administer Services heading, select [!INCLUDE[prodlong](../developer/includes/prodlong.md)].

The administration center can also be accessed by navigating directly to the URL of a tenant's instance. This is done with the URL below, replacing [TENANT_ID] with the tenant ID of the customer tenant.

`https://businesscentral.dynamics.com/[TENANT_ID]/admin`

## Environments

The **Environments** tab of the center allows you to view information about the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] production and sandbox environments for the tenant, set an upgrade window for each environment, and work with the sandbox environment for the tenant.

### Set the upgrade window

The upgrade window for an environment defines a window of time during the day in which the environment is allowed to be upgraded. When major and minor updates are rolled out to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenants, the update will only be applied to an environment within the time frame defined for the upgrade window, helping ensure that updates are applied outside of the customer's business hours.

> [!NOTE]
> The upgrade window must be a minimum of six hours.

To set the upgrade window for an environment:

1. On the **Environments tab** of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the relevant environment.
2. Click **Upgrade settings** on the action ribbon.
3. In the **Upgrade settings** pane, specify the start time and end time for the upgrade window for this environment.
4. Click Save.

### Create a sandbox environment

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides an easy method for managing the sandbox environment for the tenant. A sandbox environment is a non-production instance of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Isolated from production, a sandbox environment is the place to safely explore, learn, demo, develop, and test the service without the risk of affecting the data and settings of your production environment.

To create a sandbox environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the production environment.
2. Click **Create Sandbox** on the action ribbon.
3. In the **Create Sandbox** pane, specify if you want the sandbox environment to contain a copy of the data from the production environment.
    > [!NOTE]
    > If the environment is not created with production data, it will have default demo data.
4. Click Create.
    > [!NOTE]
    > The sandbox environment will not be accessible until the **State** shows *Active*.

A sandbox environment can also be created from within a page within the production environment of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application. For more information, see [Create a Sandbox Environment](across-how-create-sandbox-environment.md).

To delete a sandbox environment, choose the environment on the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], and then click **Delete Sandbox** on the action ribbon.

## Notification recipients

When either a major or minor update of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] has been applied to an environment, an email notification is sent to notify recipients that the upgrade has completed successfully. The notification is sent to all email addresses listed in the **Notification recipients** list of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. The list is managed manually by adding and removing recipients to ensure the right individuals are notified of the event.

## Telemetry

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides telemetry for the tenant environments to enable troubleshooting and support for the tenant.

To filter the telemetry for an environment:

1. Select a base point in time for the timestamp of the telemetry messages.
2. Enter a number of minutes prior to or following the base point in time to set a range of time for the timestamp. A negative number indicates a number of minutes prior to the base point in time, and a positive number indicates a number of minutes following the base point in time. For example, a number of -15 minutes will filter the telemetry messages to a timestamp range of 15 minutes prior to the base point in time up to the base point in time.
3. Select the message type.
4. Select the environment.
5. Click Filter.

## See also

[Working with Administration Tools](administration.md)  
[Business Central Data Security](../security/data-security.md)
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Microsoft Partner Dashboard](https://partnercenter.microsoft.com/dashboard)