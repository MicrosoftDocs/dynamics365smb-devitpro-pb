---
title: "AppSourceCop Warning AS0109"
description: "The type of a table should not be changed from Normal to Temporary, because synchronizing the app will fail if the table contains data."
ms.author: solsen
ms.custom: na
ms.date: 10/25/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0109
The type of the table has changed from Normal to Temporary.

## Description
The type of a table should not be changed from Normal to Temporary, because synchronizing the app will fail if the table contains data. Make sure to remove all data from the table before changing the table type to temporary.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  