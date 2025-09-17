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

The `Directory.app.props.json` file is used to define project metadata for AL extensions in Business Central. It's typically located in the root folder of the AL project. The `Directory.app.props.json` file must be created manually by following the steps and syntax as described below.

## Create the Directory.app.props.json file


1) In the root folder of the app project that will migrate data to a different app project, choose **New File**.
2) Name the file `directory.app.props.json`.
3) Edit the file by adding one or more properties inside the JSON structure, such as:

```json
{
    "properties": {
        "propertyName1": "propertyValue1",
        "propertyName2": "propertyValue2"
    }
}
```