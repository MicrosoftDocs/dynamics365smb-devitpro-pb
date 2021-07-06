---
title: "Update 18.3 for Microsoft Dynamics 365 Business Central 2021 Release Wave 1"
description: Get an overview of new and changed capabilities in the 18.3 update of Business Central online, which is part of 2021 release wave 1.
ms.author: solsen
ms.custom: na
ms.date: 05/10/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 18.3 for Microsoft Dynamics 365 Business Central online 2021 release wave 1

Would you like to know what has changed in update 18.3? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Feature changes  
- [Service-to-service authentication](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/service-service-authentication)
- [Dimension issues detection and repair tool](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/dimension-issues-detection-repair-tool)
- [Integration of Word templates](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/integration-word-templates-interaction-templates)
- [Data administration and cleanup tasks page](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/data-clean-up-tasks-page)
- [Integration of Word templates with interaction templates](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/integration-word-templates-interaction-templates)
- [Export any list part to Excel](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/better-365)
- [New countries added to the list of supported countries](https://aka.ms/BCcountries)
- [Business Central Database capacity changes (as of July 1, 2021)](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-capacity#storage)
- [Upgrade to certificate-based Service-to-service (S2S) authentication for Dataverse and Dynamics 365 Integration](https://go.microsoft.com/fwlink/?linkid=2167233) 
- [Get report (raw data) into Excel from request page](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/get-report-raw-data-excel-request-page) (targeting end users) and [Save report dataset to excel from the request page](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/save-report-dataset-excel-request-page) (targeting developers) 


## Hotfixes
Find an overview of hotfixes in this [article](https://support.microsoft.com/help/5004715).

## Localization updates 

| Country| Feature change |
|-------------|--------------|
| W1 | Enhance the Update Document page for posted documents (support for Payment Reference and Payment Method)|

## Release Plan
If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2021 release wave 1 (release from April 2021 through September 2021), find the link to the release plan [here](/dynamics365-release-plan/2021wave1/smb/dynamics365-business-central/planned-features).


## Upgrade to 18.3   
Please note that new customers will automatically get the latest builds of Business Central (18.3). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**Export any List to Excel**  
In this version an “Open in Excel” action has been added to list parts under the Manage group in action bar. This is only present if the user or admin enabled the feature via Feature Management, so please make sure you do that. Read more [here](https://aka.ms/BCreleaseplan).

**Two new sessions added to the collection of Business Central Launch Event 2021rw1 recordings**  
We've added two new sessions to the collection of Business Central Launch Event recordings. The two sessions are on 'Docker' and 'DevOps Processes for Per Tenant Extensions' with Freddy Kristiansen as the speaker on both sessions. They can be found [here](https://aka.ms/BCPartnerPortal).

**Go Local: New Azure data center regions for Switzerland and Norway**  
With the Business Central online service, we strive to provide the best experience and performance for our customers. Therefore, we're moving the environments running on the Swiss version of Business Central to the Switzerland North Azure region and the environments running on the Norwegian version of Business Central to the Norway East Azure region. With 2021 release wave 1 minor update 18.3, all newly created Business Central online environments will be created in the local Azure regions and we will start moving existing customers in the weeks after release of minor update 18.3. Learn more about supported countries and Azure regions [here](https://aka.ms/BCCountries). 

**Users see notification when they open the obsolete reports 204, 205, 206, & 207**  
Before 2021 release wave 1, we [announced](/dynamics365/business-central/dev-itpro/upgrade/deprecated-features-w1#reports-204-207) that we were planning to replace several reports with newer versions. As the time approaches for the final cleaning up, we start displaying notifications so that the affected users can take action before 2021 release wave 2.
 
If you still use one or more of the deprecated reports, now is the time to start using the recommended reports, alternatively you can clone the deprecated reports to a custom range, and switch to the cloned reports. 

To check if your company uses old reports, search for **Report Selection – Sales**, and check which reports are configured to be used for *Quote*, *Order*, *Quote*, and *Credit Memo*. Remember to inspect the content of the **Custom Report Selection** table (object ID 9657), to detect if these reports are used for specific customers. For more information, see: [View a table object directly from the client](/dynamics365/business-central/dev-itpro/developer/devenv-view-table-data#view-a-table-object-directly-from-the-client). Once you know which customers use these reports, you can replace them on the Document Layout page for each affected customer, or you can use configuration packages to update in bulk. 

**Action needed: Client secret-based service to service authentication deprecation for Microsoft hosted tenants integrating to Dataverse**  
To ensure no disruptions in integration between Business Central and Dataverse you must upgrade your Business Central connection to Dataverse to certificate-based authentication. 
Although change will happen in March 2022, we strongly recommend you perform steps below as soon as possible.

