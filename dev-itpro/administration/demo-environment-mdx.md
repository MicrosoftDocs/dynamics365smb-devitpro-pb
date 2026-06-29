---
title: Set up Microsoft 365 and Business Central demo environments with MDX
description: Create and configure Business Central demonstration environments with Microsoft demo experience (MDX) for presales.
author: jswymer
ms.custom: bap-template
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 06/24/2026
ms.author: jswymer
ai-usage: ai-assisted
---
# Set up Microsoft 365 and Business Central demo environments with MDX

Use [Microsoft demo experience (MDX)](https://aka.ms/CDX), formerly Customer Digital Experiences (CDX), to create repeatable demos that showcase Business Central with Microsoft apps and services in an independent Azure organization (tenant) that you fully control. MDX lets you create demo tenants and environments that you can use for demos and training without introducing changes to an existing production environment. Learn more at [Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products).

> [!IMPORTANT]
> Environments that are created through MDX are intended for demo and training purposes. If a prospect uses this environment to run their business, they might lose company data when the demo environment or MDX tenant expires. If a prospect wants to use [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to help run their business, have them sign up for a trial using their own email account. Learn more at [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview) in the business functionality content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

## Prerequisites

- **Enrolled as a partner**: You must be enrolled in Microsoft Partner Center.

   If you aren't enrolled yet, learn more in [Create a Partner Center account and enroll in MPN](/partner-center/enroll/mpn-create-a-partner-center-account).

## Create a demo environment

[!INCLUDE [admin_m365demo](../developer/includes/admin_m365demo.md)]

### Trial and demo duration

If you sign up for a trial by using an MDX tenant at the [Business Central product page](https://www.microsoft.com/dynamics-365/products/business-central), you can keep that environment for up to 90 days.

However, if you switch to the actual trial experience in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], that experience expires after 30 days. At that point, you can extend the trial. Learn more at [extend the trial](/dynamics365/business-central/admin-extend-trial).

### Manage trial duration and tenant limits

To get an overview of your tenants, select **My Dashboard** > **Overview**. View details like the content package, expiration date, and admin credentials, or delete a tenant.

Your MDX account has access to a limited number of 90-day and one-year tenants at any given time. Select **Roles & Limits** to view your current status. MDX also limits how many tenants you can create per day and month. Learn more at [CDX FAQ](https://cdx.transform.microsoft.com/help/faq).

You can keep using the demonstration company until the tenant expires if you use it a couple of times per week.

However, if you start the trial experience or switch to the empty *My Company*, that experience expires after 30 days. If it expires, you can extend the trial, create a new environment, or return to the CRONUS demonstration company. Learn more at [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview) in the business functionality content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

## Customize your demo environment

### Customize the UI

Enable the *Premium* user experience in the new company's **Company Information** page, add data for evaluation scenarios, and present the environment to the prospect.

### Administrator capabilities

As the demo tenant admin, you can configure the environment extensively:

[!INCLUDE [admin-m365admin](../developer/includes/admin-m365admin.md)]

### Add demo data and enhancements

Enhance your demo with sample data and additional capabilities:

- **Contoso Coffee Demo Data**: Add the **Contoso Coffee Demo Data** app to showcase advanced supply chain and manufacturing functionality. Learn more at [Introduction to Contoso Coffee Demo Data](/dynamics365/business-central/contoso-coffee/contoso-coffee-intro).

- **Connectivity apps**: Demonstrate integrations and connected scenarios. Learn more at [Add connectivity apps to your demo](demo-environment-extend-enhancements.md#add-connectivity-apps).

- **Dynamics 365 Sales Professional**: Integrate and demo the Sales app alongside Business Central. Learn more at [Add Dynamics 365 Sales Professional and Field Service](demo-environment-extend-enhancements.md#add-dynamics-365-sales-professional-and-field-service).

## Optimize your demo experience

### Use Microsoft Edge profiles

Use [Microsoft Edge](https://www.microsoft.com/edge) profiles to switch between demo accounts without private browsing. Microsoft Edge can save passwords and sites for your partner account and MDX tenant admin account. [!INCLUDE [prod_short](../developer/includes/prod_short.md)] performs well in Microsoft Edge. You can also switch the page layout to *Focused* to minimize distractions during demos. Learn more at [Microsoft Edge documentation](/deployedge/).

> [!TIP]
> For better performance:
> - Connect to a low-latency network for faster response time during demos.
> - Plug in your laptop before demos.
> 
> Performance can vary by device and browser, but plugging in your laptop generally helps. 

### Performance evaluation for presales

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

## Related information

[Demo environment options overview](demo-environment.md)  
[Use trial-based approaches and sandboxes](demo-environment-trial.md)  
[Add enhancements: Contoso Coffee, Sales, and more](demo-environment-extend-enhancements.md)  
[Preparing Test Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](test-environment.md)  
[Trials and Subscriptions](trials-subscriptions.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
