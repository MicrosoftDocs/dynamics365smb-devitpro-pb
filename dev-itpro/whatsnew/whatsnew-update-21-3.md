---
title: "Update 21.3 for Microsoft Dynamics 365 Business Central 2022 Release Wave 2"
description: Get an overview of new and changed capabilities in the 21.3 update of Business Central online, which is part of 2022 release wave 2.
ms.author: jswymer
ms.custom: na
ms.date: 01/03/2022
ms.reviewer: jswymer
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 21.3 for Microsoft Dynamics 365 Business Central online 2022 release wave 2
Would you like to know what has changed in update 21.2? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/help/5022714) and the downloads [here](https://www.microsoft.com/en-us/download/details.aspx?id=104873).


## Feature changes

- [Reuse launch configurations across workspace projects](/dynamics365/business-central/dev-itpro/developer/devenv-json-files#global-and-workspace-launch-configuration)
- [Media/image support for Business Central connectors](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/add-mediaimage-support-business-central-connectors)
- [Power Apps and Power Automate support for document attachments](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/power-apps-power-automate-support-document-attachments)
- [Reverse payment reconciliation journal entries](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/reverse-payment-reconciliation-journal-entries) 
- Access attachments on additional list pages (link is coming)
- Scroll through more records in lists (link is coming - see description under "good to know")


## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
| Switzerland | Enabling QR-Bill file that does not report Amount and other information | Swiss companies now can use QR bills with and without invoice amounts. If user chooses option with amount, system will automatically populate the Amount field, but if user chooses option without amount, the Amount field will be editable and user can populate it manually.|
| France, United Kingdom | Intrastat localization extensions  | New Intrastat feature is now available in France and United Kingdom.|
| W1 | Add support of Service Documents to Service Declaration | Service Declaration feature has been extended, so now except purchase and sales documents, system also uses Service document for reporting export of services.|
| W1 | Adding Supplemental Unit fields to Tariff Numbers as default  | If user defines Supplemental Unit of Measure for specific Tariff Number (for usage in Intrastat), it will be used in all Items as default Supplemental Unit of Measure.|
| W1 | Changing VAT date with more entries for one document | When users have more VAT Entries for one document with different VAT percentages, and they want to change VAT date, they need to do only on one entry and the system will update to the other entries for the same document. |
| W1 | Disabling VAT date functionality fully or partially | Users now can choose to use full VAT date functionality or just partially without changing VAT dates in posted entries and documents. And eventually, users can choose not to use VAT date functionality, hiding and making noneditable VAT fields from UI. |

## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2022 release wave 2 (release from October 2022 through  March 2022), find the link to the release plan [here](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/planned-features).

## Upgrade to 21.3

Please note that new customers will automatically get the latest builds of Business Central (21.2). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**Scroll through more records in lists**  
The Business Central user experience has been updated with technical optimizations that reduce the memory footprint of loaded records. As a result, users can continue scrolling to load significantly more records in any list.

**Reverse payment reconciliation journal entries**  
With 21.3. you can reverse payment reconciliation journals that were used to also post a bank reconciliation. With 21.4, we will enable reversal of regular payment reconciliation journals.

**Shopify connector becomes extensible: Stock calculation**  
Shopify Connector has been non-extensible, but we're changing that. We're offering a few points of extensibility. We'll keep the number of points to a minimum so that we can follow the rapid development on the Shopify side without introducing breaking changes.

We are opening for extensibility for specific scenarios, based on feedback from our partners and customers starting with **Stock calculation**.

For more details, please follow this [repository](https://github.com/microsoft/ALAppExtensions/tree/main/Apps/W1/Shopify) on GitHub. Note that even though extensibility is limited, you can submit improvements directly.

**Power Apps and Power Automate support for media/image and document attachments**  
Business Central connector (online only) for Power Platform and Azure Logic Apps has been enhanced with new capabilities and actions to allow makers to access rich data from Business Central. Note that the updated connector is rolling out to all Azure regions now and is backward compatible with latest Business Central online versions (including version 21.3 discussed here), but in order to take advantage of these new capabilities in Power Automate flows the user needs to create a new flow using the new action discussed [here](https://learn.microsoft.com/en-us/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/add-mediaimage-support-business-central-connectors).

**You can still watch the Business Central Launch Event recordings**  
We have 15+ What's New sessions and recorded Q&As available throughout January 2023. If you didn't watch them yet, you can still go to [aka.ms/BCLE](https://aka.ms/BCLE) to sign up. In November, two new sessions have been published for the following topics: [Embed Business Central in Teams tabs](https://app.hopin.com/events/business-central-launch-event/expo/815575) and [Access Business Central with your Microsoft 365 license](https://app.hopin.com/events/business-central-launch-event/expo/815576).

**AL-Go for GitHub version 2.2**  
Version 2.2 of AL-Go for GitHub has been released with improved multi-project support and a few fixes in the Pull Request workflow. See what has been added and changed in the v2.2 column in [aka.ms/AlGoRoadmap].

**Important: Take action before March 1 to retain your delegated admin access to your customers**  
Earlier this year, Microsoft Partner Center introduced Granular Delegated Administration Privileges (GDAP) as replacement for Delegated Administration Privileges (DAP) to enable partner-customer relationships that are time-bound and have more granular access rights. The timeline to migrate your existing DAP relationships to GDAP has been moved to March 1, 2023. If you do not take action by this date you will lose access to your customers' Business Central environments. Please refer to the Partner Center announcement [here](/partner-center/announcements/2022-october#17).

**Business Central newsletter for partners**  
Yay! We're doing quarterly newsletters for Business Central partners. Each newsletter contains a summary of relevant information related to Business Central. You can find it on [aka.ms/BCNews](https://aka.ms/BCNews).

**Upcoming Business Central Office Hours Calls**  
In January and February, we will be hosting the following calls, which you can already register for today:

- **January 17:**  AL-Go for GitHub
- **January 24:** Onboarding your customers to Business Central
- **February 7:** Power Platform integrations

Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours). Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings). 

**Discover resources on aka.ms/BCAll**  
Are you looking for relevant resources? Find it all in this article [aka.ms/BCAll](https://aka.ms/BCAll) and remember to bookmark it!