---
title: FAQ About Updating Your Business Central App
description: Find answers about updating Business Central apps, including validation, version compatibility, environment updates, dependencies, and critical hotfixes.
author: jswymer
ms.date: 11/09/2026
ms.reviewer: jswymer
ms.topic: faq
ms.author: jswymer
---

# FAQ about updating your Business Central app

Find answers about submitting updates to your Marketplace app for [!INCLUDE[prod_short](../includes/prod_short.md)] and making those updates available to customers.

## Is it the same process for an app update as the first version?

Yes. Upload the updated app package to your existing offer in Partner Center and submit it for validation. Updated apps must meet the technical validation requirements. If validation fails, fix the reported issues and resubmit. Passing validation is part of the publishing process, not confirmation that the update is publicly available.

Learn more about the checks and validation results in [Marketplace technical validation process FAQ](devenv-checklist-submission-validation-process.md).

## What are some "need to know" considerations with an updated app?

Increase the `version` in your app's `app.json` manifest when you submit a changed app package. You can't overwrite a previously uploaded version with different package content.

Keep the same app `id` in `app.json` across versions so that existing installations can upgrade to the updated app.

Learn more about what constitutes the identity of an app in [Understand app identity for AL apps](devenv-app-identity.md).

## When is my updated app available for tenants to install?

The update becomes publicly available shortly after the offer publishing process finishes in Partner Center. Before publication, you can test the update after the **Preview creation** step by using the preview installation URL. Select **Go Live** at the **Publisher signoff** step to make the preview version public.

Don't use the version shown in the Marketplace listing alone to determine which update an environment can install. For example, if version 1.0.0.1 is installed and you publish version 1.0.0.5, administrators can check **Manage Apps** for an available compatible update.

Learn more about [Marketplace app previews](devenv-checklist-submission-app-preview.md) and [managing apps](../administration/tenant-admin-center-manage-apps.md).

## What version of Business Central is my updated app compatible with?

The validation service uses your app's `app.json` manifest to determine the minimum targeted release. It validates the submission against releases from that minimum through the current production release. The service also validates submissions against an upcoming major release during the period described in the [technical validation process FAQ](devenv-checklist-submission-validation-process.md#against-which-releases-are-my-apps-validated).

The update is available for environments running versions for which it passed validation. It isn't limited to the latest version of [!INCLUDE[prod_short](includes/prod_short.md)]. An environment below the update's minimum supported release can't install that update, but might still be able to install an earlier compatible app version.

For example, if an update targets a minimum release of 28.1 and passes validation for 28.1, 28.2, and 28.3, it can be available on those releases. An environment on 28.0 can't install that update.

## When tenants have their Business Central version upgraded, do apps ever get automatically updated?

Yes. Marketplace apps update to the latest compatible version during major environment updates. Internal and delegated administrators can also enable app updates during minor environment updates by setting **Apps Update Cadence** to **With minor and major updates** in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)].

Regardless of that setting, a required compatible app update can be installed when necessary for an environment update.

Learn more about [updating installed apps with environment updates](../administration/tenant-admin-center-manage-apps.md#update-installed-apps-with-environment-updates).

## How do tenants that already have an existing version of my app get my latest updated version?

Internal and delegated environment administrators can view installed apps and available updates on the **Manage Apps** page in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)]. They can install the latest compatible update immediately or schedule it for the environment's next update window.

Uninstalling and reinstalling an app is another way to get an available compatible version, but it interrupts the app's functionality. Administrators can update the app from **Manage Apps** without uninstalling it.

Learn more about [managing app updates](../administration/tenant-admin-center-manage-apps.md#global-apps) and [what happens when an app is uninstalled and reinstalled](devenv-app-life-cycle.md#how-microsoft-handles-your-app).

## Do I have to submit an updated version of my app for the major releases?

Not just because a new major release is coming. If your existing app remains compatible, you don't need to submit a changed package solely for that release. Test your app against upcoming releases and submit an update if changes are needed for compatibility.

Learn more about [maintaining Marketplace apps and per-tenant extensions](app-maintain.md).

## How frequent should I submit updated versions of my app?

For routine updates, bundle bug fixes and features into releases that are at least one month apart. This approach reduces the number of updates that customers need to manage. Plan critical hotfixes separately from routine releases.

## What if I have a critical hotfix?

If a bug breaks core functionality, causes data loss or corruption, or blocks time-critical tasks, create a support ticket and submit a fixed app through Partner Center. Work with support and the Marketplace validation team on the appropriate escalation.

Learn more about [handling a critical bug in your app](devenv-app-life-cycle.md#scenario-4-critical-bug-in-your-app).

## If I make changes to the library app, must I also submit an update for the Marketplace app?

You can include the updated library app in your Partner Center submission without changing the main app package. Apps already uploaded with the same version aren't validated again for the same countries or regions. If the main app needs a higher minimum dependency version, update its `app.json` manifest and submit a new main app version too.

Learn more about [which apps are validated in a submission](devenv-checklist-submission-validation-process.md#which-apps-are-validated-in-my-submission) and [when to include library apps](devenv-checklist-submission-validation-process.md#when-should-i-include-my-library-apps-as-part-of-my-submission).

## But wouldn’t I need to change the dependency in my main app’s json to reference the updated library app file?

Not if the existing minimum version still meets the main app's requirements. The dependency `version` in `app.json` specifies a minimum, not an exact version. For example, a dependency on library version 1.0.0.1 also permits version 1.0.0.2.

If you want an update of the main app to require the newer library version, increase the dependency's minimum version and submit a new main app version. A higher library version being available doesn't by itself require an already installed dependency to be updated.

Learn more about [dependency updates](app-faq-dependencies-libraries.md#when-i-get-the-latest-updated-version-of-my-app-why-dont-i-get-the-updated-librarydependency-apps-that-my-marketplace-app-depends-on) and [manifest settings](devenv-json-files.md#appjson-file).

## Why don't I see the updated version of my app in my sandbox tenant?

Check whether the update has completed publication, supports the environment's version and country or region, and is publicly available rather than only in preview. An older environment version isn't the only possible cause.

If the environment is below the update's minimum supported release, upgrade it to a supported version before installing the update. You don't necessarily need the latest [!INCLUDE[prod_short](includes/prod_short.md)] version. For a preview update, use the [preview installation URL](devenv-checklist-submission-app-preview.md#how-can-i-install-preview-versions-for-selected-customers).

## Is there a good way to get the status of the validation as it happens?

[!INCLUDE[appsource-appinsights](includes/appsource-appinsights.md)]

## Related information

[FAQ about managing and submitting your Business Central offer](app-faq-offer.md)  
[FAQ about library and dependency apps in Business Central](app-faq-dependencies-libraries.md)  
[Update lifecycle for Marketplace apps FAQ](devenv-update-app-life-cycle-faq.md)  
[The lifecycle of apps and extensions for Business Central](devenv-app-life-cycle.md)  
