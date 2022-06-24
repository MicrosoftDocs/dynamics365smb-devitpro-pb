---
title: "Update 20.3 for Microsoft Dynamics 365 Business Central 2022 Release Wave 1"
description: Get an overview of new and changed capabilities in the 20.3 update of Business Central online, which is part of 2022 release wave 1.
ms.author: edupont
ms.custom: na
ms.date: 06/24/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 20.3 for Microsoft Dynamics 365 Business Central online 2022 release wave 1

Would you like to know what has changed in update 20.3? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](INSERT LINK).

## Feature changes  

- 

## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
|W1 | New field, **Intrastat Partner Type**, on customer and vendor cards | The Intrastat Partner Type field has replaced the Parter Type field in Intrastat reporting. Partner Type is used in SEPA to define the SEPA Direct Debit Scheme (Core or B2B). Intrastat Partner Type is used for Intrastat reporting only. This way, users can specify different values for the two fields if they need to. More details about setup [here](/dynamics365/business-central/finance-how-setup-report-intrastat). |
| W1 | Improvement in creating Intrastat file for item with supplementary UOM and without weight | When the line in Intrastat has supplementary unit of measure, weight for the item is not necessary. Now users can create the file even if they don't have weight for the item on Intrastat line if this item uses supplementary unit of measure. |

## Release Plan  

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2022 release wave 1 (release from April 2022 through  September 2022), find the link to the release plan [here](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/planned-features).

## Upgrade to 20.3

Please note that new customers will automatically get the latest builds of Business Central (20.3). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**General availability of the Shopify Connector**  
Last October, we announced a new partnership with Shopify to help our customers create a better shopping experience. The partnership was designed to better connect the easy-to-use commerce and merchant experience of Shopify with the comprehensive business management capabilities of Microsoft Dynamics 365 Business Central. The Shopify connector is now available for the online version of Business Central at no extra cost. Existing customers that have been upgraded to 20.1 automatically get the Shopify extension installed. If they do not need the app, it can be uninstalled by following [this guidance](/dynamics365/business-central/ui-extensions-install-uninstall#uninstall-an-extension). Read the [blog](https://cloudblogs.microsoft.com/dynamics365/bdm/2022/05/26/dynamics-365-business-central-now-includes-a-shopify-connector/), the [FAQ](/dynamics365/business-central/shopify/shopify-faq), watch the [on-demand session](https://aka.ms/BCShopifySession), learn how to [get started](/dynamics365/business-central/shopify/get-started) and view the listing on [Shopify App Store](https://apps.shopify.com/dynamics-365-business-central?surface_detail=global-erp-partners&surface_inter_position=1&surface_intra_position=1&surface_type=collection).

**Action required by July 2022 for Excel Add-in**  
Starting in July 2022, Microsoft will roll out an update to the Excel add-in that further secures the connection to Business Central. The update requires that you modify your organization's Azure Active Directory (Azure AD) configuration so that users can continue using the add-in. This impacts all Business Central on premises deployments that use the Excel add-in. Learn more [here](/dynamics365/business-central/dev-itpro/administration/update-excel-addin-configuration).

**Business Central newsletter for partners**  
Starting June 2022, we're doing quarterly newsletters for Business Central partners. Each newsletter will be a summary of relevant information related to Business Central and you'll be able to find it on [aka.ms/BCNews](https://aka.ms/BCNews).

**Business Central all**  
XXXX

**Upcoming Business Central Office Hours Calls**  
The Business Central office hours calls will be OOF in July. For August and September, we will be hosting the following calls, which you can register for today:

- **August, 23:** Excel Layout and reporting
- **August, 30:** You know it, so share it in Microsoft Docs for Dynamics 365 Business Central 
- **September 6:** Power Automate and Power Platform integrations

Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours). Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings).  

**Business Central Launch Event**  
If you haven't watched them yet, remember that you still have access to a keynote and 20+ sessions about what's new in Business Central 2022 release wave 1. You'll hear from product leaders as they share with you the latest innovations and capabilities to help you confidently move to the cloud and unlock the insights needed to adapt faster, work smarter, and perform better. Whether you are a business professional, developer, or consultant at a Business Central partner, get ready to up level your game and drive business transformation. Register on [aka.ms/BCLE](https://aka.ms/BCLE)