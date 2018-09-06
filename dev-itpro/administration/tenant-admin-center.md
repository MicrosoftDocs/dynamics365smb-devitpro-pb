---
title: Business Central Admin Center| Microsoft Docs
description: learn about how a VAR or an internal administrator can set upgrade windows and other admin tasks.  
services: dynamics365-business-central
documentationcenter: ''
author: jaredha

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 09/05/2018
ms.author: jaredha

---
# The Business Central Admin Center
The Business Central Admin Center provides a portal for administrators to perform administrative tasks for a Business Central tenant. Here, admins can view and work with production and sandbox environments for the tenant, set up upgrade notifications, and view telemetry for events on the tenant.

![Business Central Admin Center](../developer/media/admin/business_central_admin_center.png)

## Accessing the Business Central Admin Center
The following users are authorized to access the Business Central Admin Center:
   1. Internal tenant administrators
   2. Delegated administrators, which are typically the VAR associated with the tenant

The VAR is able to access to the center from the Partner Dashboard in the Microsoft Partner Center:
   1. Log into the <a href=https://partnercenter.microsoft.com/dashboard>Partner Dashboard</a>.
   2. Select the Customers link in the navigation pane.
   3. Select the customer tenant for which you want to perform administrative tasks.
   4. Select Service Management.
   5. Under the Administer Services heading, select Dynamics 365 Business Central.
   
The center can also be accessed by navigating directly to the URL of a tenant's instance. This is done with the URL below, replacing [AAD_TENANT_ID] with the tenant ID of the customer tenant. 

https://businesscentral.dynamics.com/[AAD_TENANT_ID]/admin

## Environments
The Environments tab of the center allows you to view information about the Business Central production and sandbox environments for the tenant, set an upgrade window for each environment, and work with the sandbox environment for the tenant.

### Set the upgrade window
The upgrade window for an environment defines a window of time during the day in which the environment is allowed to be upgraded. When major and minor updates are rolled out to Business Central tenants, the update will only be applied to an environment within the timeframe defined for the upgrade window, helping ensure that updates are applied outside of the customer's business hours.

> [!NOTE]
> The upgrade window must be a minimum of six hours.

To set the upgrade window for an environment:
   1. On the Environments tab of the Business Central Admin Center, select the desired environment.
   2. Click Upgrade settings on the action ribbon.
   3. In the Upgrade settings pane, select the desired start time and end time for the upgrade window.
   4. Click Save.

### Create a sandbox environment
The Business Central Admin Center provides an easy method for managing the sandbox environment for the tenant. A sandbox environment is a non-production instance of Business Central. Isolated from production, a sandbox environment is the place to safely explore, learn, demo, develop, and test the service without the risk of affecting the data and settings of your production environment.

To create a sandbox environment:
   1. On the Environments tab of the Business Central Admin Center, select the production environment.
   2. Click Create Sandbox on the action ribbon.
   3. In the Create Sandbox pane, select if you want the sandbox environment to contain a copy of the data from the production environment.
   > [!NOTE]
   > If the environment is not created with production data, it will have default demo data.

   4. Click Create.
   > [!NOTE]
   > The Sandbox environment will not be accessible until the State is Active.

A sandbox environment can also be created from within a page within the production environment of the Business Central application. See [Create a Sandbox Environment](across-how-create-sandbox-environment.md) for more information.

To delete a sandbox environment, select the environment on the Environments tab of the Business Central Admin Center, and click Delete Sandbox on the action ribbon.

## Notification recipients
When either a major or minor update of Business Central has been applied to an environment, an email notification is sent to notify recipients that the upgrade has completed successfully. The notification is sent to all email addresses listed in the Notification recipients list of the Business Central Admin Center. The list is managed manually by adding and removing recipients to ensure the right individuals are notified of the event.

## Telemetry
The Business Central Admin Center provides telemetry for the tenant environments to enable troubleshooting and support for the tenant.

To filter the telemetry for an environment:
   1. Select a base point in time for the timestamp of the telemetry messages.
   2. Enter a number of minutes prior to or following the base point in time to set a range of time for the timestamp. A negative number indicates a number of minutes prior to the base point in time, and a positive number indicates a number of minutes following the base point in time. For example, a number of -15 minutes will filter the telemetry messages to a timestamp range of 15 minutes prior to the base point in time up to the base point in time.
   3. Select the message type.
   4. Select the environment.
   5. Click Filter.
