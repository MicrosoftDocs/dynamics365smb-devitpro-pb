---
title: Directory.app.props.json file
description: Description of the JSON file for setting project metadata in AL extensions for Business Central.
author: SusanneWindfeldPedersen
ms.date: 09/17/2025
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Directory.app.props.json file

[!INCLUDE [2025-releasewave2-later](../includes/2025-releasewave2-later.md)]

The `directory.app.props.json` file is used to define project metadata for AL extensions in Business Central. It's typically located in the root folder of the AL project. The `directory.app.props.json` file must be created manually. When the file is found by the compiler, it's used to set the defined properties for the app. If a property is defined both in the `directory.app.props.json` file and in the `app.json` file, the value from the `app.json` file takes precedence.

## Create the directory.app.props.json file

Create the `directory.app.props.json` file by following these steps:

1) In the root folder of the app project(s), choose **New File**.
2) Name the file `directory.app.props.json`.
3) Edit the file by adding one or more properties inside the JSON structure, such as:

```json
{
    "variables": {
        "major": "1",
        "minor": "2",
        "build": "0",
        "revision": "0",
        "version": "$(major).$(minor).$(build).$(revision)",
        "configuration": "",
        "baseUrl": "https://www.mycompany.com"
    },
    "properties": {
        "publisher": "My Company",
        "url": "$(baseUrl)",
        "privacyStatement": "$(baseUrl)/privacy",
        "EULA": "$(baseUrl)/EULA",
        "help": "$(baseUrl)/documentation"
    }
}
```