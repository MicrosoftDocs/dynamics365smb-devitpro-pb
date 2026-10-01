---
title: Adding and Accessing Resources in Business Central extensions
description: Describes how to package, share, and access resources, such as sample data, images, and schemas, across Business Central extensions.
ms.date: 08/25/2026
ms.topic: concept-article
author: thloke
ms.reviewer: solsen
ms.author: solsen
---

# Adding and accessing resources in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] extensions

[!INCLUDE[2024-releasewave2_25.2](../includes/2024-releasewave2_25.2.md)]

This article describes how to package and use resources with your extensions. Resources are arbitrary files that you can include with your extension and access at runtime. For example, you can include sample data, images, or any other file that's used by your extension. By default, you can only access resources within the extension that includes them. Starting with runtime version 18.0, an extension can also expose selected resources as *public*, so that other extensions can read them. Learn more in [Sharing resources with other apps](#sharing-resources-with-other-apps).

## Specifying resource folders

To package resources in an extension, you must declare which folders within your project contain resources to be packaged in the extension's manifest file (app.json). To do this, add the `"resourceFolders"` property to the manifest file. For example, the following code snippet specifies that files within the `Resources` folder should be packaged as resources:

```json
"resourceFolders": ["Resources"]
```

You can specify multiple folders:

```json
"resourceFolders": ["SampleImages", "ConfigurationFiles"]
```

Resource folders can contain subfolders as well. Files within these subfolders are also included as resources in the extension.

Resources that you declare with `resourceFolders` are *private*. Only the extension that packages them can read them at runtime. If you want other extensions to be able to read a resource, declare it as *public* instead, as described in [Sharing resources with other apps](#sharing-resources-with-other-apps).

Every folder listed in `resourceFolders` must exist relative to the project. If a folder doesn't exist, the compiler raises an error and the build fails.

## Accessing the resources from AL

You can access resources from AL code at runtime. Several methods are available to interact with resources. The methods in the following table operate on the calling extension itself. They can access both private resources from `resourceFolders` and public resources from `publicResourceFolders`:

| Method | Description |
|--------|-------------|
| [NavApp.GetResource](methods-auto/navapp/navapp-getresource-string-instream-textencoding-method.md) `(ResourceName: Text; var ResourceStream: InStream; (Optional) Encoding: TextEncoding)` | Reads the content of resource files at runtime. |
| [NavApp.GetResourceAsText](methods-auto/navapp/navapp-getresourceastext-string-textencoding-method.md) `(ResourceName: Text; (Optional) Encoding: TextEncoding): Text` | Used to read the content of resource files directly into a Text object. |
| [NavApp.GetResourceAsJson](methods-auto/navapp/navapp-getresourceasjson-string-textencoding-method.md) `(ResourceName: Text; (Optional) Encoding: TextEncoding): JsonObject` | Used to read the content of resource files directly into a JsonObject. |
| [NavApp.ListResources](methods-auto/navapp/navapp-listresources-string-method.md) `((Optional) Filter: Text)` | Used to list available resources in an extension. |

The `ResourceName` of a resource is the path to the resource from the folder specified in the `resourceFolders` attribute of the `app.json` file. For example, if you had the following project structure:

```
MyApp
    Resources/
        Images/
            SampleImage1.png
            SampleImage2.png
        Templates/
            Template1.txt
            Template2.png
```

You can access the content of the `Template1.txt` resource file with the following code:

```al
procedure UsingResources()
var
    resourceStream: InStream;
    content: Text;
begin
    NavApp.GetResource('Templates/Template1.txt', resourceStream, TextEncoding::UTF8);
    resourceStream.Read(content);
end;
```

`NavApp.ListResources` can be used to iterate over a collection of resources. The `Filter` parameter of this method allows you to optionally specify what types of resources to list. If a filter is provided, only resources matching the pattern in the filter are listed. The filter can contain wildcards. For example, with the same project structure as before:

```al
NavApp.ListResources(); // Will return ["Images/SampleImage1.png", "Images/SampleImage2.png", "Templates/Template1.txt", "Templates/Template2.png"]
NavApp.ListResources('Images'); // Will return ["Images/SampleImage1.png", "Images/SampleImage2.png"]
NavApp.ListResources('*.png'); // Will return ["Images/SampleImage1.png", "Images/SampleImage2.png", "Templates/Template2.png"]
```

## Sharing resources with other apps

[!INCLUDE[2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

By default, a resource is private, so only its own extension can read it. If you want another extension to read one of your resources, declare the folder that contains it in the `"publicResourceFolders"` property of the manifest file (app.json) instead of, or in addition to, `"resourceFolders"`. For example:

```json
{
  "resourceFolders": [
    "Resources"
  ],
  "publicResourceFolders": [
    "PublicResources"
  ]
}
```

Public resource folders follow the same rules as private resource folders: they can contain subfolders, and every listed folder must exist relative to the project or the build fails. A resource name is the relative path from the resource folder, and it must be unique across both `resourceFolders` and `publicResourceFolders`. Declaring the same name as both private and public causes a build error.

When you build an extension that has public resources, the compiler lists every packaged public resource in both the ALC console output and the **Output** window in Visual Studio Code, so that you can confirm what you're sharing:

```text
Public resources included in the package (2):
  schemas/customer.json
  templates/invoice.txt
```

### Access another app's public resources from AL

To read a public resource that belongs to a different extension, use the app ID overloads of the resource methods and pass the target extension's app ID as the `AppId` parameter. The app ID is the `id` value from the target extension's app.json file. These overloads can only access resources that the target extension declared public:

| Method | Description |
|--------|-------------|
| [NavApp.GetResource](methods-auto/navapp/navapp-getresource-string-guid-instream-textencoding-method.md) `(ResourceName: Text; AppId: Guid; var ResourceStream: InStream; (Optional) Encoding: TextEncoding)` | Reads the content of a public resource from another extension into an `InStream`. |
| [NavApp.GetResourceAsText](methods-auto/navapp/navapp-getresourceastext-string-guid-textencoding-method.md) `(ResourceName: Text; AppId: Guid; (Optional) Encoding: TextEncoding): Text` | Reads the content of a public resource from another extension directly into a `Text` value. |
| [NavApp.GetResourceAsJson](methods-auto/navapp/navapp-getresourceasjson-string-guid-textencoding-method.md) `(ResourceName: Text; AppId: Guid; (Optional) Encoding: TextEncoding): JsonObject` | Reads the content of a public resource from another extension directly into a `JsonObject`. |
| [NavApp.ListResources](methods-auto/navapp/navapp-listresources-guid-string-method.md) `(AppId: Guid; (Optional) Filter: Text): List of [Text]` | Lists the public resources of another extension. Unlike the single-argument `NavApp.ListResources`, this overload always returns public resources only, even when `AppId` is the ID of the calling extension itself. |
| [NavApp.ListAppsWithPublicResources](methods-auto/navapp/navapp-listappswithpublicresources-method.md) `((Optional) Filter: Text): List of [Guid]` | Returns the app IDs of every installed extension that has at least one public resource matching `Filter`. Use this method to discover providers before calling the other methods. |

The following example reads a JSON schema that another extension, identified by its app ID, publishes as a public resource:

```al
procedure GetSupplierPricingSchema(): JsonObject
var
    SupplierAppId: Guid;
begin
    SupplierAppId := '00001111-aaaa-2222-bbbb-3333cccc4444';
    exit(NavApp.GetResourceAsJson('schemas/pricing.json', SupplierAppId, TextEncoding::UTF8));
end;
```

You can also discover which installed extensions publish a matching public resource, and then enumerate what each of them offers:

```al
procedure ProcessAllPricingSchemas()
var
    ProviderAppIds: List of [Guid];
    ProviderAppId: Guid;
    ResourceNames: List of [Text];
    ResourceName: Text;
    Schema: JsonObject;
begin
    ProviderAppIds := NavApp.ListAppsWithPublicResources('schemas/*.json');
    foreach ProviderAppId in ProviderAppIds do begin
        ResourceNames := NavApp.ListResources(ProviderAppId, 'schemas/*.json');
        foreach ResourceName in ResourceNames do begin
            Schema := NavApp.GetResourceAsJson(ResourceName, ProviderAppId);
            ProcessPricingSchema(ProviderAppId, ResourceName, Schema);
        end;
    end;
end;
```

Keep the following behaviors in mind when you work with public resources:

- `NavApp.ListResources()` without an `AppId` returns the calling extension's own resources, both private and public. `NavApp.ListResources(AppId)` always returns public resources only, even when `AppId` is the calling extension's own app ID.
- If you try to retrieve a resource by app ID that either doesn't exist or is private to the target extension, you get the same not-found error in both cases. This behavior prevents an extension from using error messages to determine whether a private resource exists.

## Limits on resources

The following limits are enforced on the resources that you can include in an extension:

| Limit | Value |
|-------|-------|
| Maximum size of any single resource file | 16 MB |
| Maximum size of all files in one resource folder | 128 MB |
| Maximum number of files in one resource folder | 256 files |

These limits are subject to change in the future.

> [!NOTE]
> Before version 26.3, embedded resources can't be retrieved in runtime packages. The only way around that is to publish the regular package to the database.

## Limiting access to resources

By default, an extension can only access its own resources. If two apps declare private resources with the same name, each app can only access its own version of the resource. Starting with runtime version 18.0, an extension can opt in to sharing specific resources by declaring them public, as described in [Sharing resources with other apps](#sharing-resources-with-other-apps). Resources that stay in `resourceFolders` remain private and can't be accessed by other extensions, regardless of the public resource capability.

Resources are treated like code with regard to the [Resource exposure policy](devenv-security-settings-and-ip-protection.md) setting for the application. If an application has `allowDownloadingSource` set to `true`, then any resources included with the extension is packaged into the .app file that is downloaded.

## Related information

[Get started with AL](devenv-get-started.md)  
[Publishing and installing extensions](devenv-how-publish-and-install-an-extension-v2.md)  
[Resource exposure policy setting](devenv-security-settings-and-ip-protection.md)  
[JSON files](devenv-json-files.md)  
[NavApp data type](methods-auto/navapp/navapp-data-type.md)  
