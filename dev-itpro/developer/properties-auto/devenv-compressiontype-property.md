---
title: "CompressionType Property"
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
# CompressionType Property
Specifies the compression type used.

## Applies to
-   Table

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|Unspecified|Use the compression type that is specified externally on the table, for example, in SQL Server.|
|None|Do not use compression on the table.|
|Row|Compress the table on a row-level.|
|Page|Compress the table on a page-level. This includes row, prefix, and dictionary compression.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  