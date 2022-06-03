---
title: "Update 19.4 for Microsoft Dynamics 365 Business Central 2021 Release Wave 2"
description: Get an overview of new and changed capabilities in the 19.4 update of Business Central online, which is part of 2021 release wave 2.
ms.custom: na
ms.date: 02/16/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 19.4 for Microsoft Dynamics 365 Business Central online 2021 release wave 2

Would you like to know what has changed in update 19.4? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes
Find an overview of hotfixes in this [article](https://support.microsoft.com/en-us/topic/update-19-4-for-microsoft-dynamics-365-business-central-on-premises-2021-release-wave-2-application-build-19-4-35482-platform-build-19-0-35473-bb3f4fa3-7228-420b-a7c5-77fbb83df49b).

## Feature changes  
- [Allow Delegated Admin to setup and run Cloud Migration with approval from a licensed user](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/delegated-admin-create-job-queue-entries-request-approval-licensed-user)

## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
|Mexico | CFDI Cancellation Schema changes|As of 2022, it will be necessary to indicate the reason for the cancellation of the vouchers. We have added the list of reasons that can be selected for the posted document before cancellation | 
|Norway | February update for the Electronic VAT return submission feature | Various changes made for the existing Norwegian feature have been made: *Fix issue with opening service connections when Electronic VAT Setup does not exist*, *Fix issue with validating the sign of VAT Statement Report Line when VAT Code has "SAF-T VAT Code" specified*, *Add missed VAT code “1T”*, and *Add possibility to copy reporting codes to SAF-T codes* |
|Germany | Improvement of the visibility of the Elster xml file’s content |We have added a possibility to see the amounts from the resulted Elster xml file |
|Italy | Intrastat changes |Two new fields have been added to the Intrastat export: Nature of transaction and Country of origin. Section 5 “call-of-stock” is not supported in Business Central, however in the export file an extra line has been added to Section 5 with all fields blank, for the reason of keeping the fixed length structure of the file format.|


## Release Plan  
If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2021 release wave 1 (release from April 2021 through September 2021), find the link to the release plan [here](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/planned-features).

## Upgrade to 19.4

Please note that new customers will automatically get the latest builds of Business Central (19.4). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**Discover the features for 2022 release wave 1**  
Discover what's new and planned for Dynamics 365 Business Central 2022 release wave 1. You can find the list of features here: [aka.ms/BCReleasePlan](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/planned-features).

**o	Use secondary read-only database for Power BI reporting**  
Please note that with newest Power BI Desktop update (expected in late February 2022) all new Business Central Power BI reports will be now sourced from a secondary, read-only database. This leaves the main database ready for transactions, which enhances performance of the system. This feature is part of the Power BI connector for Business Central. After updating Power BI Desktop this feature it's enabled by default for all new reports but turned off for existing reports. Read more [here](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/use-secondary-read-only-database-power-bi-reporting).

**Avoid an unexpected data upgrade during cloud migration**  
When you run cloud migration from a previous version of Business Central, one of the process steps is to run the data upgrade logic to align the migrated data to the format of the current version. We strongly recommend that you perform this step one time after you have completed the migration of all your customer’s data to the online environment. If a planned Business Central major or minor update is applied to this environment, the update will automatically include the upgrade of the data that was migrated by the cloud migration. These planned updates also turn off cloud migration for the environment. To avoid this situation, and to allow you to complete the migration and data upgrade for your environment, we recommend that you postpone any scheduled major and minor updates for the target environment until you have completed cloud migration. You can postpone updates in the Business Central admin center. For more information, see [Managing Updates](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-update-management).  

**Upcoming Business Central Office Hours Calls**  
Make sure to join the office hours call 'How to use OAuth, when calling Business Central APIs and web services' on February 22. The call is at 5.00pm - 6.00pm CET / 08.00am -09.00am PST. Register and stay tuned for upcoming calls: https://aka.ms/BCOfficeHours. Watch on-demand recordings: https://aka.ms/BCOfficeHoursRecordings. 

**Action needed: Client secret-based service to service authentication deprecation for Microsoft hosted tenants integrating to Dataverse**  
To ensure no disruptions in integration between Business Central and Dataverse you must upgrade your Business Central connection to Dataverse to certificate-based authentication.  
Although change will happen in March 2022, we strongly recommend you perform steps outlined in [Upgrade Connections from Business Central Online to Use Certificate-Based Authentication](/dynamics365/business-central/admin-how-to-set-up-a-dynamics-crm-connection#upgrade-connections-from-business-central-online-to-use-certificate-based-authentication) as soon as possible.

**Join Directions NA on April 3-6, 2022**  
Directions North America is a Microsoft Dynamics 365 event driven by Partners – for Partners. Attendees will build new business contacts, learn about best practices, and discover valuable tools for execution and success. Attendees can also use the many networking opportunities at the conference to grow and enhance relationships with other partners, ISVs, service providers, and Microsoft. Learn more and register [here](https://www.eventsquid.com/event.cfm?event_id=14536).
