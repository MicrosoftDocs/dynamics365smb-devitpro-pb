---
title: "Step 3 - How to Develop Your App"
description: ""
author: solsen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: solsen
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

<!-- Topic redirected to developer/devenv-checklist-submission with same information -->

# Step 3 - How to Develop Your App

The following table is a checklist of all requirements that you **must meet before submitting** an extension for validation. If you do not meet these mandatory requirements, your extension will fail validation.  

## Technical Checklist for Submitting Your App

|Requirement|Example/Guidance|
|-----------|----------------|
|Develop your extension in Visual Studio Code.|[Developing [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)]s](devenv-dev-overview.md)|
|The app.json file has mandatory settings that you must include. Here you can also read more about dependency syntax and multiple countries per a single app syntax.|[Mandatory app.json settings](devenv-json-files.md)|
|Coding of `Date` must follow a specific format (**no longer region-specific**)|Use the format `yyyymmddD`. For example, `20170825D`.|
|Remote services (including all Web services calls) can use either HTTP or HTTPS. However, HTTP calls are only possible by using the HttpRequest AL type.|[Guidance on HTTP use](devenv-restapi-overview.md)|
|Only JavaScript based Web client add-ins are supported. The zipping process is handled automatically by the compiler. Simply include the new AL `controladdin` type, JavaScript sources, and build the app.|[Control Add-Ins](devenv-control-addin-object.md)|
|The .app file must be digitally signed.|[Signing an APP Package File](devenv-sign-extension.md)|
|The user scenario document must contain detailed steps for all setup and user validation testing.|[User Scenario Documentation](../compliance/apptest-userscenario.md)|
|Set the application areas that apply to your controls. Failure to do so will result in the control not appearing in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].|[Application Area guidance](properties/devenv-applicationarea-property.md)|
|Permission set(s) must be created by your extension and when marked, should give the user all setup and usage abilities. A user must not be required to have SUPER permissions for setup and usage of your extension.|[Exporting Permission Sets](devenv-export-permission-sets.md)<br>[Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions)|
|Before submitting for validation, ensure that you can publish/sync/install/uninstall/reinstall your extension. **This must be done in a [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] environment**.|[How to publish your app](devenv-how-publish-and-install-an-extension-v2.md)|
|Thoroughly test your extension in a [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] environment.|[Testing Your Extension](../compliance/apptest-testingyourextension.md)|
|Do not use `OnBeforeCompanyOpen` or `OnAfterCompanyOpen`|[Replacement Options](../compliance/apptest-onbeforecompanyopen.md)|
|Include the proper upgrade code allowing your app to successfully upgrade from version to version.|[Upgrading Extensions](devenv-upgrading-extensions.md)|
|Pages and code units that are designed to be exposed as Web services must not generate any UI that would cause an exception in the calling code.|[Web Services Usage](../compliance/apptest-webservices.md)|
|You are required to prefix or suffix the **Name** of your fields and objects. This eliminates collision between apps.|[Prefix/Suffix Guidelines](../compliance/apptest-prefix-suffix.md)|
|You are required to include a Visual Studio Code test package with your extension. Ensure that you include as much code coverage as you can.|[Testing the Advanced Sample Extension](devenv-extension-advanced-example-test.md)|
|DataClassification is required for fields of all tables/table extensions. Property must be set to other than `ToBeClassified`.|[Classifying Data](devenv-classifying-data.md)|
|You must use the Profile object to add profiles instead of inserting them into the **Profiles** table.|[Profile Object](devenv-profile-object.md)|
|Use `addfirst` and `addlast` for placing your actions on Business Central pages. This eliminates breaking your app due to Business Central core changes.|[Placing Actions and Controls](devenv-pages-overview.md#using-keywords-to-place-actions-and-controls)|

<!-- 
|Permission set(s) must be created by your extension and when marked, should give the user all setup and usage abilities. A user must not be required to have SUPER permissions for setup and usage of your extension.|[Packaging the Permission Set](/powershell/module/microsoft.dynamics.nav.apps.tools/new-navapppackage?view=dynamicsnav-ps-2017)| , [How to: Export Permission Sets](../How-to-Import-Export-Permission-Sets-Permissions.md) |
-->

## See Also

[Developing Extensions](../devenv-dev-overview.md)  
[Business Central Learning Catalog](https://go.microsoft.com/fwlink/?linkid=2002101)  
