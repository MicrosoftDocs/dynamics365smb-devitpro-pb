---
title: "Update 20.2 for Microsoft Dynamics 365 Business Central 2022 Release Wave 1"
description: Get an overview of new and changed capabilities in the 20.2 update of Business Central online, which is part of 2022 release wave 1.
ms.author: a-emniel
ms.custom: na
ms.date: 06/02/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 20.2 for Microsoft Dynamics 365 Business Central online 2022 release wave 1

Would you like to know what has changed in update 20.2? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/en-us/topic/update-20-1-for-microsoft-dynamics-365-business-central-on-premises-2022-release-wave-1-application-build-20-1-39901-platform-build-20-0-39849-60a0fe56-57b5-41b1-90ee-29694d59ad3b).

## Feature changes  

- [Release and reopen multiple documents](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/release-reopen-multiple-documents)
- [Receive notifications in the Microsoft 365 Message center](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/receive-notifications-365-message-center)


## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
|W1 | New field 'Intrastat Partner Type' on Customer and Vendor cards | The Intrastat Partner Type field has replaced the Parter Type field in Intrastat reporting. Partner Type is used in SEPA to define the SEPA Direct Debit Scheme (Core or B2B). Intrastat Partner Type is used for Intrastat reporting only. This way, users can specify different values for the two fields if they need to. More details about setup [here](/dynamics365/business-central/finance-how-setup-report-intrastat). |
| W1 | Improvement in creating Intrastat file for item with supplementary UOM and without weight | When the line in Intrastat has supplementary unit of measure, weight for the item is not necessary. Now users can create the file even if they don't have weight for the item on Intrastat line if this item uses supplementary unit of measure. |

## Release Plan  

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2022 release wave 1 (release from April 2022 through  September 2022), find the link to the release plan [here](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/planned-features).

## Upgrade to 20.2

Please note that new customers will automatically get the latest builds of Business Central (20.2). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**General availability of the Shopify Connector**  
Last October, we announced a new partnership with Shopify to help our customers create a better shopping experience. The partnership was designed to better connect the easy-to-use commerce and merchant experience of Shopify with the comprehensive business management capabilities of Microsoft Dynamics 365 Business Central. The Shopify connector is now available for the online version of Business Central at no extra cost. Existing customers that have been upgraded to 20.1 automatically get the Shopify extension installed. If they do not need the app, it can be uninstalled by following [this guidance](/dynamics365/business-central/ui-extensions-install-uninstall#uninstall-an-extension). Read the [blog](https://cloudblogs.microsoft.com/dynamics365/bdm/2022/05/26/dynamics-365-business-central-now-includes-a-shopify-connector/), the [FAQ](/dynamics365/business-central/shopify/shopify-faq), watch the [on-demand session](https://aka.ms/BCShopifySession), learn how to [get started](/dynamics365/business-central/shopify/get-started) and view the listing on [Shopify App Store](https://apps.shopify.com/dynamics-365-business-central?surface_detail=global-erp-partners&surface_inter_position=1&surface_intra_position=1&surface_type=collection).

**A single tile to go to Business Central**  
We're simplifying access to Business Central online by transitioning to a single app tile starting in June 2022. Learn more [here](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/single-tile-go-business-central).

**Action required by July 2022 for Excel Add-in**  
Starting in July 2022, Microsoft will roll out an update to the Excel add-in that further secures the connection to Business Central. The update requires that you modify your organization's Azure Active Directory (Azure AD) configuration so that users can continue using the add-in. This impacts all Business Central on premises deployments that use the Excel add-in. Learn more [here](/dynamics365/business-central/dev-itpro/administration/update-excel-addin-configuration).

**Changes to the Per-Tenant Extensions Disclaimer**  
The disclaimer for per-tenant extensions has changed. Find the new Business Central PTE disclaimer [here](https://go.microsoft.com/fwlink/?linkid=2193002&clcid=0x409).

**Business Central newsletter for partners**  
Starting June 2022, we're doing bi-monthly newsletter for Business Central partners. The newsletter will be a summary of relevant information related to Business Central and you'll be able to find it on [aka.ms/BCNews](https://aka.ms/BCNews).

**Upcoming Business Central Office Hours Calls**  
Join us for the upcoming office hours call on “Introducing Shopify for Business Central” on June 14 and “Onboarding your customers to Business Central” on June 21 (Note: we will have two time slots, an early one and a later one for the two calls). Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours). Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings).  

**Business Central Launch Event**  
If you haven't watched them yet, remember that you still have access to a keynote and 20+ sessions about what's new in Business Central 2022 release wave 1. You'll hear from product leaders as they share with you the latest innovations and capabilities to help you confidently move to the cloud and unlock the insights needed to adapt faster, work smarter, and perform better. Whether you are a business professional, developer, or consultant at a Business Central partner, get ready to up level your game and drive business transformation. Register on [aka.ms/BCLE](https://aka.ms/BCLE)
