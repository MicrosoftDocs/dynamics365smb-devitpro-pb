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

This article describes how to code an extension to retrieve secrets from Azure Key Vaults. Secrets are a kind of credential used for authenticating en extension. Secrets are typically used when the extensions makes calls to web service. For an overview of app key vaults and secrets, see [Using App Key Vaults with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Extensions](../administration/extension-key-vault.md).

Developing an extension to use secrets from a key vaults involves two tasks, as described in this article:

- Specifying the Azure Key Vault in the extension's manifest.
- Adding code to retrieve the secrets from the key vault.

Secrets are actually retrieved at runtime.

## Preparation

Using secrets requires that you have at least one Azure Key Vault with secrets set up and configured for use by the the service. For more information, see [Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online](setup-app-key-vault.md) or [Setting up App Key Vaults for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises ](setup-app-key-vault-onprem.md).

For coding, you'll need the URI the Azure Key Vault that stores the secret and the name of the secret itself. If you don't have this information, you can get it from Azure portal. For instructions, see [Quickstart: Set and retrieve a secret from Azure Key Vault using the Azure portal](https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-portal).

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

Specifying two key vaults ensures a higher availability of secrets. At runtime, the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] platform will iterate both key vaults until the secret is successfully retrieved. If one of the key vaults is unavailable for any reason, the extension will continue to execute because the other key vault will most likely be available.


## Add code to retrieve secrets the key vault

Next, you add code to the extension for reading secrets from the key vault at runtime. To read secrets, you use the **Secrets** module of the System Application, specifically codeunit **3800 "App Key Vault Secret Provider"**. This codeunit includes two methods:

| Method |Description|
|--------|-----------|
| `TryInitializeFromCurrentApp(): Boolean`|Identifies the calling extension and initializes the codeunit with the key vaults specified in the extension's manifest.|
| `GetSecret(SecretName: Text, var SecretValue: Text): Boolean`|Retrieves the value of a specific secret from one of the app's key vaults.|

Look at following example for a simple page object. The code retrieves the value of the secret named **MySecret** in app key vault:

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

The call to the `TryInitializeFromCurrentApp` method determines the extension that is currently being executed, then determines the extension's key vaults as specified in the extension manifest. After initialization, you can call the `GetSecret` method to read secrets from the key vault.

## <a name="security"></a>Security considerations 

Keep the following information in mind when you use the App Key Vault feature. 

### Use NonDebuggable

As always when your code works with secrets, whether from a key vault or from Isolated Storage, remember to mark the methods as NonDebuggable. This prevents other partners from debugging into your code and seeing the secrets. 

### Don't pass the App Key Vault Secret Provider to untrusted code 

Once the App Key Vault Secret Provider codeunit has been initialized, it can be used to get secrets. If you pass the codeunit to another function, then that function can also use it. If you pass the codeunit to a function in another extension, then the other extension can also use the secret provider to get secrets. This may not be what you want, so be careful with who you pass the secret provider to. 

### Run with publisher validation 

In the on-premises steps above, you configured the NST to run with publisher validation disabled. You should only do this if you trust all extensions that get installed to not do malicious things like read secrets they are not supposed to. If you don't trust all extensions that might get installed, you should enable publisher validation. This is how the Business Central SaaS service is configured. 

When publisher validation is enabled, and an extension tries to initialize the App Key Vault Secret Provider codeunit, the following check will be performed: 

`Extension.KeyVaultUrls.AadTenantId == Extension.PublisherAadTenantId`

Only if this check is satisfied will the initialization succeed. 

So how does the NST know an extension publisher's AAD tenant ID? The value can be specified when publishing an extension, like this: 

Publish-NavApp … -PublisherAzureActiveDirectoryTenantId <guid> 

In SaaS, this value will always be empty for PTEs and dev extensions, and it will only be non-empty for App Source apps if they have been onboarded. 


## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Troubleshooting: The SAML2 token is not valid because its validity period has ended](troubleshooting-SAML2-token-not-valid-because-validity-period-ended.md)   
[Configuring Business Central Server](configure-server-instance.md)  