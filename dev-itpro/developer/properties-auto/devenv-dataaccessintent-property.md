---
title: "DataAccessIntent Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataAccessIntent Property
Sets the data access intent of the page.

## Applies to
-   Page
-   Report
-   Query

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|ReadOnly|Intent to access records, but not to modify them. Read-only pages are run against a replica of the database leading to improved performance, but preventing modifications to the database records.|
|ReadWrite|Intent to access and modify records.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  