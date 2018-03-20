---
title: "JSON Files"
description: "Description of the content of the JSON files."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 01/12/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# JSON Files

In an AL project there are two JSON files; the `app.json` file and the `launch.json` file. These files are generated automatically when you start a new project. The `app.json` file contains information about extension that you are building, such as publisher information and specifies the minimum version of base application objects that the extension is built on. Often the `app.json` file is referred to as the manifest. The `launch.json` file contains information about the server that the extension launches on.

## App.json file
The following table describes the settings in the ```app.json``` file:

|Setting|Mandatory|Value|
|-------|---------|-----|
|id|Yes|The unique ID of the extension. When app.json file is automatically created, the ID is set to a new GUID value.|
|name|Yes|The unique extension name.|
|publisher|Yes|The name of your publisher, for example: **NAV Partner**, **LLC** |
|brief|No, but required for AppSource submission|Short description of the extension.|
|description|No, but required for AppSource submission|Longer description of the extension.|
|version|Yes|The version of the app package.|
|privacyStatement|No, but required for AppSource submission|URL to the privacy statement for the extension.|
|EULA|No, but required for AppSource submission|URL to the license terms for the extension.|
|help|No, but required for AppSource submission|URL to the help for the extension.|
|url|No|URL of the extension package.|
|logo|No, but required for AppSource submission|URL to the logo for the extension package.|
|dependencies|No|List of dependencies for the extension package. For example: `"dependencies": [ {  "appId": "4805fd15-75a5-46a2-952f-39c1c4eab821", "name": "WeatherLibrary", "publisher": "Microsoft", "version": "1.0.0.0"}],`|
|screenshots|No|Relative paths to any screenshots that should be in the extension package.|
|platform|Yes, if system tables are referenced in the extension|The minimum supported version of the platform symbol package file, for example: "11.0.0.0". See the [Symbols](devenv-symbols.md) for the list of object symbols contained in the platform symbol package file.|
|application|Yes, if base application objects are extended or referenced. The AL package will be compiled against the application that is present on the server that you connect to. This allows you to write a single AL extension for multiple country versions as long as you *do not* depend on country-specific code. If you *do* depend on country-specific code you should only try to compile your app against a server set up for that country.|The minimum supported version, for example: `"application": "11.0.0.0"`|
|idRange|Yes|A range for application object IDs. For all objects outside the range, a compilation error will be raised. When you create new objects, an ID is automatically suggested.|
|showMyCode|No|This is by default set to `false` and not visible in the manifest. To enable viewing the source code when debugging into an extension, add the following setting: `"showMyCode": true`|
|target|No|By default this is `Extension`. For Dynamics NAV, you can set this to `Internal` to get access to otherwise restricted APIs. The Dynamics NAV Server setting must then also be set to `Internal`.<!-- For more information, see [Configuring Microsoft Dynamics NAV Server](../configuring-microsoft-dynamics-nav-server.md).-->|

## <a name="Launchjson"></a>Launch.json file

The following table describes the settings in the ```launch.json``` file. The `launch.json` file has two configurations depending on whether the extension is published to a local server or to the cloud.

### Publish to local server settings
|Setting|Mandatory|Value|
|-------|---------|-----|
|name|Yes|"Publish to your own server"|
|type|Yes|Must be set to `".al"`. Required by Visual Studio Code.|
|request|Yes|Request type of the configuration. Must be set to `"launch"`. Required by Visual Studio Code.|
|server|Yes|The HTTP URL of your server, for example: `"http://localhost|serverInstance"`|
|serverInstance|Yes|The instance name of your server, for example: `"NAV"`|
|authentication|Yes|Specifies the server authentication method.|
|startupObjectType|No|Specifies whether the object to open after publishing is a Page type (`"Page"`) or Table type (`"Table"`) object. The default is `"Page"`.|
|startupObjectId|No|Specifies the ID of the object to open after publishing. Only objects of type Page and Table are currently supported.|
|schemaUpdateMode|No|Specifies the data synchronization mode when you publish an extension to the development server, for example: <br>`"schemaUpdateMode": "Synchronize Recreate"`</br> The default value is Synchronize. For more information, see [Retaining table data after publishing](devenv-retaining-data-after-publishing.md)  <br>[!INCLUDE[nav_not_supported](includes/nav_not_supported.md)]  |
|serverInstance|Yes|The instance name of your server, for example: `"US"`|

### Publish to cloud settings
|Setting|Mandatory|Value|
|-------|---------|-----|
|name|Yes|"Publish to Microsoft cloud sandbox"|
|type|Yes|Must be set to `".al"`. Required by Visual Studio Code.|
|request|Yes|Request type of the configuration. Must be set to `"launch"`. Required by Visual Studio Code.|
|startupObjectType|No|Specifies whether the object to open after publishing is a Page type (`"Page"`) or Table type (`"Table"`) object.  The default is `"Page"`.|
|startupObjectId|No|Specifies the ID of the object to open after publishing. Only objects of type Page and Table are currently supported.|
|tenant|No|Specifies the tenant to which the package is deployed. If you specify multiple configurations, a drop-down of options will be available when you deploy.|

## The platform symbol file
The platform symbol file contains all of the base app objects that your extension builds on. If the symbol file is not present, you will be prompted to download it. For more information about the platform symbol file, see [Symbols](devenv-symbols.md).

## See Also 
[AL Development Environment](devenv-reference-overview.md)
