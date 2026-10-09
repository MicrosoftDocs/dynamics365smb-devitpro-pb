---
title: Use Key Vault Secrets in Business Central Extensions
description: Learn how to configure Azure Key Vault in an extension, retrieve secrets securely with SecretText, and monitor key vault operations.
ms.date: 10/09/2026
ms.topic: how-to
author: jswymer
ms.reviewer: solsen
---
# Retrieve key vault secrets in extensions

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

This article describes how to code an extension to retrieve secrets from Azure Key Vault. Secrets are typically used when an extension calls a web service. Learn more about app key vaults and secrets in [Use app key vaults with extensions](devenv-app-key-vault-overview.md).

Developing an extension to use secrets from a key vault involves two tasks, as described in this article:

- Specifying the Azure Key Vault in the extension's manifest.
- Adding code to retrieve the secrets from the key vault.

## Prerequisites for retrieving secrets

- Using secrets requires that you have at least one Azure Key Vault with secrets set up and configured for use by the service. If you don't already have an Azure Key Vault, see [Setting up App Key Vaults for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online](../administration/setup-app-key-vault.md) or [Setting up App Key Vaults for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises](../administration/setup-app-key-vault-onprem.md).

- For coding, you need the URI of the Azure Key Vault that stores the secret and the name of the secret. If you don't have this information, you can get it from the Azure portal. Learn more in [Quickstart: Set and retrieve a secret from Azure Key Vault using the Azure portal](/azure/key-vault/secrets/quick-create-portal).

## Specify the Azure Key Vault in extensions

You specify the key vaults for an extension in the extension's manifest file, `app.json`. To specify a key vault, add the `"keyVaultUrls"` setting and set its value to the key vault URL. The following example specifies a key vault that has the URI `https://mykeyvault.vault.azure.net`:

```json
"keyVaultUrls": [
    "https://mykeyvault.vault.azure.net"
]
```

You can specify up to two key vaults in `app.json`, as shown in the following example:

```json
"keyVaultUrls": [
    "https://myfirstkeyvault.vault.azure.net",
    "https://mysecondkeyvault.vault.azure.net"
]
```

Specifying two key vaults can improve the availability of secrets, especially if the vaults are in different Azure regions. At runtime, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] platform tries the configured key vaults in order until it retrieves the secret. If all attempts fail, `GetSecret` returns `false`. The extension must decide how to handle the failure.


## Add code to retrieve secrets from the key vault

Next, add code to the extension to read secrets from the key vault at runtime. Use the `Secrets` module of the System Application and codeunit `3800 "App Key Vault Secret Provider"`. The codeunit provides `TryInitializeFromCurrentApp` and two `GetSecret` overloads. For new code, use the overload that returns the secret in a `SecretText` variable.

| Method |Description|
|--------|-----------|
| `TryInitializeFromCurrentApp(): Boolean`|Identifies the calling extension and initializes the codeunit with the key vaults specified in the extension's manifest.|
| `GetSecret(SecretName: Text; var SecretValue: SecretText): Boolean`|Retrieves a secret from one of the app's key vaults without exposing its value to the debugger.|
| `GetSecret(SecretName: Text; var SecretValue: Text): Boolean`|Retrieves a secret as text. Use the `SecretText` overload for new code.|

Look at the following example for a simple page object. The code retrieves the value of the secret named `MySecret` in an app key vault:

```al
page 50100 HelloWorldPage
{
    var
        SecretProvider: Codeunit "App Key Vault Secret Provider";
        SecretValue: SecretText;

    trigger OnOpenPage()
    begin
        if SecretProvider.TryInitializeFromCurrentApp() then begin
            if SecretProvider.GetSecret('MySecret', SecretValue) then
                Message('The secret was retrieved successfully.')
            else
                Message('The secret couldn''t be retrieved.');
        end else
            Message('Error: ' + GetLastErrorText());
    end;
}
```

The call to the `TryInitializeFromCurrentApp` method determines the extension that is currently being executed, then determines the extension's key vaults as specified in the extension manifest. After initialization, the `GetSecret` call reads secrets from the key vault.

## <a name="security"></a>Security considerations

Keep the following information in mind when you use the App Key Vault feature with your extensions.

<!--
### Mark methods as NonDebuggable

When your code works with secrets, whether from a key vault or from Isolated Storage, block the ability to debug relevant methods by using the [NonDebuggable Attribute](attributes/devenv-nondebuggable-attribute.md). It prevents other partners from debugging into your code and seeing the secrets. -->

### Use SecretText

The `SecretText` data type is designed to protect sensitive values from being exposed through the AL debugger when doing regular or snapshot debugging. Its use is recommended for applications that need to handle any kind of credentials like API keys, custom licensing tokens, or similar. Learn more about how to denote a secret text string, which is non-debuggable in [SecretText data type](methods-auto/secrettext/secrettext-data-type.md) and [Protecting sensitive values with the SecretText data type](devenv-secret-text.md).

### Don't pass the App Key Vault Secret Provider to untrusted code

After you initialize the `App Key Vault Secret Provider` codeunit, you can use it to get secrets.

- If you pass the codeunit to another method, that method can use it.
- If you pass the codeunit to a method in another extension, then the other extension can also use the secret provider to get secrets.

These conditions may not be what you want, so be careful who you pass the secret provider to.

### <a name="validation"></a>Enable publisher validation

For on-premises deployments, you can configure [!INCLUDE[server](../developer/includes/server.md)] to run with or without publisher validation of key vault secret providers. The server's **Enable Publisher Validation** (`AzureKeyVaultAppSecretsPublisherValidationEnabled`) configuration setting controls publisher validation. The validation is a runtime operation that ensures extensions use only key vaults that belong to their publishers. It blocks attempts in AL to read secrets from another publisher's key vault.

#### How it works

Publisher validation is done by comparing the key vault's Microsoft Entra tenant ID with the extension publisher's Microsoft Entra tenant ID. It works this way:

1. When an extension is published by using the [Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp), the publisher can provide their Microsoft Entra tenant ID by setting the `-PublisherAzureActiveDirectoryTenantId` parameter:

    ```powershell
    Publish-NavApp -ServerInstance <ServerInstance> -Path <PathToExtensionPackage> -PublisherAzureActiveDirectoryTenantId <MicrosoftEntraTenantId>
    ```

    > [!NOTE]
    > An error won't occur if `-PublisherAzureActiveDirectoryTenantId` isn't set. There is nothing preventing you from publishing the extension at this point.

1. When the extension runs, it tries to initialize the `App Key Vault Secret Provider` codeunit.
1. The system compares the key vault's Microsoft Entra tenant ID with the Microsoft Entra tenant ID published with the extension:

    - If they match, initialization succeeds.
    - If they don't match, an error occurs.

#### Turning off publisher validation

Publisher validation is turned on by default, which is the recommended setting. If it's turned off, the server instance won't do any additional validation to ensure extensions have the right to read secrets from the key vaults that they specify. This condition implies some risk of unauthorized access to key vaults that you should be aware of. So, don't turn off publisher validation unless you trust the extensions that can be potentially installed.

Learn more about how to turn publisher validation on or off in [Configuring Business Central Server](../administration/server-instance-settings.md).

## <a name="troubleshooting"></a>Monitoring and troubleshooting

### Compiling and publishing

If you get errors when you compile or publish your extension, check the following conditions:

- You're using an old Visual Studio Code AL extension. Upgrade to the latest AL extension.

- Your extension targets an older runtime. Make sure that the `"runtime"` value in the `app.json` file is at least `"6.0"`.

- You're running an old version of [!INCLUDE[server](../developer/includes/server.md)]. Upgrade to at least version 17.0.

### Runtime

For runtime operations, there are two sources that you can use for gathering details:

- Windows Event Log of the machine running the [!INCLUDE[server](../developer/includes/server.md)].
- Application Insights.

These sources provide details about retrieving secrets from key vaults, for calls to the `TryInitializeFromCurrentApp` and `GetSecret` methods from an extension.

#### Using Application Insights

You can set up extensions to emit telemetry to an Application Insights resource in Azure.

1. Create an Application Insights resource in Azure if you don't have one.

    For runtime 7.2 and later, copy the Application Insights connection string. For runtime 6.0 through 7.1, copy the instrumentation key.

    Learn more in [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

2. For runtime 7.2 and later, add the `"applicationInsightsConnectionString"` setting to the extension's `app.json` file and set it to the Application Insights connection string. If the extension targets runtime 6.0 through 7.1, set `"applicationInsightsKey"` to the instrumentation key.

   ```json
   "applicationInsightsConnectionString": "<ConnectionString>"
   ```

3. Run your extension and view the data in Application Insights.

Learn more in [Viewing telemetry data in Application Insights](../administration/telemetry-overview.md) and [Analyzing App Key Vault Secret Trace Telemetry](../administration/telemetry-extension-key-vault-trace.md).

## Related information

[Get started with AL](devenv-get-started.md)  
[Publish and install extensions](devenv-how-publish-and-install-an-extension-v2.md)  
[Configure Business Central Server](../administration/configure-server-instance.md)  
[App key vault telemetry](../administration/telemetry-extension-key-vault-trace.md)  
[Protecting sensitive values with the SecretText data type](devenv-secret-text.md)  
