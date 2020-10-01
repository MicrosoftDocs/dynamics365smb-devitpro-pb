---
title: "Update 16.2 for Microsoft Dynamics 365 Business Central 2020 Release Wave 1"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: ManuelaHochstrasser
---

# Update 16.2 for Microsoft Dynamics 365 Business Central online 2020 release wave 1

Would you like to know what has changed in update 16.2?   
Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links, you might find interesting.  

## Hotfixes

[Link to Hotfixes](https://support.microsoft.com/help/4564072)

## Feature changes

- [Migrate data from Business Central 14.x on-premises to Business Central 15.x online](https://docs.microsoft.com/dynamics365-release-plan/2020wave1/dynamics365-business-central/migrate-data-business-central-14.x-on-premises-business-central-15.x-online)
- [Update error telemetry in Application Insights for partners](https://docs.microsoft.com/dynamics365-release-plan/2020wave1/dynamics365-business-central/update-error-telemetry-application-insights-partners) 
- [New URL parameter hides web client header](https://docs.microsoft.com/dynamics365-release-plan/2020wave1/dynamics365-business-central/new-url-parameter-hides-web-client-header)
- [Improved user experience to keep things from going wrong](https://docs.microsoft.com/dynamics365-release-plan/2020wave1/dynamics365-business-central/improved-user-experience-to-keep-things-from-going-wrong)
- [Use modern authentication to connect to Common Data Service and Dynamics 365 Sales](https://docs.microsoft.com/dynamics365/business-central/admin-common-data-service) 
- [Installing AppSource apps updates in the Business Central administration center](https://docs.microsoft.com/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-manage-apps) – please note gradual availability! Until the feature is generally available, some AppSource apps can't be updated using this feature. For information about the timeline, [see here](https://docs.microsoft.com/dynamics365-release-plan/2020wave1/dynamics365-business-central/installing-appsource-apps-updates-business-central-administration-center)
<!-- - [Use modern authentication to set up Email Logging]() -->

## Release Plan

If you want to get a comprehensive overview of what's new and planned for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online for the entire 2020 release wave 1 (release from April 2020 through September 2020), find the link to the release plan [here](https://docs.microsoft.com/dynamics365-release-plan/2020wave1/dynamics365-business-central/planned-features). 

## Upgrade to 16.2

Please note that new customers will automatically get the latest builds of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] (16.2). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded. 

## Good to know

**A change to the Web client header**  
The top-most header in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Web client and desktop app have been updated to align with other Microsoft 365 and Dynamics 365 apps. The most notable change is to the height of the header that has now been reduced to 48 pixels.

**Warning of performance impact when using configuration packages to import data**  
Configuration packages were designed to speed up the implementation of new companies. In case a customer wants to use Configuration Packages as a quick way to import data -sometimes big data- from other systems to Business Central, this small feature analyzes if the import will bring data to a new company or not and, depending of that and the size of the package, alerts the user that the performance of its tenant could be affected suggesting other ways to import or request partner help.

**Want to improve the performance of Business Central?**  
Visit [aka.ms/bcperformance](https://aka.ms/bcperformance) 
and learn about best practices, dos and don'ts and different ways to make changes with a performance impact. The Performance Tuning Guide will help you understand and improve the performance of Business Central whether you are a functional consultant, a developer, or an administrator. 

**Are you a Business Central Wave ‘Champ’?**  
Did you attend the #MSDyn365BCVirtualEvent on June 3rd? Don’t forget to watch the 15+ virtual on demand sessions featuring new innovations, tools, and in-depth product demonstrations from the experts. The best part of it - it’s all for free! You just need to [register](https://aka.ms/virtual/businesscentral/2020RW1) to become a Business Central ‘Wave Champ’ and boost your knowledge.  
