---
title: "Update 21.2 for Microsoft Dynamics 365 Business Central 2022 release Wave 2"
description: Get an overview of new and changed capabilities in the 21.2 update of Business Central online, which is part of 2022 release wave 2.
ms.author: jswymer
ms.custom: na
ms.date: 12/29/2023
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 21.2 for Microsoft Dynamics 365 Business Central online 2022 release wave 2
Would you like to know what has changed in update 21.2? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/en-us/topic/update-21-2-for-microsoft-dynamics-365-business-central-on-premises-2022-release-wave-2-application-build-21-2-49990-platform-build-21-0-49984-5a1acf84-533f-4738-9f79-a3444f54004a) and the downloads [here](https://www.microsoft.com/download/details.aspx?id=104805).



## Feature changes

- [Use default attachments in email sent from Business Central](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/use-default-attachments-email-sent-business-central)
- [Easily comply with email sending limits through email throttling](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/easily-comply-email-sending-limits-through-email-throttling)
- [Move custom fields to extensions during cloud migration](../administration/migration-table-mapping.md) 
- [Integrated session using Service-to-Service (S2S) authentication can now schedule tasks](/dynamics365/business-central/dev-itpro/administration/automation-apis-using-s2s-authentication)


## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
| United States | IRS 1099 Form Update for 2022 | With this release, Form 1099 in the United States has been updated to fulfill 2022 year requirements for reporting to IRS.|
| Mexico | Extending CFDI with foreign trade | With new release Business Central includes the information to fill the foreign trade details in the file, which is mandatory by the SAT if a customer performs an export to a foreign country.|
| France | Service Declaration (DES) | In some France, authorities require reporting for exporting services to the other EU countries. This feature enables collecting EU service’s intertrade and its reporting to the authorities. This feature is named as Service Declaration or DES, and with this release it's enabled in France. Service Declaration is created as an extension.|
| The Netherlands | Added configuration for Electronic Tax Declaration | Setup is extended so now users have the endpoints set up under the new “Endpoints” tab instead of hardcoded endpoints. This change also includes an upgrade Codeunit that fills the value in this setup for the existing tenants.|

## Release plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2022 release wave 2 (release from October 2022 through  March 2022), find the link to the release plan [here](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/planned-features).

## Upgrade to 21.2

Note that new customers will automatically get the latest builds of Business Central (21.2). If you're an existing partner/customer, you'll receive an email notification as soon as your environment has been upgraded.

## Good to know

**Use Service Support Administrator role to manage support requests on behalf of your customers**  
To better support this principle and align with the expectations of our customers, especially the Business Central customers working with other Dynamics 365 products, together with the Power Platform Admin Center team we introduce support for the [Service Support Administrator role](/azure/active-directory/roles/permissions-reference#service-support-administrator) which gives access to manage support requests on the customer's behalf. If you need to log support tickets on behalf of your customers using Power Platform Admin Center, make sure you request this role in your GDAP relationship. 


**You can still watch the Business Central launch event recordings**  
We have 15+ What's New sessions and recorded Q&As available throughout January 2023. If you didn't watch them yet, you can still go to [aka.ms/BCLE](https://aka.ms/BCLE) to sign up. In November, two new sessions have been published for the following articles: [Embed Business Central in Teams tabs](https://app.hopin.com/events/business-central-launch-event/expo/815575) and [Access Business Central with your Microsoft 365 license](https://app.hopin.com/events/business-central-launch-event/expo/815576).

**AL-Go for GitHub version 2.2**  
Version 2.2 of AL-Go for GitHub has been released with improved multi-project support and a few fixes in the Pull Request workflow. See what has been added and changed in the v2.2 column in [aka.ms/AlGoRoadmap].


**Important: Take action before March 1 to retain your delegated admin access to your customers**  
Earlier this year, Microsoft Partner Center introduced Granular Delegated Administration Privileges (GDAP) as replacement for Delegated Administration Privileges (DAP) to enable partner-customer relationships that are time-bound and have more granular access rights. The timeline to migrate your existing DAP relationships to GDAP has been moved to March 1, 2023. If you don't take action by this date you'll lose access to your customers' Business Central environments. Refer to the Partner Center announcement [here](/partner-center/announcements/2022-october#17).

**Business Central Performance toolkit VSCode extension**  
The Performance Toolkit extension is built for Independent Solution Vendors (ISVs) and Value Added Resellers (VARs) who develop vertical solutions and customize Business Central for their customers. Because things change between released versions, it's important that ISVs and VARs can test the performance of their solutions to ensure that new versions don't introduce performance regressions when the volume of users grows. To help, the Performance Toolkit lets developers simulate workloads in realistic scenarios to compare performance between builds of their solutions. The Performance Toolkit extension helps answer questions such as, "Does my solution for Business Central support X number of users doing this, that, and the other thing at the same time?" Learn more [here](/dynamics365/business-central/dev-itpro/developer/devenv-performance-toolkit).



**Business Central newsletter for partners**  
Yay! We're doing quarterly newsletters for Business Central partners. Each newsletter contains a summary of relevant information related to Business Central. You can find it on [aka.ms/BCNews](https://aka.ms/BCNews).

**Upcoming Business Central office hours calls**  
In December and January, we are hosting the following calls, which you can already register for today:

- **December 13:** Troubleshooting performance problems
- **January 17:**  Exporting your Dynamics 365 Business Central data to the Azure Data Lake Storage
- **January 24:** Onboarding your customers to Business Central

Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours). Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings). 

**Discover resources on aka.ms/BCAll**  
Are you looking for relevant resources? Find it all in this article [aka.ms/BCAll](https://aka.ms/BCAll) and remember to bookmark it!