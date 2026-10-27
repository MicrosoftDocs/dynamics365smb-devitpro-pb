---
title: Choose an AL Runtime Version for Business Central
description: Choose an AL runtime version for Business Central extensions. Check compiler defaults, server compatibility, and runtime-to-product version mappings.
author: SusanneWindfeldPedersen
ms.date: 10/16/2026
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
---

# Choose runtime version in AL

The runtime version determines the capabilities and features of AL for [!INCLUDE[prod_short](../includes/prod_short.md)]. You specify the runtime version in the `app.json` file for a project, for example, `"runtime": "18.0"`. Choose a runtime supported by all environments where you plan to deploy the extension, including Business Central online environments.

An extension requires a server that supports the same or a later runtime version. Its platform, application, and other dependency requirements must also be met. If you don't specify `runtime`, the compiler defaults to the first runtime version of its current major release. The compiler doesn't detect the target server's runtime.

## Currently available runtime versions

The most recent runtimes are listed here. For runtime version suggestions, use IntelliSense in the AL extension.

The **Business Central version** column identifies the product release, not the value for the `runtime` setting. In `app.json`, `platform` and `application` separately specify minimum versions of the System symbols and Application package. Learn more in [App.json file settings](devenv-json-files.md#appjson-file).

|Runtime version|Shipped with                       |Business Central version|
|---------------|-----------------------------------|------------------------|
|`16.0`         |Business Central 2025 release wave 2|27.0|
|`17.0`         |Business Central 2026 release wave 1|28.0|
|`18.0`         |Business Central 2026 release wave 2|29.0|

## Setting the runtime version

If you have customers that run on older versions, set the runtime to the minimum version that supports the features your extension needs. Ensure that all target servers support that runtime. This approach prevents you from inadvertently using runtime features that aren't supported on an older server.

If you target an earlier runtime, consider a daily or weekly build with the latest AL compiler. Also compile for the latest runtime and test on a corresponding Business Central environment to detect runtime-gated diagnostics and platform behavior changes. Tracking these changes can help you make design decisions before you raise the runtime version.

## Historical runtime versions

|Runtime version|Shipped with                       |Business Central version|
|---------------|-----------------------------------|------------------------|
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
|`7.2`          |Business Central 2021 release wave 1 update 3|18.3|
|`8.0`          |Business Central 2021 release wave 2|19.0|
|`9.0`          |Business Central 2022 release wave 1|20.0|
|`9.1`          |Business Central 2022 release wave 1 update 1|20.1|
|`9.2`          |Business Central 2022 release wave 1 update 4|20.4|
|`10.0`         |Business Central 2022 release wave 2|21.0|
|`11.0`         |Business Central 2023 release wave 1|22.0|
|`12.0`         |Business Central 2023 release wave 2|23.0|
|`13.0`         |Business Central 2024 release wave 1|24.0|
|`14.0`         |Business Central 2024 release wave 2|25.0|
|`15.0`         |Business Central 2025 release wave 1|26.0|

## Related information

[JSON files](devenv-json-files.md)  
[Launch JSON file](devenv-json-launch-file.md)
