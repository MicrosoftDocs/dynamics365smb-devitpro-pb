---
title: Technical Validation Checklist
description: Check technical requirements and validate your Business Central extension with AppSourceCop and BcContainerHelper before submitting it to Marketplace.
author: SusanneWindfeldPedersen
ms.date: 11/27/2026
ms.reviewer: jswymer
ms.topic: checklist
ai-usage: ai-assisted
ms.author: solsen
ms.custom: sfi-ropc-nochange
---

# Technical validation

Use this checklist to check the requirements that you must meet before submitting an extension for validation. Learn how the [!INCLUDE [prod_short](includes/prod_short.md)] services perform automated technical validation and how to set up your own validation pipeline.

> [!TIP]
> If you have questions about validation for your app, learn more about who to contact in [Technical validation FAQ](devenv-checklist-submission-faq.md).

## Technical validation checklist

Before submitting your extension to Marketplace, check these requirements. Use the `AppSourceCop` code analyzer to identify code validation issues. Learn more in [Using the code analysis tool](devenv-using-code-analysis-tool.md).

|Requirement|Example/Guidance|
|-----------|----------------|
|Develop your extension in Visual Studio Code.|[Developing [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]s](devenv-dev-overview.md)|
|The `app.json` file has mandatory properties that you must include. The `name`, `publisher`, and `version` properties must match the values set in your offer description. The guidance also covers dependencies and targeting multiple countries/regions with one app.|[Mandatory app.json properties](devenv-json-files.md)|
|Coding of `Date` must follow a specific format (**no longer region-specific**)|Use the format `yyyymmddD`. For example, `20170825D`.|
|Use the `HttpClient` AL data type to call remote services over HTTP or HTTPS. Use HTTPS to protect data in transit.|[Call external services with HttpClient](devenv-httpclient.md)|
|Only JavaScript-based web client add-ins are supported. The compiler handles the zipping process automatically. Include the AL `controladdin` object and JavaScript sources, and build the app.|[Control add-ins](devenv-control-addin-object.md)|
|The .app file must be digitally signed.|[Sign an app package file](devenv-sign-extension.md)|
|Ensure that applicable controls have an `ApplicationArea`, either explicitly or through inheritance. Starting with Business Central 2022 release wave 2, controls on pages and request pages can inherit the page or report value. Controls added by extensions still require explicit values. When application areas are enabled in a session, controls without an applicable explicit or inherited value don't appear.|[ApplicationArea guidance](properties/devenv-applicationarea-property.md)|
|Your extension must provide permission sets that let users set up and use it. Users must not need SUPER permissions to set up or use your extension.|[Exporting permission sets](devenv-export-permission-sets.md)<br>[Managing users and permissions](/dynamics365/business-central/ui-how-users-permissions)|
|Before submitting for validation, ensure that you can publish/sync/install/uninstall/reinstall your extension. **This must be done in a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] environment**.|[How to publish your app](devenv-how-publish-and-install-an-extension-v2.md)|
|Thoroughly test your extension in a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] environment.|[Testing your extension](../compliance/apptest-testingyourextension.md)|
|Don't use `OnBeforeCompanyOpen` or `OnAfterCompanyOpen`.|[Replacement options](../compliance/apptest-onbeforecompanyopen.md)|
|Include upgrade code when changes require existing data to be transformed or initialized.|[Upgrading extensions](devenv-upgrading-extensions.md)|
|Pages and codeunits that are designed to be exposed as web services must not generate any UI that would cause an exception in the calling code.|[Web services usage](../compliance/apptest-webservices.md)|
|You're required to register affixes for your publisher name and to use them in your extension.|[Prefix/suffix guidelines](../compliance/apptest-prefix-suffix.md)|
|You're required to obtain an object ID range assigned to your partner and use IDs from that range in your extension.|[Object ranges](readiness/get-started.md#requesting-an-object-range)|
|We strongly recommend that you use automated testing with the AL Test Toolkit. You aren't required to include the test package with your extension.|[Test the advanced sample extension](devenv-extension-advanced-example-test.md)|
|Normal fields in non-temporary tables and table extensions must have a `DataClassification` other than `ToBeClassified`. FlowFields and FlowFilters are automatically classified as `SystemMetadata`. Temporary tables are exempt.|[Data classification requirement](analyzers/appsourcecop-as0016.md)|
|You must use `profile` objects to define profiles supplied by your extension instead of inserting records into the obsolete `Profile` table.|[Profile object](devenv-profile-object.md)|
|Use `addfirst` and `addlast` for placing your actions on Business Central pages. This reduces reliance on individual action anchors, but doesn't eliminate breaking changes caused by changes to the target page or anchor group.|[Placing actions and controls](devenv-page-ext-object.md#using-keywords-to-place-actions-and-controls)|
|The extension submitted must not be a runtime package.|[Creating runtime packages](devenv-creating-runtime-packages.md)|
|The extension submitted must use translation files.|[Working with translation files](devenv-work-with-translation-files.md)|
|The extension submitted must specify the `application` property in `app.json`.|The `application` property is required to compute the minimum release of Business Central targeted by your submission. Learn more in [Computation of releases for validation](#against-which-releases-of-business-central-is-your-submission-validated).|
|The extension submitted must have a unique app ID, specified by the `id` property in `app.json`.|Every extension must have a unique app ID. PTEs and Marketplace apps can't use the same app ID. Learn more in [Constraints on extension types](devenv-extension-types-and-scope.md#constraints-on-extension-types).|

## Technical validation performed by the Business Central services

The primary responsibility of the technical validation is to ensure that the [!INCLUDE [prod_short](includes/prod_short.md)] online service is stable and that the apps can be installed and run without destabilizing the service.

Technical validation is fully automated and checks package requirements and compatibility. It doesn't run your app's functional tests or manually verify its setup and usage scenarios. You're responsible for thoroughly testing your app.

> [!IMPORTANT]
> Run the self-validation described in this article before submitting apps for validation.

These steps apply to the main extension and the libraries it requires.

1. The service validates the manifest of all extensions in the submission. If any mandatory properties or required property values are missing, the service rejects the submission.
2. The registration of affixes for the publisher name of all the extensions in the submission is validated. If **the publisher name does not have any registered affixes, the submission is rejected.**
3. The signature of all extensions in the submission is validated. If any **extension is not signed or its signature is not valid, the submission is rejected.**
4. The consistency of the main extension information (name, publisher, version) is validated against the offer description. If any **differences are noticed, the submission is rejected.**
5. The extensions in the submission are validated. If **any runtime packages are present, the submission is rejected.**

After your extension passes these initial validation steps, the system computes the minimum release for your submission as described in [Computation of releases for validation](#against-which-releases-of-business-central-is-your-submission-validated).

For **each country/region and each release** targeted by your submission, the following steps are run **for each extension** in the submission:

1. If the extension with the same version has already been validated for the country/region, further validation for this extension is skipped.
2. The set of dependencies for your extension is resolved. **Any unresolved dependencies will cause the submission to be rejected. If you include extensions created by Microsoft in your submission, it will also be rejected.**

3. The set of baselines for your extension is resolved by using the [App Management API](../administration/appmanagement/app-management-api.md).
4. The extension is compiled against the set of dependencies resolved. If the **compilation fails, the submission is rejected.**
5. The extension is tested against the resolved baselines using the AppSourceCop analyzer. If any **violations or breaking changes are identified, the submission is rejected.**
6. If the **runtime version of the extension is not supported by the release targeted, the submission is rejected.**

> [!NOTE]
> You're required to include the dependencies for your extension as part of your submission only if you're submitting a newer version for them. If you don't include them in your submission, the system automatically downloads them if they're publicly available in [!INCLUDE [prod_short](includes/prod_short.md)] for the targeted countries/regions. If you're making your libraries available in new countries/regions, increase the version number.

Additionally, if the extension submitted isn't the latest version and a higher version is available in the Marketplace, additional validation is performed:

1. The next version of your extension and its dependencies are resolved using the [App Management API](../administration/appmanagement/app-management-api.md).
2. The system tests the next version of your extension against the version you submitted by using the AppSourceCop analyzer. If any violations or breaking changes are identified, the system rejects the submission.

If all extensions in the submission pass validation for each country/region and release without errors, the service accepts the submission.

## Running technical validation yourself

With the latest version of BcContainerHelper, you can run a single command, which should perform the same validation steps and give you a good indication of whether your apps pass validation or not:

```powershell
$validationResults = Run-AlValidation `
    -validateCurrent `
    -installApps @( "path/url to your foreign dependencies, apps which will not be part of the validation (or blank if this is the first)" ) `
    -previousApps @( "path/url to your previous version of the .app files (or blank if this is the first)" ) `
    -apps @( "path/url to the new version of the .app files" ) `
    -countries @( "countries/regions you want to validate against (f.ex. us,ca)" ) `
    -affixes @( "affixes you own (f.ex. fab,con)" ) `
    -supportedCountries @( "supported countries/regions (f.eks. us,ca)" )
$validationResults | Write-Host -ForegroundColor Red
```

You can specify all array parameters as a comma-separated string. AppSourceCop runs for each country or region, and it collects the output. Publishing and install or upgrade errors surface as exceptions and stop validation. Fix any reported errors and rerun validation. When validation finishes successfully, `$validationResults` is empty.

### Parameters

The following parameters can be used with the `Run-AlValidation` command:

- `-installApps`: Specify the path or URL to your foreign dependencies, apps which will not be part of the validation (or blank if this is the first).
- `-previousApps`: Specify the path or URL to your previous version of the .app files (or blank if this is the first).
- `-apps`: Specify the path or URL to the new version of the .app files.
- `-countries`: Specify the countries/regions you want to validate against (for example, us,ca).
- `-affixes`: Specify the affixes you own (for example, fab,con).
- `-supportedCountries`: Specify the supported countries/regions (for example, us,ca).
- `-vsixFile`: Specify the AL Language Extension version to use.
- `-skipVerification`: Skip verification of code signing certificates.

`-previousApps` and `-apps` can be an array of apps or a comma-separated string with app filenames. You can also specify .zip files that contain .app files, or URLs to .app or .zip files.

### Run-AlCops

`Run-AlValidation` calls `Run-AlCops` whenever it needs to run AppSourceCop. You can also run `Run-AlCops` separately in a running Docker container. In this example, replace the archive paths with .zip files containing your previous and current app packages. Set `$credential` to the container credentials, and adjust the container name, affix, and countries/regions for your app.

```powershell
$validationResults = Run-AlCops `
    -containerName my2 `
    -credential $credential `
    -enableAppSourceCop `
    -previousApps @( "C:\MyApps\Previous\apps.zip" ) `
    -apps @( "C:\MyApps\Current\apps.zip" ) `
    -affixes @("hw") `
    -supportedCountries @("us")
```

You can add CodeCop and UICop analyzers to the call and specify a custom ruleset in the `rulesetFile` parameter. If you're validating for Marketplace, the default Marketplace validation ruleset is used.

Include the app and all library apps in both `previousApps` and `apps`. Include all countries/regions that you want to validate.

> [!NOTE]
> `Run-AlValidation` can't verify whether your affixes are registered with Microsoft using your MPN ID and app publisher name. Ensure that registration is in place.

> [!IMPORTANT]
> The computer on which you run this command must have Docker and the latest `BcContainerHelper` PowerShell module installed and be able to run [!INCLUDE [prod_short](includes/prod_short.md)] on Docker.
>
> You can use [Azure VM setup for Business Central on Docker](https://aka.ms/getbc?artifacturl=bcartifacts%2fsandbox%2f%2fus%2flatest) to create an Azure VM, which has all prerequisites installed to run [!INCLUDE [prod_short](includes/prod_short.md)] on Docker.

> [!NOTE]
> We recommend that all partners set up DevOps processes to run validation automatically and regularly.
>
> Learn more about setting up DevOps processes in [AL-Go for GitHub](https://aka.ms/AL-Go).

## How to get more information on the technical validation failures?

Detailed validation results are automatically logged to telemetry in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource specified in the manifest of the main extension in your submission.

To enable partner telemetry in your extension, specify the `applicationInsightsConnectionString` property in the `app.json` manifest. Learn more about this property in [JSON files](devenv-json-files.md).

To analyze your validation results, use the [Marketplace submission results troubleshooting guide](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/TroubleShootingGuides/D365BC%20Troubleshooting%20Guides%20(TSG)/content/AppSource-Submission-TSG.ipynb).

Learn more about the signals sent to telemetry during the technical validation in [Analyzing Marketplace submission validation telemetry](../administration/telemetry-appsource-submission-validation-trace.md).

> [!NOTE]
> You can set up alerts on validation telemetry. For example, you can send a daily or weekly notification to Teams or email about validation failures across all your apps. Learn more in [Alerting on telemetry](../administration/telemetry-alert.md).


## Against which releases of Business Central is your submission validated?

When you submit an extension to the Marketplace, the validation process checks the extension for all countries and regions you specify in the submission, and for all releases you target in the submission. As part of the validation, the process determines the minimum release for your submission. The validation process then checks the extension for all releases from this minimum release up to the current release in production. For example, if the minimum release for your submission is 18.0 and the latest minor release in production is 18.3, the validation process checks your submission against versions 18.0, 18.1, 18.2, and 18.3.

Thirty days before a new major release, the validation process also checks submissions against the upcoming release.

The validation process determines the minimum release for your submission based on the `application` property in your extension's `app.json` file.

> [!NOTE]
> If multiple extensions are contained in your submission, the minimum release for the submission is the highest minimal release computed for each of the extensions in the submission.

> [!NOTE]
> The telemetry sent during the technical validation contains details about validation success/failure against each release of Business Central specified above. Learn more in [Analyzing Marketplace submission validation telemetry](../administration/telemetry-appsource-submission-validation-trace.md).


> [!Important]
> The minimum release computed for your submission also defines the availability in Business Central of all the extensions in your submission.
>
> For example, if the minimum release computed is 18.1, your extensions will be available starting from release 18.1.

### Example

If you define your extension's manifest as follows, the minimum release where you can install your extension is 18.0. The manifest requires version 18.0.0.0 or later of the Application extension.

```json
{
  "application": "18.0.0.0"
}
```

The minimum release of the extension is then 18.0.

Marketplace extensions must use the `application` property instead of explicit dependencies on the `Base Application` and `System Application`. Learn more in [The Microsoft_Application.app file](devenv-application-app-file.md) and [AS0085](analyzers/appsourcecop-as0085.md).

<!-- ### How to specify a maximum release for your extension?

To specify the maximum release for your extension, you must include a file named `submissionManifest.json` along with your libraries in Partner Center. This submission manifest allows you to specify the release for which your extension should stop being validated.

For instance, the following submission manifest indicates that the extension will be validated for all releases versions from the minimum release version until 18.0 excluded. If the minimum release for the submission is 17.3, this means that this extension will be validated for 17.3, 17.4, and 17.5.

```JSON
{
  "incompatibleFromRelease": "18.0"
}
``` 

> [!Important]
> The maximum release specified for your submission also defines the availability of all the extensions in your submission as they will be marked as incompatible from this release.
>
> For example, if the maximum release specified is 18.0, your extensions will not be available for environments running on 18.0 or higher.
>
> If you don't provide a version of your extension that's compatible with this release of Business Central, your extension causes a failure to upgrade the environments where your extension is installed. Learn more about maintaining extensions in [Maintain Marketplace apps and per-tenant extensions in Business Central online](app-maintain.md).

### When should you specify a maximum release for your extension?

The `incompatibleFromRelease` property is meant to help you release a HotFix of your extension in production.

Suppose your Marketplace extension is available for tenants on releases from 17.0 to 17.5 with version 1.0.0.0 and is available for release 18.0 with version 2.0.0.0. You're now required to release a bug fix for customers on releases 17.0 to 17.5 that are using version 1.0.0.0. If you submit a version 3.0.0.0 of your extension, the validation process checks for breaking changes against version 2.0.0.0 and validates all releases from 17.0 to 18.0. However, it's not always possible to have one version of an extension that is compatible with all releases of Business Central.

In this case, you can create a version 1.0.0.1 of your extension and submit it with `incompatibleFromRelease` set to 18.0. This version of the extension will then only be validated for releases 17.0 to 17.5 and will be validated for breaking changes against version 1.0.0.0.

> [!IMPORTANT]
> You must not introduce new tables or tables fields as a HotFix of your extension as this will prevent environments where this extension is installed to be updated to the next release of Business Central.

-->

## Related information

[Developing [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]s](devenv-dev-overview.md)  
[Analyzing Marketplace submission validation telemetry](../administration/telemetry-appsource-submission-validation-trace.md)  
