---
title: Directory.app.props.json file
description: Description of the JSON file for setting project metadata in AL extensions for Business Central.
author: SusanneWindfeldPedersen
ms.date: 09/26/2025
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Directory.app.props.json file

[!INCLUDE [2025-releasewave2-later](../includes/2025-releasewave2-later.md)]

The `directory.app.props.json` file defines reusable variables and properties for one or more AL apps in a folder. With a focus on maintainability, using variables for composing properties offers several advantages:

- Single point of edit, you only change, for example, `baseUrl` once.
- Safe version bumping, you only edit `minor` or `build`, not the whole string.  
- Generally reduces copy/paste errors in URLs.

The `directory.app.props.json` file is typically located in the root folder of the AL project, and must be created manually. Whether you have one or multiple projects, the `directory.app.props.json` file can help you set variables like revision or build from the environment, and make versioned builds without creating a commit with the variables. When the file is found by the compiler, it's used to set the defined properties for the app. If a property is defined both in the `directory.app.props.json` file and in the `app.json` file, the value from the `app.json` file takes precedence. For example, if `publisher`, `help`, or `url` is also present in `app.json`, the `app.json` value overrides the value defined here.

## Supported app.json properties

The `directory.app.props.json` file supports the following `app.json` properties:

| Property      |
|---------------|
| `name`         |
| `version`      |
| `publisher`    |
| `description`  |
| `brief` |
| `privacyStatement`|
| `EULA` |
| `help` |
| `url` |
| `logo` |
| `target` |
| `platform` |
| `application` |
| `runtime` |
| `helpBaseUrl`|

Learn more about these properties in [JSON files](devenv-json-files.md).

## Create the directory.app.props.json file

Create the `directory.app.props.json` file by following these steps:

1) In the root folder of one or more app projects, choose **New File**.
1) Name the file `directory.app.props.json`.
1) Edit the file by adding one or more properties inside the JSON structure, such as:  

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

1) Save the file.

The example defines variables for version parts, a `baseUrl`, and properties that use these variables. The `configuration` variable is defined but empty, which is useful if you want to append a configuration suffix to the version in certain build scenarios (for example, `-beta` or `-preview`). The properties section uses the `baseUrl` variable to construct full URLs for `url`, `privacyStatement`, `EULA`, and `help`.

Properties after substitution:

- `publisher`: "My Company"
- `url`: "https://www.mycompany.com"
- `privacyStatement`: "https://www.mycompany.com/privacy"
- `EULA`: "https://www.mycompany.com/EULA"
- `help`: "https://www.mycompany.com/documentation"


## Potential pitfalls

- Leaving `configuration` empty while using `$(configuration)` elsewhere would expand to an empty string—ensure that defaults are meaningful.
- Typos in variable names inside `$(...)` lead to unresolved tokens—double-check spelling.
- Non-numeric fragments in version parts cause validation errors—keep them numeric.

## Related information

[JSON files](devenv-json-files.md)  
