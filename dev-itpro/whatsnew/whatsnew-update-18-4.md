---
title: "Update 18.4 for Microsoft Dynamics 365 Business Central 2021 Release Wave 1"
description: Get an overview of new and changed capabilities in the 18.4 update of Business Central online, which is part of 2021 release wave 1.
ms.author: solsen
ms.custom: na
ms.date: 08/10/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 18.4 for Microsoft Dynamics 365 Business Central online 2021 release wave 1

Would you like to know what has changed in update 18.4? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.


## Hotfixes
Find an overview of hotfixes in this [article](INSERT).

## Localization updates 

| Country| Feature change |
|-------------|--------------|
| Great Britain | Specify fraud prevention headers automatically without interaction with the user|
| Norway | SAF-T Improvements|

## Release Plan
If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2021 release wave 1 (release from April 2021 through September 2021), find the link to the release plan [here](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/planned-features).

## Upgrade to 18.4   
Please note that new customers will automatically get the latest builds of Business Central (18.4). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**Business Central Office Hours Calls in August**  
Make sure to join the office hours calls around 'Business Central Apps in AppSource' on August 17 and 'Cloud Migration' on August 31. Register and stay tuned for the upcoming calls: https://aka.ms/BCOfficeHours.

**Action needed: Client secret-based service to service authentication deprecation for Microsoft hosted tenants integrating to Dataverse**  
To ensure no disruptions in integration between Business Central and Dataverse you must upgrade your Business Central connection to Dataverse to certificate-based authentication. 
Although change will happen in March 2022, we strongly recommend you perform steps below as soon as possible.

**Users see notification when they open the obsolete reports 204, 205, 206, & 207**  
Before 2021 release wave 1, we [announced](/dynamics365/business-central/dev-itpro/upgrade/deprecated-features-w1#reports-204-207) that we were planning to replace several reports with newer versions. As the time approaches for the final clean-up, we start displaying notifications so that the affected users can take action before Business Central 2021 release wave 2.
 
If you still use one or more of the deprecated reports, now is the time to start using the recommended reports, alternatively you can clone the deprecated reports to a custom range, and switch to the cloned reports. 

To check if your company uses old reports, search for **Report Selection – Sales**, and check which reports are configured to be used for *Quote*, *Order*, *Quote*, and *Credit Memo*. Remember to inspect the content of the **Custom Report Selection** table (object ID 9657), to detect if these reports are used for specific customers. For more information, see: [View a table object directly from the client](/dynamics365/business-central/dev-itpro/developer/devenv-view-table-data#view-a-table-object-directly-from-the-client). Once you know which customers use these reports, you can replace them on the Document Layout page for each affected customer, or you can use configuration packages to update in bulk. 