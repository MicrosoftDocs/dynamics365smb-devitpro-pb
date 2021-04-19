---
title: "Choosing Runtime in AL"
description: "How to choose runtime in AL for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/19/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Choosing Runtime in AL

The capabilities and features of AL for [!INCLUDE[prod_short](../includes/prod_short.md)] are determined by the runtime version. The runtime version is set in the `app.json` file for a project. It is a mandatory setting and expressed with the following syntax is `"runtime": "7.0"`.

The runtime in the `app.json` file specifies which runtime the project is targeting. A project can be published to the server with an earlier or with the same runtime version as the server. The available options are:

|Runtime version|Shipped with                       |
|---------------|-----------------------------------|
|`1.0`          |Business Central April 2018 Release|
|`2.0`          |Business Central Fall '18 Release  |
|`3.0`          |Business Central Spring '19 Release|
|`4.0`          |Business Central 2019 release wave 2|
|`5.0`          |Business Central 2020 release wave 1|
|`6.0`          |Business Central 2020 release wave 2|
|`6.1`          |Business Central 2020 release wave 2 update 17.1|
|`6.2`          |Business Central 2020 release wave 2 update 17.2|
|`6.3`          |Business Central 2020 release wave 2 update 17.3|
|`6.4`          |Business Central 2020 release wave 2 update 17.4|
|`7.0`          |Business Central 2021 release wave 1|




|runtime|Yes|The version of the runtime that the project is targeting. The project can be published to the server with an earlier or the same runtime version. The available options are: <br>`1.0` - Business Central April 2018 Release <br>`2.0` - Business Central Fall '18 Release <br>`3.0` - Business Central Spring '19 Release <br> `4.0` - Business Central 2019 release wave 2 <br> `5.0` - Business Central 2020 release wave 1 <br>`6.0` - Business Central 2020 release wave 2 <br>`6.1` - Business Central 2020 release wave 2 update 17.1 <br> `6.2` - Business Central 2020 release wave 2 update 17.2 <br> `6.3` - Business Central 2020 release wave 2 update 17.3 <br> `6.4` - Business Central 2020 release wave 2 update 17.4|

or example, if you have customers on older versions, you should set the runtime to be the minimum version that works, but have a daily/weekly build that tests the extension against latest.
-	Testing against the latest should be done to detect new diagnostics (warnings or errors) introduced in the compiler or changes in the platform runtime.

Can we think of more best practices? What kind of guidance are you giving partners when meeting with them? Thanks.


## See Also