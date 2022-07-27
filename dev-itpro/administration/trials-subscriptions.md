---
title: Trials and Subscriptions
description: Learn how it works with trials and subscriptions for Business Central online, and how the admin can cancel subscriptions.
author: edupont04

ms.topic: conceptual
ms.workload: na
ms.search.keywords: preview, trial, sandbox, subscription
ms.search.form: 1803, 1801
ms.date: 05/25/2022
ms.author: edupont

---
# Business Central Trials and Subscriptions

Organizations across the world sign up for a free [!INCLUDE[prod_short](../includes/prod_short.md)] trial to explore the experience.  Then, when they're ready, they talk to a reselling partner about getting a subscription. In this article, we describe how the different types of trials work, and how the admin can remove licenses from users or cancel a subscription.  

## Get started with a trial

[!INCLUDE [admin-trial-signup](../includes/admin-trial-signup.md)]

Depending on the country or region, the trial includes the languages and functionality that the country or region requires. For more information, see [Changing Language and Locale](/dynamics365/business-central/about-locale-language.md).  

> [!NOTE]
> [!INCLUDE [prod_short](../includes/prod_short.md)] resellers can also set up [tailored demo environments](demo-environment.md).  

### <a name="premiumtrial"></a>Dynamics 365 Business Central Premium Trial

[!INCLUDE [admin-premiumtrial](../developer/includes/admin-premiumtrial.md)]

### <a name="extendtrial"></a>Extend trials

[!INCLUDE [admin-extendtrials](../developer/includes/admin-extendtrials.md)]

[!INCLUDE [admin-extendtrials-periods](../developer/includes/admin-extendtrials-periods.md)]

## Add your own data to an empty trial company

To try out [!INCLUDE[prod_short](../includes/prod_short.md)] with production data, you can switch to a free 30-day trial without sample data. The **Set up my company** assisted setup guide can help you specify basic information about your business. Optionally, you can import data from your existing business management solution so that you can evaluate [!INCLUDE[prod_short](../includes/prod_short.md)] with your own data. However, we strongly recommend that you don't use a free trial to help run your business. Contact [a reselling partner](/dynamics365/business-central/across-faq#findpartner) to learn more about how to get started with [!INCLUDE[prod_short](../includes/prod_short.md)]. The partner can also help you migrate your data to [!INCLUDE [prod_short](../includes/prod_short.md)] online.  

If 30 days aren't enough to decide, you can extend the trial. For more information, see the [Extend trials](#extendtrial) section.  

### Set up a company in [!INCLUDE[prod_short](../includes/prod_short.md)]

The [quick start](/dynamics365/business-central/quick-start-business-central) articles can help with the first steps into setting up [!INCLUDE [prod_short](../includes/prod_short.md)] for an organization. Inside [!INCLUDE [prod_short](../includes/prod_short.md)], the **Assisted Setup** page lists the assisted setup guides that can help you. For more information, see [Get Ready for Doing Business](/dynamics365/business-central/ui-get-ready-business).  

### Reset [!INCLUDE[prod_short](../includes/prod_short.md)]

If the data in a [!INCLUDE[prod_short](../includes/prod_short.md)] free trial, you can still start over with a fresh experience. Just create a new evaluation company, and then delete the original company. Open the **Companies** page and choose the **New** action to start the **Create New Company** assisted setup guide. The guide can help you set up a fresh evaluation company with sample data. You can also create a copy of your current company, sign out, and then sign into your new company.  

> [!IMPORTANT]
> When you share [!INCLUDE[prod_short](../includes/prod_short.md)] with other people from your organization, you must make sure other people are not logged in when you delete a company.  

### When a free trial expires

Most trials are based on people signing up at [https://dynamics.microsoft.com/business-central/](https://dynamics.microsoft.com/business-central/). These viral trials do not expire, unless the prospect switches to the 30-day trial, and provided that users access [!INCLUDE [prod_short](../includes/prod_short.md)] frequently.  

[!INCLUDE [admin-viral-trial-expiry](../developer/includes/admin-viral-trial-expiry.md)]
## Get started with a subscription

Each time a user signs in during the trial period, a notification in a blue bar at the top displays the time remaining. If an organization decides to subscribe, they must find a [!INCLUDE[prod_short](../includes/prod_short.md)] partner. For more information, see [How do I find a reselling partner?](/dynamics365/business-central/across-faq#findpartner) (business users) and [Trials and Sign-ups for Business Central Online](../deployment/customer-signup.md) (partners).  

[!INCLUDE [admin-license-trial](../includes/admin-license-trial.md)]

For more information about what you can do with [!INCLUDE [prod_short](../includes/prod_short.md)], see [Get Ready for Doing Business](/dynamics365/business-central/ui-get-ready-business.md) and [Business Functionality](/dynamics365/business-central/across-business-functionality.md).  

### Removing a subscription

If an organization decides to stop using [!INCLUDE [prod_short](../includes/prod_short.md)], an administrator must remove the subscription in the Microsoft 365 admin center. An email notification is sent to all administrators of the account. Deleting the subscription blocks all users from accessing their [!INCLUDE [prod_short](../includes/prod_short.md)], and deletes all data.  

> [!WARNING]
> The subscription is deleted immediately and can not be reactivated.

For more information, see [Suspend or cancel a subscription](/partner-center/create-a-new-subscription#suspend-or-cancel-a-subscription?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml) in the Partner Center content.  

## <a name="expire"></a>Data and access when a trial or subscription ends

Trials can expire, and so can a paid subscription, such as if the organization does not renew the subscription, stops payments, or if they cancel the subscription.  

[!INCLUDE [admin-extendtrials-periods](../developer/includes/admin-extendtrials-periods.md)]

## Get started with sandboxes

Sandbox environments are a way for you to practice with [!INCLUDE[prod_short](../includes/prod_short.md)]. Think of a sandbox as a non-production environment that you use on top of your production instance of [!INCLUDE[prod_short](../includes/prod_short.md)]. For example, if you want to take the free online training from [Microsoft Learn](/learn/dynamics365/business-central?WT.mc_id=dyn365bc_landingpage-docs), your administrator can [create a sandbox environment](tenant-admin-center-environments.md#sandbox-environments). This way, you and your colleagues can practice in a safe place rather than in your production environment.  

If you're a developer, a sandbox lets you safely build and test extensions and develop new functionality to customize the service without affecting the data and settings of your production environment.  

Right now, all customers can use a sandbox, including organizations who have signed up for a trial. For more information about how to get started with a sandbox, see [Sandbox Environments for Dynamics 365 Business Central Development](../developer/devenv-sandbox-overview.md).  

> [!NOTE]
> Sandboxes created this way contain demonstration data for the fictitious CRONUS company. No data is copied or otherwise transferred from the production environment.  

The administrator of your [!INCLUDE[prod_short](../includes/prod_short.md)] and your reselling partner can create more environments in the administration center. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

## <a name="infrastructure"></a>Understanding Business Central online infrastructure

If you are migrating from an on-premises solution, understanding the infrastructure of [!INCLUDE [prod_short](../includes/prod_short.md)] online can help you make good choices for how to set up environments and companies. For more information and an example, see [Understanding the infrastructure of Business Central online](tenant-environment-topology.md).  

## See also

[Sign up for a free Dynamics 365 Business Central trial](/dynamics365/business-central/trial-signup.md)  
[Dynamics 365 Business Central trial FAQ](/dynamics365/business-central/trial-faq.md)  
[Trials and Sign-ups for Business Central Online](../deployment/customer-signup.md)  
[Migrate Data](/dynamics365/business-central/dev-itpro/administration/migrate-data)  
[Choosing Your Dynamics 365 Business Central Development Sandbox Environment](../developer/devenv-sandbox-overview.md)  
[Country/Regional Availability and Supported Translations](../compliance/apptest-countries-and-translations.md)  
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Preparing Demonstration Environments (as a partner)](demo-environment.md)  

## Survey

Help us understand if you use Microsoft's custom Help toolkit. Take the survey in English here: [https://forms.office.com/r/A4cUJgjkD1](https://forms.office.com/r/A4cUJgjkD1).  
