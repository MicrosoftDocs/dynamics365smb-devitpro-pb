---
title: "Update 19.3 for Microsoft Dynamics 365 Business Central 2021 Release Wave 2"
description: Get an overview of new and changed capabilities in the 19.3 update of Business Central online, which is part of 2021 release wave 2.
ms.custom: na
ms.date: 01/04/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: EmmaNielsson
---

# Update 19.3 for Microsoft Dynamics 365 Business Central online 2021 release wave 2

Would you like to know what has changed in update 19.3? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/help/5010207).

## Localization updates

| Country| Feature change |
|-------------|--------------|
|EU countries | Updates have been made to Intrastat reporting to support the new requirements for 2022 in each country required to do Intrastat reporting. These updates are related to the obligation to report new data -Partner VAT no. and Country of Origin - for some Intrastat related transactions. The fields are exported according to the required file format specified in each country. Additionally, some adjustments in the Nature of Transaction data field and minor bug fixes are released. Please find the documentation about Intrastat reporting [here](/dynamics365/business-central/finance-how-setup-report-intrastat)
|Mexico | *Complement to CFDI “Carta de Porte” 2.0.* Mexican companies must be able to print and send Carta de Porte-compliant packing slips and transfer orders electronically as Comprobante Fiscal Digital por Internet (CFDI) files. As of January 1, 2022, the Waybill (Carta de Porte) complement is mandatory for taxpayers who transport goods and merchandise in the national territory. Business Central supports CFDI and Carta de Porte so that you can print packing slips and transfer orders that have the required digital signature.|
|Germany | The ASCII file format for Intrastat reporting is no longer used, therefore ASCII file format has been deprecated in this release, XML format will be used going forward.|
|Norway | The Electronic VAT return feature has been updated to support the new requirement for VAT return reporting. 

Thefollowing list provides more information about the new electronic VAT return capabilities in Norway:

- Possibility to set up **VAT Code** in the VAT statement
- New VAT codes which can be setup from the wizard
- New entities related to the new VAT codes introduced:

  - VAT specification
  - VAT Note
- You can now store and download multiple submission and response requests
- The electronic VAT return only supports numbers. Any VAT registration no. with characters will be converted into numbers only. A VAT registration no. such as *NO 777777 MVA* will be reported as *777777*. So you won't need to change the existing VAT registration no. in order to do reporting.
- Learn more about Norwegian VAT reporting [here](/dynamics365/business-central/finance-how-setup-report-intrastat).  



## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2021 release wave 1 (release from April 2021 through September 2021), find the link to the release plan [here](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/planned-features).

## Upgrade to 19.3

Please note that new customers will automatically get the latest builds of Business Central (19.3). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**Upcoming Business Central Office Hours Calls**  
Make sure to join the office hours call 'How we secure your data in Business Central' on February 1. Note that this call will be held in two different time zones; first call is at 08.00am-09.00am CET / 06.00pm-07.00 PM AEST and second call is at 5.00pm-6.00pm CET / 08.00am-09.00am PST. Register and stay tuned for upcoming calls: https://aka.ms/BCOfficeHours. Watch on-demand recordings: https://aka.ms/BCOfficeHoursRecordings. 

**Action needed: Client secret-based service to service authentication deprecation for Microsoft hosted tenants integrating to Dataverse**  
To ensure no disruptions in integration between Business Central and Dataverse you must upgrade your Business Central connection to Dataverse to certificate-based authentication. 
Although change will happen in March 2022, we strongly recommend you perform steps outlined in [Upgrade Connections from Business Central Online to Use Certificate-Based Authentication](/dynamics365/business-central/admin-how-to-set-up-a-dynamics-crm-connection#upgrade-connections-from-business-central-online-to-use-certificate-based-authentication) as soon as possible.

**Join Directions NA on April 3-6, 2022**  
Directions North America is a Microsoft Dynamics 365 event driven by Partners – for Partners. Attendees will build new business contacts, learn about best practices, and discover valuable tools for execution and success. Attendees can also use the many networking opportunities at the conference to grow and enhance relationships with other partners, ISVs, service providers, and Microsoft. Learn more and register [here](https://www.eventsquid.com/event.cfm?event_id=14536).   
