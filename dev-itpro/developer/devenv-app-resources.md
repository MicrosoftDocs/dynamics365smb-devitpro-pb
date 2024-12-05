---
title: Adding and Accessing Resources in Business Central extensions
description: Describes how to package and use resources with Business Central extensions
ms.date: 12/05/2024
ms.topic: conceptual
author: thloke
ms.reviewer: solsen
---

# Adding and accessing resources in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] extensions

[!INCLUDE[2024_releasewave2_24.2](../includes/2024-releasewave2_24.2.md)]

This article describes how to package and use resources with your extensions. Resources are arbitrary files that can be included with your extension and accessed at runtime. For example, you can include sample data, images, or any other file that are used by your extension. Resources can only be accessed within the extension that includes them; it isn't possible for extensions to access resources that are packaged with other extensions.

## Specifying resource folders

To package resources in an extension, you need to declare which folders within your project contain resources to be packaged in the extension's manifest file (app.json). To do this, add the `"resourceFolders"` property to the manifest file. For example, the following code snippet specifies that files within the `Resources` folder should be packaged as resources:

```json
"resourceFolders": ["Resources"]
```

You can specify multiple folders:

```json
"resourceFolders": ["SampleImages", "ConfigurationFiles"]
```

Resource folders can contain subfolders as well. Files within these subfolders are also included as resources in the extension.

## Accessing the resources from AL

Resources can be accessed from AL code at runtime. There are several methods that can be used to interact with resources:

| Method | Description |
|--------|-------------|
| `NavApp.GetResource(ResourceName: Text; var ResourceStream: Instream; (Optional) Encoding: TextEncoding)` | Used to read the content of resource files at runtime |
| `NavApp.GetResourceAsText(ResourceName: Text; (Optional) Encoding: TextEncoding): Text` | Used to read the content of resource files directly into a Text object |
| `NavApp.GetResourceAsJson(ResourceName: Text; (Optional) Encoding: TextEncoding): JsonObject` | Used to read the content of resource files directly into a JsonObject |
| `NavApp.ListResources((Optional) Filter: Text)` | Used to list available resources in an extension |

The `ResourceName` of a resource is the path to the resource from the folder specified in the `resourceFolders` attribute of the app.json. For example, if you had the following project structure:

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

You can access the content of the "Template1.txt" resource file with the following code:

```al
procedure UsingResources()
var
    resourceStream: Instream;
    content: Text;
begin
    NavApp.GetResource('Templates/Template1.txt', content, TextEncoding::UTF8);
    resourceStream.Read(content);
end;
```

`NavApp.ListResources` can be used to iterate over a collection of resources. The `Filter` parameter of this method allows you to optionally specify what types of resources to list. If a filter is provided, only resources matching the pattern in the filter are listed. The filter can contain wildcards. For example, with the same project structure as before:

```al
NavApp.ListResources(); // Will return ["Images/SampleImage1.png", "Images/SampleImage2.png", "Templates/Template1.txt", "Templates/Template2.png"]
NavApp.ListResources("Images") // Will return ["Images/SampleImage1.png", "Images/SampleImage2.png"]
NavApp.ListResources("*.png"); // Will return ["Images/SampleImage1.png", "Images/SampleImage2.png", "Templates/Template2.png"]
```

## Limits on resources

The following limits are enforced on the resources you can include in an extension:

| Limit | Value |
|-------|-------|
| Maximum size of any single resource file | 16 MB |
| Maximum size of the total of all resource files | 256 MB |
| Maximum number of resource files in an extension | 256 files |

These limits are subject to change in the future.

## Limiting access to resources

An extension is only able to access its own resources. This means that if two apps declare resources with the same name, they're only be able to access their own versions of the resource.

Resources are treated like code with regards to the [Resource exposure policy](devenv-security-settings-and-ip-protection.md) setting for the application. If an application has `allowDownloadingSource` set to `true`, then any resources included with the extension will be packaged into the .app file that is downloaded.

## Related information

[Get started with AL](devenv-get-started.md)  
[Publishing and installing extensions](devenv-how-publish-and-install-an-extension-v2.md)  
[Resource exposure policy setting](devenv-security-settings-and-ip-protection.md)  