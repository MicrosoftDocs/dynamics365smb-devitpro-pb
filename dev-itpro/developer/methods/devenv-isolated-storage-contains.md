---
title: "ISOLATEDSTORAGE.CONTAINS Method"
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

# ISOLATEDSTORAGE.CONTAINS Method
Determines whether the storage contains a value with the specified key.

## Syntax  
[OK=:] ISOLATEDSTORAGE.CONTAINS(KEY, [DATASCOPE]);

#### Parameters
*Key*
Type: Text

The key to locate in the storage.

*Value*
Type: Text

The value that will be associated with the specified key.

*DataScope*
Type: Text

The scope in which to check for the existence of a value with the given key. If a value is not passed in, the default value, DataScope::Module will be used. For more information, see [DataScope Data Type](../datatypes/devenv-data-scope-type.md).

## Property Value/Return Value
Type: Boolean

**true** if a value with the specified key exists in the storage, otherwise **false**.

## See Also  
[ISOLATEDSTORAGE.SET Method](devenv-isolated-storage-set.md)  
[ISOLATEDSTORAGE.GET Method](devenv-isolated-storage-get.md)  
[ISOLATEDSTORAGE.DELETE Method](devenv-isolated-storage-delete.md)  
[DataScope Data Type](../datatypes/devenv-data-scope-type.md)  
[Isolated Storage](../../developer/devenv-isolated-storage.md)
