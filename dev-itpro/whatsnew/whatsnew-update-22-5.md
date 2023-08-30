---
title: "Update 22.5 for Microsoft Dynamics 365 Business Central 2023 Release Wave 1"
description: Get an overview of new and changed capabilities in the 22.5 update of Business Central online, which is part of 2023 release wave 1.
ms.author: a-enielsson
ms.custom: na
ms.date: 08/29/2023
ms.reviewer: jswymer
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 22.5 for Microsoft Dynamics 365 Business Central online 2023 release wave 1

Would you like to know what has changed in update 22.5? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links that you might find interesting.


## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/help/5029765) and the downloads [here](https://aka.ms/BCDownload).

## Feature changes

- [Extend general ledger posting aggregations](/dynamics365/release-plan/2023wave1/smb/dynamics365-business-central/extend-general-ledger-posting-aggregations)
- [Auto-update AppSource apps with minor updates](/dynamics365/release-plan/2023wave1/smb/dynamics365-business-central/experience-improved-app-management-settings)
- Your Reference Field Should Flow Through to Cust. Ledger Entry
- General Journal to copy added Links to posted entries

## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
| France | Unique numbering for each Invoice in the General Journal | The numbering in the "EcritureNum" tag must increase over time and not contain any breaks. This transaction numbering must be unique for the whole file or specific to each journal code. Using numbers in the G/L Regusters provides unique numbering. However, if you post multiple invoices through one journal, all of the invoices will have one common number. But French regulation requires a unique number for each invoice.To fulfill this requirement, users now can run the report with an additional option, the Use Transaction No. |
| Denmark/W1 | Standard Audit File Export (SAF-T) | Users can export all mandatory required data according to the Standard Audit File for Tax (SAF-T) format in Denmark. SAF-T is an international standard for the electronic exchange of reliable accounting data from organizations to a national tax authority or external auditors. This feature uses Organization for Economic Co-operation and Development (OECD) standard SAF-T as the standard file format for reporting and it can be used in all countries if they are using OECD standard. |
| Denmark | Standard Chart of Account | The new Danish bookkeeping act requires the use of a standard chart of accounts. Because of this requirement, the Danish tax authority is providing a standard chart of accounts that can be used. Use the chart of accounts when you prepare annual accounts, and when you calculate regular tax and value-added tax (VAT) payments. You can use any chart of accounts that's included on the Chart of Accounts page. However, for required reporting, you must use the G/L Mapping page to map all general ledger (GL) accounts with the standard chart of accounts that's required by the law. |
| Denmark | Upload of CSV file with accounting data to RegnskabBasies | Integration of Microsoft Dynamics 365 Business Central with comma-separated values (CSV) file uploads is required by Danish bookkeeping act Regnskab Basis and marks a pivotal advancement in financial data management. This streamlined process enables your business to effortlessly import large datasets and helps enhance accuracy and efficiency. Now users can export all required data as a CSV file according to the Danish requirements for Regnskab Basis. |

## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2023 release wave 1 (release from April 2023 through September 2023), find the link to the release plan [here](https://aka.ms/BCReleasePlan).

## Upgrade to 22.5

Please note that new customers will automatically get the latest builds of Business Central (22.5). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

### Important: Take action before October 31st to retain your delegated admin access to your customers  
Last year Microsoft introduced [Granular Delegated Admin Privileges (GDAP)](/partner-center/gdap-introduction) to improve upon and replace Delegated Admin Privileges (DAP). GDAP addresses various security concerns by allowing customer administrators to provide partners a proper level of time-bound access to their tenants.

The Partner Center team has now [announced](/partner-center/announcements/2023-may#new-timelines-important-actions-to-secure-the-partner-ecosystem) the timeline by which you need to migrate your customer relationships to GDAP. Please make sure to read this new Partner Center announcement for more details about milestone dates and the transition plan and about the tools Microsoft provides to facilitate this process. 

To manage Dynamics 365 Business Central customers via GDAP we recommend requesting the Dynamics 365 Administrator role as the least-privileged role that grants access to Dynamics 365 Business Central environments. Read more about which other roles are supported for delegated administration of Business Central [here](/dynamics365/business-central/dev-itpro/administration/delegated-admin).

### Upcoming Business Central Office Hours Calls

In September, we will host the following call, which you can already register for today:

**September 5:** Performance Troubleshooting Tools

- Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours).

- Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings). 

### Looking for an aka.ms link?

Are you looking for an aka.ms link, but simply can't find it? Remember that you can find all aka.ms links on [aka.ms/BCLinks](https://aka.ms/BCLinks). Don't forget to bookmark it!