---
title: Business Central privacy for AL developers
description: Understand and improve the privacy of your Business Central apps written in AL.
ms.date: 03/15/2024
ms.reviewer: solsen
ms.topic: conceptual
ms.author: kepontop
author: kennienp
---

# Business Central privacy for AL developers

This article helps you understand and improve the privacy aspects of your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] app regardless of where it's hosted. In the following sections, you find guidance and recommended privacy best practices related what you as an AL developer need to know about privacy.

## Data security vs. privacy

Both of the articles of *data security* and *privacy* are about customer data stored in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database. So what's the difference between the articles?

* Data security is about protecting data from unauthorized access.
* Privacy is about the appropriate handling of personal data.

## Privacy and telemetry

It's possible to configure your extension/app to emit telemetry data to an [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource owned by your organization. This data can then be collected and visualized for analyzing the application against the desired business goals, troubleshooting, and more. For more information about how to instrument an extension/app with telemetry, see [App telemetry overview](../developer/devenv-instrument-application-for-telemetry.md)

The out of the box telemetry data send to your app doesn't emit any personal or customer data to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], see [FAQ: What about privacy laws and regulations (for telemetry)?](../administration/telemetry-faq.md#what-about-privacy-laws-and-regulations). The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server uses the data classification property set on the AL methods that emit telemetry to determine if the telemetry event is safe to send to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] or if it shouldn't be emitted. For more information, see [Using DataClassification for privacy](../developer/devenv-instrument-application-for-telemetry-app-insights.md#using-dataclassification-for-privacy). 


## Privacy and data classification of the data model

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application has support for tenant  administrators to get insights into where they keep personal data in their system, and also ability  to respond to requests from data subjects. For more information about these privacy features, see [Classifying data sensitivity fields](/dynamics365/business-central/admin-classifying-data-sensitivity). 

As a developer of an extension/app, you need to provide the intended data classification of fields in your data model by setting the ``DataClassification`` property on table fields. The tenant administrator can choose keep your data classification or override it, should they use the system in a different way than anticipated by you. 

> [!TIP]
> You can enable the AppSourceCop rule **AS00016** (Data Classification property should be different from "ToBeClassified") to find tables and fields that have not been classified yet. For more information, see [AppSourceCop Error AS0016](../developer/analyzers/appsourcecop-as0016.md).


## See also  

[AppSourceCop Error AS0016](../developer/analyzers/appsourcecop-as0016.md)  
[Classifying data sensitivity fields (for tenant admins)](/dynamics365/business-central/admin-classifying-data-sensitivity)  
[Privacy FAQ](PrivacyFAQ.md)  
[Privacy (microsoft.com)](https://www.microsoft.com/trust-center/privacy)  
[Security for AL developers](security-developers.md) 
[General security overview](security-and-protection.md)  