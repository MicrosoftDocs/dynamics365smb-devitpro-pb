---
title: Development of a Localization Solution
description: Comply with regulatory requirements in Dynamics 365 Business Central.
author: sorenfriisalexandersen
ms.date: 04/14/2025
ms.reviewer: solsen
ms.topic: article
ms.author: solsen
---

# Development of a localization solution

If you want to bring the capabilities of the [!INCLUDE [prod_long](../../includes/prod_long.md)] to your local market, then there are several reasons why you would want to choose [!INCLUDE [prod_short](../../includes/prod_short.md)]:

- Easy to translate and strong base capabilities ready for localization.
- Reach more customers by showcasing your localization apps on Microsoft AppSource.
- [!INCLUDE [prod_long](../../includes/prod_long.md)] provides a proven ERP platform and application for your localization apps, which adapts functional areas to the requirements of the local market.  

Localization apps are simply apps for [!INCLUDE [prod_long](../../includes/prod_long.md)] - learn more about getting onboarded as an app publisher in [Get started with building apps](get-started.md).  

## Localization apps functionality

Localization apps contain a set of functionalities addressing local requirements that fall within one of the categories below. Make sure to split up your localization apps at minimum according to these categories:  

* **Regulatory requirements** - local functionality that helps businesses fulfill their legal requirements, such as tax reporting, local GAAP, and other regulatory requirements.
* **National standards requirement** – local functionality that addresses local standards, such as banking and payment formats, address formats, or local interpretations of global standards.
* **Market requirements**   - nice-to-have, competitive requirements – local functionality beneficial to the productivity business processes in a country/region and thereby adding value to business but aren't required from a regulatory perspective.

<!--Skip for now ## Documentation and adoption

Good and consistent tooltips and documentation will help users adopt your features fast and alleviate most of your support burden.

An important part of your localization app will be setup data for the production company that will help users get up and running quickly and with minimum effort.-->

## Service availability in other countries/regions

Follow [this page](../../compliance/apptest-countries-and-translations.md) for information about planned country and regional expansions of [!INCLUDE [prod_long](../../includes/prod_long.md)].

<!-- skip for now ## Business Central companion/mobile apps availability

Even though [Business Central companion/mobile apps](/dynamics365/business-central/install-mobile-app) are globally available in Microsoft Store, Apple App Store, or Google Play the respective store listing may appear in English. Once Business Central is made available in a given country, we will make sure to update the store listings using local language.

> [!NOTE]  
> The companion apps are designed to work with every localized app even before we update the marketing part of the store listing.

## Monetization

As a partner developing a localization app, you are free to decide how monetization of your apps should work. Localization apps are considered like any other apps and the market is open any partner and apps in a given country. It is up to you to build a monetization mechanism for your app - as well as mechanisms to control who uses your app. -->

<!-- skip for now ## Submitting your localization app to AppSource

Apart from the regular app details you fill out when [submitting your app](https://go.microsoft.com/fwlink/?linkid=869733), there are a few things to emphasize in the app submission process for localization apps.  

The following list describes the top things to be explicit about:

- Country or group of countries that the app applies to  
- Language or languages included in the app  
- Describe and categorize each local regulatory feature included in your localization app  -->

## Product scope for localization apps

Apart from [fulfilling the technical checklist for your app](../devenv-checklist-submission.md), the minimum viable product scope for localization app is:

[!INCLUDE [translation-services-deprecation](../../includes/translation-services-deprecation.md)]

- Local regulatory features.
- [Tests for local regulatory features](../../compliance/apptest-testingyourextension.md).
- [Upgrade code for localization apps](../devenv-upgrading-extensions.md).
- Set up data RapidStart package for the localization app.
- [Translation of a localization app to local languages](../devenv-work-with-translation-files.md) and base app if you're the first partner enabling localization for the country/region. Learn more in [Dynamics translation services](/dynamics365/unified-operations/fin-ops-core/dev-itpro/lifecycle-services/translation-service-overview).
- Translation of the localization app's documentation. Learn more in [Translate the help](../../user-assistance.md#translate-the-help) and [Translate documentation files](/dynamics365/unified-operations/dev-itpro/lifecycle-services/use-translation-service-ua).
- National Standard Features (local part) are recommended to be built as an [app](opportunity-app-publisher.md) – separate from the localization app.
- Market required and local competitive features are recommended to be built as an [app](opportunity-app-publisher.md) – separate from the localization app.
- Using .NET assemblies in your localization app fails in the technical validation of an app. Instead, contribute to [C/AL Open Library](https://github.com/Microsoft/cal-open-library) GitHub repository with requests you have for .NET.
- It's recommended to logically break down the full local functionality set, at a minimum within the above categories. This approach provides optimal flexibility for customers to choose what they really need in terms of local functionality. And it makes sure that critical pieces of local functionality don't break upgrade processes nor are upgrade heavy.
- Most customers in the local market need most of the local regulatory features. In the category of local regulatory features there are some features that, even though they're legally required, apply to companies of a certain size, revenue threshold, etc. Such situations are opportunities to further logically breakdown localization apps into smaller focused-functionality sets.
- Consider separating localization functionality by the frequency of changes to smaller localization apps. If, for example, your local feature contains one part that is stable and one part that is frequently changed based on regulation changes, make sure to keep the stable part as one app and the changing part a separate localization app. This approach ensures better test coverage, faster response to changes and fewer upgrade issues.
- Use worldwide frameworks available in [!INCLUDE [prod_long](../../includes/prod_long.md)] (W1) when building features for, such as VAT reports, banking formats, data exchange, and others where most functionality is common to all countries/regions but there are some local rules or business formats that are extensions of global frameworks or formats. Make sure to familiarize yourself with such frameworks to reduce effort, reuse code, and properly utilize extensibility points and integration events. If you notice opportunities for improvements in such frameworks or [missing extensibility points](https://github.com/Microsoft/ALAppExtensions/issues), make sure to [contact us](mailto:d365bcloc@microsoft.com) to work together in improving this.
- Consider rethinking local reports by categorizing the reports that you want to include in your localization apps in following categories: reports printing lists could be converted to list pages and offer more functionality using [Excel add-in](/dynamics365/business-central/about-export-data), reports providing insights or aggregating data could be converted to [Power BI reports and dashboards](/dynamics365/business-central/across-how-use-financials-data-source-powerbi), frequently customized reports (local document reports like invoices and credit memos) could utilize [Word document layouts](../devenv-howto-report-layout.md) so customer's power users can easily customize them, for all others fall back to [RDLC reports](../devenv-howto-rdl-report-layout.md).
- Prepare a setup data RapidStart package for the production company and translate to local languages.
- Consider preparing a local demo data RapidStart package for the evaluation company and translate it to local languages.
- Prepare setup guides (wizards) for areas that are complex to set up to help users enable, discover, and have a good first experience using your localization app.
- Fork the [Dynamics 365 Business Central documentation from public GitHub repository](https://github.com/MicrosoftDocs/dynamics365smb-docs). Such an approach to documentation can help when other partners or ISVs take dependency on your localization app. For more information, see [Configuring the Help Experience](../../deployment/configure-help.md).
- Consider converting field-based documentation to task-based documentation using tooltips and [Dynamics 365 Business Central documentation GitHub repository](https://github.com/MicrosoftDocs/dynamics365smb-docs). [Rulesets](../devenv-rule-set-syntax-for-code-analysis-tools.md) can help you ensure, for example, that no fields or actions are missing [tooltips](../../user-assistance.md#guidelines-for-tooltip-text).
- If your localization apps are extending Business Central data model with new tables and/or fields, you must set the DataClassification property correctly. Localization apps with fields having the DataClassification property set to ToBeClassified are rejected. Read more on [Classifying Data in Business Central here](../devenv-classifying-data.md).
- If you're converting an existing localization (developed in C/AL) to localization apps<!-- link not valid (check this [video](https://mbspartner.microsoft.com/D365/Videos/101769)(requires PartnerSource access))-->, as described in technical checklist for your app, you need to set the ApplicationArea property on UI elements that you want to make visible in Business Central. To help you with this task, see [Change multiple Application Area tags with PowerShell](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2018/06/06/navapplicationareahelper/?source=nav) to do this in bulk.

> [!NOTE]  
> You can also create an integration if you find it beneficial to have some functionality placed outside the [!INCLUDE [prod_short](../../includes/prod_short.md)] environment and instead connect to [!INCLUDE [prod_short](../../includes/prod_short.md)] using, for example,  APIs or Web services.

> [!NOTE]  
> If you have questions for building localization apps, contact the [Microsoft localization team](mailto:d365bcloc@microsoft.com).

## Related information

[Get started with building apps](get-started.md)  
[The SMB opportunity for app publishers](opportunity-app-publisher.md)  
[Get started as a reseller of Business Central online](../../administration/get-started-online.md)  
[Countries and translations supported](../../compliance/apptest-countries-and-translations.md)  
[Business Central on Microsoft training](/learn/dynamics365/business-central?WT.mc_id=dyn365bc_landingpage-docs)  
