---
title: Using Key Vault Secrets in Business Central Extensions 
description: Describes how to use an Azure Key vault with Business Central extensions.
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Using Key Vault Secrets in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Extensions

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

This article describes how to code an extension to retrieve secrets from Azure Key Vaults. Secrets are typically used when the extensions calls a web service. For an overview of app key vaults and secrets, see [Using App Key Vaults with Extensions](devenv-app-key-vault-overview.md).

Developing an extension to use secrets from a key vault involves two tasks, as described in this article:

- Specifying the Azure Key Vault in the extension's manifest.
- Adding code to retrieve the secrets from the key vault.

## Preparation

- Using secrets requires that you have at least one Azure Key Vault with secrets set up and configured for use by the service. If you don't already have an Azure Key Vault, see [Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online](setup-app-key-vault.md) or [Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises](setup-app-key-vault-onprem.md).

- For coding, you'll need the URI the Azure Key Vault that stores the secret and the name of the secret itself. If you don't have this information, you can get it from Azure portal. For instructions, see [Quickstart: Set and retrieve a secret from Azure Key Vault using the Azure portal](/azure/key-vault/secrets/quick-create-portal).

## Specify the Azure Key Vault in extensions

You specify the key vaults for an extension in the extension's manifest file (app.json). To specify a key vault, you add the `"keyVaultUrls"` to the app.json, and set the value to the key vault's URL. For example, the following code snippet specifies a key vault that has the URI `https://mykeyvault.vault.azure.net`: 

```
    "keyVaultUrls": [ 
        "https://mykeyvault.vault.azure.net" 
    ] 
```

You can specify up to two key vaults in the app.json, as shown in the following example code snippet: 
 
``` 
    "keyVaultUrls": [ 
        "https://myfirstkeyvault.vault.azure.net", 
        "https://mysecondkeyvault.vault.azure.net" 
    ] 
```

Specifying two key vaults ensures a higher availability of secrets, especially if created in two different Azure regions. At runtime, the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] platform will iterate both key vaults until the secret is successfully retrieved. If one of the key vaults is unavailable for any reason, the extension will continue to execute because the other key vault will most likely be available.


## Add code to retrieve secrets from the key vault

Next, you add code to the extension for reading secrets from the key vault at runtime. To read secrets, you use the **Secrets** module of the System Application. Specifically, you'll use codeunit **3800 "App Key Vault Secret Provider"**. This codeunit includes two methods:

| Method |Description|
|--------|-----------|
| `TryInitializeFromCurrentApp(): Boolean`|Identifies the calling extension and initializes the codeunit with the key vaults specified in the extension's manifest.|
| `GetSecret(SecretName: Text, var SecretValue: Text): Boolean`|Retrieves the value of a specific secret from one of the app's key vaults.|

Look at the following example for a simple page object. The code retrieves the value of the secret named **MySecret** in app key vault:

```
page 50100 HelloWorldPage
{
    var
        SecretProvider: Codeunit "App Key Vault Secret Provider";
        SecretValue: Text;

    trigger OnOpenPage();
    begin
        if SecretProvider.TryInitializeFromCurrentApp() then begin
            if SecretProvider.GetSecret('MySecret', SecretValue) then
                Message('Retrieved secret: ' + SecretValue)
            else
                Message('Failed to retrieve secret')
        end
        else
            Message('ERROR: ' + GetLastErrorText());
    end;
}
```

The call to the `TryInitializeFromCurrentApp` method determines the extension that is currently being executed, then determines the extension's key vaults as specified in the extension manifest. After initialization, the `GetSecret` call reads secrets from the key vault.

## <a name="security"></a>Security considerations

Keep the following information in mind when you use the App Key Vault feature with your extensions.

### Mark methods as NonDebuggable

When your code works with secrets, whether from a key vault or from Isolated Storage, block the ability to debug relevant methods by using the [NonDebuggable Attribute](../methods/devenv-nondebuggable-attribute.md). It prevents other partners from debugging into your code and seeing the secrets.

### Don't pass the App Key Vault Secret Provider to untrusted code 

Once the **App Key Vault Secret Provider** codeunit has been initialized, it can be used to get secrets.

- If you pass the codeunit to another method, then that method is also able use it.
- If you pass the codeunit to a method in another extension, then the other extension can also use the secret provider to get secrets.

These conditions may not be what you want, so be careful who you pass the secret provider to.

### <a name="validation"></a>Enable publisher validation

For on-premises deployments, you can configure [!INCLUDE[server](../developer/includes/server.md)] to run with or without publisher validation of key vault secret providers. Publisher validation is controlled by the server's **Enable Publisher Validation** (AzureKeyVaultAppSecretsPublisherValidationEnabled) configuration setting. The validation is a runtime operation that ensures extensions use only key vaults that belong to their publishers. It essentially blocks attempts in AL to read secrets from another publisher's key vault.

#### How it works

Publisher validation is done by comparing the key vault's Azure AD tenant ID with the extension publisher's Azure AD tenant ID. It works this way:

1. When an extension is published by using the [Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp), the publisher can provide their Azure AD tenant ID by setting the `-PublisherAzureActiveDirectoryTenantId` parameter:

    ```powershell
    Publish-NavApp -ServerInstance <server instance> -Path <path to extension package> -PublisherAzureActiveDirectoryTenantId <Azure AD tenant ID GUID>
    ```
    
    > [!NOTE]
    > An error won't occur if `-PublisherAzureActiveDirectoryTenantId` isn't set. There is nothing preventing you from publishing the extension at this point.

2.  When the extension runs, it tries to initialize the **App Key Vault Secret Provider** codeunit.
3. The system compares the key vault's Azure AD tenant ID with the Azure AD tenant ID published with the extension:

    - If they match, initialization succeeds.
    - If they don't match, an error occurs.

#### Turning off publisher validation

Publisher validation is turned on by default, which is the recommended setting. If it's turned off, the server instance won't do any additional validation to ensure extensions have the right to read secrets from the key vaults that they specify. This condition implies some risk of unauthorized access to key vaults that you should be aware of. So, don't turn off publisher validation unless you trust the extensions that can be potentially installed.

For information about how to turn publisher validation on or off, see [Configuring Business Central Server](configure-server-instance.md).

## <a name="troubleshooting"></a>Monitoring and troubleshooting

### Compiling and publishing

If you get errors when you compile or publish your extension, the most likely reasons are: 

- You're using an old Visual Studio Code AL extension. Upgrade to the latest AL extension. 

- Your extension targets an older runtime. Make sure that the `"runtime"` value in the app.json file is at least `"6.0"`. 

- You're running an old version of [!INCLUDE[server](../developer/includes/server.md)]. Upgrade to at least version 17.0. 

### Runtime

For runtime operations, there are two sources that you can use for gathering details:

- Windows Event Log of the machine running the [!INCLUDE[server](../developer/includes/server.md)].
- Application Insights.

These sources provide details about retrieving secrets from key vaults, for calls to the `TryInitializeFromCurrentApp` and `GetSecret` methods from an extension.

#### Using Application Insights

You can set up extensions to emit telemetry to an Application Insights resource in Azure.

1. Create an Application Insights resource in Azure if you don't have one.

    The Application Insights resource will be assigned an instrumentation key. Copy this key because you'll need it to enable Application Insights in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].  

    For more information, see [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

2. In the app.json file of the extension, add the `"applicationInsightsKey"`:

 ``` 
 "applicationInsightsKey": ["<instrumenation key>"] 
 ```
3. Now, you can run your extensions and view data in Application Insights.

   For more information, see [Viewing telemetry data in Application Insights](../administration/telemetry-overview.md) and [Analyzing App Key Vault Secret Trace Telemetry](../administration/telemetry-extension-key-vault-trace.md).

## See Also  
[Getting Started with AL](devenv-get-started.md)  
[Publishing and Installing Extensions](devenv-how-publish-and-install-an-extension-v2.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md)  