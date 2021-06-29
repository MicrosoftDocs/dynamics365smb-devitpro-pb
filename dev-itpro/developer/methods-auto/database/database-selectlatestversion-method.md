---
title: "Database.SelectLatestVersion Method"
description: "Forces the latest version of the database to be used."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database.SelectLatestVersion Method
> **Version**: _Available or changed with runtime version 1.0._

Forces the latest version of the database to be used.


## Syntax
```
 Database.SelectLatestVersion()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method makes sure that the data displayed is the most current data in the database. The method clears all non-locked records from the client cache, thereby ensuring that you read the most recent data. The method also clears the current client session's cache for the CaptionClassTranslate strings. The strings will then be reevaluated by the **CaptionClassTranslate** method trigger in codeunit 42.  
  
> [!WARNING]  
> Clearing the cache and reading data directly from the database adversely affects performance.  
  

## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)