---
title: "Resource Exposure Policy Setting"
description: Explains how to set the resource exposure policy for allowing download or debugging into extension to see the source code.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/10/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
---

# Resource Exposure Policy Setting

[!INCLUDE[2021_releasewave2_changed](../includes/2021_releasewave2_changed.md)]

When you develop an extension, your code is protected against downloading or debugging by default. Read below about adding Intellectual Property (IP) protection against downloading or debugging into an extension to see the source code in the extensions.

The extension development package provides a pre-configured setting for protection against viewing or downloading the code of the extensions. However, this setting can also be controlled in the manifest; the `app.json` file.

## The properties of the resource exposure policy

> [!NOTE]  
> With [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 2, the `ShowMyCode` setting has been replaced by the `resourceExposurePolicy` setting which offers a richer access control. The `ShowMyCode` will be deprecated in a future release and can't be used together with the `resourceExposurePolicy` setting. If `ShowMyCode` is set, default values for `resourceExposurePolicy` will be applied (`false`).

When you start a new project, an `app.json` file is generated automatically, which contains the information about the extension that you're building. In the `app.json` file, you can specify a setting called `resourceExposurePolicy` that defines the accessibility of the resources and source code during different operations. `resourceExposurePolicy` specifies the following list of options: `applicableToDevExtension`, `allowDebugging`, `allowDownloadingSource`, and `includeSourceInSymbolFile`. Each of these properties defines the specific areas in which the source code of an extension can be accessed. All of the options are by default set to `false`, which means that by default, no dependent extension can debug or download the source code of your extension. The syntax of the `resourceExposurePolicy` setting is as follows:

```al
`"resourceExposurePolicy": {"applicableToDevExtension": <boolean>, "allowDebugging": <boolean>, "allowDownloadingSource": <boolean>, "includeSourceInSymbolFile": <boolean>}`
```

> [!NOTE]  
> The `resourceExposurePolicy` setting isn't visible in the `app.json` file when it is generated. If you want to change the default value from `false`, you must add the setting as shown in the syntax example above.

### applicableToDevExtension

[!INCLUDE [2022_releasewave2](../includes/2022_releasewave2.md)]

With the `applicableToDevExtension` flag, you can specify if all resource exposure policies specified for the extension also apply to developer extensions, by setting the value to `true`.

### allowDebugging

To allow debugging into your extension, you must set the `allowDebugging` flag when the extension is taken as a dependency, otherwise debugging isn't allowed. The default value of `allowDebugging` is `false`. 

> [!NOTE]  
> The **AL: Go!** template sets `allowDebugging` to `true`.

If you want to allow debugging into your extension to view the source code, the `allowDebugging` property in the `app.json` file must be set to `true`. For example, if someone develops an extension A and another person develops an extension B, where B depends on A, then debugging B will only step into the code for A, if a method from A is called and if the `allowDebugging` flag is set to `true` in the `app.json` file for extension A as shown in the example below. By adding this setting, you *enable debugging* into an extension to view the source code and variables when that extension is set as a dependency.

```json
`"resourceExposurePolicy": {"allowDebugging": true}`
```

> [!NOTE]  
> `allowDebugging` doesn't apply to [Profiles](devenv-profile-object.md), [Page Customizations](devenv-page-customization-object.md) and [Views](devenv-views.md), because these objects can't define any custom logic in procedures or triggers. The code for Profiles, Page Customizations, and Views defined in an extension with `allowDebugging` set to `false` can still be accessed and copied using [Designer](devenv-inclient-designer.md).

#### The [NonDebuggable] attribute

Unless, you've specified the `[NonDebuggable]` attribute on methods and variables, setting the `allowDebugging` to `true` will allow stepping into this code. If you, however, have marked the methods and variables with the `[NonDebuggable]` attribute, these will remain non-debuggable. For more information, see [NonDebuggable Attribute](attributes/devenv-nondebuggable-attribute.md).


#### When should I set `allowDebugging` to `true`?

The default value of the `allowDebugging` flag is `false`. If `allowDebugging` is set to `true`, anyone who extends your code can debug it.

It's, however, not possible to allow both, debugging and **Go to Definition**, and still protect source from being extracted through the debug experience, for example, by using third party Visual Studio Code tools. For AppSource apps, if you want to protect your IP, it's recommended to limit access to the source by setting the `resourceExposurePolicy` flags to `false`. Then rely on the ability to grant yourself and optionally trusted reseller partners time-limited individual access through the dynamic override of the resource policy. For more information, see [Override the resource policy](devenv-security-settings-and-ip-protection.md#override-the-resource-policy) in this article.

For per-tenant extensions, if the customer owns the IP and approves of exposing it, it's recommended to at least allow debugging and include source in symbols to make troubleshooting, extracting IP from the service, and working across resellers easier.

#### When can code be viewed even though the `allowDebugging` flag is set to `false`?

Someone will still be able to view your code if an extension is deployed through Visual Studio Code as a **DEV extension**, as opposed to deployed using a cmdlet, by using the **Extension Management** page in [!INCLUDE [prod_short](includes/prod_short.md)] or via AppSource.
 
### allowDownloadingSource

When this flag is set to `true` in the `app.json` file of extension A, the source code and any media files of extension A can be downloaded, for example, from the **Download Source** option in the **Extension Management** page in [!INCLUDE[prod_short](includes/prod_short.md)]. Extension A can be a PTE or a DEV extension. The default value of `allowDownloadingSource` is `false`.

### includeSourceInSymbolFile

When this flag is set to `true` in the `app.json` file of extension A, the downloaded symbol file in Visual Studio Code, which is accessed by using the **Downloading Symbols** functionality, contains symbols, source code, and all other resources of extension A. When `includeSourceInSymbolFile` is set to `false`, the source isn't available in the symbol files and you can't use **Go to Definition** to view source. You can, however, still extend, get IntelliSense for, and call functionality in extension A by relying on its exposed symbols and signatures. The default value of `includesourceInSymbolFile` is `false`.

### Example JSON file

Example JSON file with default values when generated by using the **AL: Go!** command.

```json
...
"resourceExposurePolicy": {
    "allowDebugging": true, 
    "allowDownloadingSource": false, 
    "includeSourceInSymbolFile": false
  },
  "runtime": "8.0",
  "keyVaultUrls": [
    "https://mykeyvault.vault.azure.net"
  ],
  "applicationInsightsConnectionString": "MyConnectionString1234"
...
```


## Override the resource policy

The resource exposure override can be used to dynamically grant access to the users. Overriding the policy is useful, if you've, for example, set the `allowDebugging` flag to `false` in your `app.json` file, but you want to allow specific Azure AD tenants access temporarily. If you don't specify anything in the `BC-ResourceExposurePolicy-Overrides` secret described below, then no one can debug your code if `allowDebugging` is set to `false`. On the contrary, if you've set `allowDebugging` to `true` in your `app.json` file, then it doesn't matter what you specify in the `BC-ResourceExposurePolicy-Overrides` secret, anyone will be able to debug into that code.

### Requirements for overriding the resource policy

It's a requirement to enable overriding the resource policy, that you have a key vault set up. Setting up a key vault is an onboarding process that is described in the links below. Follow the guidelines for keeping your key vault safe. If the key vault is used for multiple purposes, you can create different policies for access to override the secret in the key vault. 

> [!NOTE]
> Remember to register *all* apps that should access your key vaults, it's not enough to just add the key vault setting to your `app.json` manifest files.

> [!IMPORTANT]  
> Resource exposure policy overrides can be used to dynamically grant users of a given AAD tenant ID access. However, the users performing the action, such as debugging, must be delegated admins on the target environment. In addition, you must specify the `tenant` property in the `launch.json` file. The `tenant` property must be set to the target tenant ID. For more information, see [JSON Files](devenv-json-files.md#publish-to-cloud-settings).

For more information, see [Using Key Vault Secrets in Business Central Extensions](devenv-app-key-vault-overview.md) and [Setting up App Key Vaults for Business Central Online](../administration/setup-app-key-vault.md). For [!INCLUDE[prod_short](includes/prod_short.md)] online, the app key vault feature is only supported for AppSource extensions.


### The `BC-ResourceExposurePolicy-Overrides` secret

Once the key vault is set up, the policy of an extension can be overridden by using settings in your extension's key vault. A secret named `BC-ResourceExposurePolicy-Overrides` must be added to the key vault. The value of the secret is a .json file with the structure as shown in the example below. Because, the json secret value in this case spans multiple lines, you must use Azure PowerShell instead of the Azure portal to define the json secret value. To enable one or more of the properties for use by an Azure AD tenant, you must add the tenant ID to enable that property for the users of the tenant. This enables a temporary access to the source code, for example, for debugging purposes. 


```powershell

$json = '{ 
    "allowDebugging": [ 
      "9e2b6561-1ba6-4790-abcc-c84abf9a8961" 
    ], 
    "allowDownloadingSource": [ 
      "9e2b6561-1ba6-4790-abcc-c84abf9a8961" 
    ], 
    "includeSourceInSymbolFile": [ 
      "9e2b6561-1ba6-4790-abcc-c84abf9a8961" 
    ] 
}'
$Secret = ConvertTo-SecureString -String $json -AsPlainText -Force
Set-AzKeyVaultSecret -VaultName "YourKeyVaultName" -Name "BC-ResourceExposurePolicy-Overrides" -SecretValue $Secret
```

> [!NOTE]  
> If debugging is enabled dynamically, a breakpoint can be set in the protected source code when the debugging session is started.

### Partner telemetry

If you specify the `applicationInsightsConnectionString` setting for your extension in the `app.json` file, it enables a signal to be sent every time the policy is read from the key vault whenever, there's an issue with reading the policy, or an issue with parsing the JSON. For more information, see [Sending Extension Telemetry to Azure Application Insights](devenv-application-insights-for-extensions.md).


```json
"applicationInsightsConnectionString": "MyConnectionString1234"
```
 
## See Also

[JSON Files](devenv-json-files.md)  
[AL Development Environment](devenv-reference-overview.md)  
[NonDebuggable Attribute](attributes/devenv-nondebuggable-attribute.md)  
