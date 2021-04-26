---
title: "Update 18.1 for Microsoft Dynamics 365 Business Central 2020 Release Wave 2"
description: Get an overview of new and changed capabilities in the 18.1 update of Business Central online, which is part of 2020 release wave 2.
ms.author: solsen
ms.custom: na
ms.date: 04/26/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 18.1 for Microsoft Dynamics 365 Business Central online 2020 release wave 2

Would you like to know what has changed in update 18.1? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.

## Hotfixes
Find an overview of hotfixes in this [article](https://support.microsoft.com/office/update-17-5-for-microsoft-dynamics-365-business-central-2020-release-wave-2-application-build-17-5-22499-22546-platform-build-17-0-22463-22540-94cdc7cc-0aaf-43cd-a070-c9c9f1147679?ui=en-US&rs=en-US&ad=US).

## Localization updates 

| Country| Feature change |
|-------------|--------------|
|Netherlands | Intrastat support for Partner VAT ID and Country of Origin|
|Spain | Support for using Sales Invoice as substitution type in Immediate Supply of Information (SII) |
|Spain | Support for delivery of goods and services in the same foreign customer document in Immediate Supply of Information (SII) |
|Germany | Support of two new ciphers in preliminary VAT Return/Advance notification (kz37 and kz50)|
|Belgium| New field to control inclusion of a customer on the VAT Annual Listing|
|Norway| SAF-T update: Improved data export for Contact and Post Code information|

## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2020 release wave 2 (release from October 2020 through March 2021), find the link to the release plan [here](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/planned-features).


## Upgrade to 18.1

Please note that new customers will automatically get the latest builds of Business Central (18.1). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

**Business Central Office Hours Calls in March**  
Make sure to join the office hours calls around ‘Integrating with Teams’ on March 9 and ‘Business Central apps in AppSource’ on March 23. Register and stay tuned for the upcoming calls: https://aka.ms/BCOfficeHours. 

**OData V3 will be removed with 2021 Wave 1**  
As previously [announced](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fdynamics365%2Fbusiness-central%2Fdev-itpro%2Fupgrade%2Fdeprecated-features-w1%23odata-v3&data=04%7C01%7Ca-emniel%40microsoft.com%7C7aa180a3769141bff89f08d8c6a2c84e%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637477749732577916%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=iOEIW2bGcGMS3Q8kCjNDpk5pzGg5Vl4PXDBNtiZOF0Y%3D&reserved=0), OData Version 3.0 (V3) has been deprecated since April 2020 and support for it will be removed in Dynamics 365 Business Central 2021 release wave 1. OData V4 is the current recommended version of OData and current integrations needs to move to OData V4. To identify incoming OData V3 requests, enable and use the [Web Service Request telemetry](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fdynamics365%2Fbusiness-central%2Fdev-itpro%2Fadministration%2Ftelemetry-webservices-trace&data=04%7C01%7Ca-emniel%40microsoft.com%7C7aa180a3769141bff89f08d8c6a2c84e%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637477749732577916%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=1IbqoCHPSLXvT8%2FfRxJX252f5Bvtpn6bMZknet0wx2o%3D&reserved=0) that's available to partners. Notifications has also been sent via M365 Message Center to tenants with identified usage.

**Basic Authentication**  
Basic Authentication (Web Service Access Key) removal for Business Central online has been postponed until [April 2022](../upgrade/deprecated-features-w1.md#basic-auth--web-service-access-keys-for-saas). We see that some integrations needs more time to move from Web Service Access Key usage to OAuth. PowerShell samples on how to connect to Business Central is published on [GitHub](https://github.com/microsoft/BCTech/tree/master/samples/PSOAuthBCAccess). 

**It’s time to switch your Dynamics 365 Business Central browser to Microsoft Edge**  
On April 2, 2021, Microsoft will remove Internet Explorer 11 and Microsoft Edge Legacy browsers from the list of supported browsers for the Business Central modern clients. Read the details, how it applies to you and actions to take [here](https://cloudblogs.microsoft.com/dynamics365/it/2020/08/21/its-time-to-switch-your-dynamics-365-business-central-browser-to-microsoft-edge/).
