---
title: "ISOLATEDSTORAGE.GET Method"
ms.custom: na
ms.date: 10/16/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e536abc9-b0bb-4010-bd77-22e537eb24ba
caps.latest.revision: 14
manager: SorenGP
---

# ISOLATEDSTORAGE.GET Method
Gets the value associated with the specified key.

## Syntax  
[OK=:] ISOLATEDSTORAGE.GET(KEY, [DATASCOPE],VAR Value);

#### Parameters
*Key*
Type: Text

The key of the value to get. If the specified key is not found an error will be reported.

*Value*
Type: Text

The value that will be associated with the specified key.

*DataScope*
Type: Text

The scope of the data to retrieve. If a value is not passed in, the default value, DataScope::Module will be used. For more information, see [DataScope Data Type](../datatypes/devenv-data-scope-type.md).

## Property Value/Return Value
Type: Boolean

**true** if the value was saved successfully, otherwise **false**.

## See Also  
[ISOLATEDSTORAGE.SET Method](methods/devenv-isolated-storage-set.md)  
[ISOLATEDSTORAGE.DELETE Method](methods/devenv-isolated-storage-delete.md)  
[ISOLATEDSTORAGE.CONTAINS Method](methods/devenv-isolated-storage-contains.md)
[DataScope Data Type](../datatypes/devenv-data-scope-type.md)  
[Isolated Storage](../../developer/devenv-isolated-storage.md)
