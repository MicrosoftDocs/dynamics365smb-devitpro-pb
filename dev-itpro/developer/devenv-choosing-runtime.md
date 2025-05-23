---
title: Choose runtime version in AL
description: How to choose runtime in AL for Business Central.
author: SusanneWindfeldPedersen
ms.date: 03/12/2025
ms.topic: article
ms.author: solsen
ms.reviewer: solsen
---

# Choose runtime version in AL

The runtime version determines the capabilities and features of AL for [!INCLUDE[prod_short](../includes/prod_short.md)]. The runtime version can be specified in the `app.json` file for a project. It's expressed with the following syntax, for example: `"runtime": "15.0"`. Specifying the runtime version is mostly interesting for scenarios where you develop for on-premises or a mix of on-premises and SaaS. For SaaS only development, you'll most likely be interested in using the current runtime. If the runtime setting isn't specified, the compiler detects the runtime that matches the server.

The runtime version specified in the `app.json` file determines which runtime the project is targeting. An extension can be published to a server with the same or a later runtime version as the runtime version specified in the `app.json` file of the extension. In the absence of a specified runtime version, the compiler defaults to the latest major available version.

## Currently available runtime versions

The available options for setting the `runtime` in AL are:

|Runtime version|Shipped with                       |Internal version|
|---------------|-----------------------------------|----------------|  
|`1.0`          |Business Central April 2018 Release|12.0|
|`2.0`          |Business Central Fall '18 Release  |13.0|
|`3.0`          |Business Central Spring '19 Release|14.0|
|`4.0`          |Business Central 2019 release wave 2|15.0|
|`5.0`          |Business Central 2020 release wave 1|16.0|
|`6.0`          |Business Central 2020 release wave 2|17.0|
|`6.1`          |Business Central 2020 release wave 2 update 1|17.1|
|`6.2`          |Business Central 2020 release wave 2 update 2|17.2|
|`6.3`          |Business Central 2020 release wave 2 update 3|17.3|
|`6.4`          |Business Central 2020 release wave 2 update 4|17.4|
|`7.0`          |Business Central 2021 release wave 1|18.0|
|`7.1`          |Business Central 2021 release wave 1 update 1|18.1|
|`7.2`          |Business Central 2021 release wave 1 update 2|18.2|
|`8.0`          |Business Central 2021 release wave 2|19.0|
|`9.0`          |Business Central 2022 release wave 1|20.0|
|`9.1`          |Business Central 2022 release wave 1 update 1|20.1|
|`9.2`          |Business Central 2022 release wave 1 update 2|20.2|
|`10.0`         |Business Central 2022 release wave 2|21.0|
|`11.0`         |Business Central 2023 release wave 1|22.0|
|`12.0`         |Business Central 2023 release wave 2|23.0|
|`13.0`         |Business Central 2024 release wave 1|24.0|
|`14.0`         |Business Central 2024 release wave 2|25.0|
|`15.0`         |Business Central 2025 release wave 1|26.0|

## Setting the runtime version

Selecting the runtime depends on the circumstances. If you, for example, have customers that run on older versions, you should set the runtime to be the minimum version that works to ensure compatibility. This prevents you from inadvertently using features that aren't supported on the older server.

If an earlier runtime is picked, it can be good idea to have a daily or weekly build that tests the extension against the latest version of the runtime. Testing against the latest runtime can detect new diagnostics, such as warnings or errors, that are introduced in the compiler or changes in the platform runtime. Though it might not be possible to refactor code for a future runtime, while using an older runtime, staying on top of these changes may help making design decisions early on.

## Related information

[JSON files](devenv-json-files.md)  
[Launch JSON file](devenv-json-launch-file.md)
