---
title: "Update 20.1 for Microsoft Dynamics 365 Business Central 2022 Release Wave 1"
description: Get an overview of new and changed capabilities in the 20.1 update of Business Central online, which is part of 2022 release wave 1.
ms.author: a-emniel
ms.custom: na
ms.date: 05/05/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 20.1 for Microsoft Dynamics 365 Business Central online 2022 release wave 1

Would you like to know what has changed in update 20.1? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/en-us/topic/update-20-1-for-microsoft-dynamics-365-business-central-on-premises-2022-release-wave-1-application-build-20-1-39901-platform-build-20-0-39849-60a0fe56-57b5-41b1-90ee-29694d59ad3b).

## Feature changes  

- [Add action on card and list pages to trigger a chosen flow from Business Central web client](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/action-group-run-chosen-instant-power-automate)
- [Power Platform and Azure Logic Apps connector for Business Central online no longer in preview](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/improvements-power-automate-power-apps-connector)
- [Fraud prevention headers for clients in the UK](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/fraud-prevention-headers-clients-uk)
- [Country/regional expansion in 20 new countries](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/planned-features#country-and-regional)

## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
|Mexico | CFDI Payment version 2.0 | Payment receiving will be updated related with the version 2.0. New fields are included to identify whether the payments for the operations covered by the voucher are subject to tax. A new section is included with a summary of the total amounts of the payments made expressed in national currency, as well as the taxes that are transferred. |
| Spain | Posting Date or Document Date to be used as Operation Date | The user is now able to choose between Posting Date or Document Date, to be used as Operation Date in the XML sent via SII to the Tax Authorities. |
| Denmark; W1 | Country code in the VAT Registration No. usage for Intrastat reporting | In Denmark companies need to use different VAT Registration No. models in Intrastat and Skat.dk (one with Country Code and another without it). To avoid issues for Stat.dk clients will use only value from VAT Registration No., but for intrastat clients will have additional configuration with the following options: VAT Reg. No., Country Code + VAT No., VAT No. without Country Code. This feature is available on W1. |
| France | Intrastat FR new requirements for DEB 2022 | For France, Intrastat management implies to separate the declaration data for the statistical reporting and for the fiscal reporting (recapitulative statement of VAT), once for obligation level 1 and once for obligation level 4. |
| Norway | Add support of the free text for each VAT return line | This is an improvement of the existing feature. Previously, Business Central only supported export of a list of the predefined texts in the field "VAT Note Code". Now the user can export the file with added free text for each VAT return line. |

## Release Plan  

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2022 release wave 1 (release from April 2022 through  September 2022), find the link to the release plan [here](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/planned-features).

## Upgrade to 20.1

Please note that new customers will automatically get the latest builds of Business Central (20.1). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**Later in May: General availability of the Shopify Connector**  
Microsoft is teaming up with Shopify to help our Dynamics 365 Business Central customers create a better online shopping experience. With update 20.1 it will be possible for trial users to try out the Shopify connector, which will be available for Business Central customers later in May 2022, releasing on AppSource and Shopify App Store. Read more [here](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/shopify-connector).

**Changes to the Per-Tenant Extensions Disclaimer**  
The disclaimer for per-tenant extensions has changed. Find the new Business Central PTE disclaimer [here](https://go.microsoft.com/fwlink/?linkid=2193002&clcid=0x409).

**Business Central newsletter for partners**  
Starting May 11 2022, we're doing bi-monthly newsletter for Business Central partners. The newsletter will be a summary of relevant information related to Business Central and you'll be able to find it on [aka.ms/BCNews](https://aka.ms/BCNews).

**Updated documentation and samples related to Power Automate**  
Documentation related to Power Automate integration and the new “Automate” feature has been updated in May 2022 and is available at [aka.ms/BCAutomate](https://aka.ms/bcautomate). There are also some sample flows published in our github repository – find it under [aka.ms/BCTech](https://aka.ms/bctech). We also recommend watching the What’s new in Business Central and Power Platform session at he Business Central Virtual Launch Event. Find it on [aka.ms/BCLE](https://aka.ms/bcle).

**Discover the features for 2022 release wave 1**  
Discover what's new and planned for Dynamics 365 Business Central 2022 release wave 1. You can find the list of features here: [aka.ms/BCReleasePlan](https://aka.ms/BCReleasePlan).

**Reminder: Avoid an unexpected data upgrade during cloud migration**  
When you run cloud migration from a previous version of Business Central, one of the process steps is to run the data upgrade logic to align the migrated data to the format of the current version. We strongly recommend that you perform this step one time after you have completed the migration of all your customer’s data to the online environment. If a planned Business Central major or minor update is applied to this environment, the update will automatically include the upgrade of the data that was migrated by the cloud migration. These planned updates also turn off cloud migration for the environment. To avoid this situation, and to allow you to complete the migration and data upgrade for your environment, we recommend that you postpone any scheduled major and minor updates for the target environment until you have completed cloud migration. You can postpone updates in the Business Central admin center. For more information, see [Managing Updates](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-update-management).  

**Upcoming Business Central Office Hours Calls**  
Join us for the upcoming office hours call on “Extending Business Central’s Email Capabilities” on May 24. Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours). Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings).  

**A new update to the Business Central mobile app for iOS and Android**  
There is a new update for the Business Central mobile app (version 3.7) for [iOS](https://go.microsoft.com/fwlink/?LinkId=734847) and [Android](https://go.microsoft.com/fwlink/?LinkId=734849) available in respective app stores. This app – as before – handles Business Central online and on-premises and the update is required for on-premises customers running Business Central 2022 release wave 1.

**The legacy Windows desktop app based on UWP technology only supports legacy on-premises Business Central**  
Just an update that the Business Central desktop legacy UWP app version 3.6.3101 has been released to the Microsoft Store - and marked as a mandatory update for Windows users.

- From now on users of Windows devices will only be able to use that legacy UWP app to connect to on-premises Business Central installations v19 or below. For v20 and later on-premises - see next point.  
- On-premises users of Business Central v20 or later will be able to use the PWA app installed from the browser directly (see [aka.ms/BCPWA](https://aka.ms/bcpwa) for more).
- All online Business Central users regardless of the version can use the new PWA app installed from the browser OR from the Microsoft store (again, see [aka.ms/BCPWA](https://aka.ms/bcpwa) for more).  

It is recommended to switch to the PWA technology as this is where customers can benefit fully from all web client features.  
