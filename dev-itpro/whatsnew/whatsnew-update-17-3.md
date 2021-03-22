---
title: "Update 17.3 for Microsoft Dynamics 365 Business Central 2020 Release Wave 2"
description: Get an overview of new and changed capabilities in the 17.3 update of Business Central online, which is part of 2020 release wave 2.
ms.author: solsen
ms.custom: na
ms.date: 01/13/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 17.3 for Microsoft Dynamics 365 Business Central online 2020 release wave 2

Would you like to know what has changed in update 17.3? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes
Find an overview of hotfixes in this [article](https://support.microsoft.com/en-us/help/4595152/update-17-3-for-microsoft-dynamics-365-business-central-2020-release).

## Feature changes
- [Restoring environments in Business Central admin center](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments?#restoring-an-environment)
- [Use Shortcut dimensions in G/L Entries for Financial reporting](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/use-shortcut-dimensions-gl-entries-financial-reporting) <!--(Ivan) /dynamics365/business-central/finance-dimensions#to-set-up-global-and-shortcut-dimensionshttps://docs.microsoft.com/en-us-->
- [Signal from web service key authentication added to Application Insights telemetry for partners](../administration/telemetry-webservices-access-key-trace.md)<!--(Kennie)-->
- [Handle Price List Exceptions with Allow Updating Defaults](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/handle-price-list-exceptions-allow-updating-defaults) <!--(/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/handle-price-list-exceptions-with-allow-updating-defaults)--> 


## Release Plan
If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2020 release wave 2 (release from October 2020 through March 2021), find the link to the release plan [here](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/planned-features).


## Upgrade to 17.3
Please note that new customers will automatically get the latest builds of Business Central (17.3). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**Basic Authentication**  
Basic Authentication (Web Service Access Key) removal for Business Central online has been postponed until [April 2022](/dynamics365/business-central/dev-itpro/upgrade/deprecated-features-w1#basic-auth--web-service-access-keys-for-saas). We see that some integrations needs more time to move from Web Service Access Key usage to OAuth. PowerShell samples on how to connect to Business Central is published on [GitHub](https://github.com/microsoft/BCTech/tree/master/samples/PSOAuthBCAccess). 

**Snapshot debugging is now enabled in production environments**  
From version 17.2 and forward it is now possible to use snapshot debugging to investigate production environments. For more information, see the [help page](/dynamics365/business-central/dev-itpro/developer/devenv-snapshot-debugging) or view the [Virtual Event for 2020 Wave 2 release recording](https://events1.social27.com/MSDyn365BCLaunchEvent/agenda/player/61355) on the What’s New in Visual Studio and AL, covering snapshot debugging in details.

**Business Central Office Hours Calls in January**  
Make sure to join the office hours calls around ‘Customer Migration Tooling’ on January 12 and ‘Power Platform Integration – Power BI’ on January 26. Register and stay tuned for the upcoming calls: https://aka.ms/BCOfficeHours. 

**Want to improve the performance of Business Central?**  
Visit https://aka.ms/bcperformance and learn about best practices, dos and don'ts and different ways to make changes with a performance impact. The Performance Tuning Guide will help you understand and improve the performance of Business Central whether you are a functional consultant, a developer, or an administrator.

**It’s time to switch your Dynamics 365 Business Central browser to Microsoft Edge**  
On April 2, 2021, Microsoft will remove Internet Explorer 11 and Microsoft Edge Legacy browsers from the list of supported browsers for the Business Central modern clients. Read the details, how it applies to you and actions to take [here](https://cloudblogs.microsoft.com/dynamics365/it/2020/08/21/its-time-to-switch-your-dynamics-365-business-central-browser-to-microsoft-edge/).



