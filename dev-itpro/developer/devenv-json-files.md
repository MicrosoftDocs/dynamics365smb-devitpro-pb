---
title: "JSON Files"
description: "Description of the settings of the app and launch JSON files for AL in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# JSON Files

In an AL project there are two JSON files; the `app.json` file and the `launch.json` file that are generated automatically when you start a new project. The `app.json` file contains information about the extension that you are building, such as publisher information and specifies the minimum version of base application objects that the extension is built on. Often the `app.json` file is referred to as the manifest. The `launch.json` file contains information about the server that the extension launches on.  

> [!NOTE]  
> For information about data migration and creating a `migration.json` file, see [The Migration.json File](devenv-migration-json-file.md).

> [!IMPORTANT]  
> The `rad.json` and the `snapshots.json` files should not be modified.

## <a name="Appjson"></a>App.json file

The following table describes the settings in the `app.json` file. For an example `app.json` file, see [Business Central Performance Toolkit](https://github.com/microsoft/ALAppExtensions/edit/master/Modules/DevTools/BusinessCentralPerformanceToolkit/app.json).

|Setting|Mandatory|Value|
|-------|---------|-----|
|id|Yes|The unique ID of the extension. When the `app.json` file is automatically created, the ID is set to a new GUID value. <br>**Note:** The appId is used at runtime to bind table names contained in the application. Changing the appId will result in data from old tables not being used.|
|name|Yes|The unique extension name.|
|publisher|Yes|The name of your publisher, for example: **NAV Partner**, **LLC**.|
|brief|No, but required for AppSource submission|Short description of the extension.|
|description|No, but required for AppSource submission|Longer description of the extension.|
|version|Yes|The version of the app package.|
|privacyStatement|No, but required for AppSource submission|URL to the privacy statement for the extension.|
|EULA|No, but required for AppSource submission|URL to the license terms for the extension.|
|help|No, but required for AppSource submission|URL to an online description of the extension. The link is used in AppSource and can be the same as the value of the `contextSensitiveHelpUrl` property or a different link, such as a link to your marketing page.|
|url|No, but required for AppSource submission|URL of the extension package.|
|logo|No, but required for AppSource submission|Relative path to the app package logo from the root of the package.|
|dependencies|No|List of dependencies for the extension package. For example: `"dependencies": [ {"id": "4805fd15-75a5-46a2-952f-39c1c4eab821", "name": "WeatherLibrary", "publisher": "Microsoft", "version": "1.0.0.0"},{}]`. <br>**Note:** For dependencies to the System Application and Base Application these are no longer listed as explicit dependencies, but captured in the `application` setting as a reference to the application package. Must be filled in with the version number of the Application package. See `application` below. <br>**Note:** The version specified defines the minimum version for the dependency. At runtime and when downloading symbols, the latest version of the dependency satisfying the specified name, publisher and, minimum version will be returned. When `runtime` is set to 4.0 or earlier, use `appId` instead of `id`.|
|screenshots|No|Relative paths to any screenshots that should be in the extension package.|
|platform|Yes, if system tables are referenced in the extension|The minimum supported version of the platform symbol package file, for example: "16.0.0.0". See the [Symbols](devenv-symbols.md) for the list of object symbols contained in the platform symbol package file.|
|application|Yes, if base application is referenced in the extension|The supported version of the system and base application package file, for example: "16.0.0.0". The file name of this reference is Microsoft_Application.app and the `name` is `Application`. For code-customized base applications, the Microsoft_Application.app file can be modified to reference the code-customized base application instead. It is important to keep `"name": "Application"` in the extension, but information about publisher can be changed and the .app file can be renamed. For more information, see [The Microsoft_Application.app File](devenv-application-app-file.md).|
|idRange|Yes|For example: `"idRange": {"from": 50100,"to": 50149}`. A range for application object IDs. For all objects outside the range, a compilation error will be raised. When you create new objects, an ID is automatically suggested.|
|idRanges|Yes|For example: `"idRanges": [{"from": 50100,"to": 50200},{"from": 50202,"to": 50300}]`. A list of ranges for application object IDs. For all objects outside the ranges, a compilation error will be raised. When you create new objects, an ID is automatically suggested. You must use *either* the `idRange` *or* the `idRanges` setting. Overlapping ranges are not allowed and will result in a compilation error. |
|showMyCode|No|This is by default set to `false` and not visible in the manifest. To enable viewing the source code when debugging into an extension, add the following setting: `"showMyCode": true`|
|target|No|By default this is `Cloud`. The setting currently has the following options: `Internal`, `Extension`, `OnPrem`, and `Cloud`. The `Internal` and `Extension` settings are being deprecated with runtime 4.0 and replaced by the `OnPrem` and `Cloud` respectively. For on-premises, you can set this to `OnPrem` to get access to otherwise restricted APIs and .NET Interop. The Business Central Server setting must then also be set to `OnPrem`. **Note:** System tables that have the [Scope](properties/devenv-scope-property.md) property set to `Internal`/`OnPrem` cannot be accessed from extensions that have `target` set to `Cloud`/`External` through direct reference or through RecordRef. For more information, see [Compilation Scope Overview](devenv-compilation-scope-overview.md)|
|contextSensitiveHelpUrl|No, but required for AppSource submission|The URL for the website that displays context-sensitive Help for the objects in the app, such as `https://mysite.com/documentation/`. If the app does not support all locales currently supported by [!INCLUDE [prod_short](includes/prod_short.md)], then include a parameter for the locale in this URL, `/{0}/`, and also specify the relevant locales in the `supportedLocales` setting.|
|helpBaseUrl|No|The URL for the website that overtakes all Help for the specified locales. This property is intended for localization apps specifically since the setting overwrites the default URL of `/{0}/dynamics365/business-central`. If you set this value, you must also specify one or more languages in the `supportedLocales` setting.|
|supportedLocales|No|The list of locales that are supported in your Help if different from all locales. The value on the list is inserted into the URL defined in the `contextSensitiveHelpUrl` and `helpBaseUrl` properties. The first locale on the list is default. An example is `"supportedLocales": ["da-DK", "en-US"]` for an app that supports only Danish and English (US).|
|runtime|Yes|The version of the runtime that the project is targeting. The project can be published to the server with an earlier or the same runtime version. The available options are: <br>`1.0` - Business Central April 2018 Release <br>`2.0` - Business Central Fall '18 Release <br>`3.0` - Business Central Spring '19 Release <br> `4.0` - Business Central 2019 release wave 2 <br> `5.0` - Business Central 2020 release wave 1 <br>`6.0` - Business Central 2020 release wave 2 <br>`6.1` - Business Central 2020 release wave 2 update 17.1 <br> `6.2` - Business Central 2020 release wave 2 update 17.2 <br> `6.3` - Business Central 2020 release wave 2 update 17.3 <br> `6.4` - Business Central 2020 release wave 2 update 17.4|
|features|No|Specifies a list of options.<br><br> The `TranslationFile` option generates a `\Translations` folder that is populated with the .xlf file that contains all the labels, label properties, and report labels that you are using in the extension. The `GenerateCaptions` option depends on the `TranslationFile` setting. It generates captions for objects that do not have a `Caption` or `CaptionML` specified, these are then written to the .xlf file.<br><br> The `GenerateLockedTranslations` flag is used to generate `<trans-unit>` elements in the XLIFF file for locked labels. The syntax is `"features": [ "TranslationFile", "GenerateCaptions", "GenerateLockedTranslations" ]`. For more information, see [Working with Translation Files](devenv-work-with-translation-files.md).<br><br>When the `NoImplicitWith` flag is specified, `ImplicitWith` will be disabled by default. This flag is useful when all code has been rewritten to avoid any future usage of `ImplicitWith`. For more information, see [Pragma ImplicitWith](directives/devenv-directive-pragma-implicitwith.md) and [Deprecating Explicit and Implicit With Statements](devenv-deprecating-with-statements-overview.md).|
|internalsVisibleTo|No|Specifies a list of modules that have access to the objects that are marked as `Internal` using the **Access** property from the current module.<br> The syntax is `{   "appId": "d6c3f231-08d3-4681-996f-261c06500e1a", "name": "TheConsumer", "publisher": "Microsoft"}]`. For more information see [Access Property](properties/devenv-access-property.md) and [InternalEvent Attribute](methods/devenv-internal-attribute.md). **Note:** Using `internalsVisibleTo` in Business Central online will throw a warning from AppSourceCop and PTECop. `Access = Internal` is *not* designed as a security boundary, but for API development.|
|propagateDependencies|No|Specifies whether the dependencies of this project should be propagated as direct dependencies of projects that depend on this one. Default is `false`. If set to `true` then any dependencies of the current package will be visible to consumers of the package. For example, if A depends on B that depends on C, by default, A will not be able to use types defined in C. If B has `"propagateDependencies" : "true"`, then A will be able to use types defined in C without taking a direct dependency.<br>**Note:** `propagateDependencies` applies to all dependencies, there is no option to exclude specific dependencies.|
|preprocessorSymbols|No|Defines any symbols to use with preprocessor directives. The syntax is `"preprocessorSymbols": [ "DEBUG" ]`. For more information, see [Preprocessor Directives in AL](directives/devenv-directives-in-al.md).|
|applicationInsightsKey|No|The instrumentation key of the Azure Application Insights resource for monitoring operations, for example, like app secrets retrieval by extensions. <br><br>For more information, see [Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md).|
|keyVaultUrls|No|List of URLs of key vaults that the extension from which the extension can retrieve secrets. For example: `"keyVaultUrls": [ "https://myfirstkeyvault.vault.azure.net", "https://mysecondkeyvault.vault.azure.net" ]`. <br><br>For more information, see [App Key Vaults](devenv-app-key-vault-overview.md).|
|suppressWarnings|No|Specifies that warnings issued by, for example, a specific analyzer rule should not be shown in the **Output** window. Syntax is `"suppressWarnings": [<warning ID>,<warning ID2>,...]`. For example `"suppressWarnings": [ "AL0458" ]`. It is also possible to use `#pragma` directives for suppressing warnings for specific areas of code. For more information, see [Pragma Warning Directive](directives/devenv-directive-pragma-warning.md) and [Suppressing Warnings](devenv-deprecating-with-statements-overview.md#suppressing-warnings).|


## <a name="Launchjson"></a>Launch.json file

The following table describes the settings in the `launch.json` file. The `launch.json` file has two configurations depending on whether the extension is published to a local server or to the cloud.

### Publish to local server settings

|Setting|Mandatory|Value|
|-------|---------|-----|
|name|Yes|"Your own server"|
|type|Yes|Must be set to `".al"`. Required by Visual Studio Code.|
|request|Yes|Request type of the configuration. Can be set to `"launch"` or `"attach"` . Required by Visual Studio Code. For more information, see [Attach and Debug Next](devenv-attach-debug-next.md).|
|server|Yes|The HTTP URL of your server, for example: `"https://localhost|serverInstance"`|
|port|No|The port assigned to the development service.|
|serverInstance|Yes|The instance name of your server, for example: `"US"`|
|authentication|Yes|Specifies the server authentication method and can be set to `"UserPassword"`, `"Windows"`, or `"AAD"`. Currently, AAD authentication is supported only for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] sandboxes. AAD authentication cannot be used for on-premise servers.|
|startupObjectType|No|Specifies whether the object to open after publishing is a Page type (`"Page"`) or Table type (`"Table"`) object. The default is `"Page"`.|
|startupObjectId|No|Specifies the ID of the object to open after publishing. Only objects of type Page and Table are currently supported.|
|schemaUpdateMode|No|Specifies the data synchronization mode when you publish an extension to the development server, for example: <br>`"schemaUpdateMode": "Recreate"`</br> The default value is Synchronize. For more information, see [Retaining table data after publishing](devenv-retaining-data-after-publishing.md)  <br>[!INCLUDE[nav_not_supported](includes/nav_not_supported.md)]  |
|environmentType|No|Specifies which type of environment to use to connect to [!INCLUDE [prod_short](includes/prod_short.md)]. Possible values are `OnPrem`, `Sandbox`, or `Production`.|
|environmentName|No|Specifies which named production or sandbox environment to use in cases where multiple sandboxes are owned by the same tenant.|
|breakOnError | No |Specifies whether to break on errors when debugging. The default value is `true`. |
|breakOnNext| No | Specifies the session type that the server will connect to. The options are:<br> `WebserviceClient` - web API-based client including ODdata and SOAP clients, <br>`WebClient` - standard web client,<br> `Background` - background sessions, such as job queues, see [Task Scheduler](devenv-task-scheduler.md). <br><br>This setting applies to [Attach and Debug Next](devenv-attach-debug-next.md) and to [Snapshot Debugging](devenv-snapshot-debugging.md).<br><br> For *Attach* debugging, `breakOnNext` defines the next client session that the debug engine will attach to for the same user who has initiated an attach debug session from Visual Studio Code.<br><br>For *Snapshot* debugging, `breakOnNext` defines the next session to hook AL code execution recording for a given user on a tenant, or if this is not specified with the userId in the configuration settings; the first user on the tenant.|
|breakOnRecordWrite | No |Specifies if the debugger breaks on record changes. The default value is `false`.| 
|launchBrowser|No|Specifies whether to open a new tab page in the browser when publishing the AL extension (Ctrl+F5). The default value is `false`. If the value is not specified or set to `true`, the session is started. If the value is explicitly set to `false`, the session is not started unless you launch your extension in debugging mode.|
|enableSqlInformationDebugger|Yes|Specifies whether the debugger shows the SQL information. The default value is `true`. For more information, see [Debugging SQL behavior](devenv-debugging.md#DebugSQL).|
|enableLongRunningSqlStatements|Yes|Specifies whether the debugger enables long running SQL statements in the debugger window.|
|longRunningSqlStatementsThreshold|Yes|Sets the number of milliseconds spent before a SQL statement is considered as long running in the debugger.|
|numberOfSqlStatements|Yes|Sets the number of SQL statements to be shown in the debugger.|
|dependencyPublishingOption|No|Available options are: <br>`Default` - set dependency publishing will be applied <br> `Ignore` - dependency publishing is ignored <br> `Strict` - dependency publishing will fail if there are any apps that directly depend on the startup project and these apps are not part of the workspace. For more information, see [Working with multiple projects and project references](devenv-work-workspace-projects-references.md).|
|disableHttpRequestTimeout|No|Specifies if the default setting for HTTP request timeout in Visual Studio Code is switched off. The default value is `false`. If the value is set to `true` requests can run without timeout.|
|attach| No| Sets the session to attach to. There are two options; `Attach to the next client on the cloud sandbox` and `Attach to the next client on your server`. Use the first option to attach to a cloud session, and the second option to attach to a local server. For more information, see [Attach and Debug Next](devenv-attach-debug-next.md).|
|forceUpgrade|No| Always run upgrade codeunits, even if the version number of the extension is the same as an already installed version. This can be useful for troubleshooting upgrade issues. <br><br>**Note:** The `forceUpgrade` setting requires the package ID to be changed.|
|useSystemSession|No|Runs install and upgrade codeunits in a system session. This will prevent debugging install and upgrade codeunits.|
|snapshotFileName|No|Specifies the snapshot file name used when snapshot debugging files are saved. For more information, see [Snapshot Debugging](devenv-snapshot-debugging.md).|


### Publish to cloud settings

|Setting|Mandatory|Value|
|-------|---------|-----|
|name|Yes|"Microsoft cloud sandbox"|
|type|Yes|Must be set to `"al"`. Required by Visual Studio Code.|
|request|Yes|Request type of the configuration. Must be set to `"launch"`. Required by Visual Studio Code.|
|startupObjectType|No|Specifies whether the object to open after publishing is a Page type (`"Page"`) or Table type (`"Table"`) object.  The default is `"Page"`.|
|startupObjectId|No|Specifies the ID of the object to open after publishing. Only objects of type Page and Table are currently supported.|
|tenant|No|Specifies the tenant to which the package is deployed. If you specify multiple configurations, a drop-down of options will be available when you deploy. This parameter must contain a tenant AAD domain name, for example `mycustomer.onmicrosoft.com`.|
|environmentType|No|Specifies which type of environment to use to connect to [!INCLUDE [prod_short](includes/prod_short.md)]. Possible values are `OnPrem`, `Sandbox`, or `Production`.|
|environmentName|No|Specifies which named production or sandbox environment to use in cases where multiple sandboxes are owned by the same tenant.|
|applicationFamily|No (Yes for Embed apps)|The application family in the cloud server, for example `Fabrikam`. This property is reserved for Embed apps.|
|breakOnError | No |Specifies whether to break on errors when debugging. The default value is `true`. | 
|breakOnNext| No | Specifies the session type that the server will connect to. The options are:<br> `WebserviceClient` - web API-based client including OData and SOAP clients, <br>`WebClient` - standard web client,<br> `Background` - background sessions, such as job queues, see [Task Scheduler](devenv-task-scheduler.md). <br><br>This setting applies to [Attach and Debug Next](devenv-attach-debug-next.md) and to [Snapshot Debugging](devenv-snapshot-debugging.md).<br><br> For *Attach* debugging, `breakOnNext` defines the next client session that the debug engine will attach to for the same user who has initiated an attach debug session from Visual Studio Code.<br><br>For *Snapshot* debugging, `breakOnNext` defines the next session to hook AL code execution recording for a given user on a tenant, or if this is not specified with the userId in the configuration settings; the first user on the tenant.|
|breakOnRecordWrite | No |Specifies if the debugger breaks on record changes. The default value is `false`.| 
|launchBrowser|No|Specifies whether to open a new tab page in the browser when publishing the AL extension (Ctrl+F5). The default value is `false`. If the value is not specified or set to `true`, the session is started. If the value is explicitly set to `false`, the session is not started unless you launch your extension in debugging mode.|
|enableSqlInformationDebugger|Yes|Specifies whether the debugger shows the SQL information. The default value is `true`. For more information, see [Debugging SQL behavior](devenv-debugging.md#DebugSQL).|
|enableLongRunningSqlStatements|Yes|Specifies whether the debugger enables long running SQL statements in the debugger window.|
|longRunningSqlStatementsThreshold|Yes|Sets the number of milliseconds spent before a SQL statement is considered as long running in the debugger.|
|numberOfSqlStatements|Yes|Sets the number of SQL statements to be shown in the debugger.|
|dependencyPublishingOption|No|Available options are: <br>`Default` - set dependency publishing will be applied <br> `Ignore` - dependency publishing is ignored <br> `Strict` - dependency publishing will fail if there are any apps that directly depend on the startup project and these apps are not part of the workspace. For more information, see [Working with multiple projects and project references](devenv-work-workspace-projects-references.md).|
|disableHttpRequestTimeout|No|Specifies if the default setting for HTTP request timeout in Visual Studio Code is switched off. The default value is `false`. If the value is set to `true` requests can run without timeout.|
|attach|No | Sets the session to attach to. There are two options; `Attach to the next client on the cloud sandbox` and `Attach to the next client on your server`. Use the first option to attach to a cloud session, and the second option to attach to a local server. For more information, see [Attach and Debug Next](devenv-attach-debug-next.md).|


## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Debugging in AL](devenv-debugging.md)  
[Security Setting and IP Protection](devenv-security-settings-and-ip-protection.md)  
[AL Language Extension Configuration](devenv-al-extension-configuration.md)  
[Configure Context-Sensitive Help](../help/context-sensitive-help.md)  
[App Key Vaults](devenv-app-key-vault-overview.md)
