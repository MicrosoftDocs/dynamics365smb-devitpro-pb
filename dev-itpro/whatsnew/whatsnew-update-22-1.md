---
title: "Update 22.1 for Microsoft Dynamics 365 Business Central 2023 Release Wave 1"
description: Get an overview of new and changed capabilities in the 22.1 update of Business Central online, which is part of 2023 release wave 1.
ms.author: a-enielsson
ms.custom: na
ms.date: 05/02/2023
ms.reviewer: jswymer
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 22.1 for Microsoft Dynamics 365 Business Central online 2023 release wave 1

Would you like to know what has changed in update 22.1? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](Insert link) and the downloads [here](https://aka.ms/BCDownload).

## Feature changes  
- [Turn off event-based sync for specific integration table mappings](/dynamics365-business-central/turn-off-event-based-synch-specific-integration-table-mappings)
- [Synchronize returns, refunds from Shopify](/dynamics365-business-central/synchronize-returns-refunds-shopify)
- [Save time with automatic account codes](/dynamics365-business-central/automatic-account-codes)
- [Swedish localization delivered as extension](/dynamics365-business-central/swedish-localization-app--delocalization) 
- [Attach AL debugger to active session or next session](/dynamics365-business-central/attach-al-debugger-active-session-or-next-session-specific-user)  
- [Non-deductible, partly deductible VAT expands functionality](/dynamics365-business-central/non-deductible-partly-deductible-vat-expands-functionality)
- Partners can control welcome banner texts
- App telemetry to support the trials and onboarding tashboard to better understand and further improve evaluation and onboarding scenarios 

## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
| France | New mandatory mentions on sales documents | New fields are required on the Sales Invoices in France following the decree of the French Tax Authorities: Client's SIREN number, the delivery address of the goods sold if it is different from the customer's address, information if the invoice includes goods, services, or both, and option to pay tax based on debits. |
| W1 | Added field Registration No. to Contacts | We already had added the Registration No. field to the customer and vendor cards, but this field has been added to the Contact card as well. |
| Norway | An electronic invoice in EHF 3.0 format validation improvement | Previously, an electronic invoice in EHF 3.0 format couldn't be validated successfully when the document contains a negative line for invoice rounding, and with this release it is improved. |
| Spain | Added field 'Closed' to the table 'No Taxable Entry' | Added the field 'Closed' to the table 'No Taxable Entry' to avoid pending amounts in VAT Declarations, so now users can filter 'No Taxable Entries' by Open or Closed status. |

## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2023 release wave 1 (release from April 2023 through September 2023), find the link to the release plan [here](aka.ms/BCReleasePlan).

## Upgrade to 22.1

Please note that new customers will automatically get the latest builds of Business Central (22.1). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**Take action to retain delegated admin access to your customers’ Business Central environments**  
Last year Microsoft introduced [Granular Delegated Admin Privileges (GDAP)](/partner-center/gdap-introduction) to improve upon and replace Delegated Admin Privileges (DAP). GDAP addresses various security concerns by allowing customer administrators to provide partners a proper level of time-bound access to their tenants.

The Partner Center team has now [announced](/partner-center/announcements/2023-march#9) the timeline by which you need to migrate your customer relationships to GDAP. Please make sure to read this new Partner Center announcement for more details about milestone dates and the transition plan and about the tools Microsoft provides to facilitate this process.

To manage Dynamics 365 Business Central customers via GDAP we recommend requesting the Dynamics 365 Administrator role as the least-privileged role that grants access to Dynamics 365 Business Central environments. Read more about which other roles are supported for delegated administration of Business Central [here](/dynamics365/business-central/dev-itpro/administration/delegated-admin).


**Did you read this quarter's Business Central newsletter?**  
On April 11, we published this quarter's newsletter for Business Central partners. The newsletter contains a summary of relevant information related to Business Central. You can find it on  [aka.ms/BCNews](aka.ms/BCNews). 

**Join us for updates on LinkedIn!**  
Follow the new company page for Microsoft Dynamics 365 Business Central on LinkedIn. We’ll share updates, announcements, and other “good to know” stuff. Join us [here](https://www.linkedin.com/company/microsoft-dynamics-365-business-central/). 

**Upcoming Business Central Office Hours Calls**  
In March, we will be hosting the following call, which you can already register for today:

- **May 16:** Business Central Administration Overview
- **May 30:** Copilot and AI
- **June 6:** Onboarding your customers to Business Central

Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours). Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings). 

**Looking for an aka.ms link?**  
Are you looking for an aka.ms link, but simply can't find it? Remember that you can find all aka.ms links on [aka.ms/BCLinks](https://aka.ms/BCLinks). Don't forget to bookmark it!
