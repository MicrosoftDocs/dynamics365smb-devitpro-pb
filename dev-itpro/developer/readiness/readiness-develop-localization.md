---
title: "Development of a Localization Solution"
description: "Comply with regulatory requirements in Dynamics 365 Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: edupont
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Development of a Localization Solution

If you want to bring the capabilities of the [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] to your local market, then there are several reasons why you would want to choose [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)]:

- Easy to translate and strong base capabilities ready for localization.
- Reach more customers by showcasing your localization apps on Microsoft AppSource.
- [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] provides a proven ERP platform and application for your localization apps which adapts functional areas to the requirements of the local market.  

If you are planning to build localization apps, you should pay attention to the following considerations and requirements:

## Localization apps functionality

Localization apps contain a set of functionalities addressing local requirements that fall within one of the categories below. Make sure to split up your localization apps at minimum according to these categories:  

 * **Regulatory requirements** - local functionality that helps businesses fulfill their legal requirements, such as tax reporting, local GAAP, and other regulatory requirements.
 * **National standards requirement** – local functionality that addresses local standards, such as banking and payment formats, address formats, or local interpretations of global standards.
 * **Market requirements**   - nice-to-have, competitive requirements – local functionality beneficial to the productivity business processes in a country and thereby adding value to business but are not required from a regulatory perspective.

## Documentation and adoption

Good and consistent tooltips and documentation will help users adopt your features fast and alleviate most of your support burden.

An important part of your localization app will be setup data for the production company that will help users get up and running quickly and with minimum effort.

## Service availability in additional countries

Follow [this page](/dynamics365/business-central/dev-itpro/compliance/apptest-countries-and-translations) for information about planned country and regional expansions of [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)].

## Business Central companion/mobile apps availability

Even though [Business Central companion/mobile apps](/dynamics365/business-central/install-mobile-app) are globally available in Microsoft Store, Apple App Store, or Google Play the respective store listing may appear in English. Once Business Central is made available in a given country, we will make sure to update the store listings using local language.

> [!NOTE]  
> The companion apps are designed to work with every localized app even before we update the marketing part of the store listing.

## Monetization

As a partner developing a localization app, you are free to decide how monetization of your apps should work. Localization apps are considered like any other apps and the market is open any partner and apps in a given country. It is up to you to build a monetization mechanism for your app - as well as mechanisms to control who uses your app. <!--To learn more, please see [the Dynamics 365 Business Central App Monetization whitepaper](https://mbspartner.microsoft.com/secure/coursematerials/D365/Standalone/Dynamics_365_Business_Central_App_Monetization_Demo_Guide.pdf).-->

## Submitting your localization app to AppSource

Apart from the regular app details you fill out when [submitting your app](https://go.microsoft.com/fwlink/?linkid=869733), there are a few things to emphasize in the app submission process for localization apps.  

The following list describes the top things to be explicit about:

- Country or group of countries that the app applies to  
- Language or languages included in the app  
- Describe and categorize each local regulatory feature included in your localization app  

## Product scope for localization apps

Apart from [fulfilling the technical checklist for your app](../devenv-checklist-submission.md), the minimum viable product scope for localization app is:

* Local Regulatory Features.
* [Tests for Local Regulatory Features](../../compliance/apptest-testingyourextension.md).
* [Upgrade code for localization apps](../devenv-upgrading-extensions.md).
* Setup data RapidStart package for the localization app.
* [Translation of a localization app to local language(s)](../devenv-work-with-translation-files.md) and base app if you are the first partner enabling localization for the country (Learn more about [Dynamics Translation Services](/dynamics365/unified-operations/fin-ops-core/dev-itpro/lifecycle-services/translation-service-overview)).
* Translation of the localization app's documentation. For more information, see [Translate the Help](../../user-assistance.md#translate-the-help) and [Translate documentation files](/dynamics365/unified-operations/dev-itpro/lifecycle-services/use-translation-service-ua).
* National Standard Features (local part) are recommended to be built as an [app](opportunity-app-publisher.md) – separate from the localization app.
* Market Required and Local Competitive Features are recommended to be built as an [app](opportunity-app-publisher.md) – separate from the localization app.
* Using .NET assemblies in your localization app will fail in the technical validation of an app. Instead, contribute to [C/AL Open Library](https://github.com/Microsoft/cal-open-library) GitHub repository with requests you have for .NET.
* It is recommended to logically break down the full local functionality set, at a minimum within the above categories. This approach provides optimal flexibility for customers to choose what they really need in terms of local functionality while making sure critical pieces of local functionality do not break upgrade processes nor are upgrade heavy.
* The majority of customers in the local market will need most of the local regulatory features. In the category of local regulatory features there will be some features that, even though they are legally required, apply to companies of a certain size, revenue threshold etc. Such situations are opportunities to further logically break down localization apps into smaller focused-functionality sets.
* Consider separating localization functionality by the frequency of changes to smaller localization apps. If, for example, your local feature contains one part that is stable and one part that is frequently changed based on regulation changes, make sure to keep the stable part as one app and the changing part a separate localization app. This approach ensures better test coverage, faster response to changes and fewer upgrade issues.
* Use worldwide frameworks available in [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] (W1) when building features for, such as VAT reports, banking formats, data exchange, and others where the majority of functionality is common to all countries but there are some local rules or business formats that are extensions of global frameworks or formats. Make sure to familiarize yourself with such frameworks to reduce effort, reuse code, and properly utilize extensibility points and integration events. If you notice opportunities for improvements in such frameworks or [missing extensibility points](https://github.com/Microsoft/ALAppExtensions/issues), make sure to [contact us](mailto:d365bcloc@microsoft.com) to work together in improving this.
* Consider rethinking local reports by categorizing those you want to include in your localization app(s) in following categories: reports printing lists could be converted to list pages and offer more functionality using [Excel addin](/dynamics365/business-central/about-export-data), reports providing insights or aggregating data could be converted to [Power BI reports and dashboards](/dynamics365/business-central/across-how-use-financials-data-source-powerbi), frequently customized reports (usually local document reports like invoices, credit memos...) could utilize [Word document layouts](/dynamics365/business-central/dev-itpro/developer/devenv-howto-report-layout) so customer's power users can easily customize them, for all others fall back to [RDLC reports](/dynamics365/business-central/dev-itpro/developer/devenv-howto-rdl-report-layout)  
* Prepare a setup data RapidStart package for the production company and translate to local language(s).
* Consider preparing a local demo data RapidStart package for the evaluation company and translate it to local language(s).
* Prepare setup guides (wizards) for areas that are complex to set up to help users enable, discover and have a good first experience using your localization app.
* Fork the [Dynamics 365 Business Central documentation from public GitHub repository](https://github.com/MicrosoftDocs/dynamics365smb-docs). Such an approach to documentation can help when other partners or ISVs take dependency on your localization app. For more information, see [Configuring the Help Experience](../../deployment/configure-help.md).
* Consider converting field-based documentation to task-based documentation using tooltips and [Dynamics 365 Business Central documentation Github repository](https://github.com/MicrosoftDocs/dynamics365smb-docs). [Rulesets](../devenv-rule-set-syntax-for-code-analysis-tools.md) can help you ensure, for example, that no fields or actions are missing [tooltips](https://worldready.cloudapp.net/Styleguide/Read?id=2748&topicid=38066) (link requires PartnerSource account).
* If your localization app(s) are extending Business Central data model with new tables and/or fields, you must setthe  DataClassification property correctly. Localization apps with fields having the DataClassification property set to ToBeClassified will be rejected. Read more on [Classifying Data in Business Central here](../devenv-classifying-data.md).
* If you're converting an existing localization (developed in C/AL) to localization apps (check this [video](https://mbspartner.microsoft.com/D365/Videos/101769)(requires PartnerSource access)), as described in technical checklist for your app, you'll need to set the ApplicationArea property on UI elements that you want to make visible in Business Central. To help you with that use [NAVApplicationAreaHelper powershell command let](https://blogs.msdn.microsoft.com/nav/2018/06/06/navapplicationareahelper/) to do this in bulk.  

> [!NOTE]  
> You can also create an integration if you find it beneficial to have some functionality placed outside the [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] environment and instead connect to [!INCLUDE[d365_bus_central_md](../includes/d365_bus_central_md.md)] using for example APIs or Web services.

> [!NOTE]  
> If you have questions for building localization apps, please contact the [Microsoft localization team](mailto:d365bcloc@microsoft.com).

<!--Also, consider joining the [Ready to Go](readiness-ready-to-go.md) program for assistance on bringing you localization apps to AppSource.-->

## See Also

[Build Your Business on Dynamics 365 Business Central](readiness-welcome.md)  
[Business Central Learning Catalog](https://go.microsoft.com/fwlink/?linkid=2002101)  
[Integrate a 3rd Party Solution](readiness-thirdparty-solution.md)  
[Development of a Vertical Solution](readiness-develop-vertical.md)  
[Development of a Horizontal Solution](readiness-develop-horizontal.md)  
[Get Started as a Reseller of Business Central Online](administration/get-started-online.md)  
[Countries and Translations Supported](../../compliance/apptest-countries-and-translations.md)  
