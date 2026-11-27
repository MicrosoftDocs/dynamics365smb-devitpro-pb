---
title: "Business Central App Testing FAQ"
description: "Learn how to test Business Central Marketplace apps across releases and countries/regions, verify upgrade paths, and distinguish testing from validation."
author: SusanneWindfeldPedersen
ms.date: 11/27/2026
ms.reviewer: jswymer
ms.topic: faq
ai-usage: ai-assisted
ms.author: solsen
---

# FAQ about testing your Business Central app

Find answers about testing functionality, compatibility, and upgrades before submitting your Marketplace app for [!INCLUDE[prod_short](../includes/prod_short.md)].

## Since my app goes through validation, do I really need to thoroughly test my app?

Yes. You're responsible for thoroughly testing your app. Automated technical validation checks technical requirements and compatibility. Microsoft doesn't run your app's functional tests or manually test its usage scenarios during submission validation. Test the customer experience before publication rather than relying on customers to find bugs.

Learn more about [testing and technical validation](devenv-checklist-submission-validation-process.md#how-many-automated-tests-do-we-need-to-run-for-validation-and-how-high-must-the-test-coverage-be).

## Is it ok to submit my app for validation before we complete our own testing?

No. Complete your functional and upgrade testing before submission. We recommend aiming for 100% coverage of your app's functionality, or as close as practical. This guidance is about quality, not a required numerical code-coverage threshold for Marketplace validation. Finding issues before submission helps avoid repeat submissions and customer deployment failures.

## Is it ok to test my Marketplace app in an on-premises environment?

On-premises testing alone isn't sufficient. Test your Marketplace app in [!INCLUDE[prod_short](includes/prod_short.md)] online before submission. You can also use sandbox artifacts in Docker for development and automated testing. Online and on-premises environments differ, so on-premises-only testing can miss online-specific issues.

Learn more about [testing your extension](../compliance/apptest-testingyourextension.md).

## Does it really matter what version of Business Central I test on before submitting my app for validation?

Yes. Test your app against all [!INCLUDE[prod_short](includes/prod_short.md)] releases targeted by your submission, including the current production release when it's targeted. The service computes the targeted releases from your manifests. Testing only one release can miss compatibility or behavior differences.

For example, suppose the latest targeted release is 15.4, but you test only on 15.0. Product changes between those releases can affect your app's behavior. The same principle applies to current releases.

We recommend using Docker containers for automated testing. The `Get-BcArtifactUrl` function in the `BCContainerHelper` PowerShell module gets the latest available sandbox artifact for the specified country/region by default. Use the `-version` parameter to select other releases targeted by your submission. The function selects an artifact; it doesn't calculate all releases targeted by your submission.

Learn more about [targeted validation releases](devenv-checklist-submission-validation-process.md#against-which-releases-are-my-apps-validated).

## How thorough should our testing be?

Aim for 100% coverage of your app's functionality, or as close as practical, using automated and manual tests. Good testing infrastructure helps you find issues before customers encounter them. Microsoft doesn't set a numerical code-coverage requirement for technical validation.

## Do I have to test on every country that I intend to support with my app?

Yes. Test your app in every country or region that you support. Localized applications can differ, so verify that the app publishes, synchronizes, installs, and works correctly in each one. A successful installation in one country or region doesn't establish compatibility in another.

## Do you have recommendations on maintenance testing of our apps?

Yes. Through Docker, you can test against the latest sandbox builds and available next major and next minor insider builds. Insider artifacts are available to customers and partners, but require acceptance of the insider EULA. In `Get-BcArtifactUrl`, use `-select NextMajor` or `-select NextMinor` with `-accept_insiderEula`. When the next release is a major release, `NextMinor` selects that major release. Check that an artifact is available for the requested release and country/region.

Test often, especially against the next minor build, to find issues caused by product changes before release.

Learn more about [accessing prerelease builds](app-maintain.md).

## I only made minor code changes in my updated app. Can I test just these changes?

No. Run regression tests beyond the code that you changed. Even minor changes can affect other functionality. Aim for the same comprehensive coverage that you use for larger releases.

## Do I need to do upgrade testing?

Yes. Verify that customers can upgrade to your updated app. Automated technical validation doesn't replace testing your upgrade logic. An upgrade failure can prevent customers from installing the update.

## Any recommendations on upgrade testing?

Test upgrades with extensive, representative app data. Include data scenarios that exercise your upgrade logic and verify that the data remains correct afterward. An upgrade can fail because of an untested data scenario, or appear to succeed while losing data.

## Do I only need to do upgrade testing from previous version to current?

No. Test upgrades from various previous versions that customers might still have installed. Customers don't necessarily install every app version. For example, an environment could still have version 1.0.0.0 and need to upgrade directly to version 1.0.0.5.

Minor environment updates update apps according to the app update cadence and compatibility requirements. Don't assume that customers have installed the immediately preceding app version.

Learn more about [upgrading extensions](devenv-upgrading-extensions.md) and [automatic app updates](../administration/tenant-admin-center-manage-apps.md#update-installed-apps-with-environment-updates).

## Related information

[FAQ about updating your Business Central app](app-faq-update.md)  
[FAQ about library and dependency apps in Business Central](app-faq-dependencies-libraries.md)  
[Update lifecycle for Marketplace apps FAQ](devenv-update-app-life-cycle-faq.md)  
[The lifecycle of apps and extensions for Business Central](devenv-app-life-cycle.md)  
